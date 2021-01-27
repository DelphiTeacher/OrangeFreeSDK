//convert pas to utf8 by ¥
//copyright delphiteacher QQ:452330643
//2015-08-08
//未经授权,严禁出售赠送或转上他人使用
//
unit uPayAPIParam;

interface

uses
  SysUtils,
  Classes,


  {$IFDEF IN_ORANGESDK}
  //在OrangeSDK包里面
  uBaseList_Copy,
  {$ELSE}
  //在OrangeUI里面
  uBaseList,
  {$ENDIF}

  uPayPublic;
//  uWorkThreadList;

type
  TWorkThreadList=TBaseList;

  //请求的参数键值对
  TInterfaceParameter=class
  private
    FName:String;
    FValue:String;
  public
    constructor Create(const AName:String;const AValue:String);
    destructor Destroy;override;
  public
    property Name:String read FName write FName;
    property Value:String read FValue write FValue;
  end;




  //参数列表
  TInterfaceParameters=class(TWorkThreadList)
  private
    function GetItem(Index: Integer): TInterfaceParameter;
  public
    //需要按照名字顺序排序,如果名字相同,那要根据值来排序,生成的签名才是有用的
    procedure Sort;
    //生成XML,微信需要使用
    function GetXMLPackage:String;
    //生成需要签名的串
    function GetQueryParamsStr(
                              HasRefChar:Boolean=True;//是否需要引号
                              NeedUrlEncode:Boolean=False;//是否需要UrlEncode
                              SpaceCharReplace:String='20%'
                              ):String;
//    function GetSignQueryParamsStr:String;
    //添加一对键值
    procedure AddQueryParameter(const AName:String;const AValue:String);
  public
    function FindItemByName(AName:String):TInterfaceParameter;
    function ItemValueByName(AName:String):String;
    property Items[Index:Integer]:TInterfaceParameter read GetItem;default;
  end;




function ParseUrlQueryParameters(URL:String;HasWWW:Boolean=True):TInterfaceParameters;

//function GetMimeType(AFileName:String):String;overload;
//function GetMimeType(AContent:TStream):String;overload;
function GenerateUrl(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant
                    ):String;




implementation



function GenerateUrl(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant
                    ):String;
var
  I:Integer;
  AParamValue:String;
  //订单参数列表
  APayParamList:TInterfaceParameters;
begin

  APayParamList:=TInterfaceParameters.Create;
  try

    for I := 0 to Length(AParamNames)-1 do
    begin
      AParamValue:=AParamValues[I];
      if AParamValue<>'' then
      begin
        APayParamList.AddQueryParameter(AParamNames[I],AParamValue);
      end;
    end;


    //排序
    APayParamList.Sort;
    //生成需要签名的串
    Result:=APayParamList.GetQueryParamsStr(False);


  finally
    FreeAndNil(APayParamList);
  end;

end;


//function GetMimeType(AContent:TStream):String;
//var
//  Suffic:array [0..2] of AnsiChar;
//begin
//  AContent.Position:=0;
//  AContent.Read(Suffic,3);
//  AContent.Position:=0;
//  if Suffic='BMP' then
//  begin
//    Result:='image/bmp';
//  end
//  else if Suffic='GIF' then
//  begin
//    Result:='image/gif';
//  end
//  else if Suffic='PNG' then
//  begin
//    Result:='image/png';
//  end
//  else if Suffic='JPG' then
//  begin
//    Result:='image/jpeg';
//  end
//  else
//  begin
//    Result:='application/octet-stream';
//  end;
//end;
//
//function GetMimeType(AFileName:String):String;
//var
//  LowerCaseFileExt:String;
//begin
//  LowerCaseFileExt:=LowerCase(ExtractFileExt(AFileName));
//  if LowerCaseFileExt='.bmp' then
//  begin
//    result:='image/bmp';
//  end
//  else if LowerCaseFileExt='.gif' then
//  begin
//    result:='image/gif';
//  end
//  else if (LowerCaseFileExt='.jpg') or (LowerCaseFileExt='.jpeg') then
//  begin
//    result:='image/jpeg';
//  end
//  else if LowerCaseFileExt='.png' then
//  begin
//    result:='image/png';
//  end
//  else
//  begin
//  result:='application/octet-stream';
//  end;
//end;

function ParseUrlQueryParameters(URL:String;HasWWW:Boolean):TInterfaceParameters;
var
  I: Integer;
  AName,AValue:String;
  AEqualCharIndex:Integer;
  AParamStrList:TStringList;
  AParametersString:String;
  AParametersStringStartIndex:Integer;
begin
  Result:=TInterfaceParameters.Create;
  if HasWWW then
  begin
    //解析出参数列表字符串
    AParametersStringStartIndex:=Pos('?',URL);
    AParametersString:=Copy(URL,AParametersStringStartIndex+1,MaxInt);
  end
  else
  begin
    AParametersString:=URL;
  end;

  if AParametersString<>'' then
  begin
    //找到参数列表字符串
    AParamStrList:=TStringList.Create;
    Try
      AParamStrList.Delimiter:='&';
      AParamStrList.DelimitedText:=AParametersString;
      for I := 0 to AParamStrList.Count-1 do
      begin
        if (AParamStrList[I]<>'') then
        begin
          AEqualCharIndex:=Pos('=',AParamStrList[I]);
          if AEqualCharIndex>0 then
          begin
            AName:=Copy(AParamStrList[I],1,AEqualCharIndex-1);
            AValue:=Copy(AParamStrList[I],AEqualCharIndex+1,Length(AParamStrList[I])-AEqualCharIndex);
            Result.AddQueryParameter(AName,AValue);
          end;
        end;
      end;
    Finally
      AParamStrList.Free;
    End;
  end;

end;


{ TInterfaceParameter }

constructor TInterfaceParameter.Create(const AName:String;const AValue:String);
begin
  FName:=AName;
  FValue:=AValue;
end;

destructor TInterfaceParameter.Destroy;
begin
  inherited;
end;

{ TInterfaceParameters }

function TInterfaceParameters.GetQueryParamsStr(
                              HasRefChar:Boolean=True;//是否需要引号
                              NeedUrlEncode:Boolean=False;//是否需要UrlEncode
                              SpaceCharReplace:String='20%'
                              ): String;
var
  I:Integer;
  ValueStr:String;
begin
  Result:='';
  for I := 0 to Count-1 do
  begin
    ValueStr:=Items[I].Value;
    if ValueStr<>'' then
    begin

      if NeedUrlEncode then
      begin
        ValueStr:=FuncUrlEncode(ValueStr,SpaceCharReplace);
      end;

      if HasRefChar then
      begin
        ValueStr:='"'+ValueStr+'"';
      end;


      Result:=Result+Items[I].Name+'='+ValueStr;

      if I<Count-1 then
      begin
        Result:=Result+'&';
      end;
    end;
  end;
end;

procedure TInterfaceParameters.AddQueryParameter(const AName: String;const AValue: String);
begin
  Self.Add(TInterfaceParameter.Create(AName,AValue));
end;

function TInterfaceParameters.FindItemByName(AName: String): TInterfaceParameter;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count - 1 do
  begin
    if Items[I].Name=AName then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TInterfaceParameters.GetItem(Index: Integer): TInterfaceParameter;
begin
  Result:=TInterfaceParameter(Inherited Items[Index]);
end;

function TInterfaceParameters.GetXMLPackage: String;
var
  I:Integer;
  ValueStr:String;
begin
  Result:='<xml>'+#13#10;
  for I := 0 to Count-1 do
  begin
    ValueStr:=Items[I].Value;
    //if ValueStr<>'' then
//    begin
      Result:=Result+'<'+Items[I].Name+'>'+ValueStr+'</'+Items[I].Name+'>'+#13#10;
//    end;
  end;
  Result:=Result+'</xml>';
end;

function TInterfaceParameters.ItemValueByName(AName: String): String;
var
  AInterfaceParameter:TInterfaceParameter;
begin
  AInterfaceParameter:=Self.FindItemByName(AName);
  if AInterfaceParameter<>nil then
  begin
    Result:=AInterfaceParameter.Value;
  end
  else
  begin
    Result:='';
  end;
end;

//function TInterfaceParameters.GetSignQueryParamsStr: String;
//var
//  I:Integer;
//  ValueStr:String;
//begin
//  Result:='';
//  for I := 0 to Count-1 do
//  begin
//    ValueStr:=Items[I].Value;
//    //if ValueStr<>'' then
////    begin
//      Result:=Result+Items[I].Name+ValueStr;
////    end;
//  end;
//end;

function SortByName_Compare(Item1, Item2: Pointer): Integer;
var
  Param1,Param2:TInterfaceParameter;
begin
  Param1:=TInterfaceParameter(Item1);
  Param2:=TInterfaceParameter(Item2);
  if Param1.FName>Param2.FName then
  begin
    Result:=1;
  end
  else if Param1.FName<Param2.FName then
  begin
    Result:=-1;
  end
  else
  begin
    Result:=0;
  end;
end;

procedure TInterfaceParameters.Sort;
begin
  FItems.Sort(SortByName_Compare);
end;


end.

