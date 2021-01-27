//convert pas to utf8 by ¥
//TDataset和Json之间的相互转换
unit uDataSetToJson;

interface

//{$DEFINE SKIN_SUPEROBJECT}


uses
  Types,
  System.SysUtils,
  System.Classes,
  System.StrUtils,


  System.JSON,
  uBaseLog,



  XSuperObject,
  XSuperJson,


  Variants,
  Math,
//<<<<<<< .mine
//  EncdDecd,
//  System.NetEncoding,
//||||||| .r10989
//=======
//  EncdDecd,
  System.NetEncoding,
//>>>>>>> .r11181
  uFuncCommon,
  uBaseList,
  Data.DB;




Const
  SUCC=200;
  FAIL=400;

  NOPOST='NoPost_';

  RECORDLIST_KEY='RecordList';


  FORMAT_COMPRESSED='compressed';
  //+'_'+'FieldDefs'
  FIELD_DEFS='FieldDefs';

type

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



var
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
function CreateJsonValueByField(Json: ISuperObject;Field: TField): Boolean;
//将字段的值赋给JsonObject的Key
function CreateJsonArrayElementValueByField(JsonArray: ISuperArray;AIndex:Integer;Field: TField): Boolean;


//返回通用的记录的Json数组["name":"王能","age":35,"phone":"18957901025"]
function JSonFromRecord(DataSet: TDataSet): ISuperObject;
procedure JSonFromRecordTo(DataSet: TDataSet;ASuperObject:ISuperObject);
//返回压缩过的记录的Json数组["王能",35,"18957901025"]
function CompressedJSonFromRecord(DataSet: TDataSet): ISuperArray;



function CompressedJSonFromDataSetTo(DataSet: TDataSet;tableName: string;sj:ISuperObject): ISuperObject;
//;AFormat:String
function JSonFromDataSetTo(DataSet: TDataSet;tableName: string;sj:ISuperObject): ISuperObject;
function JSonArrayFromDataSetTo(DataSet: TDataSet): ISuperArray;


function JSonFromDataSet(DataSet: TDataSet;tableName: string): ISuperObject;
function CompressedJSonFromDataSet(DataSet: TDataSet;tableName: string): ISuperObject;


function GetJsonDoubleValue(AJson: ISuperObject;AName:String):Double;
function GetJsonIntegerValue(AJson: ISuperObject;AName:String):Integer;
function GetJsonStringValue(AJson: ISuperObject;AName:String):String;

function UTFStrToUnicode(UTFStr:String):String;
//格式化Json字符串
function formatJson(inputStr : string;indent : string='      ') : string;


//获取Json中元素的个数
function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            AFieldList:TStringList=nil;
                            ANoAddName:String=''):Integer;overload;
function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            var AValueTypeArray:TVarTypeDynArray;
                            AFieldList:TStringList=nil;
                            ANoAddName:String=''):Integer;overload;
function GetJsonCount(AJson:ISuperObject;
                            AFieldList:TStringList=nil;
                            ANoAddName:String=''):Integer;
function GetJsonNameArray(AJson:ISuperObject;AFieldList:TStringList=nil):TStringDynArray;
//function GetJsonValueTypeArray(AJson:ISuperObject;AFieldList:TStringList=nil):Array of Integer;
//function GetJsonValueArray(AJson:ISuperObject;AFieldList:String=''):TVariantDynArray;

//判断值Name为Value的JsonObject是否存在
function LocateJsonArray(AJsonArray:ISuperArray;
                          AName:String;
                          AValue:Variant;
                          AStartIndex:Integer=0):ISuperObject;overload;
function LocateJsonArrayIndex(AJsonArray:ISuperArray;
                          AName:String;
                          AValue:Variant;
                          AStartIndex:Integer=0):Integer;overload;
function LocateJsonArray(AJsonArray:ISuperArray;
                          ANames:TStringDynArray;
                          AValues:TVariantDynArray;
                          AStartIndex:Integer=0):ISuperObject;overload;
//将Json数组转换成层级的
procedure ConvertJsonArrayToLevel(AJsonArray:ISuperArray;
                                  //比如fid
                                  ALevelChildFieldName:String;
                                  //比如parent_fid
                                  ALevelParentFieldName:String;
                                  //比如0
                                  AParentFieldValue:String;
                                  ALevelJsonArray:ISuperArray);

function GetWhereConditions(AFieldNames:Array of String;
                            AFieldValues:Array of Variant):String;

function CutStringArray(AFieldNames:Array of String;ACount:Integer):TStringDynArray;
function CutVariantArray(AFieldValues:TVariantDynArray;ACount:Integer):TVariantDynArray;
procedure MergeJson(AJson:ISuperObject;AToJson:ISuperObject);

//从Json的对象数组中获取键值的列表数组
function GetKeyValuesFromJsonObjectArray(AJsonObjectArray:ISuperArray;
                                          AKey:String):TStringDynArray;


//获取数据集的字段定义列表
function GetDatasetFieldDefsJson(ADataset:TDataset):ISuperArray;


//比较两个Json是否相同
function IsSameJsonObject(AJson,BJson:ISuperObject):Boolean;
function IsSameJsonArray(AJsonArray,BJsonArray:ISuperArray):Boolean;


implementation

function IsSameJsonObject(AJson,BJson:ISuperObject):Boolean;
begin
  //先获取键值是不是相等
  Result:=(AJson.AsJSON=BJson.AsJSON);
end;

function IsSameJsonArray(AJsonArray,BJsonArray:ISuperArray):Boolean;
begin

end;

function GetDatasetFieldDefsJson(ADataset:TDataset):ISuperArray;
var
  I: Integer;
  ASuperObject:ISuperObject;
  ADataTypeName:String;
begin
  Result:=TSuperArray.Create();
  for I := 0 to ADataset.FieldDefs.Count-1 do
  begin
      ASuperObject:=TSuperObject.Create();


      ASuperObject.S['name']:=ADataset.FieldDefs[I].Name;
      ASuperObject.I['size']:=ADataset.FieldDefs[I].Size;

      //精度
      ASuperObject.I['precision']:=ADataset.FieldDefs[I].Precision;


      //直接取字段类型的整型值
      ASuperObject.I['field_type']:=Ord(ADataset.FieldDefs[I].DataType);



      case ADataset.FieldDefs[I].DataType of
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


      Result.O[I]:=ASuperObject;
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


procedure MergeJson(AJson:ISuperObject;AToJson:ISuperObject);
var
  I: Integer;
  AParamNames:TStringDynArray;
  AParamValues:TVariantDynArray;
begin
  //获取需要添加的字段,去掉表中不存在的字段
  ConvertJsonToArray(AJson,
                      AParamNames,
                      AParamValues,
                      nil);
  for I := 0 to Length(AParamNames)-1 do
  begin
    AToJson.V[AParamNames[I]]:=AParamValues[I];
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


function GetWhereConditions(AFieldNames:Array of String;
                            AFieldValues:Array of Variant):String;
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
    if (AJsonArray.O[I].V[AName]=AValue) then
    begin
      Result:=AJsonArray.O[I];
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



function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            AFieldList:TStringList;
                            ANoAddName:String):Integer;
var
  I:Integer;
{$IFDEF SKIN_SUPEROBJECT}
  ASuperEnumerator: TJSONObject.TEnumerator;
{$ELSE}
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
{$ENDIF}
begin
  Result:=GetJsonCount(AJson,AFieldList,ANoAddName);
  SetLength(ANameArray,Result);
  SetLength(AValueArray,Result);

  I:=0;

  {$IFDEF SKIN_SUPEROBJECT}
     //uSkinSuperObject
    ASuperEnumerator:=AJson.GetEnumerator;
    while ASuperEnumerator.MoveNext do
    begin
      if  //字段没有NOPOST前缀
          Not SameText(
                Copy(ASuperEnumerator.GetCurrent.JsonString.Value,1,Length(NOPOST)),
                NOPOST)
          and (
                (AFieldList=nil)
              or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.JsonString.Value)<>-1)
              )
          and ((ANoAddName='') or (ANoAddName<>ASuperEnumerator.GetCurrent.JsonString.Value)) then
      begin
        ANameArray[I]:=ASuperEnumerator.GetCurrent.JsonString.Value;
        AValueArray[I]:=ASuperEnumerator.GetCurrent.JsonValue.Value;

        Inc(I);
      end;
    end;

  {$ELSE}
    //XSuperObject
    ASuperEnumerator:=AJson.GetEnumerator;

    while ASuperEnumerator.MoveNext do
    begin
      if  //字段没有NOPOST前缀
          Not SameText(
                Copy(ASuperEnumerator.GetCurrent.Name,1,Length(NOPOST)),
                NOPOST)
          and (
                (AFieldList=nil)
              or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.Name)<>-1)
              )
          and ((ANoAddName='') or (ANoAddName<>ASuperEnumerator.GetCurrent.Name)) then
      begin
        ANameArray[I]:=ASuperEnumerator.GetCurrent.Name;
        AValueArray[I]:=ASuperEnumerator.GetCurrent.AsVariant;

        Inc(I);
      end;
    end;
  {$ENDIF}

end;


function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            var AValueTypeArray:TVarTypeDynArray;
                            AFieldList:TStringList;
                            ANoAddName:String):Integer;
var
  I:Integer;
{$IFDEF SKIN_SUPEROBJECT}
  ASuperEnumerator: TJSONObject.TEnumerator;
{$ELSE}
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
{$ENDIF}
begin
  Result:=GetJsonCount(AJson,AFieldList,ANoAddName);
  SetLength(ANameArray,Result);
  SetLength(AValueArray,Result);
  SetLength(AValueTypeArray,Result);

  I:=0;

  {$IFDEF SKIN_SUPEROBJECT}
     //uSkinSuperObject
    ASuperEnumerator:=AJson.GetEnumerator;
    while ASuperEnumerator.MoveNext do
    begin
      if  //字段没有NOPOST前缀
          Not SameText(
                Copy(ASuperEnumerator.GetCurrent.JsonString.Value,1,Length(NOPOST)),
                NOPOST)
          and (
                (AFieldList=nil)
              or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.JsonString.Value)<>-1)
              )
          and ((ANoAddName='') or (ANoAddName<>ASuperEnumerator.GetCurrent.JsonString.Value)) then
      begin
        ANameArray[I]:=ASuperEnumerator.GetCurrent.JsonString.Value;
        AValueArray[I]:=ASuperEnumerator.GetCurrent.JsonValue.Value;
        AValueTypeArray[I]:=AJson.GetType(ANameArray[I]);

        Inc(I);
      end;
    end;

  {$ELSE}
    //XSuperObject
    ASuperEnumerator:=AJson.GetEnumerator;

    while ASuperEnumerator.MoveNext do
    begin
      if  //字段没有NOPOST前缀
          Not SameText(
                Copy(ASuperEnumerator.GetCurrent.Name,1,Length(NOPOST)),
                NOPOST)
          and (
                (AFieldList=nil)
              or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.Name)<>-1)
              )
          and ((ANoAddName='') or (ANoAddName<>ASuperEnumerator.GetCurrent.Name)) then
      begin
        ANameArray[I]:=ASuperEnumerator.GetCurrent.Name;
        AValueArray[I]:=ASuperEnumerator.GetCurrent.AsVariant;
        AValueTypeArray[I]:=AJson.GetType(ANameArray[I]);

        Inc(I);
      end;
    end;
  {$ENDIF}

end;

function GetJsonCount(AJson:ISuperObject;AFieldList:TStringList;
                            ANoAddName:String):Integer;
{$IFDEF SKIN_SUPEROBJECT}
var
  ASuperEnumerator: TJSONObject.TEnumerator;
{$ELSE}
var
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
{$ENDIF}
begin
  Result:=0;
  ASuperEnumerator:=AJson.GetEnumerator;

{$IFDEF SKIN_SUPEROBJECT}

      while ASuperEnumerator.MoveNext do
      begin
        if Not SameText(
              Copy(ASuperEnumerator.GetCurrent.JsonString.Value,1,Length(NOPOST)),
              NOPOST)
            and (
                  (AFieldList=nil)
                or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.JsonString.Value)<>-1)
                )

           and ((ANoAddName='') or (ANoAddName<>ASuperEnumerator.GetCurrent.JsonString.Value)) then
        begin
          Inc(Result);
        end;
      end;


{$ELSE}

      while ASuperEnumerator.MoveNext do
      begin
        if Not SameText(
              Copy(ASuperEnumerator.GetCurrent.Name,1,Length(NOPOST)),
              NOPOST)
            and (
                  (AFieldList=nil)
                or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.Name)<>-1)
                )

           and ((ANoAddName='') or (ANoAddName<>ASuperEnumerator.GetCurrent.Name)) then
        begin
          Inc(Result);
        end;
      end;

{$ENDIF}
end;

function GetJsonNameArray(AJson:ISuperObject;AFieldList:TStringList):TStringDynArray;
var
  I:Integer;
{$IFDEF SKIN_SUPEROBJECT}
  ASuperEnumerator: TJSONObject.TEnumerator;
{$ELSE}
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
{$ENDIF}
begin

  SetLength(Result,GetJsonCount(AJson));

  //遍历所有key
  I:=0;
  ASuperEnumerator:=AJson.GetEnumerator;

{$IFDEF SKIN_SUPEROBJECT}
      while ASuperEnumerator.MoveNext do
      begin
        if Not SameText(
              Copy(ASuperEnumerator.GetCurrent.JsonString.Value,1,Length(NOPOST)),
              NOPOST)
            and (
                  (AFieldList=nil)
                or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.JsonString.Value)<>-1)
                ) then
        begin
          Result[I]:=ASuperEnumerator.GetCurrent.JsonString.Value;

          Inc(I);
        end;
      end;

{$ELSE}

      while ASuperEnumerator.MoveNext do
      begin
        if Not SameText(
              Copy(ASuperEnumerator.GetCurrent.Name,1,Length(NOPOST)),
              NOPOST)
            and (
                  (AFieldList=nil)
                or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.Name)<>-1)
                ) then
        begin
          Result[I]:=ASuperEnumerator.GetCurrent.Name;

          Inc(I);
        end;
      end;

{$ENDIF}

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




//json串的简易格式化处理
//输入:
// indent 用来表示缩进的字符串
// inputStr 待格式化的json字符串
//输出:
// 格式化后的json字符串
//
function formatJson(inputStr : string;indent : string ) : string;
var
   outStr,s : string;
   p,i : integer;
   c : char;
   level : integer; //缩进级别
   quot : integer; //双引号标记
   slant : integer; //反斜杠标记
   colon : integer; //冒号
   function getTab(level : integer):string;
   var
      tab : string;
      j : integer;
   begin
      getTab := '';
      if level > 0 then
      begin
      for j:=1 to level do
      begin
         tab := tab + indent;
      end;
      end;
      result := tab;
   end;
begin
   //去掉换行回车符
   inputStr := stringReplace(inputStr,#13#10,'',[rfReplaceAll, rfIgnoreCase]);
   //去掉tab符
   inputStr := stringReplace(inputStr,#9,'',[rfReplaceAll, rfIgnoreCase]);
   //支持 xxx={...} 格式的数据，保留 xxx= 内容。
   p := pos('{',inputStr);
   if p>0 then
   begin
      outStr := copy(inputStr,1,p-1);
      inputStr := copy(inputStr,p,length(inputStr));
   end
   else
   begin
      result := inputStr;
      exit;
   end;



   //json格式化处理
   //简易处理规则：
   //遇到反斜杠 "\"，输出，后面紧跟的字符直接输出，不做特殊处理
   //遇到双引号 """，输出，等待匹配下一个双引号（除了反斜杠"\"后的双引号外),其间的字符直接输出
   //遇到左花括号 "{" 缩进不变输出，回车，后续缩进等级+1
   //遇到右花括号 "}" 回车，缩进-1, 输出，后续缩进等级-1
   //遇到左方括号 "[" 缩进不变输出，回车，后续缩进等级+1
   //遇到右方括号 "]" 回车，缩进-1, 输出，后续缩进等级-1
   //遇到双引号外的逗号 "," 输出后回车
   //遇到冒号 ":", 输出，加一个空格
   //不符合以上规则的字符，除空格外，直接 输出

   level := 0;
   quot := 0; //是否等待匹配双引号
   colon := 0;
   for i:=1 to length(inputStr) do
   begin
      c := inputStr[i];


      if c<>' ' then s:=c else s:='';    //过滤一般性空格
      if (slant=1) then
      begin
         //反斜杠之后的字符直接输出
         slant := 0;
      end
      else if (quot = 1)   and (c <> '"') and (c<>'\') then
      begin
         //双引号之后的字符直接输出
         s := c; //双引号之间的空格也保留输出
      end
      else


      begin
        case c of
         '\': begin
            slant := 1;
            end;
         '{': begin
            if colon <> 1 then s:=getTab(level) + s ;
            s := s + #13#10 ;
            level:=level+1;
            colon := 0;
            end;
         '}': begin
            s := #13#10 + getTab(level-1) + s;
            level:=level-1;
            end;
         '[': begin
            if colon <> 1 then s:=getTab(level) + s ;
            s := s + #13#10 ;
            level:=level+1;
            colon := 0;
            end;
         ']': begin
            s := #13#10 + getTab(level-1) + s;
            level:=level-1;
            end;
         '"': begin
            quot := 1 - quot;
            if   (quot=1) and (colon =0 ) then   s := getTab(level) + s;
            colon := 0;
            end;
         ',': begin
            s := s + #13#10 ;
            colon := 0;
            end;
         ':': begin
            s := s + ' ' ;
            colon := 1;
            end;
        else
         //
        end ;


      end;
      outStr := outStr + s;
   end;


   result := outStr;
end;

//
//
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

function XDigit(Ch : Char) : Integer;
begin
  if (Ch >= '0') and (Ch <= '9') then
      Result := Ord(Ch) - Ord('0')
  else
      Result := (Ord(Ch) and 15) + 9;
end;


function UTFStrToUnicode(UTFStr:String):String;
var
  I:Integer;
  Index:Integer;
  HexStr:String;
  LowerCaseUTFStr:String;
  WChar:Char;
  WCharWord:Word;
  AChar:Char;
begin
  //您的验证码错误
  Result:='';
  LowerCaseUTFStr:=LowerCase(UTFStr);
  Index:=Low(LowerCaseUTFStr);
  while Index<=High(LowerCaseUTFStr) do
  begin
      if (LowerCaseUTFStr[Index]='\')
        and (LowerCaseUTFStr[Index+1]='u') then
      begin
          HexStr:=Copy(LowerCaseUTFStr,Index+2,4);
          WCharWord:=0;
          //HexStr=60a8
          for I := 1 to Length(HexStr) do
          begin
            AChar:=Char(HexStr[I]);
            WCharWord:=WCharWord+XDigit(AChar)*Ceil(Power(16,4-I));
          end;
          WChar:=WideChar(WCharWord);
          //WChar=您
          Result:=Result+WChar;
          Inc(Index,5);
      end
      else
      begin
          Result:=Result+UTFStr[Index];
      end;
      Inc(Index);
  end;

  Result:=formatJson(Result);
end;


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

function CreateJsonValueByField(Json: ISuperObject;Field: TField): Boolean;
var
  APicStream:TMemoryStream;
  AStringStream:TStringStream;
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


        if VarIsNull(Field.Value) then
        begin

            //值为空NULL
            case Field.DataType of
              ftDate, ftTime, ftDateTime:
              begin
                Json.S[Field.FieldName]:='';
              end;
              ftSmallint,ftInteger,ftWord,ftLargeint,ftTimeStamp,ftLongWord,ftShortint,ftByte:
              begin
                Json.I[Field.FieldName] := 0;
              end;
              ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle:
              begin
                Json.F[Field.FieldName] := 0.0;
              end;
              TFieldType.ftBoolean:
              begin
                Json.B[Field.FieldName] := False;
              end;
              ftString,ftWideString,ftFixedChar,ftFixedWideChar,ftGuid:
              begin
                Json.S[Field.FieldName] := '';
              end
              else
              begin
                //其他数据类型
                Json.S[Field.FieldName] := '';
              end;
            end;

        end
        else
        begin


            case Field.DataType of
              ftDate, ftTime, ftDateTime:
              begin
                Json.S[Field.FieldName]:=FormatDateTime('YYYY-MM-DD HH:MM:SS',Field.AsDateTime);
              end;
              ftSmallint,ftInteger,ftWord,ftLargeint,ftTimeStamp,ftLongWord,ftShortint,ftByte:
              begin
                Json.I[Field.FieldName] := Field.AsInteger;
              end;
              ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle:
              begin
                Json.F[Field.FieldName] := Field.AsFloat;
              end;
              TFieldType.ftBoolean:
              begin
                Json.B[Field.FieldName] := Field.AsBoolean;
              end;
              ftString,ftWideString,ftFixedChar,ftFixedWideChar,ftGuid:
              begin
                Json.S[Field.FieldName] := Field.AsString;
              end
              else
              begin
                //其他字段类型
                Json.S[Field.FieldName] := Field.AsString;
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

function JSonFromRecord(DataSet: TDataSet): ISuperObject;
begin
  Result:=nil;

  if not DataSet.Eof then
  begin
    Result := TSuperObject.Create();

    JSonFromRecordTo(DataSet,Result);

  end;
end;


procedure JSonFromRecordTo(DataSet: TDataSet;ASuperObject:ISuperObject);
var
  i:Integer;
begin
    if not DataSet.Eof then
    begin
      for i := 0 to DataSet.FieldCount - 1 do
      begin
            //值不为空
            CreateJsonValueByField(ASuperObject,DataSet.Fields[i]);
      end;
    end;
end;

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

function JSonFromDataSetTo(DataSet: TDataSet;tableName: string;sj:ISuperObject): ISuperObject;
var
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

      aj.O[index]:=JSonFromRecord(DataSet);


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

function JSonArrayFromDataSetTo(DataSet: TDataSet): ISuperArray;
var
  i:Integer;
  index:Integer;
begin
    //创建数据集的数据
    DataSet.First;
    Result := TSuperArray.Create();
    index:=0;
    while not DataSet.Eof do
    begin

      Result.O[index]:=JSonFromRecord(DataSet);


      Inc(index);
      DataSet.Next;
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

function JSonFromDataSet(DataSet: TDataSet;tableName: string): ISuperObject;
var
  sj:ISuperObject;
begin
  sj := TSuperObject.Create();
  Result:=JSonFromDataSetTo(DataSet,tableName,sj);
end;

function CompressedJSonFromDataSet(DataSet: TDataSet;tableName: string): ISuperObject;
var
  sj:ISuperObject;
begin
  sj := TSuperObject.Create();
  Result:=CompressedJSonFromDataSetTo(DataSet,tableName,sj);
end;

//直接从数据集返回Json
function ReturnJsonStr(ACode:Integer;
                      ADesc:String;
                      ADataset:TDataset;
                      ADatasetToJsonFormat:String;
                      ARecordListKey:String
                      ):String;
begin
  if ADatasetToJsonFormat=FORMAT_COMPRESSED then
  begin
    Result:=ReturnJson(ACode,ADesc,CompressedJSonFromDataSet(ADataset,ARecordListKey),'',nil).AsJSON;
  end
  else
  begin
    Result:=ReturnJson(ACode,ADesc,JSonFromDataSet(ADataset,ARecordListKey)).AsJSON;
  end;
end;

function ReturnJson(ACode:Integer;
                    ADesc:String;
                    ADataJson:ISuperObject;
                    ADesc2:String;
                    ADataJson2:ISuperObject;
                    ANameArray:TStringDynArray;
                    AValueArray:TVariantDynArray):ISuperObject;
var
  ASign:String;
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


end.





