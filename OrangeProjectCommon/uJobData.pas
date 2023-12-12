unit uJobData;

interface

uses
  SysUtils,
  Classes,
  uBaseList;


type
  //职位别名
  TJobAlias=class
    FName:String;
    //别名
    FAliases:TStringList;
    constructor Create;
    //在字符串中存在吗
    destructor Destroy;override;
    function ExistInStr(AStr:String):Boolean;
    function GetSQLWhere(AFieldName:String):String;
  end;

  TJobAliasList=class(TBaseList)
  private
    function GetItem(Index: Integer): TJobAlias;
  public
    function GetAliasList(AJobs:String):TStringList;
    function Find(AName:String):TJobAlias;
    property Items[Index:Integer]:TJobAlias read GetItem;default;
  end;



var
  //默认职位
  DEFAULT_JOBS:TStringList;
  KP_JOBS:TStringList;
  JobAlias_CEO:TJobAlias;
  JobAlias_owner:TJobAlias;
  JobAlias_purchase:TJobAlias;
  GlobalJobAliasList:TJobAliasList;



implementation



{ TJobAlias }

constructor TJobAlias.Create;
begin
  FAliases:=TStringList.Create;

end;

destructor TJobAlias.Destroy;
begin
  FreeAndNil(FAliases);
  inherited;
end;

function TJobAlias.ExistInStr(AStr: String): Boolean;
var
  I: Integer;
begin
  Result:=False;
  for I := 0 to Self.FAliases.Count-1 do
  begin
    if Pos(FAliases[I],AStr)>0 then
    begin
      Result:=True;
      Exit;
    end;
  end;
end;

function TJobAlias.GetSQLWhere(AFieldName: String): String;
var
  I: Integer;
begin
  Result:='';

  for I := 0 to Self.FAliases.Count-1 do
  begin
    if Result<>'' then
    begin
      Result:=Result+' OR ';
    end;
    Result:=Result+AFieldName+' LIKE '+QuotedStr('%'+FAliases[I]+'%')+' ';
  end;


end;

{ TJobAliasList }

function TJobAliasList.Find(AName: String): TJobAlias;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if Items[I].FName=AName then
    begin
      Result:=Items[I];
      Exit;
    end;
    
  end;
end;

function TJobAliasList.GetAliasList(AJobs: String): TStringList;
var
  AJobList:TStringList;
  AJobAlias:TJobAlias;
  I: Integer;
begin
  Result:=TStringList.Create;

  AJobList:=TStringList.Create;
  try
    AJobList.CommaText:=LowerCase(AJobs);
    for I := 0 to AJobList.Count-1 do
    begin
      AJobAlias:=Self.Find(AJobList[I]);
      if AJobAlias=nil then
      begin
        Result.Add(AJobList[I]);
        continue;
      end;
      Result.AddStrings(AJobAlias.FAliases);
    end;
  finally
    FreeAndNil(AJobList);
  end;

end;

function TJobAliasList.GetItem(Index: Integer): TJobAlias;
begin
  Result:=TJobAlias(Inherited Items[Index]);
end;



var
  AJobAlias:TJobAlias;

initialization
  DEFAULT_JOBS:=TStringList.Create;
  DEFAULT_JOBS.Add('CEO');
  DEFAULT_JOBS.Add('owner');
  DEFAULT_JOBS.Add('purchase');
  DEFAULT_JOBS.Add('buyer');
  DEFAULT_JOBS.Add('president');
  DEFAULT_JOBS.Add('director');
  DEFAULT_JOBS.Add('manager');


  //谷歌搜领英要搜索的KP职位
  KP_JOBS:=TStringList.Create;
  KP_JOBS.Add('CEO');
    KP_JOBS.Add('Boss');
    KP_JOBS.Add('owner');
  KP_JOBS.Add('VP');
  KP_JOBS.Add('President');
  KP_JOBS.Add('General Manager');
  KP_JOBS.Add('Buyer');

    KP_JOBS.Add('Purchase');

    KP_JOBS.Add('Vice President');

    KP_JOBS.Add('chief executive officer');

    KP_JOBS.Add('Purchasing Agent');
    KP_JOBS.Add('Purchasing Principal');
    KP_JOBS.Add('Purchasing Manager');
    KP_JOBS.Add('Purchasing Supervisor');
    KP_JOBS.Add('Purchasing coordinator');
    KP_JOBS.Add('Procurement');

//  KP_JOBS.Add('purchase');
//  KP_JOBS.Add('buyer');
//  KP_JOBS.Add('president');
//  KP_JOBS.Add('director');
//  KP_JOBS.Add('manager');




  GlobalJobAliasList:=TJobAliasList.Create;


  AJobAlias:=TJobAlias.Create;
  AJobAlias.FName:='ceo';
  AJobAlias.FAliases.Add('ceo');//要小写,省的转换
  AJobAlias.FAliases.Add('chief executive officer');//要小写,省的转换
  GlobalJobAliasList.Add(AJobAlias);
  JobAlias_CEO:=AJobAlias;


  AJobAlias:=TJobAlias.Create;
  AJobAlias.FName:='owner';
  AJobAlias.FAliases.Add('owner');
  GlobalJobAliasList.Add(AJobAlias);
  JobAlias_owner:=AJobAlias;


  AJobAlias:=TJobAlias.Create;
  AJobAlias.FName:='purchase';
  AJobAlias.FAliases.Add('purchase');
  GlobalJobAliasList.Add(AJobAlias);
  JobAlias_purchase:=AJobAlias;


  AJobAlias:=TJobAlias.Create;
  AJobAlias.FName:='buyer';
  AJobAlias.FAliases.Add('buyer');
  GlobalJobAliasList.Add(AJobAlias);

  AJobAlias:=TJobAlias.Create;
  AJobAlias.FName:='president';
  AJobAlias.FAliases.Add('president');
  GlobalJobAliasList.Add(AJobAlias);

  AJobAlias:=TJobAlias.Create;
  AJobAlias.FName:='director';
  AJobAlias.FAliases.Add('director');
  GlobalJobAliasList.Add(AJobAlias);

  AJobAlias:=TJobAlias.Create;
  AJobAlias.FName:='manager';
  AJobAlias.FAliases.Add('manager');
  GlobalJobAliasList.Add(AJobAlias);





finalization
  FreeAndNil(DEFAULT_JOBS);
  FreeAndNil(KP_JOBS);
  FreeAndNil(GlobalJobAliasList);




end.
