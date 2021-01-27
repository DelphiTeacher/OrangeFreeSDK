//convert pas to utf8 by ¥
//TDataset和Json之间的相互转换
unit uJsonToDataset;


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


//  kbmMemTypes,
//  kbmMemTable,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,



  uRestInterfaceCall,

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
  uDatasetToJson,
  Data.DB;


function JsonToDataset(ADataJson:ISuperObject):TFDMemTable;
function JsonArrayToDataset(ADataJsonArray:ISuperArray):TFDMemTable;
function JsonCreateDatasetStructure(ADataJson:ISuperObject):TFDMemTable;
procedure LoadJsonToDataset(ADataJson:ISuperObject;ADataset:TDataset);
function LoadDataJsonTokbmMemTable(AMemTable:TFDMemTable;
                                  ADataJson:ISuperObject;
                                  ARecordListKey:String=RECORDLIST_KEY
                                  ):Boolean;

//根据字段定义创建内存表
//function CreateMemTableByFieldDefArray(AFieldDefArray:ISuperArray):TFDMemTable;
function LoadMemTableFeildDefsByFieldDefArray(AMemTable:TFDMemTable;AFieldDefArray:ISuperArray):Boolean;
//function JsonToMemTable(AFieldDefArray:ISuperArray;var AMemTable:TFDMemTable):Boolean;overload;
//加载数据
function LoadDataFromJsonArray(ADataset:TDataset;ASuperArray:ISuperArray):Boolean;
function LoadDataFromCompressedJsonArray(ADataset:TDataset;ASuperArray:ISuperArray):Boolean;


//调用rest接口,返回字符串,在服务端中使用
function SimpleGetAPIDataset(API: String;
                            AInterfaceUrl:String;
                            AUrlParamNames:TStringDynArray;
                            AUrlParamValues:TVariantDynArray;
                            ASignType:String;
                            ASignSecret:String;
                            var ACode:Integer;
                            var ADesc:String;
                            var ADataJson:ISuperObject;
                            AMemTable:TFDMemTable;
                            ARecordListKey:String=RECORDLIST_KEY): Boolean;



implementation



function JsonCreateDatasetStructure(ADataJson:ISuperObject):TFDMemTable;
var
  ANameArray:TStringDynArray;
  AValueArray:TVariantDynArray;
  AValueTypeArray:TVarTypeDynArray;
  I: Integer;
begin
  Result:=TFDMemTable.Create(nil);

//  ADataJson.GetType()
//var
//  Temp: IJSONAncestor;
//begin
//  Temp := GetData(Key);
//  if Temp = Nil then
//     Result := varUnknown
//  else if Temp is TJSONString then
//     Result := varString
//  else if Temp is TJSONFloat then
//     Result := varDouble
//  else if Temp is TJSONInteger then
//      Result := varInt64
//  else if Temp is TJSONNull then
//     Result := varNull
//  else if Temp is TJSONObject then
//     Result := varObject
//  else if Temp is TJSONArray then
//     Result := varArray
//  else if Temp is TJSONBoolean then
//     Result := varBoolean



  ConvertJsonToArray(ADataJson,ANameArray,AValueArray,AValueTypeArray);
  for I := 0 to Length(ANameArray)-1 do
  begin
      case AValueTypeArray[I] of
        varInt64,varInteger:
        begin
          Result.FieldDefs.Add(ANameArray[I],TFieldType.ftInteger);
        end;
        varString,varUString:
        begin
          Result.FieldDefs.Add(ANameArray[I],TFieldType.ftString,Length(AValueArray[I])+1);
        end;
        varDouble:
        begin
          Result.FieldDefs.Add(ANameArray[I],TFieldType.ftFloat);
        end;
        varBoolean:
        begin
          Result.FieldDefs.Add(ANameArray[I],TFieldType.ftBoolean);
        end
        else
        begin
          uBaseLog.HandleException(nil,'JsonToDataset 不能将'+ANameArray[I]+'转换为字段');
        end;
      end;
  end;


  Result.CreateDataSet;
end;

function JsonArrayToDataset(ADataJsonArray:ISuperArray):TFDMemTable;
var
  I: Integer;
begin
  if ADataJsonArray.Length>0 then
  begin
    Result:=JsonCreateDatasetStructure(ADataJsonArray.O[0]);
    for I := 0 to ADataJsonArray.Length-1 do
    begin
      LoadJsonToDataset(ADataJsonArray.O[I],Result);
    end;
  end;
end;

function JsonToDataset(ADataJson:ISuperObject):TFDMemTable;
begin
  Result:=JsonCreateDatasetStructure(ADataJson);
  LoadJsonToDataset(ADataJson,Result);
end;

procedure LoadJsonToDataset(ADataJson:ISuperObject;ADataset:TDataset);
var
  I:Integer;
begin
  ADataset.Append;
  for I := 0 to ADataset.FieldDefs.Count-1 do
  begin
    ADataset.Fields[I].Value:=ADataJson.V[ADataset.Fields[I].FieldName];
  end;
  ADataset.Post;
end;

function SimpleGetAPIDataset(API: String;
                            AInterfaceUrl:String;
                            AUrlParamNames:TStringDynArray;
                            AUrlParamValues:TVariantDynArray;
                            ASignType:String;
                            ASignSecret:String;
                            var ACode:Integer;
                            var ADesc:String;
                            var ADataJson:ISuperObject;
                            AMemTable:TFDMemTable;
                            ARecordListKey:String=RECORDLIST_KEY): Boolean;
begin
  Result:=SimpleCallAPI(API,
                        nil,
                        AInterfaceUrl,
                        AUrlParamNames,
                        AUrlParamValues,
                        ACode,
                        ADesc,
                        ADataJson,
                        ASignType,
                        ASignSecret);

  if Result and (ACode=SUCC) and (ADataJson<>nil) and (ARecordListKey<>'') then
  begin
    LoadDataJsonTokbmMemTable(AMemTable,ADataJson,ARecordListKey);
  end;

end;


function LoadDataJsonTokbmMemTable(AMemTable:TFDMemTable;
                                  ADataJson:ISuperObject;
                                  ARecordListKey:String=RECORDLIST_KEY
                                  ):Boolean;
begin
  Result:=False;

  TThread.Synchronize(nil,procedure
  var
    I:Integer;
    AIsDiff:Boolean;
  begin
      AMemTable.DisableControls;
      try

        //  if AMemTable=nil then
        //  begin
        //    AMemTable:=TFDMemTable.Create(nil);
        ////    AMemTable:=CreateMemTableByFieldDefArray(ADataJson.A[ARecordListKey+'_'+'FieldDefs']);
        //  end;



          //字段数为0,需要重新创建表结构
          if (AMemTable.FieldDefs.Count=0)
            or (AMemTable.FieldDefs.Count<>ADataJson.A[ARecordListKey+'_'+'FieldDefs'].Length) then
          begin
            //每次都重建
            LoadMemTableFeildDefsByFieldDefArray(AMemTable,ADataJson.A[ARecordListKey+'_'+'FieldDefs']);
          end
          else
          begin
              //表结构有没有不同
              AIsDiff:=False;
              for I := 0 to ADataJson.A[ARecordListKey+'_'+'FieldDefs'].Length-1 do
              begin
                if (ADataJson.A[ARecordListKey+'_'+'FieldDefs'].O[I].I['field_type']<>Ord(AMemTable.FieldDefs[I].DataType))
                  or (ADataJson.A[ARecordListKey+'_'+'FieldDefs'].O[I].S['name']<>AMemTable.FieldDefs[I].Name)
                  or (ADataJson.A[ARecordListKey+'_'+'FieldDefs'].O[I].I['size']<>AMemTable.FieldDefs[I].Size) then
                begin
                  AIsDiff:=True;
                  Break;
                end;
              end;
              if AIsDiff then
              begin
                //重建
                LoadMemTableFeildDefsByFieldDefArray(AMemTable,ADataJson.A[ARecordListKey+'_'+'FieldDefs']);
              end;
              
              AMemTable.EmptyDataSet;
          end;





          if ADataJson.S['DatasetToJsonFormat']='compressed' then
          begin
            LoadDataFromCompressedJsonArray(AMemTable,ADataJson.A[ARecordListKey]);
          end
          else
          begin
            LoadDataFromJsonArray(AMemTable,ADataJson.A[ARecordListKey]);
          end;






    //      if Result then
    //      begin
    //        AMemTable.First;
    //      end;
      finally
          AMemTable.EnableControls;
      end;
  end);
  Result:=True;
end;

//function CreateMemTableByFieldDefArray(AFieldDefArray:ISuperArray):TFDMemTable;
//begin
//      Result:=TFDMemTable.Create(nil);
//      LoadMemTableFeildDefsByFieldDefArray(AFieldDefArray);
//end;

function LoadMemTableFeildDefsByFieldDefArray(AMemTable:TFDMemTable;AFieldDefArray:ISuperArray):Boolean;
var
  I: Integer;
  ADataSize:Integer;
  APrecision:Integer;
  AFieldType:TFieldType;
  ADataTypeName:String;
begin
      Result:=False;

      if AMemTable.Active then
      begin
        AMemTable.Active:=False;
//        AMemTable.EmptyDataSet;
      end;

//      AMemTable.ClearFields;


      //建表
      AMemTable.FieldDefs.Clear;


//var
//  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
//      AMemTable.FieldDefs.Add('Id', ftInteger, 0, False);
//      AMemTable.FieldDefs.Add('Value', FtString, 20, False);
//      AMemTable.FieldDefs.Add('Time', ftDateTime, 0, False);
//      AMemTable.IndexDefs.Add('Index1','Id',[]);//定义索引
      {name:**,data_type:**,size:***}
//      ASuperObject.S['name']:=ADataset.FieldDefs[I].Name;
//      ASuperObject.I['size']:=ADataset.FieldDefs[I].Size;
//
//
//      ADataTypeName:='unknown';
//      case ADataset.FieldDefs[I].DataType of
//        ftString,ftWideString,ftMemo,ftFmtMemo,ftFixedChar,ftFixedWideChar,ftWideMemo:ADataTypeName:='string';
//        ftSmallint,ftInteger,ftWord,ftLargeint,ftTimeStamp,ftLongWord,ftShortint,ftByte:
//                ADataTypeName:='integer';
//        ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle:ADataTypeName:='float';
//        ftDate:ADataTypeName:='date';
//        ftTime:ADataTypeName:='time';
//        ftDatetime:ADataTypeName:='datetime';
//        ftBoolean:ADataTypeName:='boolean';
//      end;
//      ASuperObject.S['data_type']:=ADataTypeName;


      for I := 0 to AFieldDefArray.Length-1 do
      begin


            ADataSize:=AFieldDefArray.O[I].I['size'];
            APrecision:=AFieldDefArray.O[I].I['precision'];
            if AFieldDefArray.O[I].Contains('field_type') then
            begin
                AFieldType:=TFieldType(AFieldDefArray.O[I].I['field_type']);
            end
            else
            begin
                ADataTypeName:=AFieldDefArray.O[I].S['data_type'];

                if ADataTypeName='unknown' then
                  AFieldType:=ftUnknown
                else if ADataTypeName='string' then
                  AFieldType:=ftString
                else if ADataTypeName='smallint' then
                  AFieldType:=ftSmallint
                else if ADataTypeName='integer' then
                  AFieldType:=ftInteger
                else if ADataTypeName='word' then
                  AFieldType:=ftWord
                else if ADataTypeName='boolean' then
                  AFieldType:=ftBoolean
                else if ADataTypeName='float' then
                  AFieldType:=ftFloat
                else if ADataTypeName='currency' then
                  AFieldType:=ftCurrency
                else if ADataTypeName='bcd' then
                  AFieldType:=ftBCD
                else if ADataTypeName='date' then
                  AFieldType:=ftDate
                else if ADataTypeName='time' then
                  AFieldType:=ftTime
                else if ADataTypeName='datetime' then
                  AFieldType:=ftDateTime
                else if ADataTypeName='bytes' then
                  AFieldType:=ftBytes
                else if ADataTypeName='varbytes' then
                  AFieldType:=ftVarBytes
                else if ADataTypeName='autoinc' then
                  AFieldType:=ftAutoInc
                else if ADataTypeName='blob' then
                  AFieldType:=ftBlob
                else if ADataTypeName='memo' then
                  AFieldType:=ftMemo
                else if ADataTypeName='graphic' then
                  AFieldType:=ftGraphic
                else if ADataTypeName='fmtmemo' then
                  AFieldType:=ftFmtMemo
                else if ADataTypeName='paradoxole' then
                  AFieldType:=ftParadoxOle
                else if ADataTypeName='dbaseole' then
                  AFieldType:=ftDBaseOle
                else if ADataTypeName='typedbinary' then
                  AFieldType:=ftTypedBinary
                else if ADataTypeName='cursor' then
                  AFieldType:=ftCursor
                else if ADataTypeName='fixedchar' then
                  AFieldType:=ftFixedChar
                else if ADataTypeName='widestring' then
                  AFieldType:=ftWideString
                else if ADataTypeName='largeint' then
                  AFieldType:=ftLargeint
                else if ADataTypeName='adt' then
                  AFieldType:=ftADT
                else if ADataTypeName='array' then
                  AFieldType:=ftArray
                else if ADataTypeName='reference' then
                  AFieldType:=ftReference
                else if ADataTypeName='dataset' then
                  AFieldType:=ftDataSet
                else if ADataTypeName='orablob' then
                  AFieldType:=ftOraBlob
                else if ADataTypeName='oraclob' then
                  AFieldType:=ftOraClob
                else if ADataTypeName='variant' then
                  AFieldType:=ftVariant
                else if ADataTypeName='interface' then
                  AFieldType:=ftInterface
                else if ADataTypeName='idispatch' then
                  AFieldType:=ftIDispatch
                else if ADataTypeName='guid' then
                  AFieldType:=ftGuid
                else if ADataTypeName='timestamp' then
                  AFieldType:=ftTimeStamp
                else if ADataTypeName='fmtbcd' then
                  AFieldType:=ftFMTBcd
                else if ADataTypeName='fixedwidechar' then
                  AFieldType:=ftFixedWideChar
                else if ADataTypeName='widememo' then
                  AFieldType:=ftWideMemo
                else if ADataTypeName='oratimestamp' then
                  AFieldType:=ftOraTimeStamp
                else if ADataTypeName='orainterval' then
                  AFieldType:=ftOraInterval
                else if ADataTypeName='longword' then
                  AFieldType:=ftLongWord
                else if ADataTypeName='shortint' then
                  AFieldType:=ftShortint
                else if ADataTypeName='byte' then
                  AFieldType:=ftByte
                else if ADataTypeName='extended' then
                  AFieldType:=ftExtended
                else if ADataTypeName='connection' then
                  AFieldType:=ftConnection
                else if ADataTypeName='params' then
                  AFieldType:=ftParams
                else if ADataTypeName='stream' then
                  AFieldType:=ftStream
                else if ADataTypeName='timestampoffset' then
                  AFieldType:=ftTimeStampOffset
                else if ADataTypeName='object' then
                  AFieldType:=ftObject
                else if ADataTypeName='single' then
                  AFieldType:=ftSingle;

            end;
            
            AMemTable.FieldDefs.Add(AFieldDefArray.O[I].S['name'], AFieldType, ADataSize, False);


//          if AFieldDefArray.O[I].S['data_type']='integer' then
//          begin
//            AMemTable.FieldDefs.Add(AFieldDefArray.O[I].S['name'], ftInteger, 0, False);
//          end
//          else if AFieldDefArray.O[I].S['data_type']='datetime' then
//          begin
//            AMemTable.FieldDefs.Add(AFieldDefArray.O[I].S['name'], ftDateTime, 0, False);
//          end
//          else if AFieldDefArray.O[I].S['data_type']='boolean' then
//          begin
//            AMemTable.FieldDefs.Add(AFieldDefArray.O[I].S['name'], ftBoolean, 0, False);
//          end
//          else if AFieldDefArray.O[I].S['data_type']='float' then
//          begin
//            AMemTable.FieldDefs.Add(AFieldDefArray.O[I].S['name'], ftFloat, 0,  False);
//          end
//          else if AFieldDefArray.O[I].S['data_type']='string' then
//          begin
//            AMemTable.FieldDefs.Add(AFieldDefArray.O[I].S['name'], ftString, AFieldDefArray.O[I].I['size'],  False);
//          end
//          else
//          begin
//            AMemTable.FieldDefs.Add(AFieldDefArray.O[I].S['name'], ftString, AFieldDefArray.O[I].I['size'],  False);
//          end;
      end;

      AMemTable.CreateDataSet;
//      AMemTable.Active := True;

      Result:=True;
end;

function LoadDataFromJsonArray(ADataset:TDataset;ASuperArray:ISuperArray):Boolean;
var
  I: Integer;
  J: Integer;
  ASuperObject:ISuperObject;
  AFieldDef:TFieldDef;
begin
//  ADataset.DisableControls;
//  try

    if not ADataset.Active then
    begin
      ADataset.Active:=True;
    end;
    

    for I := 0 to ASuperArray.Length-1 do
    begin
        ASuperObject:=ASuperArray.O[I];

        ADataset.Append;
        for J := 0 to ADataset.FieldDefs.Count-1 do
        begin
            AFieldDef:=ADataset.FieldDefs[J];

            try

                case AFieldDef.DataType of
                  ftDate, ftTime, ftDateTime:
                  begin
                    ADataset.FieldByName(AFieldDef.Name).AsDateTime:=StdStrToDateTime(ASuperObject.S[AFieldDef.Name]);
                  end;
                  ftSmallint,ftInteger,ftWord,ftLargeint,ftTimeStamp,ftLongWord,ftShortint,ftByte:
                  begin
                    ADataset.FieldByName(AFieldDef.Name).AsInteger:=ASuperObject.I[AFieldDef.Name];
                  end;
                  ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle:
                  begin
                    ADataset.FieldByName(AFieldDef.Name).AsFloat:=ASuperObject.F[AFieldDef.Name];
                  end;
                  ftBoolean:
                  begin
                    ADataset.FieldByName(AFieldDef.Name).AsBoolean:=ASuperObject.B[AFieldDef.Name];
                  end;
                  ftString,ftWideString,ftFixedChar,ftFixedWideChar,ftGuid:
                  begin
                    ADataset.FieldByName(AFieldDef.Name).AsString:=ASuperObject.S[AFieldDef.Name];
                  end;
                  else
                  begin
                    ADataset.FieldByName(AFieldDef.Name).AsString:=ASuperObject.S[AFieldDef.Name];
                  end;
                end;

            except
                on E:Exception do
                begin
                  uBaseLog.HandleException(E,'LoadDataFromJsonArray');
                end;
            end;


        end;
        ADataset.Post;

    end;

    ADataset.First;
//  finally
//    ADataset.EnableControls;
//  end;
end;

function LoadDataFromCompressedJsonArray(ADataset:TDataset;ASuperArray:ISuperArray):Boolean;
var
  I: Integer;
  J: Integer;
  ASuperObject:ISuperArray;
  AFieldDef:TFieldDef;
begin
//  ADataset.DisableControls;
//  try
    for I := 0 to ASuperArray.Length-1 do
    begin
        ASuperObject:=ASuperArray.A[I];

        ADataset.Append;
        for J := 0 to ADataset.FieldDefs.Count-1 do
        begin
            AFieldDef:=ADataset.FieldDefs[J];

            try
                case AFieldDef.DataType of
                  ftDate, ftTime, ftDateTime:
                  begin
                      ADataset.Fields[J].AsDateTime:=StdStrToDateTime(ASuperObject.S[J]);
                  end;
                  ftSmallint,ftInteger,ftWord,ftLargeint,ftTimeStamp,ftLongWord,ftShortint,ftByte:
                  begin
                      if VarIsNull(ASuperObject.V[J]) then
                      begin
                        ADataset.Fields[J].AsInteger:=0;
                      end
                      else
                      begin
                        ADataset.Fields[J].AsInteger:=ASuperObject.I[J];
                      end;
                  end;
                  ftFloat,ftCurrency,ftBCD,ftFMTBcd,ftExtended,ftSingle:
                  begin
                      ADataset.Fields[J].AsFloat:=ASuperObject.F[J];
                  end;
                  ftBoolean:
                  begin
                      ADataset.Fields[J].AsBoolean:=ASuperObject.B[J];
                  end;
                  ftString,ftWideString,ftFixedChar,ftFixedWideChar,ftGuid:
                  begin
                      ADataset.Fields[J].AsString:=ASuperObject.S[J];
                  end;
                  else
                  begin
                      ADataset.Fields[J].AsString:=ASuperObject.S[J];
                  end;
                end;
            except
                on E:Exception do
                begin
                  uBaseLog.HandleException(E,'LoadDataFromCompressedJsonArray');
                end;
            end;

        end;
        ADataset.Post;

    end;

    ADataset.First;
//  finally
//    ADataset.EnableControls;
//  end;
end;


end.




