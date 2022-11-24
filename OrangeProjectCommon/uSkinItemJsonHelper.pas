//convert pas to utf8 by ¥
unit uSkinItemJsonHelper;

interface


uses
  SysUtils,
  Classes,

  {$IFDEF VCL}
  Graphics,
  {$ENDIF}
//  FMX.Controls,
  Types,
  uSkinItems,
  Variants,
  uBinaryTreeDoc,
  uGraphicCommon,
  uSkinListLayouts,
  uSkinVirtualListType,
//  uSkinListViewType,

  {$IF CompilerVersion <= 21.0} // XE or older
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

  uSkinScrollControlType;




type
  TSkinItemJsonObject=class
  public
    Json:ISuperObject;
//    Json2:ISuperObject;

    JsonArray:ISuperArray;
//    JsonArray2:ISuperArray;
    procedure Clear;
  end;


  TSkinItemClassHelper=class helper for TSkinItem
  private
    function GetJson: ISuperObject;
    procedure SetJson(const Value: ISuperObject);

    function CreateJsonObject:TSkinItemJsonObject;
    function JsonObject:TSkinItemJsonObject;
  public
    property Json:ISuperObject read GetJson write SetJson;
  end;




  //Json列表项
  TJsonSkinItem=class(TSkinItem)
  private
    FJsonStr:String;
    FJson: ISuperObject;
//    function GetJsonStr: String;
    procedure SetJsonStr(const Value: String);
    procedure SetJson(const Value: ISuperObject);
  protected
    procedure AssignTo(Dest: TPersistent); override;


    /// <summary>
    ///   <para>
    ///     从文档节点中加载
    ///   </para>
    ///   <para>
    ///     Load from document node
    ///   </para>
    /// </summary>
    function LoadFromDocNode(ADocNode:TBTNode20_Class):Boolean;override;

    /// <summary>
    ///   <para>
    ///     保存到文档节点
    ///   </para>
    ///   <para>
    ///     Save to document node
    ///   </para>
    /// </summary>
    function SaveToDocNode(ADocNode:TBTNode20_Class):Boolean;override;
  public
    function GetAccessory: TSkinAccessoryType;override;

    //根据绑定的FieldName获取Item的值,然后赋给绑定的控件
    function GetValueByBindItemField(AFieldName:String):Variant;override;
    procedure SetValueByBindItemField(AFieldName:String;AValue:Variant;APageDataDir:String='';AImageServerUrl:String='');override;
  public
    property Json:ISuperObject read FJson write SetJson;
  published
//    property JsonStr:String read GetJsonStr write SetJsonStr;
    //因为AsJson会将中文等编码,所以显示的时候还是保持原来的字符串
    property JsonStr:String read FJsonStr write SetJsonStr;
  end;






  TSkinJsonItem=class(TJsonSkinItem)
  end;





//  //表格行
//  TJsonSkinItemGridRow=class(TJsonSkinItem)
//  protected
//    //表格列的总宽度
//    function GetWidth: TControlSize;override;
//  end;


  TSkinJsonTreeViewItem=class(TBaseSkinTreeViewItem)
  private
    FJson: ISuperObject;
  public
    //根据绑定的FieldName获取Item的值,然后赋给绑定的控件
    function GetValueByBindItemField(AFieldName:String):Variant;override;
  public
    property Json:ISuperObject read FJson write FJson;
  end;


//  TSkinJsonListBoxItem=TJsonSkinItem;
//  TSkinJsonListViewItem=TJsonSkinItem;




function GetItemJson(AItem:TSkinItem):ISuperObject;
function GetItemJsonObject(AItem:TSkinItem):TSkinItemJsonObject;

//将Json数组加载到列表项数组
procedure LoadJsonArrayStrToSkinItems(AJsonArrayStr:String;
                                      ASkinItems:TSkinItems;
                                      AStartIndex:Integer;
                                      const AIsNeedClear:Boolean=True);overload;
procedure LoadJsonArrayStrToSkinItems(AJsonArray:ISuperArray;
                                      ASkinItems:TSkinItems;
                                      AStartIndex:Integer;
                                      const AIsNeedClear:Boolean=True);overload;


implementation


procedure LoadJsonArrayStrToSkinItems(AJsonArray:ISuperArray;
                                      ASkinItems:TSkinItems;
                                      AStartIndex:Integer;
                                      const AIsNeedClear:Boolean=True);overload;
var
  ASkinJsonItem:TJsonSkinItem;
  I: Integer;
begin
  ASkinItems.BeginUpdate;
  try
    if AIsNeedClear then ASkinItems.Clear();

    for I := AStartIndex to AJsonArray.Length-1 do
    begin
        ASkinJsonItem:=TJsonSkinItem.Create;
        ASkinJsonItem.Json:=AJsonArray.O[I];
        ASkinItems.Add(ASkinJsonItem);
    end;
  finally
    ASkinItems.EndUpdate();
  end;
end;

procedure LoadJsonArrayStrToSkinItems(AJsonArrayStr:String;
                                      ASkinItems:TSkinItems;
                                      AStartIndex:Integer;
                                      const AIsNeedClear:Boolean=True);overload;
var
  AJsonArray:ISuperArray;
begin
  AJsonArray:=TSuperArray.Create(AJsonArrayStr);
  LoadJsonArrayStrToSkinItems(AJsonArray,ASkinItems,AStartIndex,AIsNeedClear);
end;




function GetItemJson(AItem:TSkinItem):ISuperObject;
begin
  Result:=TSkinItemJsonObject(AItem.DataObject).Json;
end;

function GetItemJsonObject(AItem:TSkinItem):TSkinItemJsonObject;
begin
  Result:=TSkinItemJsonObject(AItem.DataObject);
end;


{ TSkinItemJsonObject }

procedure TSkinItemJsonObject.Clear;
begin
  Json:=nil;
end;



{ TSkinItemClassHelper }

function TSkinItemClassHelper.CreateJsonObject: TSkinItemJsonObject;
begin
  Result:=TSkinItemJsonObject(Self.CreateOwnDataObject(TSkinItemJsonObject));
end;

function TSkinItemClassHelper.GetJson: ISuperObject;
begin
  Result:=nil;
  if Self is TJsonSkinItem then
  begin
      //TSkinJsonItem自带有Json
      Result:=TSkinJsonItem(Self).Json;
  end
  else
  begin
      if Self.DataObject<>nil then
      begin
        Result:=JsonObject.Json;
      end;
  end;
end;

function TSkinItemClassHelper.JsonObject: TSkinItemJsonObject;
begin
  if Self.DataObject=nil then
  begin
    Self.CreateOwnDataObject(TSkinItemJsonObject);
  end;
  Result:=TSkinItemJsonObject(Self.DataObject);
end;

procedure TSkinItemClassHelper.SetJson(const Value: ISuperObject);
begin
  if Self is TJsonSkinItem then
  begin
      //TSkinJsonItem自带有Json
      TSkinJsonItem(Self).Json:=Value;
  end
  else
  begin
      if Self.DataObject=nil then
      begin
        Self.CreateOwnDataObject(TSkinItemJsonObject);
      end;
      JsonObject.Json:=Value;
  end;
  //需要刷新界面
  Self.IsBufferNeedChange:=True;
end;

{ TJsonSkinItem }

procedure TJsonSkinItem.AssignTo(Dest: TPersistent);
var
  DestObject:TJsonSkinItem;
begin
  if Dest is TJsonSkinItem then
  begin

    DestObject:=Dest as TJsonSkinItem;


    DestObject.FJson:=Self.FJson;
    DestObject.FJsonStr:=Self.FJsonStr;

    //inherited里面已经有了DestObject.DoPropChange;
    inherited;

  end
  else
  begin
    inherited;
  end;

end;

//function TJsonSkinItem.GetJsonStr: String;
//begin
//  Result:=FJsonStr;
////  Result:='';
////  if Self.FJson<>nil then
////  begin
////    Result:=FJson.AsJSON;
////  end;
//end;

function TJsonSkinItem.GetAccessory: TSkinAccessoryType;
begin
  Result:=TSkinAccessoryType.satNone;
end;

function TJsonSkinItem.GetValueByBindItemField(AFieldName: String): Variant;
//var
//  AIndex:Integer;
//  AParentFieldName:String;
begin
  if (FJson<>nil) and FJson.Contains(AFieldName) then
  begin
    //设计时不能直接返回值,要判断一下,不然IDE中要报错的,但速度应该会稍微变慢
    Result:=FJson.V[AFieldName];
  end
//  else if (FJson<>nil) and (AFieldName.IndexOf('.')>0) then
//  begin
//    AIndex:=AFieldName.IndexOf('.');
//    AParentFieldName:=AFieldName.Substring(0,AIndex);
//    AFieldName:=AFieldName.Substring(AIndex+1,MaxInt);
//    Result:=FJson.O[AParentFieldName].V[AFieldName];;
//  end
  else
  begin
    Result:=inherited GetValueByBindItemField(AFieldName);
  end;
end;

function TJsonSkinItem.LoadFromDocNode(ADocNode: TBTNode20_Class): Boolean;
var
  I: Integer;
  ABTNode:TBTNode20;
begin
  Result:=False;

  Inherited LoadFromDocNode(ADocNode);

  for I := 0 to ADocNode.ChildNodes.Count - 1 do
  begin
    ABTNode:=ADocNode.ChildNodes[I];

    if ABTNode.NodeName='JsonStr' then
    begin
      JsonStr:=ABTNode.ConvertNode_WideString.Data;
    end
    ;

  end;

  Result:=True;


end;

function TJsonSkinItem.SaveToDocNode(ADocNode: TBTNode20_Class): Boolean;
var
  ABTNode:TBTNode20;
begin
  Result:=False;

  Inherited SaveToDocNode(ADocNode);


  ABTNode:=ADocNode.AddChildNode_WideString('JsonStr');
  ABTNode.ConvertNode_WideString.Data:=JsonStr;

  ABTNode:=ADocNode.AddChildNode_WideString('ClassName');
  ABTNode.ConvertNode_WideString.Data:=ClassName;



  Result:=True;
end;

procedure TJsonSkinItem.SetJson(const Value: ISuperObject);
begin
  if FJson<>Value then
  begin
    FJson := Value;

    Self.DoPropChange;
  end;
end;

procedure TJsonSkinItem.SetJsonStr(const Value: String);
begin
//  if Self.FJsonStr<>Value then
//  begin
//      FJsonStr:=Value;
//
////      if GetJsonStr<>Value then
////      begin
//        FJson:=TSuperObject.Create(Value);
////      end;
//  end;

//  if GetJsonStr<>Value then
  if FJsonStr<>Value then
  begin
    FJsonStr:=Value;
    Json:=TSuperObject.Create(Value);
  end;
end;

procedure TJsonSkinItem.SetValueByBindItemField(AFieldName: String;
  AValue: Variant;APageDataDir:String;AImageServerUrl:String);
begin
  if (FJson<>nil) and Json.Contains(AFieldName) then
  begin
    FJson.V[AFieldName]:=AValue;
  end
  else
  begin
    inherited SetValueByBindItemField(AFieldName,AValue,APageDataDir,AImageServerUrl);
  end;

end;

{ TSkinJsonTreeViewItem }

function TSkinJsonTreeViewItem.GetValueByBindItemField(AFieldName: String): Variant;
begin
  if (FJson<>nil) and FJson.Contains(AFieldName) then
  begin
    //设计时不能直接返回值,要判断一下,不然IDE中要报错的,但速度应该会稍微变慢
    Result:=FJson.V[AFieldName];
  end
//  if FJson<>nil then
//  begin
//    try
//      Result:=FJson.V[AFieldName];
//    except
//
//    end;
//  end;
  else
  begin
    Result:=inherited GetValueByBindItemField(AFieldName);
  end;
end;

//{ TJsonSkinItemGridRow }
//
//function TJsonSkinItemGridRow.GetWidth: TControlSize;
//begin
//  Result:=Inherited;
//  if Self.GetListLayoutsManager<>nil then
//  begin
////    Result:=TScrollControlProperties(TSkinListLayoutsManager(GetListLayoutsManager).FProperties).CalcContentWidth;
//    Result:=TSkinListLayoutsManager(GetListLayoutsManager).CalcContentWidth;
//  end;
//end;


{ TSuperArray }



initialization
  RegisterSkinItemClass(TJsonSkinItem);
  //后面要去掉,统一用TJsonSkinItem,以便与TRealSkinItem对应上
  RegisterSkinItemClass(TSkinJsonItem);



end.

