//因为我不想把XSuperObject放在控件里面,所以想自己作一个一样的接口
//并且XSuperObject不支持C++Builder
//convert pas to utf8 by ¥
unit uSkinSuperObject_Copy;

interface

uses
  Classes,
  SysUtils,
  Variants,
  Types,
  uFuncCommon_Copy,

  uBaseList_Copy,
  System.JSON;


type
  ISuperObject=interface;
  TSuperObject=class;
  ISuperArray=interface;
  TSuperArray=class;


  {$IF RTLVersion>=32}// 10.2
  TJSONPairEnumerator=TJSONObject.TEnumerator;
  {$ENDIF}// 10.2


  ISuperObject=interface
    function GetBoolean(Key: String): Boolean;
    function GetDouble(Key: String): Double;
    function GetInteger(Key: String): Int64;
    function GetString(Key: String): String;
    procedure SetBoolean(Key: String; const Value: Boolean);
    procedure SetDouble(Key: String; const Value: Double);
    procedure SetInteger(Key: String; const Value: Int64);
    procedure SetString(Key: String; const Value: String);
    function GetObject(Key: String): ISuperObject;
    procedure SetObject(Key: String; const Value: ISuperObject);
    function GetVariant(Key: String): Variant;
    procedure SetVariant(Key: String; const Value: Variant);
    function GetArray(Key: String): ISuperArray;
    procedure SetArray(Key: String; const Value: ISuperArray);


    property S[Key: String]: String read GetString write SetString;
    property I[Key: String]: Int64 read GetInteger write SetInteger;
    property B[Key: String]: Boolean read GetBoolean write SetBoolean;
    property F[Key: String]: Double read GetDouble write SetDouble;
    property O[Key: String]: ISuperObject read GetObject write SetObject;
    property V[Key: String]: Variant read GetVariant write SetVariant;
    property A[Key: String]: ISuperArray read GetArray write SetArray;

    function Contains(Key: String): Boolean;
    function GetType(Key: String): TVarType;

    function AsJson:String;




//    procedure First;
//    procedure Next;
//    function GetEoF: Boolean;
//    function GetCount: Integer;
//    function GetCurrentKey: String;
//    function GetCurrentValue: IJSONAncestor;
//    function GetOffset: Integer;
//    function GetNull(V: String): TMemberStatus;
//    procedure SetNull(V: String; const Value: TMemberStatus);
//    function  GetExpr(const Code: String): ISuperExpression;
//
//    procedure SetData(V: String; Data: Variant); overload;
//    procedure SetData(V: String; Data: Variant; AFormatSettings: TFormatSettings); overload;
//
//    procedure SaveTo(Stream: TStream); overload;
//    procedure SaveTo(AFile: String); overload;
//
//    property Null[V: String]: TMemberStatus read GetNull write SetNull;
//    property Expression[const Code: String]: ISuperExpression read GetExpr; default;
//    property Count: Integer read GetCount;
//    property EoF: Boolean read GetEoF;
//    property CurrentKey: String read GetCurrentKey;
//    property CurrentValue: IJSONAncestor read GetCurrentValue;
//    property Offset: Integer read GetOffset;


    function GetEnumerator: TJSONPairEnumerator;//TSuperEnumerator<IJSONPair>;


    function T: TSuperObject;
  end;




  //TJsonValue和ISuperObject的映射表
  //TJsonValue和ISuperArray的映射表
  //避免重复创建ISuperObject和ISuperArray
  TChildJsonObjectPair=class
    JsonValue:TJsonValue;

    SuperObject:ISuperObject;

    SuperArray:ISuperArray;
    destructor Destroy;override;
  end;
  TChildJsonObjectPairList=class(TBaseList)
  private
    function GetItem(Index: Integer): TChildJsonObjectPair;
  public
    function Find(AJsonValue:TJsonValue):TChildJsonObjectPair;
    property Items[Index:Integer]:TChildJsonObjectPair read GetItem;default;
  end;





  //因为不能直接继承TJsonObject
  TSuperObject=class(TInterfacedObject,ISuperObject)
//  public
//    class function ParseStream(AStream:TStream):ISuperObject;
  private
    function GetBoolean(Key: String): Boolean;
    function GetDouble(Key: String): Double;
    function GetInteger(Key: String): Int64;
    function GetString(Key: String): String;
    procedure SetBoolean(Key: String; const Value: Boolean);
    procedure SetDouble(Key: String; const Value: Double);
    procedure SetInteger(Key: String; const Value: Int64);
    procedure SetString(Key: String; const Value: String);
    function GetObject(Key: String): ISuperObject;
    procedure SetObject(Key: String; const Value: ISuperObject);
    function GetVariant(Key: String): Variant;
    procedure SetVariant(Key: String; const Value: Variant);
    function GetArray(Key: String): ISuperArray;
    procedure SetArray(Key: String; const Value: ISuperArray);

    function Contains(Key: String): Boolean;
    function GetType(Key: String): TVarType;

    function GetEnumerator: TJSONPairEnumerator;//TSuperEnumerator<IJSONPair>;
    function T: TSuperObject;
  private
    JsonObject:TJsonObject;


    //子Json都是不属于自己的,父Json会释放
    IsJsonObjectOwned:Boolean;
    ChildJsonObjectPairList:TChildJsonObjectPairList;
    procedure SetJsonObject(const AJsonObject:TJsonObject;const AIsJsonObjectOwned:Boolean);
  public
    function AsJson:String;

//  public
//    property S[Key: String]: String read GetString write SetString;
//    property I[Key: String]: Int64 read GetInteger write SetInteger;
//    property B[Key: String]: Boolean read GetBoolean write SetBoolean;
//    property F[Key: String]: Double read GetDouble write SetDouble;
//    property O[Key: String]: ISuperObject read GetObject write SetObject;
//    property A[Key: String]: ISuperArray read GetArray write SetArray;
//    property Key[Key: String]: Variant read GetVariant write SetVariant;
  public
    constructor Create(AJson:String='{}');overload;
//    constructor Create(AJsonObject:TJsonObject);overload;
    destructor Destroy;override;
  end;






  ISuperArray = interface//(IBaseJSON<IJSONArray, Integer>)
    function GetLength: Integer;
    property Length: Integer read GetLength;
    function GetObject(Index: Integer): ISuperObject;
    procedure SetObject(Index: Integer; const Value: ISuperObject);

    function T: TSuperArray;
    function AsJson:String;
//    procedure Add(Value: Variant; DateFormat: TFormatSettings); overload;
//    procedure Add(Value: Variant); overload;
//    procedure Add(Value: IJSONAncestor); overload;
//    procedure Delete(Index: Integer);
//    procedure Clear;
//    function GetEnumerator: TSuperEnumerator<IJSONAncestor>;
    property O[Index: Integer]: ISuperObject read GetObject write SetObject;
  end;



  TSuperArray=class(TInterfacedObject,ISuperArray)
  private
    function GetLength: Integer;
    property Length: Integer read GetLength;
    function GetObject(Index: Integer): ISuperObject;
    procedure SetObject(Index: Integer; const Value: ISuperObject);
  private
    //子Json都是不属于自己的,父Json会释放
    IsJsonArrayOwned:Boolean;

    JsonArray:TJsonArray;

    //子元素列表
    ChildJsonObjectPairList:TChildJsonObjectPairList;
    procedure SetJsonArray(const AJsonArray:TJsonArray;const AIsJsonArrayOwned:Boolean);
  public
    function T: TSuperArray;
    function AsJson:String;
  public
    constructor Create(AJson:String='[]');
    destructor Destroy;override;
  public
    property O[Index: Integer]: ISuperObject read GetObject write SetObject;
  end;



function GetChildJsonObjectPair(AChildJsonObject:TJsonObject;AChildJsonObjectPairList:TChildJsonObjectPairList):TChildJsonObjectPair;
function GetChildJsonArrayPair(AChildJsonArray:TJsonArray;AChildJsonObjectPairList:TChildJsonObjectPairList):TChildJsonObjectPair;



//获取Json中元素的个数
function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            AFieldList:TStringList=nil;
                            ANoAddName:String=''):Integer;
function GetJsonCount(AJson:ISuperObject;
                            AFieldList:TStringList=nil;
                            ANoAddName:String=''):Integer;
function GetJsonNameArray(AJson:ISuperObject;AFieldList:TStringList=nil):TStringDynArray;


implementation


function GetChildJsonObjectPair(AChildJsonObject: TJsonObject;AChildJsonObjectPairList:TChildJsonObjectPairList): TChildJsonObjectPair;
begin
  Result:=AChildJsonObjectPairList.Find(AChildJsonObject);
  if Result=nil then
  begin
      Result:=TChildJsonObjectPair.Create;

      //能不能不每次都创建
      Result.SuperObject:=TSuperObject.Create;
      //是子Json,不需要自己释放JsonObject
      Result.SuperObject.T.SetJsonObject(AChildJsonObject,False);
      Result.JsonValue:=AChildJsonObject;

      AChildJsonObjectPairList.Add(Result);
  end;
end;

function GetChildJsonArrayPair(AChildJsonArray: TJsonArray;AChildJsonObjectPairList:TChildJsonObjectPairList): TChildJsonObjectPair;
begin
  Result:=AChildJsonObjectPairList.Find(AChildJsonArray);
  if Result=nil then
  begin
      Result:=TChildJsonObjectPair.Create;



      //能不能不每次都创建
      Result.SuperArray:=TSuperArray.Create;
      //是子Json,不需要自己释放JsonObject
      Result.SuperArray.T.SetJsonArray(AChildJsonArray,False);
      Result.JsonValue:=AChildJsonArray;

      AChildJsonObjectPairList.Add(Result);
  end;
end;



function ConvertJsonToArray(AJson:ISuperObject;
                            var ANameArray:TStringDynArray;
                            var AValueArray:TVariantDynArray;
                            AFieldList:TStringList;
                            ANoAddName:String):Integer;
var
  I:Integer;
  ASuperEnumerator: TJSONPairEnumerator;
begin
  Result:=GetJsonCount(AJson,AFieldList,ANoAddName);
  SetLength(ANameArray,Result);
  SetLength(AValueArray,Result);

  I:=0;

     //uSkinSuperObject
    ASuperEnumerator:=AJson.GetEnumerator;
    try

        while ASuperEnumerator.MoveNext do
        begin
          if  //字段没有NOPOST前缀
    //          Not SameText(
    //                Copy(ASuperEnumerator.GetCurrent.JsonString.Value,1,Length(NOPOST)),
    //                NOPOST)
    //          and (
                    (AFieldList=nil)
                  or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.JsonString.Value)<>-1)
    //              )
              and ((ANoAddName='') or (ANoAddName<>ASuperEnumerator.GetCurrent.JsonString.Value)) then
          begin
            ANameArray[I]:=ASuperEnumerator.GetCurrent.JsonString.Value;
            AValueArray[I]:=ASuperEnumerator.GetCurrent.JsonValue.Value;

            Inc(I);
          end;
        end;
    finally
      FreeAndNil(ASuperEnumerator);
    end;

end;

function GetJsonCount(AJson:ISuperObject;AFieldList:TStringList;
                            ANoAddName:String):Integer;
var
  ASuperEnumerator: TJSONPairEnumerator;
begin
  Result:=0;
  ASuperEnumerator:=AJson.GetEnumerator;
  try


      while ASuperEnumerator.MoveNext do
      begin
        if
//        Not SameText(
//              Copy(ASuperEnumerator.GetCurrent.JsonString.Value,1,Length(NOPOST)),
//              NOPOST)
//            and (
                  (AFieldList=nil)
                or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.JsonString.Value)<>-1)
//                )

           and ((ANoAddName='') or (ANoAddName<>ASuperEnumerator.GetCurrent.JsonString.Value)) then
        begin
          Inc(Result);
        end;
      end;

  finally
    FreeAndNil(ASuperEnumerator);
  end;
end;

function GetJsonNameArray(AJson:ISuperObject;AFieldList:TStringList):TStringDynArray;
var
  I:Integer;
  ASuperEnumerator: TJSONPairEnumerator;
begin

  SetLength(Result,GetJsonCount(AJson));

  //遍历所有key
  I:=0;
  ASuperEnumerator:=AJson.GetEnumerator;
  try

      while ASuperEnumerator.MoveNext do
      begin
        if
//        Not SameText(
//              Copy(ASuperEnumerator.GetCurrent.JsonString.Value,1,Length(NOPOST)),
//              NOPOST)
//            and (
                  (AFieldList=nil)
                or (AFieldList<>nil) and (AFieldList.IndexOf(ASuperEnumerator.GetCurrent.JsonString.Value)<>-1)
//                )
                then
        begin
          Result[I]:=ASuperEnumerator.GetCurrent.JsonString.Value;

          Inc(I);
        end;
      end;
  finally
    FreeAndNil(ASuperEnumerator);
  end;

end;



{ TSuperObject }


function TSuperObject.AsJson: String;
begin
  Result:=JsonObject.ToJSON;
end;

function TSuperObject.Contains(Key: String): Boolean;
begin
  Result:=(JsonObject.GetValue(Key)<>nil);
end;

constructor TSuperObject.Create(AJson: String);
begin
  if AJson='' then
  begin
    AJson:='{}';
  end;

  JsonObject:=TJsonObject.ParseJSONValue(AJson) as TJsonObject;
  if JsonObject=nil then
  begin
    raise Exception.Create('AJson format is error');
  end;


  //属于自己的JsonObject
  SetJsonObject(JsonObject,True);


  ChildJsonObjectPairList:=TChildJsonObjectPairList.Create;
end;

destructor TSuperObject.Destroy;
begin
  FreeAndNil(ChildJsonObjectPairList);

  if IsJsonObjectOwned then
  begin
    FreeAndNil(JsonObject);
  end;
  //减少引用计数
  JsonObject:=nil;


  inherited;
end;

function TSuperObject.GetArray(Key: String): ISuperArray;
var
  AJSONPair:TJSONPair;
  AJSONArray:TJSONArray;
  AChildJsonObjectPair:TChildJsonObjectPair;
begin
  Result:=nil;
  AJSONPair:=JsonObject.Get(Key);

  if (AJSONPair<>nil) then
  begin
      //存在该键
      if AJSONPair.JsonValue is TJSONArray then
      begin
          //是数组
          AJSONArray:=AJSONPair.JsonValue as TJSONArray;

          AChildJsonObjectPair:=GetChildJsonArrayPair(AJSONArray,ChildJsonObjectPairList);
          Result:=AChildJsonObjectPair.SuperArray;

      end
      else
      begin
          //不是数组
      end;
  end
  else
  begin
      //不存在该键


  end;


end;

function TSuperObject.GetBoolean(Key: String): Boolean;
var
  AJSONValue:TJSONValue;
begin
  Result:=False;
  AJSONValue:=JsonObject.GetValue(Key);
  if AJSONValue is TJSonBool then
  begin
    Result:=TJSonBool(AJSONValue).AsBoolean;
  end;
end;

function TSuperObject.GetDouble(Key: String): Double;
var
  AJSONValue:TJSONValue;
begin
  Result:=0;
  AJSONValue:=JsonObject.GetValue(Key);
  if AJSONValue is TJSonNumber then
  begin
    Result:=TJSonNumber(AJSONValue).AsDouble;
  end;
end;

function TSuperObject.GetEnumerator: TJSONPairEnumerator;//TSuperEnumerator<IJSONPair>;
begin
//  Result.Index := -1;
////  Result.List := TJSONObject(FJSONObj).GetEnumerator
//  Result.List := Self.JsonObject.GetEnumerator

  Result:=Self.JsonObject.GetEnumerator;

end;

function TSuperObject.GetInteger(Key: String): Int64;
var
  AJSONValue:TJSONValue;
begin
  Result:=0;
  AJSONValue:=JsonObject.GetValue(Key);
  if AJSONValue is TJSonNumber then
  begin
    Result:=TJSonNumber(AJSONValue).AsInt64;
  end;
end;

function TSuperObject.GetObject(Key: String): ISuperObject;
var
  AJSONPair:TJSONPair;
  AJSONObject:TJSONObject;
  AChildJsonObjectPair:TChildJsonObjectPair;
begin
  Result:=nil;
  AJSONPair:=JsonObject.Get(Key);

  if (AJSONPair<>nil) then
  begin
      //存在该键
      if AJSONPair.JsonValue is TJSONObject then
      begin
          //是对象
          AJSONObject:=AJSONPair.JsonValue as TJSONObject;

          AChildJsonObjectPair:=GetChildJsonObjectPair(AJSONObject,ChildJsonObjectPairList);
          Result:=AChildJsonObjectPair.SuperObject;
      end
      else
      begin
          //不是对象
      end;
  end
  else
  begin
      //不存在该键


  end;

end;

function TSuperObject.GetString(Key: String): String;
var
  AJSONValue:TJSONValue;
begin
  Result:='';
  AJSONValue:=JsonObject.GetValue(Key);
  if AJSONValue<>nil then
  begin
    Result:=AJSONValue.Value;
  end;
end;

function TSuperObject.GetType(Key: String): TVarType;
var
  AJSONValue:TJSONValue;
  AStr:String;
begin
  Result:=varEmpty;
  AJSONValue:=JsonObject.GetValue(Key);
  if AJSONValue<>nil then
  begin
    if AJSONValue is TJSonNumber then
    begin
        AStr := TJSonNumber(AJSONValue).ToString;
        if (not AStr.Contains(GetJSONFormat.DecimalSeparator)) then
        begin
          Result := varInteger;
        end
        else
        begin
          Result := varDouble;
        end;

//      ADouble:=TJSonNumber(AJSONValue).AsDouble;
//      AInt64:=TJSonNumber(AJSONValue).AsDouble;
    end
    else if AJSONValue is TJSONBool then
    begin
      Result:=varBoolean;
    end
    else if AJSONValue is TJSONArray then
    begin
      Result:=varArray;
    end
    else if AJSONValue is TJSONObject then
    begin
      Result:=varObject;
    end
    else
    begin
      Result:=varString;
    end;

  end;

end;

function TSuperObject.GetVariant(Key: String): Variant;
var
  AJSONValue:TJSONValue;
begin
  Result:=varEmpty;
  AJSONValue:=JsonObject.GetValue(Key);
  if AJSONValue<>nil then
  begin
    if AJSONValue is TJSonNumber then
    begin
        if GetType(Key)=varInteger then
        begin
          Result:=TJSonNumber(AJSONValue).AsInt64;
        end
        else
        begin
          Result:=TJSonNumber(AJSONValue).AsDouble;
        end;
    end
    else if AJSONValue is TJSONBool then
    begin
        Result:=TJSONBool(AJSONValue).AsBoolean;
    end
    else// if AJSONValue is TJSONString then
    begin
        Result:=AJSONValue.Value;
    end;

  end;
//  if AJSONValue is TJSonTrue then
//  begin
//    Result:=True;
//  end;

end;

//class function TSuperObject.ParseStream(AStream: TStream): ISuperObject;
//var
//  AJsonObject:TJsonObject;
//begin
//  AJsonObject:=TJsonObject.Create();
//
//end;

procedure TSuperObject.SetArray(Key: String; const Value: ISuperArray);
var
  AJSONPair:TJSONPair;
  ANewJSONValue:TJSONValue;
begin
  if GetArray(Key)<>Value then
  begin


      ANewJSONValue:=nil;
      if Value<>nil then
      begin
        //只能复制一份
//        ANewJSONValue:=TJSONObject.ParseJSONValue(Value.AsJson);//Value.T;
        ANewJSONValue:=Value.T.JsonArray.Clone as TJSONValue;//Value.T;
      end;


      AJSONPair:=JsonObject.Get(Key);
      if AJSONPair<>nil then
      begin

          //已经有了
          //释放原来的
          if AJSONPair.JsonValue<>nil then
          begin
            AJSONPair.JsonValue.Free;
          end;

          AJSONPair.JsonValue:=ANewJSONValue;

      end
      else
      begin
          //不存在,则添加
          JsonObject.AddPair(Key,ANewJSONValue);
      end;




  end;


end;

procedure TSuperObject.SetBoolean(Key: String; const Value: Boolean);
var
  AJSONPair:TJSONPair;
  AJSONValue:TJSONValue;
begin
  AJSONValue:=TJsonBool.Create(Value);
  AJSONValue.Owned:=True;

  AJSONPair:=JsonObject.Get(Key);
  if AJSONPair<>nil then
  begin
      AJSONPair.JsonValue.Free;
      AJSONPair.JsonValue:=AJSONValue;
  end
  else
  begin
      //不存在,则添加
      JsonObject.AddPair(Key,AJSONValue);
  end;
end;

procedure TSuperObject.SetDouble(Key: String; const Value: Double);
var
  AJSONPair:TJSONPair;
  AJSONValue:TJSONValue;
begin
  AJSONValue:=TJSONNumber.Create(Value);

  AJSONPair:=JsonObject.Get(Key);
  if AJSONPair<>nil then
  begin
      AJSONPair.JsonValue.Free;
      AJSONPair.JsonValue:=AJSONValue;
  end
  else
  begin
      //不存在,则添加
      JsonObject.AddPair(Key,AJSONValue);
  end;
end;

procedure TSuperObject.SetInteger(Key: String; const Value: Int64);
var
  AJSONPair:TJSONPair;
  AJSONValue:TJSONValue;
begin
  AJSONValue:=TJSONNumber.Create(Value);
  AJSONPair:=JsonObject.Get(Key);
  if AJSONPair<>nil then
  begin
      AJSONPair.JsonValue.Free;
      AJSONPair.JsonValue:=AJSONValue;
  end
  else
  begin
      //不存在,则添加
      JsonObject.AddPair(Key,AJSONValue);
  end;
end;

procedure TSuperObject.SetJsonObject(const AJsonObject: TJsonObject;const AIsJsonObjectOwned: Boolean);
begin
  if JsonObject<>AJsonObject then
  begin
      //自己创建的要自己释放掉
      if IsJsonObjectOwned then
      begin
        FreeAndNil(JsonObject);
      end;
      JsonObject:=nil;
  end;


  JsonObject:=AJsonObject;
  IsJsonObjectOwned:=AIsJsonObjectOwned;
end;

procedure TSuperObject.SetObject(Key: String; const Value: ISuperObject);
var
  AJSONPair:TJSONPair;
  ANewJSONValue:TJSONValue;
begin
  if GetObject(Key)<>Value then
  begin


      ANewJSONValue:=nil;
      if Value<>nil then
      begin
        //只能复制一份
//        ANewJSONValue:=TJSONObject.ParseJSONValue(Value.AsJson);//Value.T;
        ANewJSONValue:=Value.T.JsonObject.Clone as TJSONValue;//Value.T;
      end;


      AJSONPair:=JsonObject.Get(Key);
      if AJSONPair<>nil then
      begin

          //已经有了
          //释放原来的
          if AJSONPair.JsonValue<>nil then
          begin
            AJSONPair.JsonValue.Free;
          end;

          AJSONPair.JsonValue:=ANewJSONValue;

      end
      else
      begin
          //不存在,则添加
          JsonObject.AddPair(Key,ANewJSONValue);
      end;




  end;
end;

procedure TSuperObject.SetString(Key: String; const Value: String);
var
  AJSONPair:TJSONPair;
  AJSONValue:TJSONValue;
begin
  AJSONValue:=TJSONString.Create(Value);
  AJSONPair:=JsonObject.Get(Key);
  if AJSONPair<>nil then
  begin
      AJSONPair.JsonValue.Free;
      AJSONPair.JsonValue:=AJSONValue;
  end
  else
  begin
      //不存在,则添加
      JsonObject.AddPair(Key,AJSONValue);
  end;
end;

procedure TSuperObject.SetVariant(Key: String; const Value: Variant);
begin
  case VarType(Value) of
    varString:
    begin
      SetString(Key,Value);
    end;
    varInteger,varInt64:
    begin
      SetString(Key,Value);
    end;
    varDouble:
    begin
      SetDouble(Key,Value);
    end;
    varBoolean:
    begin
      SetBoolean(Key,Value);
    end
    else
    begin
      raise Exception.Create('TSuperObject.SetVariant Value is error');
    end;
  end;
end;

function TSuperObject.T: TSuperObject;
begin
  Result:=Self;
end;

{ TSuperArray }

function TSuperArray.AsJson: String;
begin
  Result:=JsonArray.ToJSON;
end;

constructor TSuperArray.Create(AJson: String);
begin
  if AJson='' then
  begin
    AJson:='[]';
  end;
  JsonArray:=TJsonObject.ParseJSONValue(AJson) as TJsonArray;


  SetJsonArray(JsonArray,True);
  

  ChildJsonObjectPairList:=TChildJsonObjectPairList.Create;
end;

destructor TSuperArray.Destroy;
begin

  if IsJsonArrayOwned then
  begin
    FreeAndNil(JsonArray);
  end;
  //减少引用计数
  JsonArray:=nil;


  FreeAndNil(ChildJsonObjectPairList);
  inherited;
end;

function TSuperArray.GetLength: Integer;
begin
  Result:=JsonArray.Count;
end;

function TSuperArray.GetObject(Index: Integer): ISuperObject;
var
  AJsonValue:TJsonValue;
  AJsonObject:TJsonObject;
  AChildJsonObjectPair:TChildJsonObjectPair;
begin
  Result:=nil;
  if Index<Self.JsonArray.Count then
  begin
      AJsonValue:=JsonArray.Items[Index];
      if (AJsonValue<>nil) and (AJsonValue is TJsonObject) then
      begin
        AJsonObject:=AJsonValue as TJsonObject;
        AChildJsonObjectPair:=GetChildJsonObjectPair(AJsonObject,ChildJsonObjectPairList);
        Result:=AChildJsonObjectPair.SuperObject;
      end;
  end;
end;

procedure TSuperArray.SetJsonArray(const AJsonArray: TJsonArray;const AIsJsonArrayOwned: Boolean);
begin
  if JsonArray<>AJsonArray then
  begin
      //自己创建的要自己释放掉
      if IsJsonArrayOwned then
      begin
        FreeAndNil(JsonArray);
      end;
      JsonArray:=nil;
  end;
  


  IsJsonArrayOwned:=AIsJsonArrayOwned;

  JsonArray:=AJsonArray;
end;

procedure TSuperArray.SetObject(Index: Integer; const Value: ISuperObject);
var
//  AJsonValue:TJsonValue;
  ANewJsonObject:TJSONObject;
begin
  ANewJsonObject:=nil;
  if Value<>nil then
  begin
    ANewJsonObject:=Value.T.JsonObject.Clone as TJSONObject;
        //TJSONObject.ParseJSONValue(Value.AsJson) as TJSONObject;
  end;



  //不能修改,只能添加
//  if Index<Self.JsonArray.Count then
//  begin
//      //修改
//      JsonArray.Items[Index]:=ANewJsonObject;
//  end
//  else
//  begin
      //添加
      JsonArray.Add(ANewJsonObject);
//  end;

end;




function TSuperArray.T: TSuperArray;
begin
  Result:=Self;
end;

{ TChildJsonObjectPairList }

function TChildJsonObjectPairList.Find(AJsonValue: TJsonValue): TChildJsonObjectPair;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Count-1 do
  begin
    if (Items[I].JsonValue=AJsonValue) then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TChildJsonObjectPairList.GetItem(Index: Integer): TChildJsonObjectPair;
begin
  Result:=TChildJsonObjectPair(Inherited Items[Index]);
end;

{ TChildJsonObjectPair }

destructor TChildJsonObjectPair.Destroy;
begin
  JsonValue:=nil;

  SuperObject:=nil;

  SuperArray:=nil;

  inherited;
end;

end.
