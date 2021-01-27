﻿//convert pas to utf8 by ¥
unit uDataInterface;

interface


uses
  Classes,
  SysUtils,
  uBaseLog,
  uBaseList,
  uLang,
  Types,
  Variants,
  DB,

  StrUtils,
  uRestInterfaceCall,

  uFuncCommon,


  XSuperObject,
  XSuperJson,

//  uFrameContext,

//  uSkinItems,


//  uDatabaseConfig,
//  uUniDBHelper,


//  uObjectPool,

  uFileCommon;



type
  TDataInterfaceClass=class of TDataInterface;




  //列表数据列类型
  TDataIntfResultType=(ldtNone,
                        //
                        ldtJson,
                        //列表
                        ldtSkinItems,

                        //单个SkinItem
                        ldtSkinItem);
//  TListData=class
//  public
//    DataType:TListDataType;
//    Code:Integer;
//    Desc:String;
//    DataJson:ISuperObject;
//  end;



  TDataIntfResult=class(TPersistent)
  public
    //返回的数据类型
    DataType:TDataIntfResultType;
    Succ:Boolean;

    Desc:String;
    DataJson:ISuperObject;

    //引用
    DataSkinItems:TObject;
    procedure Clear;

//    Code:Integer;
//    function LoadDataToSkinItem(TSkinItem:TBaseSkinItem):Boolean;virtual;
//    constructor Create;
//    destructor Destroy;override;
  end;



  //加载数据时的参数
  TLoadDataSetting=Record

    //加载列表时使用//
    PageIndex:Integer;
    PageSize:Integer;


    //tablecommonrest中的接口都要传这个,GetRecordList
    //GlobalMainProgramSetting.AppID
    AppID:Integer;


    //加载参数名和参数值
    LoadDataParamNames:TStringDynArray;
    LoadDataParamValues:TVariantDynArray;

  public
    //查询条件,Json数组
    WhereKeyJson:String;
//    //排序
//    OrderBy:String;
//    //自带的Where条件
//    CustomWhereSQL:String;
//    //是否需要总数
//    IsNeedSumCount:Integer;
//    //是否需要返回层级
//    IsNeedReturnLevel:Integer;
//    //接口参数
//    ParamRecordDataJsonStr:String;
    //是否需要返回子表数据
    IsNeedSubQueryList:Integer;
  public
    //查询记录时使用
    //GetRecord
    IsMustExist:Boolean;
//    IsNeedSubQueryList:Integer;

  public
    //接口类型为SkinItems时使用,Page的DataSkinItems属性
    //以便让接口支持设计时的静态列表项
    PageDataSkinItems:TObject;
  public
    //编辑和查看页面加载数据时使用
    //是否是添加记录模式
    IsAddRecord:Boolean;
    //是否删除了记录
    IsDelRecord:Boolean;
    //编辑或查看的数据,用于页面直接从它加载数据
    RecordDataJson:ISuperObject;

    CustomWhereKeyJson:String;
  public
    //从列表页面跳转过来的列表项,跳转到列表页面或编辑页面,
    //用于删除记录后从列表删除
    JumpFromSourceItem:TObject;
  public
    //从按钮或其他控件点击跳转到页面
    JumpFromControlMap:TObject;
  public
    procedure Clear;
  end;



  //保存数据时的参数
  TSaveDataSetting=Record
    //GlobalMainProgramSetting.AppID
    AppID:Integer;

    //当前编辑的记录FID
    EditingRecordFID:Integer;

    //接口返回是否新增了数据
    IsAddedRecord:Boolean;
    //保存的数据
    RecordDataJson:ISuperObject;
  public
    procedure Clear;
  end;






  TDataInterface=class(TPersistent)
  private
    FName: String;
    FCaption: String;
    FDesc: String;
//    FDataListOtherFieldNames: String;
    procedure SetFieldNameList(const Value: TStringList);
  protected
    //表的字段列表
    FFieldNameList:TStringList;
    FIsInited:Boolean;
    procedure SetIsInited(const Value: Boolean);virtual;
  public
    fid:Integer;
    appid:Integer;
    user_fid:String;
    program_template_fid:Integer;
    data_server_fid:Integer;
//    table_common_rest_name:String;
    intf_type:String;

    constructor Create;virtual;
    destructor Destroy;override;

    procedure AssignTo(Dest: TPersistent); override;

    //从json中加载
    function LoadFromJson(ASuperObject:ISuperObject):Boolean;
    //保存到Json中
    function SaveToJson(ASuperObject:ISuperObject):Boolean;

    //从json中加载
    function CustomLoadFromJson(ASuperObject:ISuperObject):Boolean;virtual;
    //保存到Json中
    function CustomSaveToJson(ASuperObject:ISuperObject):Boolean;virtual;

    property IntfType:String read intf_type write intf_type;
  public

    function IsEmpty:Boolean;virtual;
    //获取记录列表
    function GetDataList(
//                           AAppID:Integer;
//                           APageIndex:Integer;
//                           APageSize:Integer;
//                           //查询条件,Json数组
//                           AWhereKeyJson:String;
//                           //排序
//                           AOrderBy:String;
//                           //自带的Where条件
//                           ACustomWhereSQL:String;
//                           //是否需要总数
//                           AIsNeedSumCount:Integer;
//                           //是否需要返回层级
//                           AIsNeedReturnLevel:Integer;
//                           //接口参数
//                           ARecordDataJsonStr:String;
//                           //是否需要返回子表数据
//                           AIsNeedSubQueryList:Integer;
                           ALoadDataSetting:TLoadDataSetting;
                           ADataIntfResult:TDataIntfResult
//                           var ACode:Integer;
//                           var ADesc:String;
//                           var ADataJson:ISuperObject;
//                           AMasterRecordJson:ISuperObject=nil
                           ):Boolean;virtual;abstract;
    //获取记录
    function GetDataDetail(
//                       AAppID:Integer;
//                       //查询条件,Json数组
//                       AWhereKeyJson:String;
//                       //自带的Where条件
//                       ACustomWhereSQL:String;
//                       //接口参数
//                       ARecordDataJsonStr:String;
                       ALoadDataSetting:TLoadDataSetting;
                       ADataIntfResult:TDataIntfResult
//                       var ACode:Integer;
//                       var ADesc:String;
//                       var ADataJson:ISuperObject;
//                       AIsMustExist:Boolean=True;
//                       AIsNeedSubQueryList:Integer=1
                       ):Boolean;virtual;abstract;
    //保存记录
    function SaveData(
                      //要保存的数据
                      ASaveDataSetting:TSaveDataSetting;
                      //原数据
//                      ALoadDataIntfResult:TDataIntfResult;
                      ADataIntfResult:TDataIntfResult):Boolean;virtual;abstract;
    //删除记录
    function DelData( //原数据,用于生成删除的条件
                      ALoadDataIntfResult:TDataIntfResult;
                      ADataIntfResult:TDataIntfResult):Boolean;virtual;abstract;
  published

    //英文名称,主要用于定位
    //比如:RepairItem
    property Name:String read FName write FName;
    //中文名称,
    //比如:维修项目
    property Caption:String read FCaption write FCaption;

    property Desc:String read FDesc write FDesc;

//    //与Name重复了
//    property TableCommonnRestName:String read table_common_rest_name write table_common_rest_name;

    //字段列表,供设计时控件选择绑定字段
    property FieldNameList:TStringList read FFieldNameList write SetFieldNameList;

    //是否激活
    property IsInited:Boolean read FIsInited write SetIsInited;

    //列表页面的数据列表的其他字段,比如HomeAd,PromotionList,RecordList,
//    property RecordListFieldNames:String read FDataListOtherFieldNames write FDataListOtherFieldNames;
  end;


  //列表项的数据接口
  TSkinItemsDataInterface=class(TDataInterface)
  public
    function IsEmpty:Boolean;override;
    //获取记录列表
    function GetDataList(
                           ALoadDataSetting:TLoadDataSetting;
                           ADataIntfResult:TDataIntfResult
                           ):Boolean;override;
    //获取记录
    function GetDataDetail(
                       ALoadDataSetting:TLoadDataSetting;
                       ADataIntfResult:TDataIntfResult
                       ):Boolean;override;
    //保存记录
    function SaveData(ASaveDataSetting:TSaveDataSetting;
//                      ALoadDataIntfResult:TDataIntfResult;
                      ADataIntfResult:TDataIntfResult):Boolean;override;
    //删除记录
    function DelData(ALoadDataIntfResult:TDataIntfResult;
                      ADataIntfResult:TDataIntfResult):Boolean;override;
  end;














var
  GlobalDataInterfaceClass:TDataInterfaceClass;

implementation





{ TDataInterface }

procedure TDataInterface.AssignTo(Dest: TPersistent);
var
  ADest:TDataInterface;
begin
  if (Dest<>nil) and (Dest is TDataInterface) then
  begin
    ADest:=TDataInterface(Dest);

    ADest.fid:=Self.fid;
    ADest.appid:=Self.appid;
    ADest.user_fid:=Self.user_fid;
    ADest.program_template_fid:=Self.program_template_fid;
    ADest.intf_type:=Self.intf_type;
    ADest.data_server_fid:=Self.data_server_fid;
//    ADest.table_common_rest_name:=Self.table_common_rest_name;
    ADest.name:=Self.name;
    ADest.caption:=Self.caption;
    ADest.desc:=Self.desc;

    ADest.FFieldNameList.Assign(Self.FFieldNameList);
  end;

end;

constructor TDataInterface.Create;
begin
  FFieldNameList:=TStringList.Create;

end;

function TDataInterface.CustomLoadFromJson(ASuperObject: ISuperObject): Boolean;
begin

end;

function TDataInterface.CustomSaveToJson(ASuperObject: ISuperObject): Boolean;
begin

end;

destructor TDataInterface.Destroy;
begin
  FreeAndNil(FFieldNameList);

  inherited;
end;

function TDataInterface.IsEmpty:Boolean;
begin
  Result:=(Name='');
end;

function TDataInterface.LoadFromJson(ASuperObject: ISuperObject): Boolean;
begin
  Result:=False;


  try
      if ASuperObject.Contains('fid') then
      begin

          fid:=ASuperObject.I['fid'];
          Self.appid:=ASuperObject.I['appid'];
          user_fid:=ASuperObject.V['user_fid'];
          program_template_fid:=ASuperObject.I['program_template_fid'];
          intf_type:=ASuperObject.S['type'];
          data_server_fid:=ASuperObject.I['data_server_fid'];
        //  table_common_rest_name:=ASuperObject.S['table_common_rest_name'];



          //英文名称,主要用于定位
          //比如:RepairItem
          Name:=ASuperObject.S['name'];
          //中文名称,
          //比如:维修项目
          Caption:=ASuperObject.S['caption'];
          Desc:=ASuperObject.S['description'];



          CustomLoadFromJson(ASuperObject);

      end;

      Result:=True;
  except
    on E:Exception do
    begin
      uBaseLog.HandleException(E,'TDataInterface.LoadFromJson');
    end;
  end;
end;

function TDataInterface.SaveToJson(ASuperObject: ISuperObject): Boolean;
begin
  Result:=False;

  try

      if fid<>0 then ASuperObject.I['fid']:=fid;
      ASuperObject.I['appid']:=Self.appid;


      ASuperObject.S['user_fid']:=user_fid;
      ASuperObject.I['program_template_fid']:=program_template_fid;
      ASuperObject.S['type']:=intf_type;
      ASuperObject.I['data_server_fid']:=data_server_fid;


      ASuperObject.S['table_common_rest_name']:=Name;//table_common_rest_name;



      //英文名称,主要用于定位
      //比如:RepairItem
      ASuperObject.S['name']:=Name;
      //中文名称,
      //比如:维修项目
      ASuperObject.S['caption']:=Caption;
      ASuperObject.S['description']:=Desc;


      CustomSaveToJson(ASuperObject);

      Result:=True;
  except
    on E:Exception do
    begin
      uBaseLog.HandleException(E,'TDataInterface.SaveToJson');
    end;
  end;
end;


procedure TDataInterface.SetFieldNameList(const Value: TStringList);
begin
  FFieldNameList.Assign(Value);
end;

procedure TDataInterface.SetIsInited(const Value: Boolean);
begin

end;


{ TDataIntfResult }

procedure TDataIntfResult.Clear;
begin
  //返回的数据类型
  DataType:=TDataIntfResultType.ldtNone;
  Succ:=False;

//    Code:Integer;
  Desc:='';
  DataJson:=nil;


  DataSkinItems:=nil;
end;

//constructor TDataIntfResult.Create;
//begin
//  DataItems:=TSkinItems.Create;
//
//end;
//
//destructor TDataIntfResult.Destroy;
//begin
//  FreeAndNil(DataItems);
//  inherited;
//end;

{ TLoadDataSetting }

procedure TLoadDataSetting.Clear;
begin

  PageIndex:=1;
  PageSize:=20;



  //GetRecordList
//  AppID:=0;

  //查询条件,Json数组
  WhereKeyJson:='';

//  //排序
//  OrderBy:='';
//  //自带的Where条件
//  CustomWhereSQL:='';
//  //是否需要总数
//  IsNeedSumCount:=1;
//  //是否需要返回层级
//  IsNeedReturnLevel:=0;
//  //接口参数
//  ParamRecordDataJsonStr:='';
//  //是否需要返回子表数据
//  IsNeedSubQueryList:=1;



  IsMustExist:=False;

  PageDataSkinItems:=nil;



  IsAddRecord:=False;
  IsDelRecord:=False;
  //编辑或查看的数据
  RecordDataJson:=nil;


  //跳转过来的列表项,用于删除记录后从列表删除
  JumpFromSourceItem:=nil;

  JumpFromControlMap:=nil;
end;


{ TSkinItemsDataInterface }

function TSkinItemsDataInterface.DelData(ALoadDataIntfResult:TDataIntfResult;
  ADataIntfResult: TDataIntfResult): Boolean;
begin
  Result:=False;


  ADataIntfResult.Succ:=True;
  ADataIntfResult.Desc:='删除成功';

  Result:=True;

end;

function TSkinItemsDataInterface.GetDataDetail(
  ALoadDataSetting: TLoadDataSetting;
  ADataIntfResult: TDataIntfResult): Boolean;
begin
//  ADataIntfResult.DataType:=TDataIntfResultType.ldtSkinItems;
  Result:=False;

  ADataIntfResult.Succ:=True;
  ADataIntfResult.Desc:='加载成功';

  Result:=True;
end;

function TSkinItemsDataInterface.GetDataList(ALoadDataSetting: TLoadDataSetting;
  ADataIntfResult: TDataIntfResult): Boolean;
begin
  Result:=False;
  ADataIntfResult.Succ:=True;
  ADataIntfResult.DataSkinItems:=ALoadDataSetting.PageDataSkinItems;
  ADataIntfResult.DataType:=TDataIntfResultType.ldtSkinItems;
  ADataIntfResult.Desc:='加载成功';
  Result:=True;
end;

function TSkinItemsDataInterface.IsEmpty: Boolean;
begin
  Result:=False;
end;

function TSkinItemsDataInterface.SaveData(ASaveDataSetting: TSaveDataSetting;
  ADataIntfResult: TDataIntfResult): Boolean;
begin
  Result:=False;
  ADataIntfResult.Succ:=True;

//  if ASaveDataSetting.IsAddRecord then
//  begin
//
//  end;
//
//  ADataIntfResult.DataSkinItems:=ALoadDataSetting.PageDataSkinItems;
//  ADataIntfResult.DataType:=TDataIntfResultType.ldtSkinItem;


  ADataIntfResult.DataType:=TDataIntfResultType.ldtJson;
  ADataIntfResult.DataJson:=ASaveDataSetting.RecordDataJson;
  ADataIntfResult.Desc:='保存成功';

  Result:=True;
end;


{ TSaveDataSetting }

procedure TSaveDataSetting.Clear;
begin
  AppID:=0;

  EditingRecordFID:=0;

  IsAddedRecord:=False;
  //保存的数据
  RecordDataJson:=nil;

end;



end.
