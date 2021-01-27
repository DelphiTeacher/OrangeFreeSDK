unit uTaoBaoAPIParam;

interface

uses
  Windows,
  SysUtils,
  Classes,
  uTaoBaoPublic,
  uWorkThreadList;

type
  //请求的参数键值对
  TQueryParameter=class
  private
    FName:String;
    FValue:Variant;
  public
    constructor Create(const AName:String;const AValue:Variant);
    destructor Destroy;override;
  public
    property Name:String read FName write FName;
    property Value:Variant read FValue write FValue;
  end;

  //参数列表
  TQueryParameters=class(TWorkThreadList)
  private
    function GetItem(Index: Integer): TQueryParameter;
  public
    //需要按照名字顺序排序,如果名字相同,那要根据值来排序,生成的签名才是有用的
    procedure Sort;
    function GetUtf8UrlEncodeQueryParamsStr:String;
    function GetUtf8UrlEncodeQueryParamsStr1:String;
    function GetSignQueryParamsStr:String;
    //添加一对键值
    procedure AddQueryParameter(const AName:String;const AValue:Variant);
  public
    function FindItemByName(AName:String):TQueryParameter;
    property Items[Index:Integer]:TQueryParameter read GetItem;default;
  end;

function ParseUrlQueryParameters(URL:String;HasWWW:Boolean=True):TQueryParameters;

function GetMimeType(AFileName:String):String;overload;
function GetMimeType(AContent:TStream):String;overload;

implementation

function GetMimeType(AContent:TStream):String;
var
  Suffic:array [0..2] of AnsiChar;
begin
  AContent.Position:=0;
  AContent.Read(Suffic,3);
  AContent.Position:=0;
  if Suffic='BMP' then
  begin
    Result:='image/bmp';
  end
  else if Suffic='GIF' then
  begin
    Result:='image/gif';
  end
  else if Suffic='PNG' then
  begin
    Result:='image/png';
  end
  else if Suffic='JPG' then
  begin
    Result:='image/jpeg';
  end
  else
  begin
    Result:='application/octet-stream';
  end;
end;

function GetMimeType(AFileName:String):String;
var
  LowerCaseFileExt:String;
begin
  LowerCaseFileExt:=LowerCase(ExtractFileExt(AFileName));
  if LowerCaseFileExt='.bmp' then
  begin
    result:='image/bmp';
  end
  else if LowerCaseFileExt='.gif' then
  begin
    result:='image/gif';
  end
  else if (LowerCaseFileExt='.jpg') or (LowerCaseFileExt='.jpeg') then
  begin
    result:='image/jpeg';
  end
  else if LowerCaseFileExt='.png' then
  begin
    result:='image/png';
  end
  else
  begin
  result:='application/octet-stream';
  end;
end;

function ParseUrlQueryParameters(URL:String;HasWWW:Boolean):TQueryParameters;
var
  I: Integer;
  AName,AValue:String;
  AEqualCharIndex:Integer;
  AParamStrList:TStringList;
  AParametersString:String;
  AParametersStringStartIndex:Integer;
begin
  Result:=TQueryParameters.Create;
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


{ TQueryParameter }

constructor TQueryParameter.Create(const AName:String;const AValue:Variant);
begin
  FName:=AName;
  FValue:=AValue;
end;

destructor TQueryParameter.Destroy;
begin
  inherited;
end;

{ TQueryParameters }

function TQueryParameters.GetUtf8UrlEncodeQueryParamsStr: String;
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
      Result:=Result+Items[I].Name+'='+URLEncodeUTF8(UTF8Encode(ValueStr));
      if I<Count-1 then
      begin
        Result:=Result+'&';
      end;
    end;
  end;
end;

function TQueryParameters.GetUtf8UrlEncodeQueryParamsStr1: String;
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
      Result:=Result+Items[I].Name+'%3D'+URLEncode(URLEncodeUTF8(UTF8Encode(ValueStr)));
      if I<Count-1 then
      begin
        Result:=Result+'%26';
      end;
    end;
  end;
end;

procedure TQueryParameters.AddQueryParameter(const AName: String;const AValue: Variant);
begin
  Self.Add(TQueryParameter.Create(AName,AValue));
end;

function TQueryParameters.FindItemByName(AName: String): TQueryParameter;
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

function TQueryParameters.GetItem(Index: Integer): TQueryParameter;
begin
  Result:=TQueryParameter(Inherited Items[Index]);
end;

function TQueryParameters.GetSignQueryParamsStr: String;
var
  I:Integer;
  ValueStr:String;
begin
  Result:='';
  for I := 0 to Count-1 do
  begin
    ValueStr:=Items[I].Value;
    //if ValueStr<>'' then
    begin
      Result:=Result+Items[I].Name+ValueStr;
    end;
  end;
end;

function SortByName_Compare(Item1, Item2: Pointer): Integer;
var
  Param1,Param2:TQueryParameter;
begin
  Param1:=TQueryParameter(Item1);
  Param2:=TQueryParameter(Item2);
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

procedure TQueryParameters.Sort;
begin
  FItems.Sort(SortByName_Compare);
end;


end.

