//convert pas to utf8 by ¥
//TDataset和Json之间的相互转换
unit uDataSetToJson;

interface

//{$DEFINE SKIN_SUPEROBJECT}


uses
  Types,
  SysUtils,
  Classes,
  StrUtils,

  uBaseLog,



  {$IF CompilerVersion <= 21.0} // D2010之前
    //Delphi2010不能用XSuperObject
    SuperObject,
    superobjecthelper,
  {$ELSE}
    {$IFDEF SKIN_SUPEROBJECT}
    uSkinSuperObject,
    {$ELSE}
    XSuperObject,
    XSuperJson,
    {$ENDIF}
  {$IFEND}



  Variants,
  Math,
  uFuncCommon,
  uBaseList,
  DB;




Const
  SUCC=200;
  FAIL=400;

  NOPOST='NoPost_';

  RECORDLIST_KEY='RecordList';


  FORMAT_COMPRESSED='compressed';
  //+'_'+'FieldDefs'
  FIELD_DEFS='FieldDefs';

  { TODO : 注释掉了 }
  //这个可能用处在值为null，字段也存在，字段不存在可能会有问题。
  //网页表格中有些字段为空,则会显示为undefined
  DEFAULT_IsNeedNullField=True;//Integer;//

type
  //有些接口传入的查询条件要能特殊处理来组成条件
  //比如keyword的参数,需要name、addr、phone等多列来查询
  //所以需要拼成一个很长的SQL
  TOnGetWhereConditionItemSQLEvent=
      function(Sender:TObject;
              ALogicOperator,     //逻辑运算符,NOT,AND,OR
              AName,              //参数名,比如name,keyword
              AOperator:String;   //比较符,比如>,<,=,LIKE
              AValue:Variant      //比较值
              ):String of object;

  TVarTypeDynArray=Array of TVarType;

  TBaseJsonObjectClass=class of TBaseJsonObject;
  TBaseJsonObject=class(TPersistent)
  public
    constructor Create;virtual;
    function ParseFromJson(AJson: ISuperObject): Boolean;virtual;abstract;
  end;
  TBaseJsonObjectList=class(TBaseList)
  public
    procedure Assign(Source: TBaseJsonObjectList;JsonObjectClass:TBaseJsonObjectClass);
  public
    function ParseFromJsonArray(JsonObjectClass:TBaseJsonObjectClass;JsonArray:ISuperArray):Boolean;virtual;
  end;

  {$REGION 'TWhereKeyTranslator 查询条件字段翻译'}
  //查询条件字段翻译
  TWhereKeyTranslator=class
  public
    //条件
    Key:String;
    //FieldName
    FieldNames:TStringList;
    function DoGetWhereConditionItemSQL(
                                        ALogicOperator,
                                        AOperator:String;
                                        AValue:Variant):String;
  public
    constructor Create;
    destructor Destroy;override;
  end;
  TWhereKeyTranslatorList=class(TBaseList)
  private
    function GetItem(Index: Integer): TWhereKeyTranslator;
  public
    function Find(AKey:String):TWhereKeyTranslator;
    function Add(AKey:String;
                 AFieldNamesCommaText:String):TWhereKeyTranslator;
    property Items[Index:Integer]:TWhereKeyTranslator read GetItem;default;
  end;
  {$ENDREGION}


var
  //返回数据集的时候,是否返回数据集的字段,用于在客户端生成表格的列
  GlobalIsReturnDatasetFieldDefs:Boolean;



//通用的格式
function ReturnJson(ACode:Integer;
                    ADesc:String;
                    ADataJson:ISuperObject;
                    ADesc2:String='';
                    ADataJson2:ISuperObject=nil;
                    ANameArray:TStringDynArray=nil;
                    AValueArray:TVariantDynArray=nil
                    ):ISuperObject;
//直接从数据集返回Json
function ReturnJsonStr(ACode:Integer;
                      ADesc:String;
                      ADataset:TDataset;
                      ADatasetToJsonFormat:String='';
                      ARecordListKey:String='RecordList'
                      ):String;


//将字段的值赋给JsonObject的Key
function CreateJsonValueByField(Json: ISuperObject;Field: TField;AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField): Boolean;


//返回通用的记录的Json数组["name":"王能","age":35,"phone":"18957901025"]
function JSonFromRecord(DataSet: TDataSet;AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField): ISuperObject;
procedure JSonFromRecordTo(DataSet: TDataSet;ASuperObject:ISuperObject;AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField;
                                ANoNeedFieldNameList:TStringList=nil);


{$IF CompilerVersion > 21.0} // XE or older
//将字段的值放入JsonArray中
function CreateJsonArrayElementValueByField(JsonArray: ISuperArray;AIndex:Integer;Field: TField): Boolean;
//返回压缩过的记录的Json数组["王能",35,"18957901025"]
function CompressedJSonFromRecord(DataSet: TDataSet): ISuperArray;
function CompressedJSonFromDataSetTo(DataSet: TDataSet;tableName: string;sj:ISuperObject): ISuperObject;
function CompressedJSonFromDataSet(DataSet: TDataSet;tableName: string='RecordList'): ISuperObject;
{$IFEND} // XE or older



function JSonFromDataSetTo(DataSet: TDataSet;tableName: string;sj:ISuperObject;AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField): ISuperObject;
function JSonArrayFromDataSetTo(DataSet: TDataSet;AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField): ISuperArray;

//数组切片(传入起始坐标和结束坐标，返回截取子数组)
function SliceJsonArray(JsonArray: ISuperArray; StartIndex, EndIndex: Integer): ISuperArray;

function JSonFromDataSet(DataSet: TDataSet;tableName: string='RecordList';AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField): ISuperObject;


function GetJsonDoubleValue(AJson: ISuperObject;AName:String):Double;
function GetJsonIntegerValue(AJson: ISuperObject;AName:String):Integer;
function GetJsonStringValue(AJson: ISuperObject;AName:String):String;

function ComposeJsonObjectsToArray(AJsonObjects:Array of ISuperObject):ISuperArray;

procedure ConvertArrayToJson(ANameArray:TStringDynArray;
                            AValueArray:TVariantDynArray;
                            AJson:ISuperObject);overload;
function ConvertArrayToJson(ANameArray:TStringDynArray;
                            AValueArray:TVariantDynArray):ISuperObject;overload;

procedure ConvertArrayToJson(ANameValueArray:TVariantDynArray;
                            AJson:ISuperObject);overload;
function ConvertArrayToJson(ANameValueArray:TVariantDynArray):ISuperObject;overload;


//获取Json中元素的个数
function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            //只添加在FieldList中的Key
                            AFieldList:TStringList=nil;
                            //不添加的字段名
                            ANoAddKeyName:String='';
                            AIsNeedNullValueField:Boolean=True;
                            AIsNeedArrayValueField:Boolean=True;
                            AIsNeedObjectValueField:Boolean=True):Integer;overload;
function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            var AValueTypeArray:TVarTypeDynArray;
                            //只添加在FieldList中的Key
                            AFieldList:TStringList=nil;
                            ANoAddKeyName:String='';
                            AIsNeedNullValueField:Boolean=True;
                            AIsNeedArrayValueField:Boolean=True;
                            AIsNeedObjectValueField:Boolean=True):Integer;overload;
function GetJsonCount(AJson:ISuperObject;
                            AFieldList:TStringList=nil;
                            ANoAddKeyName:String='';
                            AIsNeedNullValueField:Boolean=True;
                            AIsNeedArrayValueField:Boolean=True;
                            AIsNeedObjectValueField:Boolean=True):Integer;
function GetJsonNameArray(AJson:ISuperObject;AIgnoreFieldList:TStringList=nil;
                            AIsNeedNullValueField:Boolean=True;
                            AIsNeedArrayValueField:Boolean=True;
                            AIsNeedObjectValueField:Boolean=True):TStringDynArray;
function CopyJson(AJson:ISuperObject;AIgnoreFieldList:TStringList=nil;
                            AIsNeedNullValueField:Boolean=True;
                            AIsNeedArrayValueField:Boolean=True;
                            AIsNeedObjectValueField:Boolean=True):ISuperObject;
//function GetJsonValueTypeArray(AJson:ISuperObject;AFieldList:TStringList=nil):Array of Integer;
//function GetJsonValueArray(AJson:ISuperObject;AFieldList:String=''):TVariantDynArray;




//判断值Name为Value的JsonObject是否存在
function LocateJsonArray(AJsonArray:ISuperArray;
                          AName:String;
                          AValue:Variant;
                          AStartIndex:Integer=0):ISuperObject;overload;
function LocateJsonValueArray(AJsonArray:ISuperArray;
                          AValue:Variant;
                          AStartIndex:Integer=0):Integer;
function LocateJsonArrayIndex(AJsonArray:ISuperArray;
                          AName:String;
                          AValue:Variant;
                          AStartIndex:Integer=0):Integer;overload;
function LocateJsonArray(AJsonArray:ISuperArray;
                          ANames:TStringDynArray;
                          AValues:TVariantDynArray;
                          AStartIndex:Integer=0):ISuperObject;overload;
function LocateJsonArrayValueArray(AJsonArray:ISuperArray;
                        AIndex:Integer;
                        AValue:Variant):ISuperArray;
//从Json数组中取出某一个字段的值,然后拼成数组
function GetJsonArrayValues(AJsonArray: ISuperArray;AKeyName:String):TVariantDynArray;overload;
function GetJsonArrayValues2(AJsonArray: ISuperArray;AKeyName:String):ISuperArray;overload;
function ConvertArrayToStringList(AValues:TVariantDynArray):TStringList;
function GetJsonArrayValuesCommaText(AJsonArray: ISuperArray;AKeyName:String):String;overload;
function GetJsonArrayValuesCommaText(AJsonArray: ISuperArray):String;overload;

//将Json数组转换成层级的
procedure ConvertJsonArrayToLevel(AJsonArray:ISuperArray;
                                  //比如fid
                                  ALevelChildFieldName:String;
                                  //比如parent_fid
                                  ALevelParentFieldName:String;
                                  //比如0
                                  AParentFieldValue:String;
                                  ALevelJsonArray:ISuperArray);
function LocateArray(AStr:String;AStringArray:TStringDynArray):Integer;
procedure MergeJson(AFromJson:ISuperObject;AToJson:ISuperObject;AIsOverride:Boolean=True;AIsMergeArray:Boolean=False;AIgnoreFieldList:TStringDynArray=[]);




//生成查询条件
function GetWhereConditions(AFieldNames:Array of String;
                            AFieldValues:Array of Variant):String;overload;
function GetWhereConditionArray(AFieldNames:Array of String;
                            AFieldValues:Array of Variant):ISuperArray;overload;


function ConvertJsonArray(AJsonArray:Array of ISuperObject):ISuperArray;overload;


function GetWhereCondition(ALogicalOperator:String;
                            AFieldName:String;
                            ACompareOperator:String;
                            AFieldValue:Variant;
                            AFieldValueIsField:Boolean=False;
                            AFieldValueIsCheckEmpty:Boolean=False;
                            AFieldEmptyValue:String=''):ISuperObject;

function GetWhereConditions(AFieldNames:TStringDynArray;
                            AFieldValues:TVariantDynArray):String;overload;
function GetWhereKeyJson(AFieldNames:TStringDynArray;
                            AFieldValues:TVariantDynArray):String;
function GetWhereConditionsPro(AFieldNames:TStringDynArray;
                            //比较运算符
                            AFieldOpers:TStringDynArray;
                            AFieldValues:TVariantDynArray):String;


function GetFieldCondition(ALogicalOperator:String;
                            AFieldName:String;
                            //条件运算符
                            ACompareOperator:String;
                            AFieldValue:Variant;
                            AFieldValueIsFieldName:Boolean=False):ISuperObject;




function CutStringArray(AFieldNames:Array of String;ACount:Integer):TStringDynArray;
function CutVariantArray(AFieldValues:TVariantDynArray;ACount:Integer):TVariantDynArray;

//从Json的对象数组中获取键值的列表数组
function GetKeyValuesFromJsonObjectArray(AJsonObjectArray:ISuperArray;
                                          AKey:String):TStringDynArray;


//获取数据集的字段定义列表JsonArray
function GetDatasetFieldDefsJson(ADataset:TDataset;AFieldMapList:TStringList=nil):ISuperArray;


//比较两个Json是否相同
function IsSameJsonObject(AJson,BJson:ISuperObject):Boolean;
//function IsSameJsonArray(AJsonArray,BJsonArray:ISuperArray):Boolean;


//使用UTF8的字符集来解析出Json
function TSuperObjectParseStream(AStream:TStream):ISuperObject;

//获取参数数组中的参数值
function GetParamValue(ANameArray:TStringDynArray;
                            AValueArray:TVariantDynArray;
                            AParamName:String;
                            ADefaultValue:Variant):Variant;

//获取更新Json
//function GetUpdateRecordJson(AOldJson:ISuperObject;ANewJson:ISuperObject):ISuperObject;

function GetJsonValueArray(AFieldNames:Array of String;AJson:ISuperObject):TVariantDynArray;


//获取默认的条件
function GetWhereConditionItemSQL(
                            ALogicOperator,
                            AName,
                            AOperator:String;
                            AValue: Variant;
                            AFieldValueIsField:Boolean=False;AFieldTableAlias:String=''): String;
//获取Where条件
function GetWhereConditionSQL(AWhereKeyJsonArray:ISuperArray;
                              AWhereKeyTranslatorList:TWhereKeyTranslatorList;
                              AFieldTableAliasList:TStringList
                              ):String;//virtual;
//获取ES格式的查询条件
function GetWhereConditionItemESQuery(AESQuery:ISuperObject;
                            ALogicOperator,
                            AName,
                            AOperator:String;
                            AValue: Variant;
                            AFieldValueIsField:Boolean=False;AFieldTableAlias:String=''):ISuperObject;
function GetWhereConditionESQuery(AWhereKeyJsonArray:ISuperArray;
                              AWhereKeyTranslatorList:TWhereKeyTranslatorList=nil;
                              AFieldTableAliasList:TStringList=nil
                              ):ISuperObject;//virtual;


//判断json是否存在别的字段
function IsJsonHasNotExistsField(ARecordDataJson:ISuperObject;AFieldDefArray:ISuperArray;AParentFieldName:String;var ADesc:String):Boolean;

implementation

function IsJsonHasNotExistsField(ARecordDataJson:ISuperObject;AFieldDefArray:ISuperArray;AParentFieldName:String;var ADesc:String):Boolean;
var
  AParamNames:TStringDynArray;
  I: Integer;
  AFieldDefJson:ISuperObject;
  J: Integer;
begin
  Result:=False;

  if AParentFieldName<>'' then
  begin
    AParentFieldName:=AParentFieldName+'.'
  end;

  AParamNames:=GetJsonNameArray(ARecordDataJson);
  for I := 0 to Length(AParamNames)-1 do
  begin
    AFieldDefJson:=LocateJsonArray(AFieldDefArray,'name',AParamNames[I]);
    if AFieldDefJson=nil then
    begin

        //字段不存在
        if ADesc<>'' then
        begin
          ADesc:=ADesc+',';
        end;
        ADesc:=ADesc+'表中不存在'+AParentFieldName+AParamNames[I];
        Result:=True;

    end
    else
    begin
        //字段已经存在


            //字段存在,是不是数组类型,如果是数组对象类型,则要判断里面的对象的字段是不是超了
            if ARecordDataJson.GetType(AParamNames[I])=varArray then
            begin
                if AFieldDefJson.Contains('FieldList') then
                begin
                  //数组类型,判断子节点
                  for J := 0 to ARecordDataJson.A[AParamNames[I]].Length-1 do
                  begin
                    if IsJsonHasNotExistsField(ARecordDataJson.A[AParamNames[I]].O[J],AFieldDefJson.A['FieldList'],AParentFieldName+AParamNames[I],ADesc) then
                    begin
                      Result:=True;
                    end;

                  end;
                end
                else
                begin
                  //类型不匹配
                  if ADesc<>'' then
                  begin
                    ADesc:=ADesc+',';
                  end;
                  ADesc:=ADesc+AParentFieldName+AParamNames[I]+'字段类型不匹配';
                  Result:=True;
                end;
            end
            else if ARecordDataJson.GetType(AParamNames[I])=varObject then
            begin
                if AFieldDefJson.Contains('FieldList') then
                begin
                  if IsJsonHasNotExistsField(ARecordDataJson.O[AParamNames[I]],AFieldDefJson.A['FieldList'],AParentFieldName+AParamNames[I],ADesc) then
                  begin
                    Result:=True;
                  end;
                end
                else
                begin
                  //类型不匹配
                  if ADesc<>'' then
                  begin
                    ADesc:=ADesc+',';
                  end;
                  ADesc:=ADesc+AParentFieldName+AParamNames[I]+'字段类型不匹配';
                  Result:=True;
                end;
            end;


    end;
  end;


end;


function GetWhereCondition(ALogicalOperator:String;
                            AFieldName:String;
                            ACompareOperator:String;
                            AFieldValue:Variant;
                            AFieldValueIsField:Boolean=False;
                            AFieldValueIsCheckEmpty:Boolean=False;
                            AFieldEmptyValue:String=''):ISuperObject;
begin
  Result:=nil;
  if AFieldValueIsCheckEmpty and (AFieldValue=AFieldEmptyValue) then
  begin
    Exit;
  end;

  Result:=TSuperObject.Create;
  Result.S['logical_operator']:=ALogicalOperator;//'AND';
  Result.S['name']:=AFieldName;
  Result.S['operator']:=ACompareOperator;//'=';
  Result.V['value']:=AFieldValue;
  Result.B['value_is_field']:=AFieldValueIsField;

end;

function GetWhereConditions(AFieldNames:TStringDynArray;
                            AFieldValues:TVariantDynArray):String;
var
  I:Integer;

  AWhereKeyJson:ISuperObject;
  AWhereKeyJsonArray:ISuperArray;
begin
  AWhereKeyJsonArray:=TSuperArray.Create;

  for I := 0 to Length(AFieldNames)-1 do
  begin

    AWhereKeyJson:=TSuperObject.Create;
    AWhereKeyJson.S['logical_operator']:='AND';
    AWhereKeyJson.S['name']:=AFieldNames[I];
    AWhereKeyJson.S['operator']:='=';
    AWhereKeyJson.V['value']:=AFieldValues[I];

    AWhereKeyJsonArray.O[I]:=AWhereKeyJson;

  end;

  Result:=AWhereKeyJsonArray.AsJSON;
end;


function GetWhereKeyJson(AFieldNames:TStringDynArray;
                            AFieldValues:TVariantDynArray):String;
begin
  Result:=GetWhereConditions(AFieldNames,AFieldValues);
end;


function GetWhereConditionsPro(AFieldNames:TStringDynArray;
                            AFieldOpers:TStringDynArray;
                            AFieldValues:TVariantDynArray):String;
var
  I:Integer;

  AWhereKeyJson:ISuperObject;
  AWhereKeyJsonArray:ISuperArray;
begin
  AWhereKeyJsonArray:=TSuperArray.Create;

  for I := 0 to Length(AFieldNames)-1 do
  begin

    AWhereKeyJson:=TSuperObject.Create;
    AWhereKeyJson.S['logical_operator']:='AND';
    AWhereKeyJson.S['name']:=AFieldNames[I];
    AWhereKeyJson.S['operator']:=AFieldOpers[I];
    AWhereKeyJson.V['value']:=AFieldValues[I];

    AWhereKeyJsonArray.O[I]:=AWhereKeyJson;

  end;

  Result:=AWhereKeyJsonArray.AsJSON;
end;



//function GetUpdateRecordJson(AOldJson:ISuperObject;ANewJson:ISuperObject):ISuperObject;
//begin
//  Result:=nil;
//
//end;

//function TBaseQueryItem.GetWhereConditionSQL(AWhereKeyJsonArray: ISuperArray): String;
function GetWhereConditionSQL(AWhereKeyJsonArray: ISuperArray;
                              AWhereKeyTranslatorList:TWhereKeyTranslatorList;
                              AFieldTableAliasList:TStringList): String;
var
  I:Integer;
  ASubWhereConditionSQL:String;
  AWhereConditionItemSQL:String;
  AWhereKeyTranslator:TWhereKeyTranslator;
  AFieldTableAlias:String;
begin
  Result:='';
  ASubWhereConditionSQL:='';

  for I := 0 to AWhereKeyJsonArray.Length-1 do
  begin
      if AWhereKeyJsonArray.O[I].Contains('conditions') then
      begin
          //子条件列表
          ASubWhereConditionSQL:=GetWhereConditionSQL(AWhereKeyJsonArray.O[I].A['conditions'],AWhereKeyTranslatorList,AFieldTableAliasList);

          Result:=Result
                +' '+AWhereKeyJsonArray.O[I].S['logical_operator']
                +' ('+ASubWhereConditionSQL+') ';

      end
      else
      begin

          //自定义获取条件表达式
          AWhereKeyTranslator:=nil;
          if AWhereKeyTranslatorList<>nil then AWhereKeyTranslatorList.Find(AWhereKeyJsonArray.O[I].S['name']);
          if AWhereKeyTranslator<>nil then
          begin
              AWhereConditionItemSQL:=AWhereKeyTranslator.DoGetWhereConditionItemSQL(
                                          AWhereKeyJsonArray.O[I].S['logical_operator'],
                                          AWhereKeyJsonArray.O[I].S['operator'],
                                          AWhereKeyJsonArray.O[I].V['value']);
          end
          else
          begin

//              if Assigned(Self.OnGetWhereConditionItemSQLEvent) then
//              begin
//                AWhereConditionItemSQL:=OnGetWhereConditionItemSQLEvent(Self,
//                                          AWhereKeyJsonArray.O[I].S['logical_operator'],
//                                          AWhereKeyJsonArray.O[I].S['name'],
//                                          AWhereKeyJsonArray.O[I].S['operator'],
//                                          AWhereKeyJsonArray.O[I].V['value']);
//              end
//              else
//              begin
                AFieldTableAlias:='';
                if AFieldTableAliasList<>nil then
                begin
                  AFieldTableAlias:=AFieldTableAliasList.Values[AWhereKeyJsonArray.O[I].S['name']];
                end;
                //单个条件
                AWhereConditionItemSQL:=GetWhereConditionItemSQL(
                                            AWhereKeyJsonArray.O[I].S['logical_operator'],
                                            AWhereKeyJsonArray.O[I].S['name'],
                                            AWhereKeyJsonArray.O[I].S['operator'],
                                            AWhereKeyJsonArray.O[I].V['value'],
                                            AWhereKeyJsonArray.O[I].B['value_is_field'],
                                            AFieldTableAlias
                                            );

//              end;

          end;


          Result:=Result+AWhereConditionItemSQL;
      end;
  end;
end;

function GetWhereConditionESQuery(AWhereKeyJsonArray: ISuperArray;
                              AWhereKeyTranslatorList:TWhereKeyTranslatorList;
                              AFieldTableAliasList:TStringList): ISuperObject;
var
  I:Integer;
  AHasOR:Boolean;
  ASubWhereConditionSQL:ISuperObject;
  AWhereConditionItemSQL:ISuperObject;
  AWhereConditionItemSQLArray:ISuperArray;
  AWhereKeyTranslator:TWhereKeyTranslator;
  AFieldTableAlias:String;
begin
  Result:=SO();
  AHasOR:=False;
  AWhereConditionItemSQLArray:=SA();
//  Result.O['bool'].A['must'];
//  ASubWhereConditionSQL:='';

  for I := 0 to AWhereKeyJsonArray.Length-1 do
  begin
      if AWhereKeyJsonArray.O[I].Contains('conditions') then
      begin
          //子条件列表

          ASubWhereConditionSQL:=GetWhereConditionESQuery(AWhereKeyJsonArray.O[I].A['conditions'],AWhereKeyTranslatorList,AFieldTableAliasList);

//          Result:=Result
//                +' '+AWhereKeyJsonArray.O[I].S['logical_operator']
//                +' ('+ASubWhereConditionSQL+') ';

          AWhereConditionItemSQL:=SO();
          AWhereConditionItemSQL.O['bool']:=ASubWhereConditionSQL;

//        AWhereConditionItemSQLArray.O[AWhereConditionItemSQLArray.Length]:=AWhereConditionItemSQL;
      end
      else
      begin

          //自定义获取条件表达式
//          AWhereKeyTranslator:=nil;
//          if AWhereKeyTranslatorList<>nil then AWhereKeyTranslatorList.Find(AWhereKeyJsonArray.O[I].S['name']);
//          if AWhereKeyTranslator<>nil then
//          begin
//              AWhereConditionItemSQL:=AWhereKeyTranslator.DoGetWhereConditionItemSQL(
//                                          AWhereKeyJsonArray.O[I].S['logical_operator'],
//                                          AWhereKeyJsonArray.O[I].S['operator'],
//                                          AWhereKeyJsonArray.O[I].V['value']);
//          end
//          else
//          begin

//              if Assigned(Self.OnGetWhereConditionItemSQLEvent) then
//              begin
//                AWhereConditionItemSQL:=OnGetWhereConditionItemSQLEvent(Self,
//                                          AWhereKeyJsonArray.O[I].S['logical_operator'],
//                                          AWhereKeyJsonArray.O[I].S['name'],
//                                          AWhereKeyJsonArray.O[I].S['operator'],
//                                          AWhereKeyJsonArray.O[I].V['value']);
//              end
//              else
//              begin

                if SameText(AWhereKeyJsonArray.O[I].S['logical_operator'],'OR') then
                begin
                  AHasOR:=True;
                end;
                
                AFieldTableAlias:='';
                if AFieldTableAliasList<>nil then
                begin
                  AFieldTableAlias:=AFieldTableAliasList.Values[AWhereKeyJsonArray.O[I].S['name']];
                end;

                //单个条件
                AWhereConditionItemSQL:=GetWhereConditionItemESQuery(Result,//Result.O['bool'],
                                                                      AWhereKeyJsonArray.O[I].S['logical_operator'],
                                                                      AWhereKeyJsonArray.O[I].S['name'],
                                                                      AWhereKeyJsonArray.O[I].S['operator'],
                                                                      AWhereKeyJsonArray.O[I].V['value'],
                                                                      AWhereKeyJsonArray.O[I].B['value_is_field'],
                                                                      AFieldTableAlias
                                                                      );




//              end;

//          end;


//          Result:=Result+AWhereConditionItemSQL;

//        Result.A['must'].O[Result.A['must'].Length]:=AWhereConditionItemSQL;

//          Result.O['bool']:=AWhereConditionItemSQL;

      end;
      AWhereConditionItemSQLArray.O[AWhereConditionItemSQLArray.Length]:=AWhereConditionItemSQL;

  end;

  //根据and 和 or 来拼是must还是should
  if AWhereConditionItemSQLArray.Length>0 then
  begin
    if not AHasOR then
    begin
      //用MUST
      Result.A['must']:=AWhereConditionItemSQLArray;
    end
    else
    begin
      Result.A['should']:=AWhereConditionItemSQLArray;
    end;
  end;
  

end;


function GetWhereConditionItemSQL(ALogicOperator,
                            AName,
                            AOperator:String;
                            AValue:Variant;
                            AFieldValueIsField:Boolean=False;AFieldTableAlias:String=''): String;
var
  AValueStr:String;
begin
  //有些字段有表别名,则要加上表别名
//  if Self.FFieldTableAliasList.Values[AName]<>'' then
//  begin
//    AName:=Self.FFieldTableAliasList.Values[AName]+AName;
//  end;

  if AFieldTableAlias<>'' then
  begin
    AName:=AFieldTableAlias+AName;
  end;

  if SameText(AOperator,'LIKE') then
  begin
      //LIKE i'm  -> LIKE i''m
      AValueStr:=QuotedStr(AValue);
      //去掉两边的引号
      AValueStr:=Copy(AValueStr,2,Length(AValueStr)-2);
      Result:=' '+ALogicOperator+' ( '+AName+' '+AOperator+' ''%'+AValueStr+'%'' ) ';
  end
  else if SameText(AOperator,'IN') then
  begin
      //IN ('待派','已派工')  ->  IN (''待派'',''已派工'')
      Result:=' '+ALogicOperator+' ( '+AName+' '+AOperator+' '+AValue+' ) ';
  end
  else if SameText(AOperator,'IS') then
  begin
      //IS NULL,IS NOT NULL
      Result:=' '+ALogicOperator+' ( '+AName+' '+AOperator+' '+AValue+' ) ';
  end
  else if SameText(AOperator,'EXISTS') then
  begin
      //不为空
      Result:=' '+ALogicOperator+' ( IFNULL('+AName+','''') <> '+''''+' ) ';
  end
  else
  begin
      if (VarType(AValue)=varString)
        or (VarType(AValue)=varUString) then
      begin
        if not AFieldValueIsField then
        begin
          Result:=' '+ALogicOperator+' ('+AName+' '+AOperator+' '+QuotedStr(AValue)+') ';
        end
        else
        begin
          Result:=' '+ALogicOperator+' ('+AName+' '+AOperator+' '+AValue+') ';
        end;
      end
      else
      begin
        AValueStr:=AValue;
        Result:=' '+ALogicOperator+' ('+AName+' '+AOperator+' '+AValueStr+') ';
      end;
  end;
end;

function GetWhereConditionItemESQuery(AESQuery:ISuperObject;
                                      ALogicOperator,
                                      AName,
                                      AOperator:String;
                                      AValue:Variant;
                                      AFieldValueIsField:Boolean=False;AFieldTableAlias:String=''):ISuperObject;
var
  AValueStr:String;
  AValueList:TStringList;
  I: Integer;
begin
  Result:=SO();

  //有些字段有表别名,则要加上表别名
//  if Self.FFieldTableAliasList.Values[AName]<>'' then
//  begin
//    AName:=Self.FFieldTableAliasList.Values[AName]+AName;
//  end;
  //https://blog.csdn.net/m0_38071129/article/details/126423242

  if AFieldTableAlias<>'' then
  begin
    AName:=AFieldTableAlias+AName;
  end;

  //ES的搜索条件：https://blog.csdn.net/xyc1211/article/details/120349794
  if SameText(AOperator,'LIKE') then
  begin

      AValueStr:=VarToStr(AValue);
      if POS(' ',AValue)>0 then
      begin

        //如果关键词有空格,那么只需要同时满足存在这两个字段就可以了
//        Result.O['match'].V[AName]:=AValue;
        AValueList:=SplitString(AValueStr,' ');
        try
          for I := 0 to AValueList.Count-1 do
          begin
            Result.O['bool'].A['must'].O[Result.O['bool'].A['must'].Length].O['term'].S[AName]:=AValueList[I];
          end;
        finally
          FreeAndNil(AValueList);
        end;

      end
      else
      begin
        //如果关键词有空格,那么只需要同时满足存在这两个字段就可以了
        Result.O['match'].V[AName]:=AValue;
      end;

  end
  else if SameText(AOperator,'IN') then
  begin
      //('','','')
      AValueStr:=VarToStr(AValue);
      //去掉括号
      AValueStr:=Trim(AValueStr);
      AValueStr:=Copy(AValueStr,2,Length(AValueStr)-2);
      //去掉全部的单引号
      AValueStr:=ReplaceStr(AValueStr,'''','');
      AValueList:=SplitString(AValueStr);
      try
        for I := 0 to AValueList.Count-1 do
        begin
          Result.O['terms'].A[AName].S[I]:=AValueList[I];
        end;
      finally
        FreeAndNil(AValueList);
      end;
  end
  else if SameText(AOperator,'IS') then
  begin
      //IS NULL,IS NOT NULL
      if SameText(AValue,'null') then
      begin
        //IS NULL
        Result.O['bool'].A['must_not'].O[Result.O['bool'].A['must_not'].Length].O['exists'].S['field']:=AName;
      end
      else
      begin
        //IS NOT NULL
        Result.O['exists'].S['field']:=AName;
      end;
  end
  else
  if SameText(AOperator,'EXISTS') then
  begin
      //存在字段
      Result.O['bool'].A['must'].O[Result.O['bool'].A['must'].Length].O['exists'].S['field']:=AName;
      Result.O['bool'].A['must_not'].O[Result.O['bool'].A['must_not'].Length].O['term'].S[AName]:='';
  end
  else
  if SameText(AOperator,'wildcard') then
  begin
      Result.O['wildcard'].V[AName]:=AValue;
  end
  else
  if SameText(AOperator,'raw') then
  begin
      //直接就是原始
      Result:=SO(AValue);
  end
//  else
//  //时间范围
//  if SameText(AOperator,'RANGE') then
//  begin
//      //大于
//      Result.O['range'].O[AName].S['gte']:=AValue;
//      //小于
//      Result.O['range'].O[AName].S['lte']:=AValue;
//  end
  else
  //时间范围
  if SameText(AOperator,'<=') then
  begin
      //小于
      Result.O['range'].O[AName].S['lte']:=AValue;
  end
  else
  //时间范围
  if SameText(AOperator,'<') then
  begin
      //小于
      Result.O['range'].O[AName].S['lt']:=AValue;
  end
  else
  //时间范围
  if SameText(AOperator,'>=') then
  begin
      //大于
      Result.O['range'].O[AName].S['gte']:=AValue;
  end
  else
  //时间范围
  if SameText(AOperator,'>') then
  begin
      //大于
      Result.O['range'].O[AName].S['gt']:=AValue;
  end
  else
  if SameText(AOperator,'=') then
  begin
//      if (VarToStr(AValue)='') then
//      begin
//        //值为空则表示：
//        //字段不存在,或者值为空字符串
//        Result.O['bool'].A['should'].O[Result.O['bool'].A['should'].Length].O['exists'].S['field']:=AName;
//        Result.O['bool'].A['should'].O[Result.O['bool'].A['should'].Length].O['term'].S[AName]:='';
//      end
//      else
//      begin
        Result.O['term'].V[AName]:=AValue;
//      end;
  end
  else
  if SameText(AOperator,'<>') then
  begin
    if (VarToStr(AValue)='') then
    begin
      //值不为空则表示：
      //存在值且不为空字符串
      Result.O['bool'].A['must'].O[Result.O['bool'].A['must'].Length].O['exists'].S['field']:=AName;
    end;
    Result.O['bool'].A['must_not'].O[Result.O['bool'].A['must_not'].Length].O['term'].S[AName]:=AValue;
  end
  else//简单的比较条件
  begin
      raise Exception.Create('GetWhereConditionItemESQuery UnSupport Operator');
  end;
end;


function GetJsonValueArray(AFieldNames:Array of String;AJson:ISuperObject):TVariantDynArray;
var
  I: Integer;
begin
  SetLength(Result,Length(AFieldNames));
  for I := 0 to Length(AFieldNames)-1 do
  begin
    Result[I]:=AJson.V[AFieldNames[I]];
  end;
end;

//获取参数数组中的参数值
function GetParamValue(ANameArray:TStringDynArray;
                            AValueArray:TVariantDynArray;
                            AParamName:String;
                            ADefaultValue:Variant):Variant;
var
  I:Integer;
begin
  Result:=ADefaultValue;

  for I := 0 to Length(ANameArray)-1 do
  begin
    if ANameArray[I]=AParamName then
    begin
      Result:=AValueArray[I];
      Exit;
    end;
  end;
end;


function TSuperObjectParseStream(AStream:TStream):ISuperObject;
var
  AStingStream:TStringStream;
begin
  AStingStream:=TStringStream.Create('',TEncoding.UTF8);
  try
    AStingStream.LoadFromStream(AStream);

    Result := SO(AStingStream.DataString);
  finally
    FreeAndNil(AStingStream);
  end;
end;

function IsSameJsonObject(AJson,BJson:ISuperObject):Boolean;
begin
  //先获取键值是不是相等
  Result:=(AJson.AsJSON=BJson.AsJSON);
end;

//function IsSameJsonArray(AJsonArray,BJsonArray:ISuperArray):Boolean;
//begin
//
//end;

function GetDatasetFieldDefsJson(ADataset:TDataset;AFieldMapList:TStringList=nil):ISuperArray;
var
  I: Integer;
  ASuperObject:ISuperObject;
  ADataTypeName:String;
  AFieldDef:TFieldDef;
begin
  Result:=TSuperArray.Create();
  for I := 0 to ADataset.FieldDefs.Count-1 do
  begin
    AFieldDef:=ADataset.FieldDefs[I];

    if not (faHiddenCol in AFieldDef.Attributes) then
    begin

      ASuperObject:=TSuperObject.Create();


      ASuperObject.S['name']:=AFieldDef.Name;
      if AFieldMapList<>nil then
      begin
        if AFieldMapList.Values[AFieldDef.Name]<>'' then
        begin
          ASuperObject.S['name']:=AFieldMapList.Values[AFieldDef.Name];
        end;
      end;
      ASuperObject.I['size']:=AFieldDef.Size;

      //精度
      ASuperObject.I['precision']:=AFieldDef.Precision;


      //直接取字段类型的整型值
      ASuperObject.I['field_type']:=Ord(AFieldDef.DataType);
      ASuperObject.S['data_type']:='';



      case AFieldDef.DataType of
        ftUnknown:
        begin
          ADataTypeName:='unknown';
        end;
        ftString:
        begin
          ADataTypeName:='string';
        end;
        ftSmallint:
        begin
          ADataTypeName:='smallint';
        end;
        ftInteger:
        begin
          ADataTypeName:='integer';
        end;
        ftWord:
        begin
          ADataTypeName:='word';
        end;
        ftBoolean:
        begin
          ADataTypeName:='boolean';
        end;
        ftFloat:
        begin
          ADataTypeName:='float';
        end;
        ftCurrency:
        begin
          ADataTypeName:='currency';
        end;
        ftBCD:
        begin
          ADataTypeName:='bcd';
        end;
        ftDate:
        begin
          ADataTypeName:='date';
        end;
        ftTime:
        begin
          ADataTypeName:='time';
        end;
        ftDateTime:
        begin
          ADataTypeName:='datetime';
        end;
        ftBytes:
        begin
          ADataTypeName:='bytes';
        end;
        ftVarBytes:
        begin
          ADataTypeName:='varbytes';
        end;
        ftAutoInc:
        begin
          ADataTypeName:='autoinc';
        end;
        ftBlob:
        begin
          ADataTypeName:='blob';

        end;
        ftMemo:
        begin
          ADataTypeName:='memo';
//          ASuperObject.I['size']:=2048;//如果memo转成string字段,因为没有datasize,所以创建会报错
        end;
        ftGraphic:
        begin
          ADataTypeName:='graphic';
        end;
        ftFmtMemo:
        begin
          ADataTypeName:='fmtmemo';
//          ASuperObject.I['size']:=2048;//如果memo转成string字段,因为没有datasize,所以创建会报错
        end;
        ftParadoxOle:
        begin
          ADataTypeName:='paradoxole';
        end;
        ftDBaseOle:
        begin
          ADataTypeName:='dbaseole';
        end;
        ftTypedBinary:
        begin
          ADataTypeName:='typedbinary';
        end;
        ftCursor:
        begin
          ADataTypeName:='cursor';
        end;
        ftFixedChar:
        begin
          ADataTypeName:='fixedchar';
        end;
        ftWideString:
        begin
          ADataTypeName:='widestring';
        end;
        ftLargeint:
        begin
          ADataTypeName:='largeint';
        end;
        ftADT:
        begin
          ADataTypeName:='adt';
        end;
        ftArray:
        begin
          ADataTypeName:='array';
        end;
        ftReference:
        begin
          ADataTypeName:='reference';
        end;
        ftDataSet:
        begin
          ADataTypeName:='dataset';
        end;
        ftOraBlob:
        begin
          ADataTypeName:='orablob';
        end;
        ftOraClob:
        begin
          ADataTypeName:='oraclob';
        end;
        ftVariant:
        begin
          ADataTypeName:='variant';
        end;
        ftInterface:
        begin
          ADataTypeName:='interface';
        end;
        ftIDispatch:
        begin
          ADataTypeName:='idispatch';
        end;
        ftGuid:
        begin
          ADataTypeName:='guid';
        end;
        ftTimeStamp:
        begin
          ADataTypeName:='timestamp';
        end;
        ftFMTBcd:
        begin
          ADataTypeName:='fmtbcd';
        end;
        ftFixedWideChar:
        begin
          ADataTypeName:='fixedwidechar';
        end;
        ftWideMemo:
        begin
          ADataTypeName:='widememo';
//          ASuperObject.I['size']:=2048;//如果memo转成string字段,因为没有datasize,所以创建会报错
        end;
        ftOraTimeStamp:
        begin
          ADataTypeName:='oratimestamp';
        end;
        ftOraInterval:
        begin
          ADataTypeName:='orainterval';
        end;
        ftLongWord:
        begin
          ADataTypeName:='longword';
        end;
        ftShortint:
        begin
          ADataTypeName:='shortint';
        end;
        ftByte:
        begin
          ADataTypeName:='byte';
        end;
        ftExtended:
        begin
          ADataTypeName:='extended';
        end;
        ftConnection:
        begin
          ADataTypeName:='connection';
        end;
        ftParams:
        begin
          ADataTypeName:='params';
        end;
        ftStream:
        begin
          ADataTypeName:='stream';
        end;
        ftTimeStampOffset:
        begin
          ADataTypeName:='timestampoffset';
        end;
        ftObject:
        begin
          ADataTypeName:='object';
        end;
        ftSingle:
        begin
          ADataTypeName:='single';
        end;
      end;; //49..51




//      case ADataset.FieldDefs[I].DataType of
//        ftSmallint,ftInteger,ftWord,ftLargeint,ftTimeStamp,ftLongWord,ftShortint,ftByte:
//          ADataTypeName:='integer';
//        ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle:
//          ADataTypeName:='float';
//        ftDate,ftTime,ftDatetime:
//          ADataTypeName:='datetime';
//        ftBoolean:
//          ADataTypeName:='boolean';
//        ftString,ftWideString,ftFixedChar,ftFixedWideChar,ftGuid:
//          ADataTypeName:='string';
//        ftMemo,ftFmtMemo,ftWideMemo:
//        begin
//          ADataTypeName:='string';
//          ASuperObject.I['size']:=2048;//memo类型的datasize怎么是0
//        end
//        else
//        begin
//          //其他字段类型的列,使用String
//          uBaseLog.HandleException(nil,'GetDatasetFieldDefsJson Unknown Field DataType');
//          ADataTypeName:='string';
//        end;
//      end;




      ASuperObject.S['data_type']:=ADataTypeName;


      Result.O[Result.Length]:=ASuperObject;
    end;
  end;
end;

function GetKeyValuesFromJsonObjectArray(AJsonObjectArray:ISuperArray;
                                          AKey:String):TStringDynArray;
var
  I: Integer;
begin
  SetLength(Result,AJsonObjectArray.Length);
  for I := 0 to AJsonObjectArray.Length-1 do
  begin
    Result[I]:=AJsonObjectArray.O[I].S[AKey];
  end;
end;

function LocateArray(AStr:String;AStringArray:TStringDynArray):Integer;
var
  I: Integer;
begin
  Result:=-1;
  for I := 0 to Length(AStringArray)-1 do
  begin
    if AStringArray[I]=AStr then
    begin
      Result:=I;
      Break;
    end;
  end;
end;

procedure MergeJson(AFromJson:ISuperObject;AToJson:ISuperObject;AIsOverride:Boolean=True;AIsMergeArray:Boolean=False;AIgnoreFieldList:TStringDynArray=[]);
var
  I: Integer;
  AParamNames:TStringDynArray;
begin
  //获取需要添加的字段,去掉表中不存在的字段
  AParamNames:=GetJsonNameArray(AFromJson,nil,True,AIsMergeArray);
  for I := 0 to Length(AParamNames)-1 do
  begin
    if LocateArray(AParamNames[I],AIgnoreFieldList)<>-1 then Continue;
    
    //直接覆盖
    if AIsOverride
      //不存在,才添加
      or not AIsOverride and not AToJson.Contains(AParamNames[I]) then
    begin
      //是否需要覆盖数组
      if (AFromJson.GetType(AParamNames[I])=varArray) and AIsMergeArray then
      begin
        AToJson.A[AParamNames[I]]:=AFromJson.A[AParamNames[I]];
      end
      else
      //是否需要覆盖对象
      if AFromJson.GetType(AParamNames[I])=varObject then
      begin
        AToJson.O[AParamNames[I]]:=AFromJson.O[AParamNames[I]];
      end
      else
      begin
        //
        AToJson.V[AParamNames[I]]:=AFromJson.V[AParamNames[I]];
      end;
    end;
  end;

end;

function CutStringArray(AFieldNames:Array of String;ACount:Integer):TStringDynArray;
var
  I: Integer;
begin
  SetLength(Result,ACount);
  for I := 0 to ACount-1 do
  begin
    Result[I]:=AFieldNames[I];
  end;
end;

function CutVariantArray(AFieldValues:TVariantDynArray;ACount:Integer):TVariantDynArray;
var
  I: Integer;
begin
  SetLength(Result,ACount);
  for I := 0 to ACount-1 do
  begin
    Result[I]:=AFieldValues[I];
  end;
end;

function ConvertJsonArray(AJsonArray:Array of ISuperObject):ISuperArray;
var
  I: Integer;
begin
  Result:=SA();
  for I := 0 to Length(AJsonArray)-1 do
  begin
    if AJsonArray[I]<>nil then
    begin
      Result.O[Result.Length]:=AJsonArray[I];
    end;
  end;
end;


function GetFieldCondition(ALogicalOperator:String;
                            AFieldName:String;
                            //条件运算符
                            ACompareOperator:String;
                            AFieldValue:Variant;
                            AFieldValueIsFieldName:Boolean):ISuperObject;
var
  AWhereKeyJson:ISuperObject;
begin
  AWhereKeyJson:=TSuperObject.Create;
  AWhereKeyJson.S['logical_operator']:=ALogicalOperator;
  AWhereKeyJson.S['name']:=AFieldName;
  AWhereKeyJson.S['operator']:=ACompareOperator;
  AWhereKeyJson.V['value']:=AFieldValue;

  if AFieldValueIsFieldName then
  begin
    AWhereKeyJson.B['value_is_field']:=AFieldValueIsFieldName;
  end;

  Result:=AWhereKeyJson;
end;

function GetWhereConditionArray(AFieldNames:Array of String;
                            AFieldValues:Array of Variant):ISuperArray;
var
  I:Integer;
begin
  Result:=TSuperArray.Create;

  for I := 0 to Length(AFieldNames)-1 do
  begin
    Result.O[I]:=GetFieldCondition('AND',AFieldNames[I],'=',AFieldValues[I]);
  end;

end;

function GetWhereConditions(AFieldNames:Array of String;
                            AFieldValues:Array of Variant):String;
var
  I:Integer;
  AWhereKeyJsonArray:ISuperArray;
begin
  AWhereKeyJsonArray:=TSuperArray.Create;

  for I := 0 to Length(AFieldNames)-1 do
  begin
    AWhereKeyJsonArray.O[I]:=GetFieldCondition('AND',AFieldNames[I],'=',AFieldValues[I]);
  end;

  Result:=AWhereKeyJsonArray.AsJSON;
end;

procedure ConvertJsonArrayToLevel(AJsonArray:ISuperArray;
                                  ALevelChildFieldName:String;
                                  ALevelParentFieldName:String;
                                  AParentFieldValue:String;
                                  ALevelJsonArray:ISuperArray);
var
  I: Integer;
  AIndex:Integer;
  ALevelFieldValue:String;
begin
  AIndex:=0;
  for I := 0 to AJsonArray.Length-1 do
  begin
    //当前记录的parent_fid是AParentFieldValue
    ALevelFieldValue:=AJsonArray.O[I].V[ALevelParentFieldName];
    if ALevelFieldValue=AParentFieldValue then
    begin
      ALevelJsonArray.O[AIndex]:=AJsonArray.O[I];

      //递归,将子节点的
      ConvertJsonArrayToLevel(
                            AJsonArray,
                            ALevelChildFieldName,
                            ALevelParentFieldName,
                            AJsonArray.O[I].V[ALevelChildFieldName],
                            ALevelJsonArray.O[AIndex].A['SubRecordList']
                            );

      Inc(AIndex);
    end;
  end;
end;

function LocateJsonArray(AJsonArray:ISuperArray;
                        AName:String;
                        AValue:Variant;
                        AStartIndex:Integer=0):ISuperObject;
var
  I:Integer;
begin
  Result:=nil;
  for I := AStartIndex to AJsonArray.Length-1 do
  begin
    //遍历所有key
    if (AJsonArray.O[I].Contains(AName)) and (AJsonArray.O[I].V[AName]=AValue) then
    begin
      Result:=AJsonArray.O[I];
      Break;
    end;
  end;

end;

function LocateJsonValueArray(AJsonArray:ISuperArray;
                        AValue:Variant;
                        AStartIndex:Integer=0):Integer;
var
  I:Integer;
begin
  Result:=-1;
  for I := AStartIndex to AJsonArray.Length-1 do
  begin
    //遍历所有key
    if (AJsonArray.V[I]=AValue) then
    begin
      Result:=I;
      Break;
    end;
  end;

end;

function LocateJsonArrayValueArray(AJsonArray:ISuperArray;
                                    AIndex:Integer;
                                    AValue:Variant):ISuperArray;
var
  I:Integer;
begin
  Result:=nil;
  for I := 0 to AJsonArray.Length-1 do
  begin
    if (AJsonArray.A[I].V[AIndex]=AValue) then
    begin
      Result:=AJsonArray.A[I];
      Break;
    end;
  end;

end;

function LocateJsonArrayIndex(AJsonArray:ISuperArray;
                        AName:String;
                        AValue:Variant;
                        AStartIndex:Integer=0):Integer;
var
  I:Integer;
begin
  Result:=-1;
  for I := AStartIndex to AJsonArray.Length-1 do
  begin
    //遍历所有key
    if (AJsonArray.O[I].V[AName]=AValue) then
    begin
      Result:=I;
      Break;
    end;
  end;

end;

function GetJsonArrayValues(AJsonArray: ISuperArray;AKeyName:String):TVariantDynArray;
var
  I:Integer;
begin
  SetLength(Result,AJsonArray.Length);
  for I := 0 to AJsonArray.Length-1 do
  begin
    Result[I]:=AJsonArray.O[I].V[AKeyName];
  end;

end;

function GetJsonArrayValues2(AJsonArray: ISuperArray;AKeyName:String):ISuperArray;
var
  I:Integer;
  AVariantDynArray:TVariantDynArray;
begin
  AVariantDynArray:=GetJsonArrayValues(AJsonArray,AKeyName);

  Result:=SA();
  for I := 0 to Length(AVariantDynArray)-1 do
  begin
    Result.V[I]:=AVariantDynArray[I];
  end;

end;

function ConvertArrayToStringList(AValues:TVariantDynArray):TStringList;
var
  I: Integer;
begin
  Result:=TStringList.Create;
  for I := 0 to Length(AValues)-1 do
  begin
    Result.Add(VarToStr(AValues[I]));
  end;
end;

function GetJsonArrayValuesCommaText(AJsonArray: ISuperArray;AKeyName:String):String;
var
  AStringList:TStringList;
begin
  AStringList:=ConvertArrayToStringList(GetJsonArrayValues(AJsonArray,AKeyName));
  try
    Result:=AStringList.CommaText;
  finally
    FreeAndNil(AStringList);
  end;
end;

function GetJsonArrayValuesCommaText(AJsonArray: ISuperArray):String;
var
  AStr:String;
  I: Integer;
begin
  Result:='';
  for I := 0 to AJsonArray.Length-1 do
  begin
    AStr:=AJsonArray.V[I];
    if Result<>'' then
    begin
      Result:=Result+',';
    end;
    Result:=Result+AStr;
  end;
end;

//function LocateJsonArray(AJsonArray:ISuperArray;
//                        AName:String;
//                        AValue:Variant;
//                        AName1:String;
//                        AValue1:Variant):ISuperObject;
//var
//  I:Integer;
//begin
//  Result:=nil;
//  for I := 0 to AJsonArray.Length-1 do
//  begin
//    //遍历所有key
//    if (AJsonArray.O[I].V[AName]=AValue)
//      and (AJsonArray.O[I].V[AName1]=AValue1) then
//    begin
//      Result:=AJsonArray.O[I];
//      Break;
//    end;
//  end;
//
//end;

function LocateJsonArray(AJsonArray:ISuperArray;
                          ANames:TStringDynArray;
                          AValues:TVariantDynArray;
                          AStartIndex:Integer=0):ISuperObject;overload;
var
  I:Integer;
  J: Integer;
  AIsEqual:Boolean;
begin
  Result:=nil;
  for I := AStartIndex to AJsonArray.Length-1 do
  begin

    AIsEqual:=True;
    for J := 0 to Length(ANames)-1 do
    begin
      if AJsonArray.O[I].V[ANames[J]]<>AValues[J] then
      begin
        AIsEqual:=False;
        Break;
      end;
    end;

    if AIsEqual then
    begin
      Result:=AJsonArray.O[I];
      Break;
    end;
  end;
end;

function ConvertArrayToJson(ANameValueArray:TVariantDynArray):ISuperObject;
begin
  Result:=SO();
  ConvertArrayToJson(ANameValueArray,Result);
end;

procedure ConvertArrayToJson(ANameValueArray:TVariantDynArray;
                            AJson:ISuperObject);
var
  I: Integer;
begin
  for I := 0 to Length(ANameValueArray) div 2 -1 do
  begin
    AJson.V[ANameValueArray[I*2]]:=ANameValueArray[I*2+1];
  end;

//procedure ConvertArrayToJson(ANameValueArray:TVariantDynArray;
//                            AJson:ISuperObject);
//var
//  I: Integer;
//begin
//  for I := 0 to Length(ANameValueArray) div 2 -1 do
//  begin
//    AJson.V[ANameValueArray[I*2]]:=ANameValueArray[I*2+1];
//  end;
//
//<<<<<<< .mine
end;

function ConvertArrayToJson(ANameArray:TStringDynArray;
                            AValueArray:TVariantDynArray):ISuperObject;
begin
  Result:=SO();
  ConvertArrayToJson(ANameArray,AValueArray,Result);
end;


procedure ConvertArrayToJson(ANameArray:TStringDynArray;
                            AValueArray:TVariantDynArray;
                            AJson:ISuperObject);
var
  I: Integer;
begin
  for I := 0 to Length(ANameArray)-1 do
  begin
    AJson.V[ANameArray[I]]:=AValueArray[I];
  end;
end;

//||||||| .r16098
//=======
//
//end;
//
//procedure ConvertArrayToJson(ANameArray:TStringDynArray;
//                            AValueArray:TVariantDynArray;
//                            AJson:ISuperObject);
//var
//  I: Integer;
//begin
//  for I := 0 to Length(ANameArray)-1 do
//  begin
//    AJson.V[ANameArray[I]]:=AValueArray[I];
//  end;
//end;
//
//>>>>>>> .r17253

function ComposeJsonObjectsToArray(AJsonObjects:Array of ISuperObject):ISuperArray;
var
  I: Integer;
begin
  Result:=TSuperArray.Create();
  for I := 0 to Length(AJsonObjects)-1 do
  begin
    Result.O[I]:=AJsonObjects[I];
  end;
end;


function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            AFieldList:TStringList;
                            ANoAddKeyName:String;
                            AIsNeedNullValueField:Boolean;
                            AIsNeedArrayValueField:Boolean;
                            AIsNeedObjectValueField:Boolean):Integer;
var
  I:Integer;
  {$IF CompilerVersion > 21.0} // XE or older
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
  {$ELSE} // D2010之前
  ASuperEnumerator:TSuperAvlIterator;
  {$IFEND} // XE or older
  ACurrentName:String;
  ACurrentValue:Variant;
begin
  Result:=GetJsonCount(AJson,AFieldList,ANoAddKeyName,AIsNeedNullValueField,AIsNeedArrayValueField,AIsNeedObjectValueField);
  SetLength(ANameArray,Result);
  SetLength(AValueArray,Result);

  I:=0;

  //XSuperObject
  {$IF CompilerVersion > 21.0} // XE or older
  ASuperEnumerator:=AJson.GetEnumerator;
  {$ELSE} // D2010之前
  ASuperEnumerator:=AJson.AsObject.GetEnumerator;
  {$IFEND} // XE or older

  while ASuperEnumerator.MoveNext do
  begin
      {$IF CompilerVersion > 21.0} // XE or older
      ACurrentName:=ASuperEnumerator.GetCurrent.Name;
      ACurrentValue:=ASuperEnumerator.GetCurrent.AsVariant;
      {$ELSE} // D2010之前
      ACurrentName:=ASuperEnumerator.Current.Name;
      ACurrentValue:=AJson.V[ASuperEnumerator.Current.Name];
      {$IFEND} // XE or older

      if (AFieldList<>nil) and (AFieldList.IndexOf(ACurrentName)=-1) then
      begin
        uBaseLog.HandleException(nil,'ConvertJsonToArray Key不存在：'+ACurrentName);
        continue;
      end;

      if  //字段没有NOPOST前缀
          Not SameText(
                Copy(ACurrentName,1,Length(NOPOST)),
                NOPOST)
          and (
                (AFieldList=nil)
              or (AFieldList<>nil) and (AFieldList.IndexOf(ACurrentName)<>-1)
              )
          and ((ANoAddKeyName='') or (ANoAddKeyName<>ACurrentName))
         and (AIsNeedNullValueField or not AIsNeedNullValueField and not VarIsNULL(ACurrentValue))
         and (AIsNeedArrayValueField or not AIsNeedArrayValueField and (AJson.GetType(ACurrentName)<>varArray)  )
         and (AIsNeedObjectValueField or not AIsNeedObjectValueField and (AJson.GetType(ACurrentName)<>varObject)  )
         then
      begin
        ANameArray[I]:=ACurrentName;
        AValueArray[I]:=ACurrentValue;

        Inc(I);
      end;
  end;
end;


function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            var AValueTypeArray:TVarTypeDynArray;
                            AFieldList:TStringList;
                            ANoAddKeyName:String;
                            AIsNeedNullValueField:Boolean;
                            AIsNeedArrayValueField:Boolean;
                            AIsNeedObjectValueField:Boolean):Integer;
var
  I:Integer;
  {$IF CompilerVersion > 21.0} // XE or older
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
  {$ELSE} // D2010之前
  ASuperEnumerator:TSuperAvlIterator;
  {$IFEND} // XE or older
  ACurrentName:String;
  ACurrentValue:Variant;
begin
  Result:=GetJsonCount(AJson,AFieldList,ANoAddKeyName,AIsNeedNullValueField,AIsNeedArrayValueField,AIsNeedObjectValueField);
  SetLength(ANameArray,Result);
  SetLength(AValueArray,Result);
  SetLength(AValueTypeArray,Result);

  I:=0;

    //XSuperObject
    {$IF CompilerVersion > 21.0} // XE or older
    ASuperEnumerator:=AJson.GetEnumerator;
    {$ELSE} // D2010之前
    ASuperEnumerator:=AJson.AsObject.GetEnumerator;
    {$IFEND} // XE or older

    while ASuperEnumerator.MoveNext do
    begin

      {$IF CompilerVersion > 21.0} // XE or older
      ACurrentName:=ASuperEnumerator.GetCurrent.Name;
      ACurrentValue:=ASuperEnumerator.GetCurrent.AsVariant;
      {$ELSE} // D2010之前
      ACurrentName:=ASuperEnumerator.Current.Name;
      ACurrentValue:=AJson.V[ASuperEnumerator.Current.Name];
      {$IFEND} // XE or older

      if  //字段没有NOPOST前缀
          Not SameText(
                Copy(ACurrentName,1,Length(NOPOST)),
                NOPOST)
          and (
                (AFieldList=nil)
              or (AFieldList<>nil) and (AFieldList.IndexOf(ACurrentName)<>-1)
              )
          and ((ANoAddKeyName='') or (ANoAddKeyName<>ACurrentName))
         and (AIsNeedNullValueField or not AIsNeedNullValueField and not VarIsNULL(ACurrentValue))
         and (AIsNeedArrayValueField or not AIsNeedArrayValueField and (AJson.GetType(ACurrentName)<>varArray)  )
         and (AIsNeedObjectValueField or not AIsNeedObjectValueField and (AJson.GetType(ACurrentName)<>varObject)  )
         then
      begin
        ANameArray[I]:=ACurrentName;
        AValueArray[I]:=ACurrentValue;
        AValueTypeArray[I]:=AJson.GetType(ANameArray[I]);

        Inc(I);
      end;
    end;

end;

function GetJsonCount(AJson:ISuperObject;AFieldList:TStringList;
                            ANoAddKeyName:String;
                            AIsNeedNullValueField:Boolean;
                            AIsNeedArrayValueField:Boolean;
                            AIsNeedObjectValueField:Boolean):Integer;
var
  {$IF CompilerVersion > 21.0} // XE or older
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
  {$ELSE} // D2010之前
  ASuperEnumerator:TSuperAvlIterator;
  {$IFEND} // XE or older
  ACurrentName:String;
  ACurrentValue:Variant;
begin
  Result:=0;

  {$IF CompilerVersion > 21.0} // XE or older
  ASuperEnumerator:=AJson.GetEnumerator;
  {$ELSE} // D2010之前
  ASuperEnumerator:=AJson.AsObject.GetEnumerator;
  {$IFEND} // XE or older

  while ASuperEnumerator.MoveNext do
  begin

      {$IF CompilerVersion > 21.0} // XE or older
      ACurrentName:=ASuperEnumerator.GetCurrent.Name;
      ACurrentValue:=ASuperEnumerator.GetCurrent.AsVariant;
      {$ELSE} // D2010之前
      ACurrentName:=ASuperEnumerator.Current.Name;
      ACurrentValue:=AJson.V[ASuperEnumerator.Current.Name];
      {$IFEND} // XE or older

      if Not SameText(
            Copy(ACurrentName,1,Length(NOPOST)),
            NOPOST)
          and (
                (AFieldList=nil)
              or (AFieldList<>nil) and (AFieldList.IndexOf(ACurrentName)<>-1)
              )

         and ((ANoAddKeyName='') or (ANoAddKeyName<>ACurrentName))
         and (AIsNeedNullValueField or not AIsNeedNullValueField and not VarIsNULL(ACurrentValue))
         and (AIsNeedArrayValueField or not AIsNeedArrayValueField and (AJson.GetType(ACurrentName)<>varArray)  )
         and (AIsNeedObjectValueField or not AIsNeedObjectValueField and (AJson.GetType(ACurrentName)<>varObject)  )
         then
      begin

        Inc(Result);
      end;
  end;
end;

function GetJsonNameArray(AJson:ISuperObject;AIgnoreFieldList:TStringList;
                            AIsNeedNullValueField:Boolean;
                            AIsNeedArrayValueField:Boolean;
                            AIsNeedObjectValueField:Boolean):TStringDynArray;
var
  I:Integer;
  {$IF CompilerVersion > 21.0} // XE or older
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
  {$ELSE} // D2010之前
  ASuperEnumerator:TSuperAvlIterator;
  {$IFEND} // XE or older
  ACurrentName:String;
  ACurrentValue:Variant;
begin

  SetLength(Result,GetJsonCount(AJson,AIgnoreFieldList,'',AIsNeedNullValueField,AIsNeedArrayValueField,AIsNeedObjectValueField));

  //遍历所有key
  I:=0;
  {$IF CompilerVersion > 21.0} // XE or older
  ASuperEnumerator:=AJson.GetEnumerator;
  {$ELSE} // D2010之前
  ASuperEnumerator:=AJson.AsObject.GetEnumerator;
  {$IFEND} // XE or older


  while ASuperEnumerator.MoveNext do
  begin

    {$IF CompilerVersion > 21.0} // XE or older
    ACurrentName:=ASuperEnumerator.GetCurrent.Name;
    ACurrentValue:=ASuperEnumerator.GetCurrent.AsVariant;
    {$ELSE} // D2010之前
    ACurrentName:=ASuperEnumerator.Current.Name;
    ACurrentValue:=AJson.V[ASuperEnumerator.Current.Name];
    {$IFEND} // XE or older

    if Not SameText(
          Copy(ACurrentName,1,Length(NOPOST)),
          NOPOST)
        and (
              (AIgnoreFieldList=nil)
            or (AIgnoreFieldList<>nil) and (AIgnoreFieldList.IndexOf(ACurrentName)<>-1)
            )
         and (AIsNeedNullValueField or not AIsNeedNullValueField and not VarIsNULL(ACurrentValue))
         and (AIsNeedArrayValueField or not AIsNeedArrayValueField and (AJson.GetType(ACurrentName)<>varArray)  )
         and (AIsNeedObjectValueField or not AIsNeedObjectValueField and (AJson.GetType(ACurrentName)<>varObject)  )
         then
    begin
      Result[I]:=ACurrentName;

      Inc(I);
    end;
  end;

end;

function CopyJson(AJson:ISuperObject;AIgnoreFieldList:TStringList=nil;
                            AIsNeedNullValueField:Boolean=True;
                            AIsNeedArrayValueField:Boolean=True;
                            AIsNeedObjectValueField:Boolean=True):ISuperObject;
var
  I:Integer;
  {$IF CompilerVersion > 21.0} // XE or older
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
  {$ELSE} // D2010之前
  ASuperEnumerator:TSuperAvlIterator;
  {$IFEND} // XE or older
  ACurrentName:String;
  ACurrentValue:Variant;
begin

  Result:=SO();

  //遍历所有key
  I:=0;
  {$IF CompilerVersion > 21.0} // XE or older
  ASuperEnumerator:=AJson.GetEnumerator;
  {$ELSE} // D2010之前
  ASuperEnumerator:=AJson.AsObject.GetEnumerator;
  {$IFEND} // XE or older


  while ASuperEnumerator.MoveNext do
  begin

    {$IF CompilerVersion > 21.0} // XE or older
    ACurrentName:=ASuperEnumerator.GetCurrent.Name;
    ACurrentValue:=ASuperEnumerator.GetCurrent.AsVariant;
    {$ELSE} // D2010之前
    ACurrentName:=ASuperEnumerator.Current.Name;
    ACurrentValue:=AJson.V[ASuperEnumerator.Current.Name];
    {$IFEND} // XE or older

    if Not SameText(
          Copy(ACurrentName,1,Length(NOPOST)),
          NOPOST)
        and (
              (AIgnoreFieldList=nil)
            or (AIgnoreFieldList<>nil) and (AIgnoreFieldList.IndexOf(ACurrentName)=-1)
            )
         and (AIsNeedNullValueField or not AIsNeedNullValueField and not VarIsNULL(ACurrentValue))
         and (AIsNeedArrayValueField or not AIsNeedArrayValueField and (AJson.GetType(ACurrentName)<>varArray)  )
         and (AIsNeedObjectValueField or not AIsNeedObjectValueField and (AJson.GetType(ACurrentName)<>varObject)  )
         then
    begin
      Result.V[ACurrentName]:=ACurrentValue;

    end;
  end;

end;



//function GetJsonValueArray(AJson:ISuperObject;AFieldList:String):TVariantDynArray;
//var
//  I:Integer;
//  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
//  AFieldList:TStringList;
//begin
//
//  SetLength(Result,GetJsonCount(AJson));
//
//  //遍历所有key
//  I:=0;
//  ASuperEnumerator:=AJson.GetEnumerator;
//
//  AFieldList:=TStringList.Create;
//  try
//      AFieldList.CommaText:=AFieldList;
//
//      while ASuperEnumerator.MoveNext do
//      begin
//        if Not SameText(
//              Copy(ASuperEnumerator.GetCurrent.Name,1,Length(NOPOST)),
//              NOPOST)
//              and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.Name)=-1) then
//        begin
//          Result[I]:=ASuperEnumerator.GetCurrent.AsVariant;
//          Inc(I);
//        end;
//      end;
//  finally
//    FreeAndNil(AFieldList);
//  end;
//
//end;


//function LocateJsonArray(AJsonArray:ISuperArray;AName:String;AValue:Variant):ISuperObject;
//var
//  I:Integer;
//begin
//  Result:=nil;
//  for I := 0 to AJsonArray.Length-1 do
//  begin
//    //遍历所有key
//    if (AJsonArray.O[I].V[AName]=AValue) then
//    begin
//      Result:=AJsonArray.O[I];
//      Break;
//    end;
//  end;
//
//end;
//
////function LocateJsonArray(AJsonArray:ISuperArray;
////                        AName:String;
////                        AValue:Variant;
////                        AName1:String;
////                        AValue1:Variant):ISuperObject;
////var
////  I:Integer;
////begin
////  Result:=nil;
////  for I := 0 to AJsonArray.Length-1 do
////  begin
////    //遍历所有key
////    if (AJsonArray.O[I].V[AName]=AValue)
////      and (AJsonArray.O[I].V[AName1]=AValue1) then
////    begin
////      Result:=AJsonArray.O[I];
////      Break;
////    end;
////  end;
////
////end;
//
//function LocateJsonArray(AJsonArray:ISuperArray;
//                          ANames:TStringDynArray;
//                          AValues:TVariantDynArray):ISuperObject;overload;
//var
//  I:Integer;
//  J: Integer;
//  AIsEqual:Boolean;
//begin
//  Result:=nil;
//  for I := 0 to AJsonArray.Length-1 do
//  begin
//
//    AIsEqual:=True;
//    for J := 0 to Length(ANames)-1 do
//    begin
//      if AJsonArray.O[I].V[ANames[J]]<>AValues[J] then
//      begin
//        AIsEqual:=False;
//        Break;
//      end;
//    end;
//
//    if AIsEqual then
//    begin
//      Result:=AJsonArray.O[I];
//      Break;
//    end;
//  end;
//end;
//
//
//function ConvertJsonToArray(AJson:ISuperObject;
//                            var ANameArray:TStringDynArray;
//                            var AValueArray:TVariantDynArray;
//                            AExceptFieldsCommaText:String=''):Integer;
//var
//  I:Integer;
//  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
//  AExceptFieldList:TStringList;
//begin
//  Result:=GetJsonCount(AJson,AExceptFieldsCommaText);
//  SetLength(ANameArray,Result);
//  SetLength(AValueArray,Result);
//
//  ASuperEnumerator:=AJson.GetEnumerator;
//
//  AExceptFieldList:=TStringList.Create;
//  try
//      AExceptFieldList.CommaText:=AExceptFieldsCommaText;
//
//      while ASuperEnumerator.MoveNext do
//      begin
//        if Not SameText(
//              Copy(ASuperEnumerator.GetCurrent.Name,1,Length(NOPOST)),
//              NOPOST)
//              and (AExceptFieldList.IndexOf(ASuperEnumerator.GetCurrent.Name)=-1) then
//        begin
//          ANameArray[I]:=ASuperEnumerator.GetCurrent.Name;
//          AValueArray[I]:=ASuperEnumerator.GetCurrent.AsVariant;
//
//          Inc(I);
//        end;
//      end;
//  finally
//    FreeAndNil(AExceptFieldList);
//  end;
//
//end;
//
//function GetJsonCount(AJson:ISuperObject;AExceptFieldsCommaText:String):Integer;
//var
//  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
//  AExceptFieldList:TStringList;
//begin
//  Result:=0;
//  ASuperEnumerator:=AJson.GetEnumerator;
//
//  AExceptFieldList:=TStringList.Create;
//  try
//      AExceptFieldList.CommaText:=AExceptFieldsCommaText;
//
//      while ASuperEnumerator.MoveNext do
//      begin
//        if Not SameText(
//              Copy(ASuperEnumerator.GetCurrent.Name,1,Length(NOPOST)),
//              NOPOST)
//            and (AExceptFieldList.IndexOf(ASuperEnumerator.GetCurrent.Name)=-1) then
//        begin
//          Inc(Result);
//        end;
//      end;
//
//  finally
//    FreeAndNil(AExceptFieldList);
//  end;
//end;

//function GetJsonValueArray(AJson:ISuperObject;AExceptFieldsCommaText:String):TVariantDynArray;
//var
//  I:Integer;
//  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
//  AExceptFieldList:TStringList;
//begin
//
//  SetLength(Result,GetJsonCount(AJson));
//
//  //遍历所有key
//  I:=0;
//  ASuperEnumerator:=AJson.GetEnumerator;
//
//  AExceptFieldList:=TStringList.Create;
//  try
//      AExceptFieldList.CommaText:=AExceptFieldsCommaText;
//
//      while ASuperEnumerator.MoveNext do
//      begin
//        if Not SameText(
//              Copy(ASuperEnumerator.GetCurrent.Name,1,Length(NOPOST)),
//              NOPOST)
//              and (AExceptFieldList.IndexOf(ASuperEnumerator.GetCurrent.Name)=-1) then
//        begin
//          Result[I]:=ASuperEnumerator.GetCurrent.AsVariant;
//          Inc(I);
//        end;
//      end;
//  finally
//    FreeAndNil(AExceptFieldList);
//  end;
//
//end;
//
//function GetJsonNameArray(AJson:ISuperObject;AExceptFieldsCommaText:String):TStringDynArray;
//var
//  I:Integer;
//  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
//  AExceptFieldList:TStringList;
//begin
//
//  SetLength(Result,GetJsonCount(AJson));
//
//  //遍历所有key
//  I:=0;
//  ASuperEnumerator:=AJson.GetEnumerator;
//
//  AExceptFieldList:=TStringList.Create;
//  try
//      AExceptFieldList.CommaText:=AExceptFieldsCommaText;
//
//      while ASuperEnumerator.MoveNext do
//      begin
//        if Not SameText(
//              Copy(ASuperEnumerator.GetCurrent.Name,1,Length(NOPOST)),
//              NOPOST)
//              and (AExceptFieldList.IndexOf(ASuperEnumerator.GetCurrent.Name)=-1) then
//        begin
//          Result[I]:=ASuperEnumerator.GetCurrent.Name;
//
//          Inc(I);
//        end;
//      end;
//  finally
//    FreeAndNil(AExceptFieldList);
//  end;
//
//end;


function GetJsonDoubleValue(AJson: ISuperObject;AName:String):Double;
begin
//  if AJson.Null[Name]=jNull then
//  begin
//    Result:='';
//  end
//  else
//  begin
//    Result:=AJson.V[Name];
//  end;
  if VarIsNull(AJson.V[AName]) then
  begin
    Result:=0.00;
  end
//  else if AJson.Contains(AName)
//          and (AJson.GetType(AName)=varString)
//          and (AJson.S[AName]='') then
//  begin
//    Result:=0.00;
//  end
  else
  begin
    Result:=AJson.V[AName];
  end;
end;

function GetJsonIntegerValue(AJson: ISuperObject;AName:String):Integer;
begin
//  if AJson.Null[Name]=jNull then
//  begin
//    Result:='';
//  end
//  else
//  begin
//    Result:=AJson.V[Name];
//  end;
  if VarIsNull(AJson.V[AName]) then
  begin
    Result:=0;
  end
  else
  begin
    Result:=AJson.V[AName];
  end;
end;

function GetJsonStringValue(AJson: ISuperObject;AName:String):String;
begin
//  if AJson.Null[AName]=jNull then
//  begin
//    Result:='';
//  end
//  else
//  begin
//    Result:=AJson.V[AName];
//  end;
  if VarIsNull(AJson.V[AName]) then
  begin
    Result:='';
  end
  else
  begin
    Result:=AJson.V[AName];
  end;

end;

function CreateJsonValueByField(Json: ISuperObject;Field: TField;AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField): Boolean;
var
  APicStream:TMemoryStream;
  AStringStream:TStringStream;
  AKeyName:String;
begin
  Result:=False;

//  TFieldType = (ftUnknown, ftString,  // 0..4
//     , // 5..11
//    ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo, // 12..18
//    ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor, ftFixedChar, ftWideString, // 19..24
//    , ftADT, ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, // 25..31
//    ftVariant, ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd, // 32..37
//    ftFixedWideChar, ftWideMemo, ftOraTimeStamp, ftOraInterval, // 38..41
//     , ftConnection, ftParams, ftStream, //42..48
//    ftTimeStampOffset, ftObject, ftSingle); //49..51


        AKeyName:=Field.FieldName;
        if AFieldMapList<>nil then
        begin
          if AFieldMapList.Values[AKeyName]<>'' then
          begin
            AKeyName:=AFieldMapList.Values[AKeyName];
          end;

        end;

        if Field.IsNull then//VarIsNull(Field.Value) then
        begin
            if AIsNeedNullField then
            begin
                //值为空NULL
                case Field.DataType of
                  ftDate, ftTime, ftDateTime:
                  begin
                    Json.S[AKeyName]:='';
                  end;
                  ftSmallint,ftInteger,ftWord,ftLargeint,ftTimeStamp,ftLongWord,ftShortint,ftByte:
                  begin
                    Json.I[AKeyName] := 0;
                  end;
                  ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle:
                  begin
                    Json.F[AKeyName] := 0.0;
                  end;
                  TFieldType.ftBoolean:
                  begin
                    Json.B[AKeyName] := False;
                  end;
                  ftString,ftWideString,ftFixedChar,ftFixedWideChar,ftGuid:
                  begin
                    Json.S[AKeyName] := '';
                  end
                  else
                  begin
                    //其他数据类型
                    Json.S[AKeyName] := '';
                  end;
                end;
            end;

        end
        else
        begin


            case Field.DataType of
              ftDate, ftTime, ftDateTime:
              begin
                Json.S[AKeyName]:=FormatDateTime('YYYY-MM-DD HH:MM:SS',Field.AsDateTime);
              end;
              ftSmallint,ftInteger,ftWord,//ftTimeStamp,
              ftLongWord,ftShortint,ftByte:
              begin
                Json.I[AKeyName] := Field.AsInteger;
              end;
              ftLargeint:
              begin
                Json.I[AKeyName] := Field.AsLargeInt;
              end;
              ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle,ftTimeStamp:
              begin
                Json.F[AKeyName] := Field.AsFloat;
              end;
              TFieldType.ftBoolean:
              begin
                Json.B[AKeyName] := Field.AsBoolean;
              end;
              ftString,ftWideString,ftFixedChar,ftFixedWideChar,ftGuid:
              begin
                Json.S[AKeyName] := Field.AsString;
              end
              else
              begin
                //其他字段类型
                Json.S[AKeyName] := Field.AsString;
              end;
            end;

        end;

////  try
//    if (Field Is TDateTimeField)
//      or(Field is TSQLTimeStampField) then
//        Json.S[Field.FieldName] := //SO(
//                                    FormatDateTime('YYYY-MM-DD HH:MM:SS',Field.AsDateTime)
//                                    //)
////<<<<<<< .mine
//    else if Field is TBlobField then
//        Json.S[Field.FieldName] := //EncodeString(
//                                    //Field.AsString
//                                    TNetEncoding.Base64.EncodeBytesToString(TBlobField(Field).AsBytes)
//                                    //)
////||||||| .r10989
//////    else if Field is TBlobField then
//////        Json.S[Field.FieldName] := //EncodeString(
//////                                    Field.AsString
//////                                    //)
////=======
////    else if Field is TBlobField then
////    begin
////
////        AStringStream:=TStringStream.Create('',TEncoding.UTF8);
////        APicStream:=TMemoryStream.Create;
////        try
////            TBlobField(Field).SaveToStream(APicStream);
////            APicStream.Position:=0;
////            TNetEncoding.Base64.Encode(APicStream,AStringStream);
////            AStringStream.Position:=0;
////            Json.S[Field.FieldName]:=AStringStream.DataString;
////
////
//////            AStringStream.SaveToFile('C:\ok.base64');
//////
//////            APicStream.Size:=0;
//////            AStringStream.Position:=0;
//////            TNetEncoding.Base64.Decode(AStringStream,APicStream);
//////            APicStream.Position:=0;
////
////
////
////        finally
////          FreeAndNil(AStringStream);
////          FreeAndNil(APicStream);
////        end;
////    end
////>>>>>>> .r11181
//    else if Field is TBooleanField then
//        Json.B[Field.FieldName] := Field.Value
//
//    else if Field is TIntegerField then
//        Json.I[Field.FieldName] := Field.Value
//
//    else if Field is TLargeintField then
//        Json.I[Field.FieldName] := Field.Value
//
//    else if (Field is TFloatField)
//      or (Field is TSingleField)
//      or (Field is TFloatField)
//      or (Field is TExtendedField)
//      then
//        Json.F[Field.FieldName] := Field.Value
//
//    else
//        Json.S[Field.FieldName] := Field.Value;
//
//    Result := True;
////  except
////    Result:=False;
////  end;
end;

{$IF CompilerVersion > 21.0} // XE or older
function CreateJsonArrayElementValueByField(JsonArray: ISuperArray;AIndex:Integer;Field: TField): Boolean;
var
  APicStream:TMemoryStream;
  AStringStream:TStringStream;
begin

  Result:=False;

  if VarIsNull(Field.Value) then
  begin
      //字段值为空
      case Field.DataType of
        ftDateTime,ftDate,ftTime:
          JsonArray.S[AIndex]:='';
        ftSmallint,ftInteger,ftWord,ftLargeint,ftTimeStamp,ftLongWord,ftShortint,ftByte:
          JsonArray.I[AIndex] := 0;
        ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle:
          JsonArray.F[AIndex] := 0.0;
        TFieldType.ftBoolean:
          JsonArray.B[AIndex] := False;
        else
          //其他数据类型
          JsonArray.S[AIndex] := '';
      end;
  end
  else
  begin
      //值不为空
      case Field.DataType of
        ftDateTime,ftDate,ftTime:
          JsonArray.S[AIndex]:=FormatDateTime('YYYY-MM-DD HH:MM:SS',Field.AsDateTime);
        ftSmallint,ftInteger,ftWord,ftLargeint,ftTimeStamp,ftLongWord,ftShortint,ftByte:
          JsonArray.I[AIndex]:=Field.AsInteger;
        ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle:
          JsonArray.F[AIndex]:=Field.AsFloat;
        TFieldType.ftBoolean:
          JsonArray.B[AIndex]:=Field.AsBoolean;
        else
          //其他数据类型
          JsonArray.S[AIndex]:=Field.AsString;
      end;
  end;


end;
{$IFEND}

function JSonFromRecord(DataSet: TDataSet;AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField): ISuperObject;
begin
  Result:=nil;


  if not DataSet.Eof then
  begin
    Result := TSuperObject.Create();

    JSonFromRecordTo(DataSet,Result,AFieldMapList,AIsNeedNullField);

  end;
end;


procedure JSonFromRecordTo(DataSet: TDataSet;ASuperObject:ISuperObject;AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField;ANoNeedFieldNameList:TStringList=nil);
var
  i:Integer;
begin
    if not DataSet.Eof then
    begin
      for i := 0 to DataSet.FieldCount - 1 do
      begin
        //不需要的字段
        if (ANoNeedFieldNameList=nil) or (ANoNeedFieldNameList.IndexOf(DataSet.Fields[i].FieldName)=-1) then
        begin
            //值不为空
            CreateJsonValueByField(ASuperObject,DataSet.Fields[i],AFieldMapList,AIsNeedNullField);
        end;
      end;
    end;
end;

{$IF CompilerVersion > 21.0} // XE or older
function CompressedJSonFromRecord(DataSet: TDataSet): ISuperArray;
var
  i:Integer;
begin
  Result:=nil;

  if not DataSet.Eof then
  begin
    Result := TSuperArray.Create();
    for i := 0 to DataSet.FieldCount - 1 do
    begin
          //值不为空
          CreateJsonArrayElementValueByField(Result,I,DataSet.Fields[i]);
    end;
  end;
end;

function CompressedJSonFromDataSetTo(DataSet: TDataSet;tableName: string;sj:ISuperObject): ISuperObject;
var
  sj2:ISuperArray;
  aj:ISuperArray;
  i:Integer;
  index:Integer;
begin
      //创建数据集的数据
      DataSet.First;
      aj := TSuperArray.Create();
      index:=0;
      while not DataSet.Eof do
      begin
        sj2 := CompressedJSonFromRecord(DataSet);
        aj.A[index]:=sj2;
        Inc(index);
        DataSet.Next;
      end;
      sj.A[tableName] := aj;


      if GlobalIsReturnDatasetFieldDefs then
      begin
        sj.A[tableName+'_'+'FieldDefs'] := GetDatasetFieldDefsJson(DataSet);
      end;

      sj.S['DatasetToJsonFormat']:=FORMAT_COMPRESSED;

      Result := sj;

end;

function CompressedJSonFromDataSet(DataSet: TDataSet;tableName: string): ISuperObject;
var
  sj:ISuperObject;
begin
  sj := TSuperObject.Create();
  Result:=CompressedJSonFromDataSetTo(DataSet,tableName,sj);
end;

{$IFEND} // XE or older

function JSonFromDataSetTo(DataSet: TDataSet;tableName: string;sj:ISuperObject;AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField): ISuperObject;
var
  aj:ISuperArray;
//  i:Integer;
  index:Integer;
begin

    //创建数据集的数据
    DataSet.First;
    aj := TSuperArray.Create();
    index:=0;
    while not DataSet.Eof do
    begin

      aj.O[index]:=JSonFromRecord(DataSet,AFieldMapList,AIsNeedNullField);


      Inc(index);
      DataSet.Next;
    end;
    sj.A[tableName] := aj;


    if GlobalIsReturnDatasetFieldDefs then
    begin
      sj.A[tableName+'_'+'FieldDefs'] := GetDatasetFieldDefsJson(DataSet);
    end;

    Result := sj;

end;

function JSonArrayFromDataSetTo(DataSet: TDataSet;AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField): ISuperArray;
var
//  i:Integer;
  index:Integer;
begin
    //创建数据集的数据
    DataSet.First;
    Result := TSuperArray.Create();
    index:=0;
    while not DataSet.Eof do
    begin

      Result.O[index]:=JSonFromRecord(DataSet,AFieldMapList,AIsNeedNullField);


      Inc(index);
      DataSet.Next;
    end;

end;

//数组切片
function SliceJsonArray(JsonArray: ISuperArray; StartIndex,EndIndex: Integer): ISuperArray;
var
  I: Integer;
begin
  Result := TSuperArray.Create();
  for I := 0 to JsonArray.Length-1 do
  begin
    if (I >= StartIndex) and (I <= EndIndex) then
    begin
      Result.S[Result.Length]:= JsonArray.S[I];
    end;
    if I > EndIndex then Exit;
  end;
end;

function JSonFromDataSet(DataSet: TDataSet;tableName: string='RecordList';AFieldMapList:TStringList=nil;AIsNeedNullField:Boolean=DEFAULT_IsNeedNullField): ISuperObject;
var
  sj:ISuperObject;
begin
  sj := TSuperObject.Create();
  Result:=JSonFromDataSetTo(DataSet,tableName,sj,AFieldMapList,AIsNeedNullField);
end;


//直接从数据集返回Json
function ReturnJsonStr(ACode:Integer;
                      ADesc:String;
                      ADataset:TDataset;
                      ADatasetToJsonFormat:String;
                      ARecordListKey:String
                      ):String;
begin
//  if ADatasetToJsonFormat=FORMAT_COMPRESSED then
//  begin
//    Result:=ReturnJson(ACode,ADesc,CompressedJSonFromDataSet(ADataset,ARecordListKey),'',nil).AsJSON;
//  end
//  else
//  begin
    Result:=ReturnJson(ACode,ADesc,JSonFromDataSet(ADataset,ARecordListKey)).AsJSON;
//  end;
end;

function ReturnJson(ACode:Integer;
                    ADesc:String;
                    ADataJson:ISuperObject;
                    ADesc2:String;
                    ADataJson2:ISuperObject;
                    ANameArray:TStringDynArray;
                     AValueArray:TVariantDynArray):ISuperObject;
var
//  ASign:String;
  ATimestamp:Integer;
  I: Integer;

begin
  Result:=TSuperObject.Create;


  //返回的Json规范
  //Code是代码,200表示成功,400表示失败
  Result.I['Code']:=ACode;
  //Desc为返回的信息,比如操作***成功,***失败
  Result.S['Desc']:=ADesc;


  //全部写下来日志太大
//  uBaseLog.HandleException(nil,'ReturnJson ACode:'+IntToStr(ACode)+' ADesc:'+ADesc);


  //Data则为返回的数据,比如***列表
  if ADataJson<>nil then
  begin
    Result.O['Data']:=ADataJson;
  end;


  if ADesc2<>'' then
  begin
    //Desc为返回的信息,比如操作***成功,***失败
    Result.S['Desc2']:=ADesc2;
    //Data则为返回的数据,比如***列表
    if ADataJson2<>nil then
    begin
      Result.O['Data2']:=ADataJson2;
    end;

  end;


  if ANameArray<>nil then
  begin
    for I := 0 to Length(ANameArray)-1 do
    begin
      Result.V[ANameArray[I]]:=AValueArray[I];
    end;
  end;



//  //加上时间戳
//  ATimestamp:=timeIntervalSince1970(Now);
//  Result.I['Timestamp']:=ATimestamp;
//
//
//  //加上签名
//  AParamsStr:=AParamsStr
//              +'&'+'signtype'+'='+ASignType
//              +'&'+'sign'+'='+SignParam(AUrlParamNames,
//                                        AUrlParamValues,
//                                        ASignType,
//                                        ASignSecret);
end;




{ TBaseJsonObjectList }

procedure TBaseJsonObjectList.Assign(Source: TBaseJsonObjectList;
  JsonObjectClass: TBaseJsonObjectClass);
var
  I:Integer;
  ABaseJsonObject:TBaseJsonObject;
begin

  Self.Clear(True);
  if Source<>nil then
  begin
      for I := 0 to Source.Count - 1 do
      begin
        ABaseJsonObject:=JsonObjectClass.Create();
        ABaseJsonObject.Assign(TPersistent(Source.Items[I]));
        Self.Add(ABaseJsonObject);
      end;
  end;

end;

function TBaseJsonObjectList.ParseFromJsonArray(JsonObjectClass:TBaseJsonObjectClass;JsonArray: ISuperArray): Boolean;
var
  I:Integer;
  ABaseJsonObject:TBaseJsonObject;
begin
  Result:=False;

  for I := 0 to JsonArray.Length - 1 do
  begin
    ABaseJsonObject:=JsonObjectClass.Create();
    ABaseJsonObject.ParseFromJson(JsonArray.O[I]);
    Self.Add(ABaseJsonObject);
  end;

  Result:=True;
end;

{ TBaseJsonObject }

constructor TBaseJsonObject.Create;
begin

end;

{ TWhereKeyTranslator }

constructor TWhereKeyTranslator.Create;
begin
  FieldNames:=TStringList.Create;

end;

destructor TWhereKeyTranslator.Destroy;
begin
  FreeAndNil(FieldNames);
  inherited;
end;

function TWhereKeyTranslator.DoGetWhereConditionItemSQL(ALogicOperator,
  AOperator: String; AValue: Variant): String;
var
  I: Integer;
begin
  Result:='';
  if (AValue<>'') and (Self.FieldNames.Count>0) then
  begin
      Result:=' '+ALogicOperator+' ( ';

      Result:=Result+' ( '+FieldNames[0]+' LIKE ''%'+AValue+'%'') ';
      for I := 1 to FieldNames.Count-1 do
      begin
        Result:=Result+' OR ( '+FieldNames[I]+' LIKE ''%'+AValue+'%'') ';
      end;

//            +'    (车牌号 LIKE ''%'+AValue+'%'') '
//            +' OR (车主 LIKE ''%'+AValue+'%'') '
//            +' OR (往来单位 LIKE ''%'+AValue+'%'') '
//            +' OR (名称输入码 LIKE ''%'+AValue+'%'') '
//            +' OR (联系人 LIKE ''%'+AValue+'%'') '
//            +' OR (联系电话 LIKE ''%'+AValue+'%'') '
//            +' OR (驾驶员电话 LIKE ''%'+AValue+'%'') '

      Result:=Result+' ) ';

  end;

end;

{ TWhereKeyTranslatorList }

function TWhereKeyTranslatorList.Add(AKey,AFieldNamesCommaText: String): TWhereKeyTranslator;
begin
  Result:=TWhereKeyTranslator.Create;

  Result.Key:=AKey;
  Result.FieldNames.CommaText:=AFieldNamesCommaText;

  Inherited Add(Result);
end;

function TWhereKeyTranslatorList.Find(AKey: String): TWhereKeyTranslator;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if SameText(Items[I].Key,AKey) then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TWhereKeyTranslatorList.GetItem(Index: Integer): TWhereKeyTranslator;
begin
  Result:=TWhereKeyTranslator(Inherited Items[Index]);
end;

//initialization
//
//  { TODO : 注释掉了 }
//  //这个可能用处在值为null，字段也存在，字段不存在可能会有问题。
//  DEFAULT_IsNeedNullField:=True;


end.










