unit uDatasetToCompressJson;

interface

//{$DEFINE SKIN_SUPEROBJECT}

uses
  Types,
  System.SysUtils,
  System.Classes,
  System.StrUtils,


  System.JSON,



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



type
//  TVariantDynArray=array of Variant;
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

  TDatasetToJsonFormat=(dtjfDefault,dtjfCompress);



//ͨ�õĸ�ʽ
function ReturnJson(ACode:Integer;
                    ADesc:String;
                    ADataJson:ISuperObject;
                    ADesc2:String='';
                    ADataJson2:ISuperObject=nil):ISuperObject;
//ֱ�Ӵ����ݼ�����Json
function ReturnJsonStr(ACode:Integer;
                      ADesc:String;
                      ADataset:TDataset;
                      ARecordListKey:String;
                      AFormat:TDatasetToJsonFormat=dtjfDefault):String;
//
function CreateJsonValueByField(Json: ISuperObject;Field: TField): Boolean;


function JSonFromRecord(DataSet: TDataSet): ISuperObject;
function JSonFromDataSet(DataSet: TDataSet;tableName: string): ISuperObject;
function JSonFromDataSetTo(DataSet: TDataSet;tableName: string;sj:ISuperObject): ISuperObject;

function GetJsonDoubleValue(AJson: ISuperObject;AName:String):Double;
function GetJsonIntegerValue(AJson: ISuperObject;AName:String):Integer;
function GetJsonStringValue(AJson: ISuperObject;AName:String):String;

function UTFStrToUnicode(UTFStr:String):String;
//��ʽ��Json�ַ���
function formatJson(inputStr : string;indent : string='      ') : string;


//��ȡJson��Ԫ�صĸ���
function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            AFieldList:TStringList=nil;
                            ANoAddName:String=''):Integer;
function GetJsonCount(AJson:ISuperObject;
                            AFieldList:TStringList=nil;
                            ANoAddName:String=''):Integer;
function GetJsonNameArray(AJson:ISuperObject;AFieldList:TStringList=nil):TStringDynArray;
//function GetJsonValueArray(AJson:ISuperObject;AFieldList:String=''):TVariantDynArray;

//�ж�ֵNameΪValue��JsonObject�Ƿ����
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
//��Json����ת���ɲ㼶��
procedure ConvertJsonArrayToLevel(AJsonArray:ISuperArray;
                                  //����fid
                                  ALevelChildFieldName:String;
                                  //����parent_fid
                                  ALevelParentFieldName:String;
                                  //����0
                                  AParentFieldValue:String;
                                  ALevelJsonArray:ISuperArray);

function GetWhereConditions(AFieldNames:Array of String;
                            AFieldValues:Array of Variant):String;

function CutStringArray(AFieldNames:Array of String;ACount:Integer):TStringDynArray;
function CutVariantArray(AFieldValues:TVariantDynArray;ACount:Integer):TVariantDynArray;
procedure MergeJson(AJson:ISuperObject;AToJson:ISuperObject);

//��Json�Ķ��������л�ȡ��ֵ���б�����
function GetKeyValuesFromJsonObjectArray(AJsonObjectArray:ISuperArray;
                                          AKey:String):TStringDynArray;


//��ȡ���ݼ����ֶζ����б�
function GetDatasetFieldDefsJson(ADataset:TDataset):ISuperArray;



implementation

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
  //    FChildDefs: TFieldDefs;
  //    FPrecision: Integer;
  //    FFieldNo: Integer;
  //    FSize: Integer;
  //    FInternalCalcField: Boolean;
  //    FDataType: TFieldType;
  //    FAttributes: TFieldAttributes;
  //  TFieldType = (ftUnknown, ftString, ftSmallint, ftInteger, ftWord, // 0..4
  //    ftBoolean, ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime, // 5..11
  //    ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo, // 12..18
  //    ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor, ftFixedChar, ftWideString, // 19..24
  //    ftLargeint, ftADT, ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, // 25..31
  //    ftVariant, ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd, // 32..37
  //    ftFixedWideChar, ftWideMemo, ftOraTimeStamp, ftOraInterval, // 38..41
  //    ftLongWord, ftShortint, ftByte, ftExtended, ftConnection, ftParams, ftStream, //42..48
  //    ftTimeStampOffset, ftObject, ftSingle); //49..51
  //  TFieldTypes = set of TFieldType;

      ASuperObject.S['name']:=ADataset.FieldDefs[I].Name;
      ASuperObject.I['size']:=ADataset.FieldDefs[I].Size;


      ADataTypeName:='unknown';
      case ADataset.FieldDefs[I].DataType of
        ftString,ftWideString,ftMemo,ftFmtMemo,ftFixedChar,ftFixedWideChar,ftWideMemo:ADataTypeName:='string';
        ftSmallint,ftInteger,ftWord,ftLargeint,ftTimeStamp,ftLongWord,ftShortint,ftByte:
                ADataTypeName:='integer';
        ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle:ADataTypeName:='float';
        ftDate:ADataTypeName:='date';
        ftTime:ADataTypeName:='time';
        ftDatetime:ADataTypeName:='datetime';
        ftBoolean:ADataTypeName:='boolean';
      end;
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
  //��ȡ��Ҫ��ӵ��ֶ�,ȥ�����в����ڵ��ֶ�
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
    //��ǰ��¼��parent_fid��AParentFieldValue
    ALevelFieldValue:=AJsonArray.O[I].V[ALevelParentFieldName];
    if ALevelFieldValue=AParentFieldValue then
    begin
      ALevelJsonArray.O[AIndex]:=AJsonArray.O[I];

      //�ݹ�,���ӽڵ��
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
    //��������key
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
    //��������key
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
//    //��������key
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
      if  //�ֶ�û��NOPOSTǰ׺
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
      if  //�ֶ�û��NOPOSTǰ׺
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

  //��������key
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
//  //��������key
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




//json���ļ��׸�ʽ������
//����:
// indent ������ʾ�������ַ���
// inputStr ����ʽ����json�ַ���
//���:
// ��ʽ�����json�ַ���
//
function formatJson(inputStr : string;indent : string ) : string;
var
   outStr,s : string;
   p,i : integer;
   c : char;
   level : integer; //��������
   quot : integer; //˫���ű��
   slant : integer; //��б�ܱ��
   colon : integer; //ð��
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
   //ȥ�����лس���
   inputStr := stringReplace(inputStr,#13#10,'',[rfReplaceAll, rfIgnoreCase]);
   //ȥ��tab��
   inputStr := stringReplace(inputStr,#9,'',[rfReplaceAll, rfIgnoreCase]);
   //֧�� xxx={...} ��ʽ�����ݣ����� xxx= ���ݡ�
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



   //json��ʽ������
   //���״������
   //������б�� "\"�����������������ַ�ֱ��������������⴦��
   //����˫���� """��������ȴ�ƥ����һ��˫���ţ����˷�б��"\"���˫������),�����ַ�ֱ�����
   //���������� "{" ��������������س������������ȼ�+1
   //�����һ����� "}" �س�������-1, ��������������ȼ�-1
   //���������� "[" ��������������س������������ȼ�+1
   //�����ҷ����� "]" �س�������-1, ��������������ȼ�-1
   //����˫������Ķ��� "," �����س�
   //����ð�� ":", �������һ���ո�
   //���������Ϲ�����ַ������ո��⣬ֱ�� ���

   level := 0;
   quot := 0; //�Ƿ�ȴ�ƥ��˫����
   colon := 0;
   for i:=1 to length(inputStr) do
   begin
      c := inputStr[i];


      if c<>' ' then s:=c else s:='';    //����һ���Կո�
      if (slant=1) then
      begin
         //��б��֮����ַ�ֱ�����
         slant := 0;
      end
      else if (quot = 1)   and (c <> '"') and (c<>'\') then
      begin
         //˫����֮����ַ�ֱ�����
         s := c; //˫����֮��Ŀո�Ҳ�������
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
//    //��������key
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
////    //��������key
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
//  //��������key
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
//  //��������key
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
  ////\u60a8\u7684\u9a8c\u8bc1\u7801\u9519\u8bef
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
          //WChar=��
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


  try
    if (Field Is TDateTimeField)
      or(Field is TSQLTimeStampField) then
        Json.S[Field.FieldName] := //SO(
                                    FormatDateTime('YYYY-MM-DD HH:MM:SS',Field.AsDateTime)
                                    //)
//<<<<<<< .mine
    else if Field is TBlobField then
        Json.S[Field.FieldName] := //EncodeString(
                                    //Field.AsString
                                    TNetEncoding.Base64.EncodeBytesToString(TBlobField(Field).AsBytes)
                                    //)
//||||||| .r10989
////    else if Field is TBlobField then
////        Json.S[Field.FieldName] := //EncodeString(
////                                    Field.AsString
////                                    //)
//=======
//    else if Field is TBlobField then
//    begin
//
//        AStringStream:=TStringStream.Create('',TEncoding.UTF8);
//        APicStream:=TMemoryStream.Create;
//        try
//            TBlobField(Field).SaveToStream(APicStream);
//            APicStream.Position:=0;
//            TNetEncoding.Base64.Encode(APicStream,AStringStream);
//            AStringStream.Position:=0;
//            Json.S[Field.FieldName]:=AStringStream.DataString;
//
//
////            AStringStream.SaveToFile('C:\ok.base64');
////
////            APicStream.Size:=0;
////            AStringStream.Position:=0;
////            TNetEncoding.Base64.Decode(AStringStream,APicStream);
////            APicStream.Position:=0;
//
//
//
//        finally
//          FreeAndNil(AStringStream);
//          FreeAndNil(APicStream);
//        end;
//    end
//>>>>>>> .r11181
    else if Field is TBooleanField then
        Json.B[Field.FieldName] := Field.Value

    else if Field is TIntegerField then
        Json.I[Field.FieldName] := Field.Value

    else if Field is TLargeintField then
        Json.I[Field.FieldName] := Field.Value

    else if (Field is TFloatField)
      or (Field is TSingleField)
      or (Field is TFloatField)
      or (Field is TExtendedField)
      then
        Json.F[Field.FieldName] := Field.Value

    else
        Json.S[Field.FieldName] := Field.Value;

    Result := True;
  except
    Result:=False;
  end;
end;

function JSonFromRecord(DataSet: TDataSet): ISuperObject;
var
  sj2:ISuperObject;
  i:Integer;
begin
  Result:=nil;

  try
    if not DataSet.Eof then
    begin
      sj2 := TSuperObject.Create();
      for i := 0 to DataSet.FieldCount - 1 do
      begin
        if VarIsNull(DataSet.Fields[i].Value) then
        begin

//          DataSet.FieldByName().As
            //ֵΪ��
            case DataSet.Fields[i].DataType of
              TFieldType.ftInteger:sj2.I[DataSet.Fields[i].FieldName] := 0;
              TFieldType.ftFloat:sj2.F[DataSet.Fields[i].FieldName] := 0.0;
              TFieldType.ftSingle:sj2.F[DataSet.Fields[i].FieldName] := 0.0;
              TFieldType.ftBoolean:sj2.B[DataSet.Fields[i].FieldName] := False;
              else sj2.S[DataSet.Fields[i].FieldName] := '';
            end;
        end
        else
        begin
            //ֵ��Ϊ��
            CreateJsonValueByField(sj2,DataSet.Fields[i]);
        end;
      end;
    end;

    Result := sj2;
  finally
  end;
end;

function JSonFromDataSetTo(DataSet: TDataSet;tableName: string;sj:ISuperObject): ISuperObject;
var
  sj2:ISuperObject;
  aj:ISuperArray;
  i:Integer;
  index:Integer;
begin
  try
      //�������ݼ�������
  //    DataSet.DisableControls;
      DataSet.First;
      aj := TSuperArray.Create();
      index:=0;
      while not DataSet.Eof do
      begin
        sj2 := TSuperObject.Create();
        for i := 0 to DataSet.FieldCount - 1 do
        begin
          if VarIsNull(DataSet.Fields[i].Value) then
          begin
              //ֵΪ��
              case DataSet.Fields[i].DataType of
                TFieldType.ftInteger:sj2.I[DataSet.Fields[i].FieldName] := 0;
                TFieldType.ftFloat:sj2.F[DataSet.Fields[i].FieldName] := 0.0;
                TFieldType.ftSingle:sj2.F[DataSet.Fields[i].FieldName] := 0.0;
                TFieldType.ftBoolean:sj2.B[DataSet.Fields[i].FieldName] := False;
                else sj2.S[DataSet.Fields[i].FieldName] := '';
              end;
          end
          else
          begin
              //ֵ��Ϊ��
              CreateJsonValueByField(sj2,DataSet.Fields[i]);
          end;
        end;
        aj.O[index]:=sj2;
        Inc(index);
        DataSet.Next;
      end;
      sj.A[tableName] := aj;


      sj.A[tableName+'_'+'FieldDefs'] := GetDatasetFieldDefsJson(DataSet);

      Result := sj;
  finally
//    DataSet.EnableControls;
  end;

end;

function JSonFromDataSet(DataSet: TDataSet;tableName: string): ISuperObject;
var
  sj:ISuperObject;
begin
  sj := TSuperObject.Create();
  Result:=JSonFromDataSetTo(DataSet,tableName,sj);
end;


//ֱ�Ӵ����ݼ�����Json
function ReturnJsonStr(ACode:Integer;
                      ADesc:String;
                      ADataset:TDataset;
                      ARecordListKey:String;
                      AFormat:TDatasetToJsonFormat=dtjfDefault):String;
var
  AJsonObject:TJsonObject;
begin
  case AFormat of
    dtjfDefault:
    begin
      Result:=JSonFromDataSet(ADataset,'RecordList').AsJSON;
    end;
    dtjfCompress:
    begin

    end;
  end;
end;

function ReturnJson(ACode:Integer;
                    ADesc:String;
                    ADataJson:ISuperObject;
                    ADesc2:String;
                    ADataJson2:ISuperObject):ISuperObject;
var
  ASign:String;
  ATimestamp:Integer;

begin
  Result:=TSuperObject.Create;


  //���ص�Json�淶
  //Code�Ǵ���,200��ʾ�ɹ�,400��ʾʧ��
  Result.I['Code']:=ACode;
  //DescΪ���ص���Ϣ,�������***�ɹ�,***ʧ��
  Result.S['Desc']:=ADesc;
  //Data��Ϊ���ص�����,����***�б�
  if ADataJson<>nil then
  begin
    Result.O['Data']:=ADataJson;
  end;


  if ADesc2<>'' then
  begin
    //DescΪ���ص���Ϣ,�������***�ɹ�,***ʧ��
    Result.S['Desc2']:=ADesc2;
    //Data��Ϊ���ص�����,����***�б�
    if ADataJson2<>nil then
    begin
      Result.O['Data2']:=ADataJson2;
    end;

  end;


//  //����ʱ���
//  ATimestamp:=timeIntervalSince1970(Now);
//  Result.I['Timestamp']:=ATimestamp;
//
//
//  //����ǩ��
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




