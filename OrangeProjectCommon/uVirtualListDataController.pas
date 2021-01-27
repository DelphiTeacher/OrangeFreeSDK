//convert pas to utf8 by ¥
unit uVirtualListDataController;

interface

uses
  Classes,
  System.Types,
  StrUtils,
  Math,
  System.IOUtils,


  FMX.Types,
  uSkinItems,
  IdURI,
  EncdDecd,
  uBaseLog,
  uTimerTask,
  uSkinCommonFrames,
  uTimerTaskEvent,
  uComponentType,
  uBasePageStructure,
  uSkinVirtualListType,
  uRestInterfaceCall,
  uSkinItemJsonHelper,
//  uPayPublic,
//  uAppCommon,


  XSuperObject,
  XSuperJson,


  uDataInterface,

  uBaseHttpControl,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,


  {$IFDEF MSWINDOWS}
  WinApi.Windows,
  {$ENDIF}
  {$IFDEF ANDROID}
  Androidapi.IOUtils,
  {$ENDIF}
  {$IFDEF _MACOS}
  Macapi.Mach,
  {$ENDIF}

  SysUtils;


type













  TListDataController=class
  public
    //Json数据数组的键,一般为RecordList
    DataJsonArrayKey:String;
    //调用接口,将数据保存到TimerTask.TaskDesc
    OnGetListData:TTimerTaskNotify;
    //数据加载到界面后的事件
    OnLoadDataToUIEnd:TNotifyEvent;

    tteGetData: TTimerTaskEvent;


    //标题与数据绑定的设置
    FieldControlSettingList:TFieldControlSettingList;
    //列表显示控件
    ListControl:TSkinVirtualList;
    ParentControl:TFmxObject;

    //是否需要插入第一个空的列表项
    IsNeedInsertFirstEmptyItem:Boolean;
  protected
    procedure tteGetDataBegin(ATimerTask: TTimerTask);virtual;
    procedure tteGetDataExecute(ATimerTask: TTimerTask);virtual;
    procedure tteGetDataExecuteEnd(ATimerTask: TTimerTask);virtual;
  public
    constructor Create(AOwner:TComponent);
    destructor Destroy;override;
  public
    procedure GetData(AParentControl:TFmxObject;
                      AListControl:TSkinVirtualList;
                      //获取Json数据的过程
                      AOnGetDataEvent:TTimerTaskNotify;
                      //加载数据到界面结束事件
                      AOnOnLoadDataToUIEnd:TNotifyEvent;
                      //Json数据中列表的Key
                      ADataJsonArrayKey:String;
                      //列表项的样式
                      AItemStyle:String='';
                      AIsNeedInsertFirstEmptyItem:Boolean=False);
  end;




  //列表项数据绑定
  TSkinItemDataBinding=class(TComponent)
  private
    FItemType: TSkinItemType;

    FItemCaptionFieldControl: TFieldControlSetting;
    FItemIconFieldControl: TFieldControlSetting;
    FItemPicFieldControl: TFieldControlSetting;
    FItemSelectedFieldControl: TFieldControlSetting;
    FItemCheckedFieldControl: TFieldControlSetting;
    FItemExpanededFieldControl: TFieldControlSetting;

    FItemDetailFieldControl: TFieldControlSetting;
    FItemDetail1FieldControl: TFieldControlSetting;
    FItemDetail2FieldControl: TFieldControlSetting;
    FItemDetail3FieldControl: TFieldControlSetting;
    FItemDetail4FieldControl: TFieldControlSetting;
    FItemDetail5FieldControl: TFieldControlSetting;
    FItemDetail6FieldControl: TFieldControlSetting;
    //标题与数据绑定的设置(用于自定义组件)
    FieldControlSettingList:TFieldControlSettingList;

    function GetItemCaptionField: String;
    function GetItemCheckedField: String;
    function GetItemDetail1Field: String;
    function GetItemDetail2Field: String;
    function GetItemDetail3Field: String;
    function GetItemDetail4Field: String;
    function GetItemDetail5Field: String;
    function GetItemDetail6Field: String;
    function GetItemDetailField: String;
    function GetItemExpanededField: String;
    function GetItemIconField: String;
    function GetItemPicField: String;
    function GetItemSelectedField: String;
    procedure SetItemCaptionField(const Value: String);
    procedure SetItemCheckedField(const Value: String);
    procedure SetItemDetail1Field(const Value: String);
    procedure SetItemDetail2Field(const Value: String);
    procedure SetItemDetail3Field(const Value: String);
    procedure SetItemDetail4Field(const Value: String);
    procedure SetItemDetail5Field(const Value: String);
    procedure SetItemDetail6Field(const Value: String);
    procedure SetItemDetailField(const Value: String);
    procedure SetItemExpanededField(const Value: String);
    procedure SetItemIconField(const Value: String);
    procedure SetItemPicField(const Value: String);
    procedure SetItemSelectedField(const Value: String);
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
  published
    //适用于什么类型的列表项
    property ItemType:TSkinItemType read FItemType write FItemType;

    property ItemCaptionField:String read GetItemCaptionField write SetItemCaptionField;
    property ItemIconField:String read GetItemIconField write SetItemIconField;
    property ItemCheckedField:String read GetItemCheckedField write SetItemCheckedField;
    property ItemSelectedField:String read GetItemSelectedField write SetItemSelectedField;
    property ItemExpanededField:String read GetItemExpanededField write SetItemExpanededField;
    property ItemPicField:String read GetItemPicField write SetItemPicField;

    property ItemDetailField:String read GetItemDetailField write SetItemDetailField;
    property ItemDetail1Field:String read GetItemDetail1Field write SetItemDetail1Field;
    property ItemDetail2Field:String read GetItemDetail2Field write SetItemDetail2Field;
    property ItemDetail3Field:String read GetItemDetail3Field write SetItemDetail3Field;
    property ItemDetail4Field:String read GetItemDetail4Field write SetItemDetail4Field;
    property ItemDetail5Field:String read GetItemDetail5Field write SetItemDetail5Field;
    property ItemDetail6Field:String read GetItemDetail6Field write SetItemDetail6Field;
  end;







  TGetListDataEvent=procedure(AListData:TDataIntfResult;
                              var AIsSucc:Boolean) of object;
  //列表框数据控制器
  TListBoxDataController=class(TComponent)
  public
    //默认风格下,标题与数据绑定的设置
    FDefaultItemDataBinding:TSkinItemDataBinding;

    //列表控件
    ListControl:TSkinVirtualList;

    FOnLoadDataToUIEnd: TNotifyEvent;
    FDataJsonArrayKey: String;
    FOnGetListData: TGetListDataEvent;
    FDefaultItemStyle: String;
  protected
    procedure tteGetDataExecute(ATimerTask: TObject);virtual;
    procedure tteGetDataExecuteEnd(ATimerTask: TObject);virtual;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    procedure ShowList(AListControl:TSkinVirtualList);
  published
    //默认的列表项风格
    property DefaultItemStyle:String read FDefaultItemStyle write FDefaultItemStyle;
    //Json数组的键名
    property DataJsonArrayKey:String read FDataJsonArrayKey write FDataJsonArrayKey;
    //调用接口的事件
    property OnGetListData:TGetListDataEvent read FOnGetListData write FOnGetListData;
    //加载数据到界面上的事件
    property OnLoadDataToUIEnd:TNotifyEvent read FOnLoadDataToUIEnd write FOnLoadDataToUIEnd;
  end;




//将Json数组中的数据添加到Items
function LoadDataJsonArrayToItems(
          ADataJsonArray:ISuperArray;
          ADataJsonArrayKey:String;
          ASkinItems:TSkinItems;
          AFieldControlSettingList:TFieldControlSettingList;
          //是否需要插入第一个空的列表项
          AIsNeedInsertFirstEmptyItem:Boolean=False):Boolean;
//根据FieldControlSettingList给Item赋值
function LoadDataJsonToSkinItem(
          ADataJson:ISuperObject;
          ASkinItem:TSkinItem;
          AFieldControlSettingList:TFieldControlSettingList):Boolean;overload;
//根据FieldControlSetting给Item的属性赋值
function LoadDataJsonToSkinItemProp(
          ADataJson:ISuperObject;
          ASkinItem:TSkinItem;
          AFieldControlSetting:TFieldControlSetting): Boolean;




//procedure Register;


implementation


//procedure Register;
//begin
//  RegisterComponents('OrangeUIPageFramework',[TListDataController]);
//end;




function LoadDataJsonArrayToItems(
          ADataJsonArray:ISuperArray;
          ADataJsonArrayKey:String;
          ASkinItems:TSkinItems;
          AFieldControlSettingList:TFieldControlSettingList;
          //是否需要插入第一个空的列表项
          AIsNeedInsertFirstEmptyItem:Boolean):Boolean;
var
  I: Integer;
  ASkinItem:TSkinItem;
begin
  Result:=False;


  if AIsNeedInsertFirstEmptyItem then
  begin
    //添加一个空的Item
    ASkinItems.Add;
  end;



  for I := 0 to ADataJsonArray.Length-1 do
  begin
      ASkinItem:=TSkinItem(ASkinItems.Add);
      if Not LoadDataJsonToSkinItem(
                                   ADataJsonArray.O[I],
                                   ASkinItem,
                                   AFieldControlSettingList) then
      begin
        //加载数据失败
        Exit;
      end;


      //wn{ TODO : 要转成TBase }
      //如果有子节点,并且是树型控件,那么加载子列表
//      if (ASkinItems is TSkinTreeViewItems)
      if (ASkinItems is TBaseSkinTreeViewItems)
        and ADataJsonArray.O[I].Contains('SubRecordList')
        and (ADataJsonArray.O[I].A['SubRecordList'].Length>0) then
      begin
          if not LoadDataJsonArrayToItems(ADataJsonArray.O[I].A['SubRecordList'],
                                          'SubRecordList',
//                                          TSkinTreeViewItem(ASkinItem).Childs,
                                          TBaseSkinTreeViewItem(ASkinItem).Childs,
                                          AFieldControlSettingList,
                                          False
                                          ) then
          begin
            //加载数据失败
            Exit;
          end;
      end;

  end;

  Result:=True;
end;


function LoadDataJsonToSkinItem(
    ADataJson:ISuperObject;
    ASkinItem:TSkinItem;
    AFieldControlSettingList:TFieldControlSettingList):Boolean;
var
  I: Integer;
begin
  Result:=True;

  //Json数据保存到DataJsonStr
  ASkinItem.DataJsonStr:=ADataJson.AsJSON;
  ASkinItem.CreateOwnDataObject(TSkinItemJsonObject);
  GetItemJsonObject(ASkinItem).Json:=ADataJson;

  for I := 0 to AFieldControlSettingList.Count-1 do
  begin
    if not LoadDataJsonToSkinItemProp(
              ADataJson,
              ASkinItem,
              AFieldControlSettingList[I]) then
    begin
      Exit;
    end;
  end;
  Result:=True;
end;

function LoadDataJsonToSkinItemProp(
    ADataJson:ISuperObject;
    ASkinItem:TSkinItem;
    AFieldControlSetting:TFieldControlSetting):Boolean;
begin
  Result:=True;

  if AFieldControlSetting.field_name<>'' then
  begin
      ASkinItem.SetValueByBindItemField(AFieldControlSetting.bind_listitem_data_type,ADataJson.V[AFieldControlSetting.field_name]);
//      if ADataJson.Contains(AFieldControlSetting.FieldName) then
//      begin
//          //给Item的属性赋值
//          SetItemValueByItemDataType(
//              ASkinItem,
//              GetItemDataType(AFieldControlSetting.bind_listitem_data_type),
//              AFieldControlSetting.BindSubItemsIndex,
//              ADataJson.V[AFieldControlSetting.FieldName]
//              );
//      end
//      else
//      begin
//          HandleException(nil,'LoadDataJsonToSkinItemProp ADataJson中不存在'+AFieldControlSetting.FieldName);
//          Exit;
//      end;
  end;

  Result:=True;
end;



{ TListDataController }


constructor TListDataController.Create(AOwner: TComponent);
begin

  FieldControlSettingList:=TFieldControlSettingList.Create;

  tteGetData:=TTimerTaskEvent.Create(nil);
  tteGetData.OnBegin:=tteGetDataBegin;
  tteGetData.OnExecute:=tteGetDataExecute;
  tteGetData.OnExecuteEnd:=tteGetDataExecuteEnd;
end;

destructor TListDataController.Destroy;
begin
  FreeAndNil(tteGetData);
  FreeAndNil(FieldControlSettingList);

  inherited;
end;

procedure TListDataController.GetData(
  AParentControl:TFmxObject;
  AListControl: TSkinVirtualList;
  AOnGetDataEvent: TTimerTaskNotify;
  AOnOnLoadDataToUIEnd:TNotifyEvent;
  ADataJsonArrayKey,
  AItemStyle: String;
  AIsNeedInsertFirstEmptyItem:Boolean);
begin
  ParentControl:=AParentControl;

  ListControl:=AListControl;
  //设置默认的列表项风格
  ListControl.Prop.DefaultItemStyle:=AItemStyle;


  //数据列表在DataJson中的哪个Key
  DataJsonArrayKey:=ADataJsonArrayKey;
  //获取数据的方法
  OnGetListData:=AOnGetDataEvent;

  OnLoadDataToUIEnd:=AOnOnLoadDataToUIEnd;

  IsNeedInsertFirstEmptyItem:=AIsNeedInsertFirstEmptyItem;



  //启动获取数据的线程
  Self.tteGetData.Run;

end;

procedure TListDataController.tteGetDataBegin(ATimerTask: TTimerTask);
begin
  GlobalShowWaiting(ParentControl,'加载中...');
end;

procedure TListDataController.tteGetDataExecute(ATimerTask: TTimerTask);
begin
  if Assigned(OnGetListData) then
  begin
    OnGetListData(ATimerTask);
  end;

end;

procedure TListDataController.tteGetDataExecuteEnd(ATimerTask: TTimerTask);
var
  ASuperObject:ISuperObject;
  ADataJson:ISuperObject;
  AListData:TDataIntfResult;
begin
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin


        //如果Json数据已经解析在了ATimerTask.TaskObject,那么不需要再解析了
        if (ATimerTask.TaskObject<>nil)
          and (ATimerTask.TaskObject is TDataIntfResult) then
        begin
            AListData:=TDataIntfResult(ATimerTask.TaskObject);
            try
                if AListData.Succ then
                begin
                  ADataJson:=AListData.DataJson;
                end
                else
                begin
                  GlobalShowMessageBox(ParentControl,AListData.Desc,'');//,TMsgDlgType.mtInformation,['确定'],nil);
                  Exit;
                end;
            finally
              FreeAndNil(AListData);
            end;

        end
        else
        begin
            //尚未解析
            ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
            if (ASuperObject.I['Code']=200) then
            begin

                if ASuperObject.Contains('Data')
                  and ASuperObject.O['Data'].Contains(DataJsonArrayKey) then
                begin
                    ADataJson:=ASuperObject.O['Data'];
                end
                else
                begin
                    GlobalShowMessageBox(ParentControl,'返回的数据格式不匹配!','');//,TMsgDlgType.mtInformation,['确定'],nil);
                    Exit;
                end;

            end
            else
            begin
                //获取列表失败
                GlobalShowMessageBox(ParentControl,ASuperObject.S['Desc'],'');//,TMsgDlgType.mtInformation,['确定'],nil);
                Exit;
            end;
        end;



        //加载数据
        Self.ListControl.Prop.Items.BeginUpdate;
        try
          LoadDataJsonArrayToItems(
                                  ADataJson.A[DataJsonArrayKey],
                                  DataJsonArrayKey,
                                  Self.ListControl.Prop.Items,
                                  Self.FieldControlSettingList,
                                  IsNeedInsertFirstEmptyItem
                                  );
        finally
          Self.ListControl.Prop.Items.EndUpdate;
        end;

        //设置弹出框的高度
        if Assigned(Self.OnLoadDataToUIEnd) then
        begin
          OnLoadDataToUIEnd(Self);
        end;



    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      GlobalShowMessageBox(ParentControl,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc);//,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
    GlobalHideWaiting;
  end;

end;


{ TListBoxDataController }


constructor TListBoxDataController.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);
  FDefaultItemDataBinding:=TSkinItemDataBinding.Create(nil);
end;

destructor TListBoxDataController.Destroy;
begin
  FreeAndNil(FDefaultItemDataBinding);

  inherited;
end;

procedure TListBoxDataController.ShowList(
  AListControl: TSkinVirtualList
  );
begin

  ListControl:=AListControl;


  //设置列表项的风格
  ListControl.Prop.DefaultItemStyle:=Self.DefaultItemStyle;


  //启动获取数据的线程
  GetGlobalTimerThread.RunTempTask(
      Self.tteGetDataExecute,
      Self.tteGetDataExecuteEnd,
      'GetData'
      );

end;

procedure TListBoxDataController.tteGetDataExecute(ATimerTask: TObject);
var
  AListData:TDataIntfResult;
  AIsSucc:Boolean;
begin
  TThread.Synchronize(nil,procedure
  begin
    GlobalShowWaiting(nil,'加载中...');
  end);

  AIsSucc:=False;
  TTimerTask(ATimerTask).TaskTag:=TASK_FAIL;
  TTimerTask(ATimerTask).TaskDesc:='网络异常,请检查您的网络连接!';

  if Assigned(OnGetListData) then
  begin

      try
        AListData:=TDataIntfResult.Create;
        TTimerTask(ATimerTask).TaskObject:=AListData;

        OnGetListData(AListData,AIsSucc);

        TTimerTask(ATimerTask).TaskDesc:=AListData.Desc;
        if AIsSucc then
        begin
          //调用成功
          TTimerTask(ATimerTask).TaskTag:=TASK_SUCC;
        end;
      except
        on E:Exception do
        begin
          TTimerTask(ATimerTask).TaskDesc:=E.Message;
          uBaseLog.HandleException(E,'TListBoxDataController.tteGetDataExecute');
        end;
      end;

  end;
end;

procedure TListBoxDataController.tteGetDataExecuteEnd(ATimerTask: TObject);
var
  AListData:TDataIntfResult;
begin
  AListData:=TDataIntfResult(TTimerTask(ATimerTask).TaskObject);
  try

    if TTimerTask(ATimerTask).TaskTag=TASK_SUCC then
    begin
        //调用成功
        case AListData.DataType of
          ldtJson:
          begin

                if (AListData.DataJson<>nil)
                  and AListData.DataJson.Contains(DataJsonArrayKey) then
                begin
                    Self.ListControl.Prop.Items.BeginUpdate;
                    try
                      LoadDataJsonArrayToItems(
                          AListData.DataJson.A[DataJsonArrayKey],
                          DataJsonArrayKey,
                          Self.ListControl.Prop.Items,
                          Self.FDefaultItemDataBinding.FieldControlSettingList
                          );
                    finally
                      Self.ListControl.Prop.Items.EndUpdate;
                    end;

                    //设置弹出框的高度
                    if Assigned(Self.OnLoadDataToUIEnd) then
                    begin
                      OnLoadDataToUIEnd(Self);
                    end;

                end
                else
                begin
                    GlobalShowMessageBox(nil,'返回的数据格式不匹配!','');
                end;

          end
          else
          begin
            GlobalShowMessageBox(nil,'请指定数据格式类型AListData.DataType','');
          end;
        end;


    end
    else //if TTimerTask(ATimerTask).TaskTag=TASK_FAIL then
    begin
        //网络异常
        GlobalShowMessageBox(nil,TTimerTask(ATimerTask).TaskDesc,'');//,TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
    FreeAndNil(AListData);
    GlobalHideWaiting;
  end;

end;







{ TSkinItemDataBinding }

constructor TSkinItemDataBinding.Create(AOwner: TComponent);
begin
  inherited;
  FieldControlSettingList:=TFieldControlSettingList.Create();

  FItemCaptionFieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemCaptionFieldControl.bind_listitem_data_type:='ItemCaption';
  FItemIconFieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemIconFieldControl.bind_listitem_data_type:='ItemIcon';
  FItemPicFieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemPicFieldControl.bind_listitem_data_type:='ItemPic';
  FItemSelectedFieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemSelectedFieldControl.bind_listitem_data_type:='ItemSelected';
  FItemCheckedFieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemCheckedFieldControl.bind_listitem_data_type:='ItemChecked';
  FItemExpanededFieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemExpanededFieldControl.bind_listitem_data_type:='ItemExpaned';

  FItemDetailFieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemDetailFieldControl.bind_listitem_data_type:='ItemDetail';
  FItemDetail1FieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemDetail1FieldControl.bind_listitem_data_type:='ItemDetail1';
  FItemDetail2FieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemDetail2FieldControl.bind_listitem_data_type:='ItemDetail2';
  FItemDetail3FieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemDetail3FieldControl.bind_listitem_data_type:='ItemDetail3';
  FItemDetail4FieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemDetail4FieldControl.bind_listitem_data_type:='ItemDetail4';
  FItemDetail5FieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemDetail5FieldControl.bind_listitem_data_type:='ItemDetail5';
  FItemDetail6FieldControl:=TFieldControlSetting(FieldControlSettingList.Add);
  FItemDetail6FieldControl.bind_listitem_data_type:='ItemDetail6';


end;

destructor TSkinItemDataBinding.Destroy;
begin
  FreeAndNil(FieldControlSettingList);
  inherited;
end;

function TSkinItemDataBinding.GetItemCaptionField: String;
begin
  Result:=FItemCaptionFieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemCheckedField: String;
begin
  Result:=FItemCheckedFieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemDetail1Field: String;
begin
  Result:=FItemDetail1FieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemDetail2Field: String;
begin
  Result:=FItemDetail2FieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemDetail3Field: String;
begin
  Result:=FItemDetail3FieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemDetail4Field: String;
begin
  Result:=FItemDetail4FieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemDetail5Field: String;
begin
  Result:=FItemDetail5FieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemDetail6Field: String;
begin
  Result:=FItemDetail6FieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemDetailField: String;
begin
  Result:=FItemDetailFieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemExpanededField: String;
begin
  Result:=FItemExpanededFieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemIconField: String;
begin
  Result:=FItemIconFieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemPicField: String;
begin
  Result:=FItemPicFieldControl.field_name;
end;

function TSkinItemDataBinding.GetItemSelectedField: String;
begin
  Result:=FItemSelectedFieldControl.field_name;
end;

procedure TSkinItemDataBinding.SetItemCaptionField(const Value: String);
begin
  FItemCaptionFieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemCheckedField(const Value: String);
begin
  FItemCheckedFieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemDetail1Field(const Value: String);
begin
  FItemDetail1FieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemDetail2Field(const Value: String);
begin
  FItemDetail2FieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemDetail3Field(const Value: String);
begin
  FItemDetail3FieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemDetail4Field(const Value: String);
begin
  FItemDetail4FieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemDetail5Field(const Value: String);
begin
  FItemDetail5FieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemDetail6Field(const Value: String);
begin
  FItemDetail6FieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemDetailField(const Value: String);
begin
  FItemDetailFieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemExpanededField(const Value: String);
begin
  FItemExpanededFieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemIconField(const Value: String);
begin
  FItemIconFieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemPicField(const Value: String);
begin
  FItemPicFieldControl.field_name:=Value;
end;

procedure TSkinItemDataBinding.SetItemSelectedField(const Value: String);
begin
  FItemSelectedFieldControl.field_name:=Value;
end;


end.
