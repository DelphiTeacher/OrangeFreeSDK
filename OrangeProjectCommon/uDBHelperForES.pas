
//convert pas to utf8 by ¥
//UniDac数据库操作类,用于连接MSSQL//
unit uDBHelperForES;

interface
{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}



//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
//才可以正常编译此单元
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}




uses
//  Windows,
  SysUtils,
  Classes,
//  Forms,
  IniFiles,
//  ADODB,
  SyncObjs,
  DB,
  XSuperObject,
//  ActiveX,
  uBaseLog,
  uFuncCommon,

  StrUtils,
  Variants,
  uBaseDBHelper,
  uDatasetToJson,
  uDataBaseConfig,

  System.NetEncoding,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,


  DateUtils
//  Messages
  ;



  //不使用kbmMWUNIDACConnectionPool
//  {$DEFINE NOT_USE_kbmMWUNIDACConnectionPool}


type
  TDBHelperForESDB=class(TBaseDBHelper)
  protected
  public
    ANetHttpClient:TNetHttpClient;
    ANameValuePair:TNameValuePair;
    FNetHTTPRequestHeaders:TNetHeaders;
    FDBInfo:ISuperObject;
    FDataBaseConfig:TDataBaseConfig;
    FResponseJson:ISuperObject;


    function ServerUrl:String;
    constructor Create;overload;override;
    destructor Destroy;override;

  public
    procedure Close;override;

    function GetConnectionFromPool:TObject;override;
    procedure UnlockConnectionToPool;override;


    function Connect(ADataBaseConfig:TDataBaseConfig):Boolean;override;
    function Disconnect:Boolean;override;
    //查询,标准:select * from
    function SelfQuery(AQueryString:String;
                        AParamNames:TStringDynArray;
                        AParamValues:TVariantDynArray;
                        AOperation:TSQLOperation;
                        AParamsCompleted:Boolean=False;
                        ACustomQueryDataSet:TDataSet=nil):Boolean;override;
  public
    //添加一条记录
    function AddRecord(ATableName:String;ARecordDataJson:ISuperObject;
                          //ES数据库插入的时候需要主键
                          AKeyFieldName:String;
                          ASelectAfterInsert:String;
                          var AAddedRecordDataJson:ISuperObject
                          ):Boolean;override;
    //通过查询修改一条记录
    function UpdateRecordByQuery(ATableName:String;ARecordDataJson:ISuperObject;
                          AWhereKeyJsonArray:ISuperArray
                          ):Boolean;
    //获取字段列表
    function GetFieldList(ATableName:String;ASelectText:String;
                           var ARecordList:ISuperArray;
                           ADataJson:ISuperObject
                           ):Boolean;override;
    //获取一条记录
    function GetRecord(ATableName:String;
                      AKeyFieldName:String;
                      AKeyFieldValue:Variant;
                      var ARecordDataJson:ISuperObject
                      ):Boolean;override;
    //获取多条记录
    function GetRecordList(ATableName:String;
                          APageIndex:Integer;
                          APageSize:Integer;
                          AWhereKeyJsonArray:ISuperArray;
                          var ADataJson:ISuperObject;
                          AIsNeedRecordList:Boolean=True;
                          AOrderBy:String='';
                          AHTTPRequestParamJson:ISuperObject=nil
                          ):Boolean;override;
    //更新一条记录,根据主键fid
    function UpdateRecord(ATableName:String;AUpdateRecordDataJson:ISuperObject;
                          AKeyFieldName:String;
                          AKeyFieldValue:Variant;
                          var AUpdatedRecordDataJson:ISuperObject;
                          AOldRecordDataJson:ISuperObject=nil
                          ):Boolean;overload;override;
    //根据条件更新
    function UpdateRecord(ATableName:String;AUpdateRecordDataJson:ISuperObject;
                          AKeyFieldName:String;
                          AWhereKeyJsonArray:ISuperArray;
                          var AUpdatedRecordDataJson:ISuperObject;
                          AOldRecordDataJson:ISuperObject=nil
                          ):Boolean;overload;override;

    //更新字段列表
    function UpdateFieldList(ATableName:String;
                            AFieldListJson: ISuperObject;
                            var ARecordDataJson:ISuperObject):Boolean;override;

    //数据库查询
    function QueryRecordList:ISuperArray;override;
  public
    function DoQueryBySQL(ATableName:String;AQueryJson:ISuperObject):Boolean;
    //AAPI:String='_search?scroll=5m';
    function DoQueryBySearch(ATableName:String;AQueryJsonStr:String;AIsScroll:Boolean=False):Boolean;

  end;


  TESDBHelper=TDBHelperForESDB;

//从user_center/tbluser取出user_center
function GetESDBName(AESTableName:String):String;
//从user_center/tbluser取出tbluser
function GetESTableName(AESTableName:String):String;

implementation

function GetESDBName(AESTableName:String):String;
begin
  Result:=Copy(AESTableName,1,Pos('/',AESTableName)-1);
end;

function GetESTableName(AESTableName:String):String;
begin
  Result:=Copy(AESTableName,Pos('/',AESTableName)+1,MaxInt);
end;

{ TDBHelperForESDB }

procedure TDBHelperForESDB.Close;
begin
  inherited;

end;

function TDBHelperForESDB.Connect(ADataBaseConfig: TDataBaseConfig): Boolean;
var
  AResponseStream:TStringStream;
begin
          Result:=False;

          FDataBaseConfig.Assign(ADataBaseConfig);

          AResponseStream:=TStringStream.Create('',TEncoding.UTF8);


          Self.DBType:=ADataBaseConfig.FDBType;


          if ADataBaseConfig.FDBUserName<>'' then
          begin
            SetLength(FNetHTTPRequestHeaders,2);
            ANameValuePair.Name:= 'Authorization';
            //Basic bXhlczptZjJvZWc2VVU0ViM=
            ANameValuePair.Value:= 'Basic '+TNetEncoding.Base64.Encode(ADataBaseConfig.FDBUserName+':'+ADataBaseConfig.FDBPassword);
            FNetHTTPRequestHeaders[0]:=ANameValuePair;

            ANameValuePair.Name:= 'Content-type';
            ANameValuePair.Value:= 'application/json';
            FNetHTTPRequestHeaders[1]:=ANameValuePair;
          end
          else
          begin
            SetLength(FNetHTTPRequestHeaders,1);

            ANameValuePair.Name:= 'Content-type';
            ANameValuePair.Value:= 'application/json';
            FNetHTTPRequestHeaders[0]:=ANameValuePair;
          end;



          try
              uBaseLog.HandleException(nil,'TDBHelperForESDB.Connect '
                                            +'Server='+ADataBaseConfig.FDBHostName+' '
                                            +'Port='+ADataBaseConfig.FDBHostPort+' '
                                            +'Username='+ADataBaseConfig.FDBUserName+' '
                                            +'Password='+ADataBaseConfig.FDBPassword+' '
                                            +'Database='+ADataBaseConfig.FDBDataBaseName+' '
                                            );

              //连接数据库,ES
              ANetHttpClient.Get(Self.ServerUrl+ADataBaseConfig.FDBDataBaseName,AResponseStream,FNetHTTPRequestHeaders);
              FDBInfo:=SO(AResponseStream.DataString);
              if FDBInfo.Contains('error') then
              begin
                Self.LastExceptMessage:=AResponseStream.DataString;
                Exit;
              end;
              //{
              //	"error": {
              //		"root_cause": [{
              //			"type": "index_not_found_exception",
              //			"reason": "no such index [user_center]",
              //			"resource.type": "index_or_alias",
              //			"resource.id": "user_center",
              //			"index_uuid": "_na_",
              //			"index": "user_center"
              //		}],
              //		"type": "index_not_found_exception",
              //		"reason": "no such index [user_center]",
              //		"resource.type": "index_or_alias",
              //		"resource.id": "user_center",
              //		"index_uuid": "_na_",
              //		"index": "user_center"
              //	},
              //	"status": 404
              //}

              Result:=True;
          except
            on E:Exception do
            begin
              Self.LastExceptMessage:=E.Message;
//              ShowException('数据库连接错误，请确认正确参数配置并重启服务端');
              uBaseLog.HandleException(nil,'TDBHelperForESDB.Connect '+E.Message);
            end;
          end;

          FreeAndNil(AResponseStream);
end;

constructor TDBHelperForESDB.Create;
begin
  Inherited;
  ANetHttpClient:=TNetHttpClient.Create(nil);
//  ANetHttpClient.ResponseTimeout:=10*60*1000;//10分钟
  FDataBaseConfig:=TDataBaseConfig.Create;

  SetLength(FNetHTTPRequestHeaders,0);

end;


destructor TDBHelperForESDB.Destroy;
begin
  FreeAndNil(ANetHttpClient);
  FreeAndNil(FDataBaseConfig);
  inherited;
end;

function TDBHelperForESDB.Disconnect: Boolean;
begin
  Result:=False;
  Result:=True;
end;

function TDBHelperForESDB.AddRecord(ATableName:String;
                                    ARecordDataJson:ISuperObject;
                                    //ES数据库插入的时候需要主键
                                    AKeyFieldName:String;
                                    ASelectAfterInsert:String;
                                    var AAddedRecordDataJson:ISuperObject
                                    ): Boolean;
var
  AUrl:String;
  AKeyValue:String;
  ARequestStream:TStringStream;
  AResponseStream:TStringStream;
begin
  Result:=False;

  FResponseJson:=nil;

  ARequestStream:=TStringStream.Create('',TEncoding.UTF8);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try

        try



                ARequestStream.WriteString(ARecordDataJson.AsJSON);
                ARequestStream.Position:=0;

                AKeyValue:='';//如果为空，那么ES数据库会自动建fid
                if ARecordDataJson.Contains(AKeyFieldName) then
                begin
                  AKeyValue:=ARecordDataJson.S[AKeyFieldName];
                end;
                
                AUrl:=Self.ServerUrl+ATableName+'/'+AKeyValue;
                //PUT和POST都能新增修改
//                ANetHttpClient.Put(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);
                ANetHttpClient.Post(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);

                //{"_index":"user_center","_type":"tbluser","_id":"ggggcexx","_version":1,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":54710295,"_primary_term":171}
                FResponseJson:=SO(AResponseStream.DataString);
//                uBaseLog.HandleException(nil,'TDBHelperForESDB.DoAddRecord '
//                                            +' '+AUrl+' '+ARecordDataJson.AsJson
//                                            +' '+AResponseStream.DataString);



                Result:=not FResponseJson.Contains('error');
                if not Result then
                begin
                  FLastExceptMessage:=FResponseJson.AsJSON;
                  uBaseLog.HandleError(nil,'TDBHelperForESDB.DoAddRecord '
                                              +' '+AUrl+' '+ARecordDataJson.AsJson+' '+AResponseStream.DataString);
                  Exit;
                end;


                AAddedRecordDataJson:=ARecordDataJson;

        except
            on E: Exception do
            begin
              Result:=False;
              //'Lost connection to MySQL server during query'#$D#$A'Error on data reading from the connection:'#$D#$A'你的主机中的软件中止了一个已建立的连接。.'#$D#$A'Socket Error Code: 10053($2745)'
              FLastExceptMessage:=E.Message;
              //      DoLog(E,'SelfQuery');
              uBaseLog.HandleException(E,'TDBHelperForESDB.DoAddRecord '//+E.Message
                                          //上次使用时间,跟踪MYSQL是否在10分钟之内就断开连接了
                                          //+' '+FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Self.FLastUseTime)
                                          +' '+AUrl+' '+ARecordDataJson.AsJson);


            end;
        end;

  finally
    FreeAndNil(ARequestStream);
    FreeAndNil(AResponseStream);
  end;


end;

function TDBHelperForESDB.DoQueryBySearch(ATableName:String;
  AQueryJsonStr: String//;AAPI:String
  ;AIsScroll:Boolean
  ): Boolean;
var
  AUrl:String;
  ARequestStream:TStringStream;
  AResponseStream:TStringStream;
begin
  Result:=False;

  FResponseJson:=nil;

  ARequestStream:=TStringStream.Create('',TEncoding.UTF8);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try

        try



                ARequestStream.WriteString(AQueryJsonStr);
                ARequestStream.Position:=0;

                //'_search?scroll=5m'
                if not AIsScroll then
                begin
                  //表示我要开滚动模式查询
                  AUrl:=Self.ServerUrl+ATableName+'/'+'_search?scroll=15m';
                end
                else
                begin
                  //'_search/scroll'
                  //使用scrollid进行查询,不需要TableName
                  AUrl:=Self.ServerUrl+'_search/scroll';
                end;
                ANetHttpClient.Post(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);


                FResponseJson:=SO(AResponseStream.DataString);
//                uBaseLog.HandleException(nil,'TDBHelperForESDB.DoQueryBySearch '
//                                            +' '+AUrl+' '+AQueryJsonStr+' '+AResponseStream.DataString);



                Result:=not FResponseJson.Contains('error');
                if not Result then
                begin
                  FLastExceptMessage:=FResponseJson.AsJSON;
                  uBaseLog.HandleError(nil,'TDBHelperForESDB.DoQueryBySearch '
                                              +' '+AUrl+' '+AQueryJsonStr+' '+AResponseStream.DataString);
                end;


        except
          on E: Exception do
          begin
            Result:=False;
            //'Lost connection to MySQL server during query'#$D#$A'Error on data reading from the connection:'#$D#$A'你的主机中的软件中止了一个已建立的连接。.'#$D#$A'Socket Error Code: 10053($2745)'
            FLastExceptMessage:=E.Message;
            //      DoLog(E,'SelfQuery');
            uBaseLog.HandleException(E,'TDBHelperForESDB.DoQueryBySearch '//+E.Message
                                        //上次使用时间,跟踪MYSQL是否在10分钟之内就断开连接了
                                        //+' '+FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Self.FLastUseTime)
                                        +' '+AUrl+' '+AQueryJsonStr);


          end;
        end;

  finally
    FreeAndNil(ARequestStream);
    FreeAndNil(AResponseStream);
  end;



end;

function TDBHelperForESDB.DoQueryBySQL(ATableName:String;AQueryJson: ISuperObject): Boolean;
var
  ARequestStream:TStringStream;
  AResponseStream:TStringStream;
begin
  Result:=False;

  FResponseJson:=nil;

  ARequestStream:=TStringStream.Create('',TEncoding.UTF8);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try

        try



                ARequestStream.WriteString(AQueryJson.AsJSON);
                ARequestStream.Position:=0;

                ANetHttpClient.Post(Self.ServerUrl+ATableName+'/'+'_sql',ARequestStream,AResponseStream,FNetHTTPRequestHeaders);


                FResponseJson:=SO(AResponseStream.DataString);


                Result:=not FResponseJson.Contains('error');
                if not Result then
                begin
                  FLastExceptMessage:=FResponseJson.AsJSON;
                  uBaseLog.HandleError(nil,'TDBHelperForESDB.DoQueryBySQL '
                                              +' '+AResponseStream.DataString);
                end;


        except
          on E: Exception do
          begin
            Result:=False;
            //'Lost connection to MySQL server during query'#$D#$A'Error on data reading from the connection:'#$D#$A'你的主机中的软件中止了一个已建立的连接。.'#$D#$A'Socket Error Code: 10053($2745)'
            FLastExceptMessage:=E.Message;
            //      DoLog(E,'SelfQuery');
            uBaseLog.HandleException(E,'TDBHelperForESDB.DoQueryBySQL '+E.Message
                                        //上次使用时间,跟踪MYSQL是否在10分钟之内就断开连接了
                                        +' '+FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Self.FLastUseTime)
                                        +' '+AQueryJson.AsJSON);


          end;
        end;

  finally
    FreeAndNil(ARequestStream);
    FreeAndNil(AResponseStream);
  end;


end;

procedure TDBHelperForESDB.UnlockConnectionToPool;
begin

end;

function TDBHelperForESDB.UpdateFieldList(ATableName: String;
  AFieldListJson: ISuperObject; var ARecordDataJson: ISuperObject): Boolean;
var
  ANewFieldNames:TStringDynArray;
var
  I:Integer;
  AUrl:String;
  AProertiesJson:ISuperObject;
  AResponseStream:TStringStream;
  ARequestStream:TStringStream;
begin
  //先获取字段列表,然后存在的更新，不存在的替换
  Result:=False;

  FResponseJson:=nil;

  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  ARequestStream:=TStringStream.Create('',TEncoding.UTF8);
  try

        try

            //curl 127.0.0.1:9200/user_center/tbluser/_mapping?include_type_name=true
            AUrl:=Self.ServerUrl+ATableName+'/_mapping?include_type_name=true';
            //PUT和POST都能新增修改
            //ANetHttpClient.Put(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);
            ANetHttpClient.Get(AUrl,AResponseStream,FNetHTTPRequestHeaders);


            FResponseJson:=SO(AResponseStream.DataString);
            uBaseLog.HandleException(nil,'TDBHelperForESDB.UpdateFieldList GetFieldList '
                                        +' '+AUrl
                                        +' '+AResponseStream.DataString);



            Result:=not FResponseJson.Contains('error');
            if not Result then
            begin
              FLastExceptMessage:=FResponseJson.AsJSON;
              uBaseLog.HandleError(nil,'TDBHelperForESDB.UpdateFieldList GetFieldList '
                                          +' '+AUrl+' '+AResponseStream.DataString);
              Exit;
            end;


            //遍历出里面的字段列表
            AProertiesJson:=FResponseJson.O[GetESDBName(ATableName)].O['mappings'].O[GetESTableName(ATableName)].O['properties'];
            ANewFieldNames:=GetJsonNameArray(AFieldListJson);
            for I := 0 to Length(ANewFieldNames)-1 do
            begin
              AProertiesJson.O[ANewFieldNames[I]]:=AFieldListJson.O[ANewFieldNames[I]];
            end;


            //再提交上去
            ARequestStream.WriteString(FResponseJson.O[GetESDBName(ATableName)].O['mappings'].O[GetESTableName(ATableName)].AsJSON());

            ARequestStream.Position:=0;
            AResponseStream.Size:=0;
            ANetHttpClient.Post(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);

            //{"acknowledged":true}
            FResponseJson:=SO(AResponseStream.DataString);
            uBaseLog.HandleException(nil,'TDBHelperForESDB.UpdateFieldList Post'
                                        +' '+AUrl
                                        +' '+AResponseStream.DataString);



            Result:=not FResponseJson.Contains('error');
            if not Result then
            begin
              FLastExceptMessage:=FResponseJson.AsJSON;
              uBaseLog.HandleError(nil,'TDBHelperForESDB.UpdateFieldList Post'
                                          +' '+AUrl+' '+AResponseStream.DataString);
              Exit;
            end;



            Result:=True;

        except
            on E: Exception do
            begin
              Result:=False;
              FLastExceptMessage:=E.Message;
              //      DoLog(E,'SelfQuery');
              uBaseLog.HandleException(E,'TDBHelperForESDB.UpdateFieldList '//+E.Message
                                          //上次使用时间,跟踪MYSQL是否在10分钟之内就断开连接了
                                          //+' '+FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Self.FLastUseTime)
                                          +' '+AUrl);


            end;
        end;

  finally
    FreeAndNil(AResponseStream);
    FreeAndNil(ARequestStream);
  end;

end;

function TDBHelperForESDB.UpdateRecord(ATableName: String;
  AUpdateRecordDataJson: ISuperObject; AKeyFieldName:String;AWhereKeyJsonArray: ISuperArray;
  var AUpdatedRecordDataJson: ISuperObject;
  AOldRecordDataJson:ISuperObject=nil): Boolean;
var
  AKeyFieldCondition:ISuperObject;
//  AOldRecordDataJson:ISuperObject;
begin
  //更新有两种方式,一种是先取下来,再提交上去,另一种是直接提交修改语句update_by_query
  Result:=False;
  AKeyFieldCondition:=LocateJsonArray(AWhereKeyJsonArray,'name',AKeyFieldName);
  if AKeyFieldCondition<>nil then
  begin
      //存在fid这个条件,那就是直接更新
      if (AOldRecordDataJson=nil) and not GetRecord(ATableName,AKeyFieldCondition.S['name'],AKeyFieldCondition.V['value'],AOldRecordDataJson) then
      begin
        Exit;
      end;
      if AOldRecordDataJson=nil then
      begin
        uBaseLog.HandleError(nil,'TDBHelperForESDB.UpdateRecord Record not Exist fid:'+VarToStr(AKeyFieldCondition.V['value']));
        Exit;
      end;
      //将修改合并到AOldRecordDataJson
      MergeJson(AUpdateRecordDataJson,AOldRecordDataJson);
      //再提交
      if not AddRecord(ATableName,AOldRecordDataJson,AKeyFieldCondition.S['name'],'',AUpdatedRecordDataJson) then
      begin
        Exit;
      end;
      Result:=True;
  end
  else
  begin
      //不存在fid这个条件,那就是其他条件，可能会批量更新，根据条件进行更新

      Result:=UpdateRecordByQuery(ATableName,AUpdateRecordDataJson,AWhereKeyJsonArray);

  end;

end;

function TDBHelperForESDB.UpdateRecordByQuery(ATableName: String;
  ARecordDataJson: ISuperObject; AWhereKeyJsonArray: ISuperArray): Boolean;
var
  I:Integer;
  AUrl:String;
  APostJson:ISuperObject;
  ARequestStream:TStringStream;
  AResponseStream:TStringStream;
var
  ASource:String;
  AParamNames:TStringDynArray;
  AParamValues:TVariantDynArray;
begin
  Result:=False;

  FResponseJson:=nil;

  ARequestStream:=TStringStream.Create('',TEncoding.UTF8);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try

        try
                //生成更新Json
                //{
                //    "query": {
                //        "term": {
                //            "id": {
                //                "value": "gameinternational"
                //            }
                //        }
                //    },
                //
                //  "script": {
                //    "source": "ctx._source['linkedin_id'] = '123456'"
                //  }
                //}
                APostJson:=SO();
                //加上条件
                APostJson.O['query'].O['bool']:=GetWhereConditionESQuery(AWhereKeyJsonArray,nil,nil);

                //要不要先查询 一次有几条记录,只有一条才可以更新，这样安全一点
                //或者也可以先GetRecordList，然后再一条条UpdateRecord


                //加上要修改的字段
                //获取需要添加的字段,去掉表中不存在的字段
                ConvertJsonToArray(ARecordDataJson,
                                    AParamNames,
                                    AParamValues);
                ASource:='';
                for I := 0 to Length(AParamNames)-1 do
                begin
                  ASource:=ASource+'ctx._source['+QuotedStr(AParamNames[I])+'] = ';
                  case ARecordDataJson.GetType(AParamNames[I]) of
                     varString, varUString:
                        ASource:=ASource+QuotedStr(AParamValues[I]);
                     varInt64, varInteger, varByte,
                      //wn fixed
                      varWord, varLongWord:
                        ASource:=ASource+IntToStr(AParamValues[I]);
                     varDouble, varCurrency:
                        ASource:=ASource+FloatToStr(AParamValues[I]);
                     varBoolean:
                        ASource:=ASource+BoolToStr(AParamValues[I]);
                     varDate:
                        ASource:=ASource+StdDateTimeToStr(AParamValues[I]);
//                     varNull:
//                        Null[V] := jNull;
                  end;
//                  if ASource<>'' then
//                  begin
                    ASource:=ASource+';';
//                  end;
                end;
                APostJson.O['script'].S['source']:=ASource;


                ARequestStream.WriteString(APostJson.AsJSON);
                ARequestStream.Position:=0;


                AUrl:=Self.ServerUrl+ATableName+'/_update_by_query';
                //PUT和POST都能新增修改
//                ANetHttpClient.Put(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);
                ANetHttpClient.Post(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);

                //'{"took":140,"timed_out":false,"total":3,"updated":3,"deleted":0,"batches":1,"version_conflicts":0,"noops":0,"retries":{"bulk":0,"search":0},"throttled_millis":0,"requests_per_second":-1.0,"throttled_until_millis":0,"failures":[]}'
                FResponseJson:=SO(AResponseStream.DataString);
//                uBaseLog.HandleException(nil,'TDBHelperForESDB.UpdateRecordByQuery '
//                                            +' '+AUrl+' '+ARecordDataJson.AsJson
//                                            +' '+AResponseStream.DataString);



                Result:=not FResponseJson.Contains('error');
                if not Result then
                begin
                  FLastExceptMessage:=FResponseJson.AsJSON;
                  uBaseLog.HandleError(nil,'TDBHelperForESDB.DoAddRecord '
                                              +' '+AUrl+' '+ARecordDataJson.AsJson+' '+AResponseStream.DataString);
                  Exit;
                end;


//                AAddedRecordDataJson:=ARecordDataJson;

        except
            on E: Exception do
            begin
              Result:=False;
              //'Lost connection to MySQL server during query'#$D#$A'Error on data reading from the connection:'#$D#$A'你的主机中的软件中止了一个已建立的连接。.'#$D#$A'Socket Error Code: 10053($2745)'
              FLastExceptMessage:=E.Message;
              //      DoLog(E,'SelfQuery');
              uBaseLog.HandleException(E,'TDBHelperForESDB.DoAddRecord '//+E.Message
                                          //上次使用时间,跟踪MYSQL是否在10分钟之内就断开连接了
                                          //+' '+FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Self.FLastUseTime)
                                          +' '+AUrl+' '+ARecordDataJson.AsJson);


            end;
        end;

  finally
    FreeAndNil(ARequestStream);
    FreeAndNil(AResponseStream);
  end;


end;

function TDBHelperForESDB.UpdateRecord(ATableName: String;
  AUpdateRecordDataJson: ISuperObject; AKeyFieldName:String;
  AKeyFieldValue: Variant;
                          var AUpdatedRecordDataJson:ISuperObject;
                          AOldRecordDataJson:ISuperObject=nil): Boolean;
//var
//  AOldRecordDataJson:ISuperObject;
begin
  //更新有两种方式,一种是先取下来,再提交上去,另一种是直接提交修改语句update_by_query
  Result:=False;
  if  (AOldRecordDataJson=nil) and not GetRecord(ATableName,AKeyFieldName,AKeyFieldValue,AOldRecordDataJson) then
  begin
    Exit;
  end;
  if AOldRecordDataJson=nil then
  begin
    Exit;
  end;
  //将修改合并到AOldRecordDataJson
  MergeJson(AUpdateRecordDataJson,
            AOldRecordDataJson,
            //全部覆盖
            True,
            //覆盖数组
            True);
  //再提交
  if not AddRecord(ATableName,AOldRecordDataJson,AKeyFieldName,'',AUpdatedRecordDataJson) then
  begin
    Exit;
  end;

  Result:=True;
end;

function TDBHelperForESDB.GetConnectionFromPool: TObject;
begin

end;

function TDBHelperForESDB.GetFieldList(ATableName, ASelectText: String;
  var ARecordList: ISuperArray;
                           ADataJson:ISuperObject): Boolean;
var
  AParamNames:TStringDynArray;
  AChildParamNames:TStringDynArray;
  J: Integer;
var
  I:Integer;
  AUrl:String;
  ASuperObject:ISuperObject;
  AFieldProp:ISuperObject;
  AChildFieldProp:ISuperObject;
  AChildSuperObject:ISuperObject;
  AProertiesJson:ISuperObject;
  AResponseStream:TStringStream;
begin
  Result:=False;

  FResponseJson:=nil;
  ARecordList:=nil;

  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try

        try

            //curl 127.0.0.1:9200/user_center/tbluser/_mapping?include_type_name=true
            AUrl:=Self.ServerUrl+ATableName+'/_mapping?include_type_name=true';
            //PUT和POST都能新增修改
            //ANetHttpClient.Put(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);
            ANetHttpClient.Get(AUrl,AResponseStream,FNetHTTPRequestHeaders);


            FResponseJson:=SO(AResponseStream.DataString);
            if ADataJson<>nil then
            begin
              ADataJson.O['response']:=FResponseJson;
            end;
            uBaseLog.HandleException(nil,'TDBHelperForESDB.GetFieldList '
                                        +' '+AUrl
                                        +' '+AResponseStream.DataString);



            Result:=not FResponseJson.Contains('error');
            if not Result then
            begin
              FLastExceptMessage:=FResponseJson.AsJSON;
              uBaseLog.HandleError(nil,'TDBHelperForESDB.GetFieldList '
                                          +' '+AUrl+' '+AResponseStream.DataString);
              Exit;
            end;


            //遍历出里面的字段列表
            AProertiesJson:=FResponseJson.O[GetESDBName(ATableName)].O['mappings'].O[GetESTableName(ATableName)].O['properties'];
            ARecordList:=SA();
            AParamNames:=GetJsonNameArray(AProertiesJson);
            for I := 0 to Length(AParamNames)-1 do
            begin
              if (AParamNames[I]<>'mappings') and (AParamNames[I]<>'mappings') then
              begin
                ASuperObject:=SO();
                ASuperObject.S['name']:=AParamNames[I];

//                ASuperObject.I['size']:=AFieldDef.Size;
//                //精度
//                ASuperObject.I['precision']:=AFieldDef.Precision;
//                //直接取字段类型的整型值
//                ASuperObject.I['field_type']:=Ord(AFieldDef.DataType);

                AFieldProp:=AProertiesJson.O[AParamNames[I]];
                if AFieldProp.Contains('type') then
                begin
                    //普通类型
                    ASuperObject.S['data_type']:=AFieldProp.S['type'];
                end
                else
                begin
                    //对象类型
                    AChildParamNames:=GetJsonNameArray(AFieldProp.O['properties']);
                    for J := 0 to Length(AChildParamNames)-1 do
                    begin
                      AChildFieldProp:=AFieldProp.O['properties'].O[AChildParamNames[J]];
                      AChildSuperObject:=SO();
                      AChildSuperObject.S['name']:=AChildParamNames[J];
                      AChildSuperObject.S['data_type']:=AChildFieldProp.S['type'];
                      ASuperObject.A['FieldList'].O[ASuperObject.A['FieldList'].Length]:=AChildSuperObject;
                    end;
                end;
                ARecordList.O[ARecordList.Length]:=ASuperObject;
              end;
            end;


        except
            on E: Exception do
            begin
              Result:=False;
              //'Lost connection to MySQL server during query'#$D#$A'Error on data reading from the connection:'#$D#$A'你的主机中的软件中止了一个已建立的连接。.'#$D#$A'Socket Error Code: 10053($2745)'
              FLastExceptMessage:=E.Message;
              //      DoLog(E,'SelfQuery');
              uBaseLog.HandleException(E,'TDBHelperForESDB.DoAddRecord '//+E.Message
                                          //上次使用时间,跟踪MYSQL是否在10分钟之内就断开连接了
                                          //+' '+FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Self.FLastUseTime)
                                          +' '+AUrl);


            end;
        end;

  finally
    FreeAndNil(AResponseStream);
  end;

end;

function TDBHelperForESDB.GetRecord(ATableName, AKeyFieldName:String;
  AKeyFieldValue: Variant; var ARecordDataJson: ISuperObject): Boolean;
var
  AUrl:String;
  AResponseStream:TStringStream;
begin
  Result:=False;

  FResponseJson:=nil;
  ARecordDataJson:=nil;

  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try

        try

                //curl 127.0.0.1:9200/user_center/tbluser/ggggcexx
                AUrl:=Self.ServerUrl+ATableName+'/'+VarToStr(AKeyFieldValue);
                //PUT和POST都能新增修改
                //ANetHttpClient.Put(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);
                ANetHttpClient.Get(AUrl,AResponseStream,FNetHTTPRequestHeaders);

                FResponseJson:=SO(AResponseStream.DataString);
                uBaseLog.HandleException(nil,'TDBHelperForESDB.DoAddRecord '
                                            +' '+AUrl
                                            +' '+AResponseStream.DataString);



                Result:=not FResponseJson.Contains('error');
                if not Result then
                begin
                  FLastExceptMessage:=FResponseJson.AsJSON;
                  uBaseLog.HandleError(nil,'TDBHelperForESDB.DoAddRecord '
                                              +' '+AUrl+' '+AResponseStream.DataString);
                  Exit;
                end;
                //'{"_index":"searched_company_center","_type":"tblsearched_company","_id":"61529005A0CE441F90DC9768FB3E91DC","found":false,"_source":{}}'
                if not FResponseJson.B['found'] then
                begin
                  FLastExceptMessage:=AResponseStream.DataString;
                  Result:=False;
                  Exit;
                end;

                ARecordDataJson:=FResponseJson.O['_source'];
        except
            on E: Exception do
            begin
              Result:=False;
              //'Lost connection to MySQL server during query'#$D#$A'Error on data reading from the connection:'#$D#$A'你的主机中的软件中止了一个已建立的连接。.'#$D#$A'Socket Error Code: 10053($2745)'
              FLastExceptMessage:=E.Message;
              //      DoLog(E,'SelfQuery');
              uBaseLog.HandleException(E,'TDBHelperForESDB.DoAddRecord '//+E.Message
                                          //上次使用时间,跟踪MYSQL是否在10分钟之内就断开连接了
                                          //+' '+FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Self.FLastUseTime)
                                          +' '+AUrl+' '+ARecordDataJson.AsJson);


            end;
        end;

  finally
    FreeAndNil(AResponseStream);
  end;
end;

function ConvertSQLWhereKeyJsonArrayToESFormat(ASQLWhereKeyJsonArray:ISuperArray):ISuperArray;
begin
  //


end;

function TDBHelperForESDB.GetRecordList(ATableName: String; APageIndex,
  APageSize: Integer; AWhereKeyJsonArray: ISuperArray;
  var ADataJson: ISuperObject;
  AIsNeedRecordList:Boolean=True;
  AOrderBy:String='';
  AHTTPRequestParamJson:ISuperObject=nil): Boolean;
var
  I:Integer;
  AUrl:String;
  AScroll:String;
  AQueryMustArray:ISuperArray;
  AUserRequestData:ISuperObject;
  ARequestStream:TStringStream;
  AResponseStream:TStringStream;
  ARecordDataJson:ISuperObject;
  ASortList:TStringList;
  ASortItemList:TStringList;
  ASortItemJson:ISuperObject;
begin
  Result:=False;

  FResponseJson:=nil;
  ADataJson:=SO();

  ARequestStream:=TStringStream.Create('',TEncoding.UTF8);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try

        try

                AUserRequestData:=SO();

                //最大是一万
                if APageSize>10000 then
                begin
                  APageSize:=10000;
                end;


                //将WhereKeyJsonArray转成ES格式的条件
//                AQueryMustArray:=AUserRequestData.O['query'].O['bool'].A['must'];
//                for I := 0 to AWhereKeyJsonArray.Length-1 do
//                begin
//                  AQueryMustArray.O[I].O['term'].S[AWhereKeyJsonArray.O[I].S['name']]:=AWhereKeyJsonArray.O[I].S['value'];
//                end;
                AUserRequestData.O['query'].O['bool']:=GetWhereConditionESQuery(AWhereKeyJsonArray,nil,nil);
//                uBaseLog.HandleException(nil,'TDBHelperForESDB.GetRecordList ' +' '+AUrl+' '+AUserRequestData.AsJson);


                ARequestStream.WriteString(AUserRequestData.AsJSON);
                ARequestStream.Position:=0;

//                AUserRequestData:= '{ "query": { "bool": { "must": [ { "term": { "company_unique_name": "' + ACompanyName + '" } } ],'
//                                 + ' "filter": [ ' + AHaveJobFilterStr + AHaveEmailFilterStr + AHavePhoneFilterStr + ACountryFilterStr + ' ] } },'
//                                 + ' "from": ' + IntToStr((APageIndex-1)*APageSize) + ',"size": ' + IntToStr(APageSize) + '}';

                if not AIsNeedRecordList then
                begin
                    ADataJson.O['es_query']:=AUserRequestData;
                    //curl 127.0.0.1:9200/user_center/tbluser/ggggcexx
                    AUrl:=Self.ServerUrl+ATableName+'/_count';
                    //PUT和POST都能新增修改
                    //ANetHttpClient.Put(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);
                    ANetHttpClient.Post(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);

                    FResponseJson:=SO(AResponseStream.DataString);
//                    uBaseLog.HandleException(nil,'TDBHelperForESDB.GetRecordList '
//                                                +' '+AUrl
//                                                +' '+AResponseStream.DataString);
                    if FResponseJson.Contains('error') then
                    begin
                      FLastExceptMessage:=FResponseJson.AsJSON;
                      uBaseLog.HandleError(nil,'TDBHelperForESDB.GetRecordList '
                                                  +' '+AUrl
                                                  +' '+AResponseStream.DataString);
                      Exit;
                    end;
                    //{"count":4006,"_shards":{"total":5,"successful":5,"skipped":0,"failed":0}}
                    ADataJson.I['SumCount']:=FResponseJson.I['count'];

                end;



                if AIsNeedRecordList then
                begin
                    AScroll:='15m';
                    if (AHTTPRequestParamJson<>nil) and AHTTPRequestParamJson.Contains('scroll') then
                    begin
                      AScroll:=AHTTPRequestParamJson.S['scroll'];
                    end;

                    //如果有is_scroll，那么用开启scroll模式查询 _search?scroll=15m
                    //如果有scroll_id，那么只需要根据scroll_id查询即可
                    //AQueryJson.S['scroll_id']:=ADBHelper.FResponseJson.S['_scroll_id'];
                    //AQueryJson.S['scroll']:='5m';
                    if (AHTTPRequestParamJson<>nil)
                      and AHTTPRequestParamJson.Contains('_scroll_id')
                      and (AHTTPRequestParamJson.S['_scroll_id']<>'') then
                    begin

                        AUserRequestData:=SO();
                        AUserRequestData.S['scroll_id']:=AHTTPRequestParamJson.S['_scroll_id'];
                        AUserRequestData.S['scroll']:=AScroll;

                        //不需要TableName
                        AUrl:=Self.ServerUrl+'_search/scroll';

                    end
                    else
                    begin
                        //curl 127.0.0.1:9200/user_center/tbluser/ggggcexx
                        AUrl:=Self.ServerUrl+ATableName+'/_search';
                        if (AHTTPRequestParamJson<>nil) and AHTTPRequestParamJson.Contains('is_scroll') then
                        begin
                            AUrl:=AUrl+'?scroll='+AScroll;
                            //会返回"_scroll_id"，要记下这个"_scroll_id"
                        end;


                        AUserRequestData.I['from']:=(APageIndex-1)*APageSize;
                        AUserRequestData.I['size']:=APageSize;

                        if AOrderBy<>'' then
                        begin
                          //排序
                          //后面要考虑到多个排序
                          //createtime DESC,fid ASC
                          //用空格分隔
                          //ORDER BY
                          AOrderBy:=ReplaceStr(AOrderBy,'ORDER BY','');
                          ASortList:=uFuncCommon.SplitString(AOrderBy,',');
                          try

                            for I := 0 to ASortList.Count-1 do
                            begin
                              ASortItemList:=uFuncCommon.SplitString(Trim(ASortList[I]),' ');
                              try
                                ASortItemJson:=SO();
                                ASortItemJson.O[ASortItemList[0]].S['order']:=LowerCase(ASortItemList[1]);
                                AUserRequestData.A['sort'].O[AUserRequestData.A['sort'].Length]:=ASortItemJson;
                              finally
                                FreeAndNil(ASortItemList);
                              end;
                            end;

                          finally
                            FreeAndNil(ASortList);
                          end;
                        end;
                    end;
                    ADataJson.O['es_query']:=AUserRequestData;
//                    ADataJson.S['es_url']:=AUrl;


                    ARequestStream.Position:=0;
                    ARequestStream.WriteString(AUserRequestData.AsJSON);
                    ARequestStream.Position:=0;





                    //PUT和POST都能新增修改
                    //ANetHttpClient.Put(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);
                    ANetHttpClient.Post(AUrl,ARequestStream,AResponseStream,FNetHTTPRequestHeaders);

                    FResponseJson:=SO(AResponseStream.DataString);
//                    uBaseLog.HandleException(nil,'TDBHelperForESDB.GetRecordList '
//                                                +' '+AUrl
//                                                +' '+AResponseStream.DataString);



                    Result:=not FResponseJson.Contains('error');
                    if not Result then
                    begin
                      ADataJson.O['es_response']:=FResponseJson;
                      FLastExceptMessage:=FResponseJson.AsJSON;
                      uBaseLog.HandleError(nil,'TDBHelperForESDB.GetRecordList '
                                                  +' '+AUrl+' '+AResponseStream.DataString);
                      Exit;
                    end;

                    //查询公司成功
                    //这种方式,只能返回前10000条
                    if FResponseJson.O['hits'].GetType('total') = varInt64 then
                    begin
                      ADataJson.I['SumCount']:=FResponseJson.O['hits'].I['total'];
                    end;
                    if FResponseJson.O['hits'].GetType('total') = varObject then
                    begin
                      ADataJson.I['SumCount']:=FResponseJson.O['hits'].O['total'].I['value'];
                    end;
                    //AHTTPRequestParamJson.S['_scroll_id']
                    if FResponseJson.Contains('_scroll_id') then
                    begin
                        if (FResponseJson.O['hits'].A['hits'].Length>0) then
                        begin
                          ADataJson.S['_scroll_id']:=FResponseJson.S['_scroll_id'];
                        end
                        else
                        begin
                          //要删除这个_scroll_id
                          AResponseStream.Size:=0;
                          ANetHttpClient.Delete(Self.ServerUrl+'_search/scroll'+'/'+FResponseJson.S['_scroll_id'],AResponseStream,FNetHTTPRequestHeaders);
                          ADataJson.O['es_delete_scroll_response']:=SO(AResponseStream.DataString);
                        end;
                    end;

    //                uBaseLog.HandleException(nil,'【已查到公司总数】：' + IntToStr(ACompanyCount));

                    if (APageIndex*APageSize) <= ADataJson.I['SumCount'] then
                    begin
                      ADataJson.I['HasNextPage']:=1;
                    end
                    else
                    begin
                      ADataJson.I['HasNextPage']:=0;
                    end;


                    for I := 0 to FResponseJson.O['hits'].A['hits'].Length-1 do
                    begin
                      ARecordDataJson:=FResponseJson.O['hits'].A['hits'].O[I].O['_source'];
    //                  ARecordDataJson.S['_id']:=FResponseJson.O['hits'].A['hits'].O[I].S['_id'];
                      ADataJson.A['RecordList'].O[ADataJson.A['RecordList'].Length]:=FResponseJson.O['hits'].A['hits'].O[I].O['_source'];
                    end;


                    //把上一个_scroll_id删除，ES有限制
                    // 手动删除scroll_id的方法
                    //DELETE /_search/scroll { "scroll_id" : "DnF1ZXJ5VGhlbkZldGNoBgAAAAAATJH1FlFTYzlSZ0VNVGdlM2o0T0dTX2tVUncAAAAAAE0-zBZQUVp6Sy04X1J1NjJCaVZfQUhHWjFnAAAAAABMkfYWUVNjOVJnRU1UZ2UzajRPR1Nfa1VSdwAAAAAATXVxFk83UWRhNGg3UmxTQnpXTEUzd0dreXcAAAAAAEyR9xZRU2M5UmdFTVRnZTNqNE9HU19rVVJ3AAAAAABNPs0WUFFaekstOF9SdTYyQmlWX0FIR1oxZw==" }
                    if (AHTTPRequestParamJson<>nil)
                      and AHTTPRequestParamJson.Contains('_scroll_id')
                      and (AHTTPRequestParamJson.S['_scroll_id']<>'')
                      //测试时发现每个分页返回的_scroll_id都是相同的,所以如果要删除,那要判断下是否相同,不同才需要删除
                      and (
                            (ADataJson.S['_scroll_id']<>AHTTPRequestParamJson.S['_scroll_id'])
                          )
                            then
                    begin
                      ARequestStream.Position:=0;
                      AResponseStream.Size:=0;
                      ANetHttpClient.Delete(Self.ServerUrl+'_search/scroll'+'/'+AHTTPRequestParamJson.S['_scroll_id'],AResponseStream,FNetHTTPRequestHeaders);
                      ADataJson.O['es_delete_scroll_response']:=SO(AResponseStream.DataString);
                    end;

                end;

                Result:=True;
        except
            on E: Exception do
            begin
              Result:=False;
              //'Lost connection to MySQL server during query'#$D#$A'Error on data reading from the connection:'#$D#$A'你的主机中的软件中止了一个已建立的连接。.'#$D#$A'Socket Error Code: 10053($2745)'
              FLastExceptMessage:=E.Message;
              ADataJson.S['es_response_str']:=AResponseStream.DataString;
              //      DoLog(E,'SelfQuery');
              uBaseLog.HandleException(E,'TDBHelperForESDB.GetRecordList '//+E.Message
                                          //上次使用时间,跟踪MYSQL是否在10分钟之内就断开连接了
                                          //+' '+FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Self.FLastUseTime)
                                          +' '+AUrl
                                          );


            end;
        end;

  finally
    FreeAndNil(AResponseStream);
    FreeAndNil(ARequestStream);
  end;


end;

function TDBHelperForESDB.QueryRecordList: ISuperArray;
begin

end;

function TDBHelperForESDB.SelfQuery(AQueryString: String;
                                                AParamNames: TStringDynArray;
                                                AParamValues: TVariantDynArray;
                                                AOperation: TSQLOperation;
                                                AParamsCompleted:Boolean;
                                                ACustomQueryDataSet:TDataSet): Boolean;
var
  I: Integer;

  AIndex:Integer;
  AValueStr:String;
  ATempQuerySQL:String;
  AParams:ISuperObject;
//  StartTime,EndTime:TDateTime;
//  sParams : String;
begin
  Result:=False;

  FResponseJson:=nil;



//                HandleException(nil,'TDBHelperForESDB.SelfQuery '+AQueryString);
                ATempQuerySQL:=AQueryString;

                AQueryString:=TransSelectSQL(AQueryString,DBType);
                //AQuery.Prepare;
                if Not AParamsCompleted then
                begin
                  for I:=Length(AParamNames)-1 downto 0 do
                  begin
                    if AParamNames[I]<>'' then
                    begin
//                        AQuery.Params.ParamByName(AParamNames[I]).Value:=AParamValues[I];
//
//
//                        //f,保存到日志文件中去
//                        try
//                            AIndex:=Pos(':'+AParamNames[I],ATempQuerySQL);
//                            AValueStr:=AParamValues[I];
//                            case VarType(AParamValues[I]) of
//                                varString, varUString:
//                                begin
//                                  AValueStr:=QuotedStr(AValueStr);
//                                end
//                                else
//                                begin
//
//                                end;
//                            end;
//
//                            if AIndex>0 then
//                            begin
//                              ATempQuerySQL:=Copy(ATempQuerySQL,1,AIndex-1)
//                                              +AValueStr
//                                              +Copy(ATempQuerySQL,AIndex+Length(AParamNames[I])+1{:的长度},MaxInt);
//                            end;
//                        except
//                           //避免出错
//                        end;


                    end;
                  end;
                end;


                if Length(AParamNames)>0 then
                begin
                    HandleException(nil,'TDBHelperForESDB.SelfQuery '+ATempQuerySQL);

//                    if (Pos('INSERT',UpperCase(ATempQuerySQL))>0)
//                      or (Pos('UPDATE',UpperCase(ATempQuerySQL))>0)
//                      or (Pos('DELETE',UpperCase(ATempQuerySQL))>0) then
//                    begin
//                      GetGlobalDBLog.HandleException(nil,'TDBHelperForESDB.SelfQuery '+ATempQuerySQL);
//                    end;
                end
                else
                begin
                    HandleException(nil,'TDBHelperForESDB.SelfQuery '+AQueryString);
                end;


                AParams:=SO();
                AParams.S['query']:=AQueryString;

//                ARequestStream.WriteString(AParams.AsJSON);

//                case AOperation of
//                  asoOpen: AQuery.Open;
//                  asoExec:
//                  begin
//                      //AQuery.Prepare;
//                      AQuery.ExecSql;
//                  end;
//                end;
//                ANetHttpClient.Post(Self.ServerUrl+'_sql',ARequestStream,AResponseStream);

                Result:=DoQueryBySQL('',AParams);


//                Result:=True;


end;


function TDBHelperForESDB.ServerUrl: String;
begin
  Result:='http://'+FDataBaseConfig.FDBHostName+':'+FDataBaseConfig.FDBHostPort+'/';
end;

end.



