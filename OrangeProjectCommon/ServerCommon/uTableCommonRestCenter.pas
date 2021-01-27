//convert pas to utf8 by ¥
unit uTableCommonRestCenter;

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

//  Forms,
  StrUtils,
  uRestInterfaceCall,
//  uOpenPlatformServerManager,
  uBaseDatabaseModule,

  uFuncCommon,
  uDatabaseConfig,
  uDataInterface,
//  uUniDBHelper,


  uObjectPool,

  uFileCommon,
//  ServerDataBaseModule,
  uDataSetToJson,
  XSuperObject,
  XSuperJson,
  uBaseDBHelper;





type
  TBaseQueryItem=class;
  TBaseQueryList=class;
  TCommonRestIntfItem=class;
  //有些接口传入的查询条件要能特殊处理来组成条件
  //比如keyword的参数,需要name、addr、phone等多列来查询
  //所以需要拼成一个很长的SQL
  TOnGetWhereConditionItemSQLEvent=
      function(Sender:TBaseQueryItem;
              ALogicOperator,     //逻辑运算符,NOT,AND,OR
              AName,              //参数名,比如name,keyword
              AOperator:String;   //比较符,比如>,<,=,LIKE
              AValue:Variant      //比较值
              ):String of object;






  //数据提交的时候对字段进行合法性检测
  TFieldValueCheck=class
  public
    //用于提示
    FieldCaption:String;
    //所要比较的字段
    FieldName:String;
    //检测的方式
    CheckValueType:String;
    //比较的值
    Value:Variant;
    ValueCaption:String;
    //必须存在
    IsMustExist:Boolean;
    function CheckFieldValueIsValid(ASQLDBHelper:TBaseDBHelper;
                                    ARecordDataJson:ISuperObject;
                                    var ADesc:String
                                    ):Boolean;
  end;

  TFieldValueCheckList=class(TBaseList)
  private
    function GetItem(Index: Integer): TFieldValueCheck;
  public
    function Add(AFieldCaption:String;
                 AFieldName:String;
                 ACheckValueType:String;
                 AValue:Variant;
                 AValueCaption:String;
                 AIsMustExist:Boolean=False
                  ):TFieldValueCheck;
    function Check(ASQLDBHelper:TBaseDBHelper;
                    ARecordDataJson:ISuperObject;
                    var ADesc:String):Boolean;
    property Items[Index:Integer]:TFieldValueCheck read GetItem;default;
  end;




  {$REGION 'TDataFlowAction 数据流转'}
  //处理
  TCustomProcessDataFlowActionEvent=function(
                Sender:TObject;
//                ADBModule: TBaseDatabaseModule;
                ASQLDBHelper:TBaseDBHelper;
                AAppID:Integer;
                ARecordDataJson:ISuperObject;
                AWhereKeyJsonArray:ISuperArray;
                AAddedDataJson:ISuperObject;
                AMasterRecordDataJson:ISuperObject;
                var ACode:Integer;
                var ADesc:String;
                var ADataJson:ISuperObject):Boolean of object;


  //数据流转中的基本一个动作
  TDataFlowAction=class
  public
    //流转项的名称
    Name:String;

    //自定义流转的处理过程
    OnCustomProcessDataFlowAction:TCustomProcessDataFlowActionEvent;
    //处理
    function Process(
//                ADBModule: TBaseDatabaseModule;
                ASQLDBHelper:TBaseDBHelper;
                AAppID:Integer;
                ARecordDataJson:ISuperObject;
                AWhereKeyJsonArray:ISuperArray;
                AAddedDataJson:ISuperObject;
                AMasterRecordDataJson:ISuperObject;
                var ACode:Integer;
                var ADesc:String;
                var ADataJson:ISuperObject):Boolean;virtual;

  end;

  TDataFlowActionList=class(TBaseList)
  private
    function GetItem(Index: Integer): TDataFlowAction;
  public
    property Items[Index:Integer]:TDataFlowAction read GetItem;default;
  end;

  //修改记录的数据流转动作
  TFieldValueFromType=(
                       //常量
                       fvftFromConst,
                       //值从RecordDataJson来,由接口提交
                       fvftFromRecordDataJson,
                       //值从WhereKeyJson来,由接口提交
                       fvftFromWhereKeyJson,
                       //值从刚添加好的主表Json中来
                       fvftFromNewDataJson,
                       //值从参数AppID
                       fvftFromAppID,
                       //值从主表MasterRecordDataJson来
                       fvftFromMasterRecordDataJson
                      );
  //数据流转字段
  TDataFlowField=class
  public
    FieldName:String;
    ValueFromType:TFieldValueFromType;
    FieldValue:Variant;
    //测试值
    TestQueryFieldValue:Variant;
    IsMustExist:Boolean;

    MasterRecordIntfItem:TCommonRestIntfItem;

    //0失败
    //1成功
    //2不存在
    function GetFieldValue(
//                ADBModule: TBaseDatabaseModule;
                ASQLDBHelper:TBaseDBHelper;
                AAppID:Integer;
                ARecordDataJson:ISuperObject;
                AWhereKeyJsonArray:ISuperArray;
                AAddedDataJson:ISuperObject;
                AMasterRecordDataJson:ISuperObject;
                var ACode:Integer;
                var ADesc:String;
                var AValue:Variant):Integer;
  end;
  TDataFlowFieldList=class(TBaseList)
  private
    function GetItem(Index: Integer): TDataFlowField;
  public
    function Add(
                AFieldName:String;
                AValueFromType:TFieldValueFromType;
                AFieldValue:Variant;
                ATestQueryFieldValue:Variant;
                AIsMustExist:Boolean=True;
                AMasterRecordIntfItem:TCommonRestIntfItem=nil):TDataFlowField;
    property Items[Index:Integer]:TDataFlowField read GetItem;default;
  end;
  //查询条件参数
  TSelectParam=TDataFlowField;
  TSelectParamList=TDataFlowFieldList;
  //数据流转条件参数
  TDataFlowWhereField=class(TDataFlowField)
  public
    //更新数据时的查询条件
    Operator_:String;
  end;
  TDataFlowWhereFieldList=class(TDataFlowFieldList)
  private
    function GetItem(Index: Integer): TDataFlowWhereField;
  public
    function Add(
                AFieldName:String;
                AValueFromType:TFieldValueFromType;
                AFieldValue:Variant;
                AOperator:String):TDataFlowWhereField;      
    property Items[Index:Integer]:TDataFlowWhereField read GetItem;default;
  end;

  //添加记录的数据流转动作
  //没有设置字段,那么直接提交
  TAddRecordDataFlowAction=class(TDataFlowAction)
  public
    //添加记录所需要的所有字段都在RecordDataJson中
    IsNeedAllFieldInRecordDataJson:Boolean;
    RemoveFieldListInRecordDataJson:TStringList;
  public
    //往哪个接口插入一条记录
    RestIntfItem:TCommonRestIntfItem;

    //要添加哪些字段
    FieldList:TDataFlowFieldList;
    function Process(
//                ADBModule: TBaseDatabaseModule;
                ASQLDBHelper:TBaseDBHelper;
                AAppID:Integer;
                ARecordDataJson:ISuperObject;
                AWhereKeyJsonArray:ISuperArray;
                AAddedDataJson:ISuperObject;
                AMasterRecordDataJson:ISuperObject;
                var ACode:Integer;
                var ADesc:String;
                var ADataJson:ISuperObject):Boolean;override;
  public
    constructor Create;
    destructor Destroy;override;
  end;

  
  TUpdateRecordDataFlowAction=class(TDataFlowAction)
  public
    IsNeedAllFieldInRecordDataJson:Boolean;
    RemoveFieldListInRecordDataJson:TStringList;
  public
    //往哪个接口更新记录
    RestIntfItem:TCommonRestIntfItem;
    
    //要修改哪些字段
    FieldList:TDataFlowFieldList;
    //根据什么条件来定位记录
    WhereKeyList:TDataFlowWhereFieldList;
    
    function Process(
//                ADBModule: TBaseDatabaseModule;
                ASQLDBHelper:TBaseDBHelper;
                AAppID:Integer;
                ARecordDataJson:ISuperObject;
                AWhereKeyJsonArray:ISuperArray;
                AAddedDataJson:ISuperObject;
                AMasterRecordDataJson:ISuperObject;
                var ACode:Integer;
                var ADesc:String;
                var ADataJson:ISuperObject):Boolean;override;
  public
    constructor Create;
    destructor Destroy;override;
  end;
  {$ENDREGION '数据流转'}


  {$REGION 'TWhereKeyTranslator 查询条件字段翻译'}
  //查询条件字段翻译
  TWhereKeyTranslator=class
  public
    //条件
    Key:String;
    //FieldName
    FieldNames:TStringList;
    function DoGetWhereConditionItemSQL(
                          ALogicOperator,
                          AOperator:String;
                          AValue:Variant):String;
  public
    constructor Create;
    destructor Destroy;override;
  end;
  TWhereKeyTranslatorList=class(TBaseList)
  private
    function GetItem(Index: Integer): TWhereKeyTranslator;
  public
    function Find(AKey:String):TWhereKeyTranslator;
    function Add(AKey:String;
                 AFieldNamesCommaText:String):TWhereKeyTranslator;
    property Items[Index:Integer]:TWhereKeyTranslator read GetItem;default;
  end;
  {$ENDREGION 'TWhereKeyTranslator 查询条件字段翻译'}


  {$REGION 'TBaseQueryItem 基础查询项'}
  //基础查询项
  TBaseQueryItem=class(TDataInterface)
  public
    FIsStarted:Boolean;

    //默认的查询条件,需要包含AND,OR
    //比如:AND is_deleted=0
    DefaultWhere:String;
//    //默认的排序条件,不包含ORDER BY
//    DefaultOrderBy:String;


    //主键字段
    PKFieldName:String;


    //是否有AppID字段
    //如果有,那么在查询语句中会加入 AND appid=**** 的条件
    HasAppIDField:Boolean;


    //从表查询列表(引用)
    SubQueryList:TBaseQueryList;


    //关联主表的字段名,比如维修单项目表中的维修单号是主表的主键
    RelateToMasterFieldName:String;
    RelateToMasterMasterFieldName:String;

//    //表名,用于拼成查询语句
//    TableName:String;
    //删除字段
    DeleteFieldName:String;
    //父层级节点的字段名
    LevelParentFieldName:String;
    LevelChildFieldName:String;
    //根节点的值
    LevelFieldRootNodeValue:String;



    //自定义查询条件的事件,用于处理特殊的查询字段
    OnGetWhereConditionItemSQLEvent:TOnGetWhereConditionItemSQLEvent;

//    //根据用户类型所需要的条件
//    QueryUserTypeConditions:TUserTypeConditionList;




    //添加记录时的数据流转列表
    AddRecordDataFlowActionList:TDataFlowActionList;
    BeforeAddRecordDataFlowActionList:TDataFlowActionList;

    //修改记录时的数据流转列表
    BeforeUpdateRecordDataFlowActionList:TDataFlowActionList;
    UpdateRecordDataFlowActionList:TDataFlowActionList;


    //自定义搜索条件字段列表,用于比如将一个keyword转换成多个数据库字段名name,phone
    WhereKeyTranslatorList:TWhereKeyTranslatorList;

    //查询语句的条件参数列表
    SelectParamList:TSelectParamList;

    //作为从表,被主表添加记录时的字段列表
    DetailAddRecordFieldList:TDataFlowFieldList;


    //汇总查询字段
    SummaryQueryFieldList:TStringList;

    //不更新的字段,比如主鍵,自增字段
    NoUpdateFieldList:TStringList;

    //不重复的字段,插入和更新之前需要检验
    UniqueFieldNameList:TStringList;
    UniqueFieldCaptionList:TStringList;

    //数据提交时字段检测列表
    FieldValueCheckList:TFieldValueCheckList;

    //是否是存储过程
    function IsStoreProcedure:Boolean;


    //检测查询条件Json是否合法,是不是少了字段
    function CheckWhereKeyJsonArray(AWhereKeyJsonArray:ISuperArray;
                                    var AError:String):Boolean;

    procedure AssignTo(Dest: TPersistent); override;

  public
    constructor Create;overload;override;
    constructor Create(
                      //接口名称
                      AName:String;
                      //标题
                      ACaption:String;
                      //表名
                      ATableName:String;
                      //查询语句
                      ASelect:String;
                      //查询条件
                      ADefaultWhere:String;
                      //删除字段
                      ADeleteFieldName:String;
                      //主键字段
                      APKFieldName:String;
                      //默认的排序字段
                      ADefaultOrderBy:String;
                      //是否拥有AppID字段
                      AHasAppIDField:Boolean;
                      //主表在子表中的字段
                      ARelateToMasterFieldName:String='');overload;
    destructor Destroy;override;
  public


    //查询语句的字段列表
    TableFieldNameList:TStringList;
//    QueryFieldNameList:TStringList;


    {$REGION '获取从表数据'}

    //获取Where条件
    function GetWhereConditionSQL(AWhereKeyJsonArray:ISuperArray):String;virtual;
    //获取调用存储过程的参数
    function GetExecProcParamSQL(AWhereKeyJsonArray:ISuperArray):String;virtual;
    //遍历主表数组AMasterJsonArray,将从表数据插入每条从表记录
    function GetSubQueryRecordListOfMasterRecordArray(
                ADBModule: TBaseDatabaseModule;
                AAppID:Integer;
                ASubQueryList:TBaseQueryList;
                AMasterJsonArray:ISuperArray;
                ARecordDataJsonStr:String;
                ADBHelper:TBaseDBHelper;
               var ACode:Integer;
               var ADesc:String
                ):Boolean;
    //获取一条主表记录的从表记录列表
    function GetSubQueryRecordListOfMasterRecord(
                ADBModule: TBaseDatabaseModule;
                AAppID:Integer;
                ASubQueryList:TBaseQueryList;
                //主记录Json
                AMasterJson:ISuperObject;
                //调用时传进来的参数
                ARecordDataJsonStr:String;
                ADBHelper:TBaseDBHelper;
               var ACode:Integer;
               var ADesc:String
                ):Boolean;
          //获取从表数据到AMasterDataJson
          //旧的
          function GetSubDetailRecordList(
                        ADBModule: TBaseDatabaseModule;
                        AMasterFieldValue:Variant;
                        AMasterDataJson:ISuperObject;
                        ADBHelper:TBaseDBHelper;
                         var ACode:Integer;
                         var ADesc:String
                        ):Boolean;


//    //检测用户类型条件是否都满足
//    function CheckQueryUserTypeCondition(AUserType:Integer;
//                            AWhereKeyJson:String;
//                            var AError:String):Boolean;
    //处理从表的数据操作
    function ProcessSubQueryListRecord(
                        ADBModule: TBaseDatabaseModule;
                        ASQLDBHelper:TBaseDBHelper;
                        AAppID:Integer;
                        //主表的主键值,用于在子表中插入时使用
//                        AMasterPKFieldValue:Variant;
                        //主表的记录
                        AMasterRecordDataJson:ISuperObject;
                        ASubQueryListJsonArray:ISuperArray;
                        var ACode:Integer;
                        var ADesc:String;
                        var ADataJson:ISuperObject
                        ):Boolean;
    //处理从表的数据操作
    function ProcessSubQueryItemRecord(
                        ADBModule: TBaseDatabaseModule;
                        ASQLDBHelper:TBaseDBHelper;
                        AAppID:Integer;
                        //主表的主键值,用于在子表中插入时使用
//                        AMasterPKFieldValue:Variant;
                        //主表的记录
                        AMasterRecordDataJson:ISuperObject;
                        ASubQueryItemJson:ISuperObject;
                        var ACode:Integer;
                        var ADesc:String;
                        var ADataJson:ISuperObject
                        ):Boolean;

    {$ENDREGION '获取从表数据'}
  public
    {$REGION '操作'}

    //获取记录列表
    function GetRecordList(
                          ADBModule: TBaseDatabaseModule;
                          ASQLDBHelper:TBaseDBHelper;
                           AAppID:Integer;
                           APageIndex:Integer;
                           APageSize:Integer;
                           //查询条件,Json数组
                           AWhereKeyJson:String;
                           //排序
                           AOrderBy:String;
                           //自带的Where条件
                           ACustomWhereSQL:String;
                           //是否需要总数
                           AIsNeedSumCount:Integer;
                           //是否需要返回层级
                           AIsNeedReturnLevel:Integer;
                           //接口参数
                           ARecordDataJsonStr:String;
                           //是否需要返回子表数据
                           AIsNeedSubQueryList:Integer;
                           var ACode:Integer;
                           var ADesc:String;
                           var ADataJson:ISuperObject;
                           AMasterRecordJson:ISuperObject=nil
                           ):Boolean;overload;
    //获取记录
    function GetRecord(
                      ADBModule: TBaseDatabaseModule;
                      ASQLDBHelper:TBaseDBHelper;
                       AAppID:Integer;
                       //查询条件,Json数组
                       AWhereKeyJson:String;
                       //自带的Where条件
                       ACustomWhereSQL:String;
                       //接口参数
                       ARecordDataJsonStr:String;
                       var ACode:Integer;
                       var ADesc:String;
                       var ADataJson:ISuperObject;
                       AIsMustExist:Boolean=True;
                       AIsNeedSubQueryList:Integer=1
                       ):Boolean;overload;


    //获取字段列表
    function DoGetFieldList(
                          ADBModule: TBaseDatabaseModule;
                          ASQLDBHelper:TBaseDBHelper;
                          ASelect:String;
                           var ACode:Integer;
                           var ADesc:String;
                           var ADataJson:ISuperObject
                           ):Boolean;
    function GetFieldList(
                          ADBModule: TBaseDatabaseModule;
                          ASQLDBHelper:TBaseDBHelper;
                           var ACode:Integer;
                           var ADesc:String;
                           var ADataJson:ISuperObject
                           ):Boolean;

    //添加一条记录
    function AddRecord(ADBModule: TBaseDatabaseModule;
                        ASQLDBHelper:TBaseDBHelper;
                        AAppID:Integer;
                        ARecordDataJson:ISuperObject;
                        AMasterRecordDataJson:ISuperObject;
                        var ACode:Integer;
                        var ADesc:String;
                        var ADataJson:ISuperObject
                        ):Boolean;
    //添加记录列表
    function AddRecordList(
                        ADBModule: TBaseDatabaseModule;
                        ASQLDBHelper:TBaseDBHelper;
                        AAppID:Integer;
                        ARecordDataJsonArray:ISuperArray;
                        AMasterRecordDataJson:ISuperObject;
                        var ACode:Integer;
                        var ADesc:String;
                        var ADataJson:ISuperObject
                        ):Boolean;
    //修改一条记录
    function UpdateRecord(
                          ADBModule: TBaseDatabaseModule;
                          ASQLDBHelper:TBaseDBHelper;
                          AAppID:Integer;
                          ARecordDataJson:ISuperObject;
                          //更新条件数组,Json数组
                          AWhereKeyJson:String;
                          //自带的Where条件,如  AND (1=1),可以不使用AWhereKeyJson
                          ACustomWhereSQL:String;
                          var ACode:Integer;
                          var ADesc:String;
                          var ADataJson:ISuperObject
                          ):Boolean;
    function UpdateRecordList(
                          ADBModule: TBaseDatabaseModule;
                          ASQLDBHelper:TBaseDBHelper;
                          AAppID:Integer;
                          ARecordDataJsonArray:ISuperArray;
                          var ACode:Integer;
                          var ADesc:String;
                          var ADataJson:ISuperObject
                          ):Boolean;
    //物理删除一条记录,不安全,不建议使用
    function RealDeleteRecord(
                          ADBModule: TBaseDatabaseModule;
                          ASQLDBHelper:TBaseDBHelper;
                          AAppID:Integer;
                          //删除条件数组,Json数组
                          AWhereKeyJson:String;
                          //自带的Where条件,如  AND (1=1),可以不使用AWhereKeyJson
                          ACustomWhereSQL:String;
                          var ACode:Integer;
                          var ADesc:String;
                          var ADataJson:ISuperObject
                          ):Boolean;
    //物理删除多条记录,不安全,不建议使用
    function RealDeleteRecordList(
                          ADBModule: TBaseDatabaseModule;
                          ASQLDBHelper:TBaseDBHelper;
                          AAppID:Integer;
                          AWhereJsonArray:ISuperArray;
                          var ACode:Integer;
                          var ADesc:String;
                          var ADataJson:ISuperObject
                          ):Boolean;
    //虚拟删除一条记录
    function DeleteRecord(
                          ADBModule: TBaseDatabaseModule;
                          ASQLDBHelper:TBaseDBHelper;
                          AAppID:Integer;
                          //删除条件数组,Json数组
                          AWhereKeyJson:String;
                          //自带的Where条件,如  AND (1=1),可以不使用AWhereKeyJson
                          ACustomWhereSQL:String;
                          var ACode:Integer;
                          var ADesc:String;
                          var ADataJson:ISuperObject
                          ):Boolean;
    //虚拟删除多条记录
    function DeleteRecordList(
                        ADBModule: TBaseDatabaseModule;
                        ASQLDBHelper:TBaseDBHelper;
                        AAppID:Integer;
                        //删除条件数组,Json数组
                        AWhereJsonArray:ISuperArray;
                        var ACode:Integer;
                        var ADesc:String;
                        var ADataJson:ISuperObject
                        ):Boolean;

    {$ENDREGION '操作'}
  public
    FIsInTest:Boolean;
    //初始
    function Init(ADBModule: TBaseDatabaseModule): Boolean;
    //准备启动
    function DoPrepareStart(var AError:String): Boolean; virtual;

    //从json中加载
    function CustomLoadFromJson(ASuperObject:ISuperObject):Boolean;override;
    //保存到Json中
    function CustomSaveToJson(ASuperObject:ISuperObject):Boolean;override;

    //接口是否为空,为空就不调用,不保存了
    function IsEmpty:Boolean;override;
  private
    FSelect: TStringList;
    FTableName: String;
    FDefaultOrderBy: String;
    procedure SetSelect(const Value: TStringList);
    property TableName:String read FTableName write FTableName;
  published
    //列表查询语句,
    //比如:SELECT * FROM 维修项目
    property Select:TStringList read FSelect write SetSelect;
    //默认的排序条件,不包含ORDER BY
    property DefaultOrderBy:String read FDefaultOrderBy write FDefaultOrderBy;
  end;

  TBaseQueryList=class(TBaseList)
  private
    function GetItem(Index: Integer): TBaseQueryItem;
  public
    function Find(AName:String):TBaseQueryItem;
    function FindItemByCaption(ACaption:String):TBaseQueryItem;
    property Items[Index:Integer]:TBaseQueryItem read GetItem;default;
  end;


//  //因为可能相同的子表
//  TSubQueryItem=class
//  public
//    RelateToMasterFieldName:String;
//    BaseQueryItem:TBaseQueryItem;
//  end;
//
//  TSubQueryList=class(TBaseList)
//  private
//    function GetItem(Index: Integer): TBaseQueryItem;
//  public
//    procedure Add(ABaseQueryItem:TBaseQueryItem;ARelateToMasterFieldName:String='');
//    function Find(AName:String):TBaseQueryItem;
//    function FindItemByCaption(ACaption:String):TBaseQueryItem;
//    property Items[Index:Integer]:TBaseQueryItem read GetItem;default;
//  end;
  {$ENDREGION 'TBaseQueryItem 基础查询项'}


  {$REGION 'TCommonRestIntfItem 接口项,多了数据库的功能'}
  TCommonRestIntfItem=class(TBaseQueryItem)
  public
    //使用的数据库连接
    DBModule: TBaseDatabaseModule;
    //数据库连接是否是共用的,还是自己的
    IsDBModuleSelfOwn:Boolean;
  public
    //准备启动
    function DoPrepareStart(var AError:String): Boolean; override;
    //准备停止
    function DoPrepareStop: Boolean; virtual;
  public

    procedure AssignTo(Dest: TPersistent); override;

    procedure SetDBModule(ADBModule: TBaseDatabaseModule);
  private
    function GetDBCharset: String;
    function GetDBDataBaseName: String;
    function GetDBPassword: String;
    function GetDBHostName: String;
    function GetDBUserName: String;
    function GetDBHostPort: String;
    function GetDBType: String;
    procedure SetDBCharset(const Value: String);
    procedure SetDBDataBaseName(const Value: String);
    procedure SetDBHostName(const Value: String);
    procedure SetDBHostPort(const Value: String);
    procedure SetDBPassword(const Value: String);
    procedure SetDBType(const Value: String);
    procedure SetDBUserName(const Value: String);
  public
    constructor Create;overload;override;
//    constructor Create(ADBModule:TBaseDatabaseModule);overload;
    constructor Create(
                      //接口名称
                      AName:String;
                      //标题
                      ACaption:String;
                      //
                      ADBModule:TBaseDatabaseModule;
                      //表名
                      ATableName:String;
                      //查询语句
                      ASelect:String;
                      ADefaultWhere:String;
                      //删除字段
                      ADeleteFieldName:String;
                      //主键字段
                      APKFieldName:String;
                      //默认的排序字段
                      ADefaultOrderBy:String;
                      //是否拥有AppID字段
                      AHasAppIDField:Boolean=False;
                      //该表中与主表关联的字段
                      ARelateToMasterFieldName:String='');overload;
    destructor Destroy;override;

    //从json中加载
    function CustomLoadFromJson(ASuperObject:ISuperObject):Boolean;override;
    //保存到Json中
    function CustomSaveToJson(ASuperObject:ISuperObject):Boolean;override;

    //获取记录列表
    function GetRecordList(
                           AAppID:Integer;
                           APageIndex:Integer;
                           APageSize:Integer;
                           //查询条件,Json数组
                           AWhereKeyJson:String;
                           //排序
                           AOrderBy:String;
                           //自带的Where条件
                           ACustomWhereSQL:String;
                           //是否需要总数
                           AIsNeedSumCount:Integer;
                           //是否需要返回层级
                           AIsNeedReturnLevel:Integer;
                           //接口参数
                           ARecordDataJsonStr:String;
                           //是否需要返回子表数据
                           AIsNeedSubQueryList:Integer;
                           var ACode:Integer;
                           var ADesc:String;
                           var ADataJson:ISuperObject;
                           AMasterRecordJson:ISuperObject=nil
                           ):Boolean;overload;//override;
    //获取记录
    function GetRecord(
                       AAppID:Integer;
                       //查询条件,Json数组
                       AWhereKeyJson:String;
                       //自带的Where条件
                       ACustomWhereSQL:String;
                       //接口参数
                       ARecordDataJsonStr:String;
                       var ACode:Integer;
                       var ADesc:String;
                       var ADataJson:ISuperObject;
                       AIsMustExist:Boolean=True;
                       AIsNeedSubQueryList:Integer=1
                       ):Boolean;overload;//override;

    procedure SetIsInited(const Value: Boolean);override;

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
                           ):Boolean;override;
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
                       ):Boolean;override;
  published
    property DBType:String read GetDBType write SetDBType;
    property DBHostName:String read GetDBHostName write SetDBHostName;
    property DBHostPort:String read GetDBHostPort write SetDBHostPort;
    property DBUserName:String read GetDBUserName write SetDBUserName;
    property DBPassword:String read GetDBPassword write SetDBPassword;
    property DBDataBaseName:String read GetDBDataBaseName write SetDBDataBaseName;
    property DBCharset:String read GetDBCharset write SetDBCharset;

  end;

  TCommonRestIntfList=class(TBaseQueryList)
  private
    function GetItem(Index: Integer): TCommonRestIntfItem;
  public
    function Find(AName:String):TCommonRestIntfItem;
    function FindItemByCaption(ACaption:String):TCommonRestIntfItem;
    property Items[Index:Integer]:TCommonRestIntfItem read GetItem;default;
  end;
  {$ENDREGION 'TCommonRestIntfItem 接口项'}




////获取表格的查询分页的条件
//function GetTableQueryPageSQL(
//            //表名
//            ATableName:String;
//            //数据库类型,MYSQL还是MSSQL
//            ADBType:String;
//            //页号,从1开始
//            APageIndex:Integer;
//            //每页记录数,如果为MaxInt则全部返回
//            APageSize:Integer;
//            //条件语句
//            AWhere:String;
//            //排序语句
//            AOrderBy:String):String;


//<<<<<<< .mine
//
//
////��ȡ��ѯ���Ĳ�ѯ��ҳ����
//||||||| .r10989
////��ȡ��ѯ���Ĳ�ѯ��ҳ����
//=======




//获取查询语句的查询分页条件
//>>>>>>> .r11181
function GetQueryQueryPageSQL(
            ASQLDBHelper:TBaseDBHelper;
            //查询语句,不要条件和排序
            ASelect:String;
            //数据库类型,MYSQL还是MSSQL
            ADBType:String;
            //页号,从1开始
            APageIndex:Integer;
            //每页记录数,如果为MaxInt则全部返回
            APageSize:Integer;
            //条件语句
            AWhere:String;
            //排序语句
            AOrderBy:String;
            AParamNames:TStringDynArray;
            AParamValues:TVariantDynArray;
            AIsProcedure:Boolean;
            AExecProcParams:String
            ):String;


//获取默认的条件
function GetDefaultWhereConditionItemSQL(
                ALogicOperator,
                AName,
                AOperator:String;
                AValue: Variant): String;


function GetIFNULLName(ADBType:String):String;


implementation


function GetIFNULLName(ADBType:String):String;
begin
  if ADBType='MSSQL' then
  begin
    Result:='ISNULL';
  end
  else
  begin
    Result:='IFNULL';
  end;

end;

function GetQueryQueryPageSQL(
            ASQLDBHelper:TBaseDBHelper;
            ASelect:String;
            ADBType:String;
            APageIndex:Integer;
            APageSize:Integer;
            AWhere:String;
            AOrderBy:String;
            AParamNames:TStringDynArray;
            AParamValues:TVariantDynArray;
            AIsProcedure:Boolean;
            AExecProcParams:String
            ):String;
var
  AOrderByFieldNames:TStringList;
  AOrderByFieldName:String;
  AOrderByType:String;
  AIndex:Integer;
  AMaxValue:String;
  AOrderByWhere:String;
begin
  Result:=ASelect+' '+AWhere+AOrderBy;


//  if (APageSize<>MaxInt) then
//  begin


      //返回分页数据
      if (ADBType='') or SameText(ADBType,'MYSQL') then
      begin
          if (APageSize<>MaxInt) then
          begin
              Result:=ASelect+' '
                      +AWhere
                      +AOrderBy
                      //从0开始
                      +' LIMIT '+IntToStr((APageIndex-1)*APageSize)+','+IntToStr(APageSize)+' ';
          end;
      end
      else if SameText(ADBType,'MSSQL') then
      begin

          if not AIsProcedure then// Pos('exec ',LowerCase(ASelect))=0 then
          begin
              if (APageSize<>MaxInt) then
              begin
                {$IFDEF SQLSERVER_2000}
                  //低版本的SQLServer,不支持ROW_NUMBER
                  if (AOrderBy<>'') and (APageIndex>1) then
                  begin
                      //先找出主键
                      AOrderByFieldName:=AOrderBy;
                      AOrderByFieldName:=ReplaceText(AOrderByFieldName,'  ',' ');
                      AOrderByFieldName:=ReplaceText(AOrderByFieldName,'  ',' ');
                      AOrderByFieldName:=ReplaceText(AOrderByFieldName,'  ',' ');
                      AOrderByFieldName:=Trim(AOrderByFieldName);
                      AOrderByFieldNames:=TStringList.Create;
                      try
                          AOrderByFieldNames.Delimiter:=' ';
                          AOrderByFieldNames.StrictDelimiter:=True;
                          AOrderByFieldNames.DelimitedText:=AOrderByFieldName;
                          AOrderByFieldName:=AOrderByFieldNames[2];
                          AOrderByType:=AOrderByFieldNames[3];


                          //ASC,1,2,3,4,5,6
                          //DESC,6,5,4,3,2,1
                          AIndex:=Pos('FROM',UpperCase(ASelect));
                          if not ASQLDBHelper.SelfQuery(
                              'SELECT TOP '+IntToStr((APageIndex-1)*APageSize)+' '+AOrderByFieldName+' '+Copy(ASelect,AIndex-1,MaxInt)
                              +AWhere+AOrderBy,
                              AParamNames,
                              AParamValues,
                              asoOpen) then
                          begin
                            Exit;
                          end;



                          AMaxValue:='';
                          ASQLDBHelper.Query.First;
                          while not ASQLDBHelper.Query.Eof do
                          begin
                            AMaxValue:=ASQLDBHelper.Query.Fields[0].AsString;
                            ASQLDBHelper.Query.Next;
                          end;

                          //条件
                          AOrderByWhere:='';
                          if SameText(AOrderByType,'ASC') then
                          begin
                            //顺序,1,2,3,4,5,6
                            AOrderByWhere:=' '+AOrderByFieldName+'>'+QuotedStr(AMaxValue);
                          end
                          else
                          begin
                            //倒序,1,2,3,4,5,6
                            AOrderByWhere:=' '+AOrderByFieldName+'<'+QuotedStr(AMaxValue);
                          end;
                          if Trim(AWhere)='' then
                          begin
                            AOrderByWhere:=' WHERE '+AOrderByWhere;
                          end
                          else
                          begin
                            AOrderByWhere:=' AND '+AOrderByWhere;
                          end;


                          Result:=ASelect
                                  +' '
                                  +AWhere
                                  +AOrderByWhere
                                  +AOrderBy;


                      finally
                        FreeAndNil(AOrderByFieldNames);
                      end;
                  end;

                  AIndex:=Pos('SELECT',UpperCase(Result));
                  Result:='SELECT '+' TOP '+IntToStr(APageSize)+' '
                          +Copy(Result,AIndex+6,MaxInt);


      //            Result:=
      //              ' SELECT TOP '+IntToStr(APageSize)+' * '
      //                +' FROM ( '
      //                    +' SELECT '+' ROW_NUMBER() OVER ('+AOrderBy+') AS RowNumber, '+' * '
      //                    +' FROM '+'('+ASelect+AWhere+') Z'+' '
      //                +' ) Y '
      //                +' WHERE RowNumber > '+IntToStr(APageSize)+'*('+IntToStr(APageIndex)+'-1) '
      //                +AOrderBy;
                {$ELSE}
                  //高版本的SQLServer,支持ROW_NUMBER
                  Result:=
                    ' SELECT TOP '+IntToStr(APageSize)+' * '
                      +' FROM ( '
                          +' SELECT '+' ROW_NUMBER() OVER ('+AOrderBy+') AS RowNumber, '+' * '
                          +' FROM '+'('+ASelect+' '+AWhere+') Z'+' '
                      +' ) Y '
                      +' WHERE RowNumber > '+IntToStr(APageSize)+'*('+IntToStr(APageIndex)+'-1) '
                      +AOrderBy;
                {$ENDIF}

              end;


          end
          else
          begin

              //存储过程
              Result:=ASelect+' '+AExecProcParams;

          end;


      end;



//  end
//  else
//  begin
//      //不分页
//      //返回所有数据
//  end;

end;


function GetDefaultWhereConditionItemSQL(ALogicOperator,
              AName,
              AOperator:String;
              AValue:Variant): String;
var
  AValueStr:String;
begin
  if SameText(AOperator,'LIKE') then
  begin
      //LIKE i'm  -> LIKE i''m
      AValueStr:=QuotedStr(AValue);
      //去掉两边的引号
      AValueStr:=Copy(AValueStr,2,Length(AValueStr)-2);
      Result:=' '+ALogicOperator+' ( '+AName+' '+AOperator+' ''%'+AValueStr+'%'' ) ';
  end
  else if SameText(AOperator,'IN') then
  begin
      //IN ('待派','已派工')  ->  IN (''待派'',''已派工'')
      Result:=' '+ALogicOperator+' ( '+AName+' '+AOperator+AValue+' ) ';
  end
  else
  begin
      if (VarType(AValue)=varString)
        or (VarType(AValue)=varUString) then
      begin
        Result:=' '+ALogicOperator+' ('+AName+' '+AOperator+' '+QuotedStr(AValue)+') ';
      end
      else
      begin
        AValueStr:=AValue;
        Result:=' '+ALogicOperator+' ('+AName+' '+AOperator+' '+AValueStr+') ';
      end;
  end;
end;

//function GetTableQueryPageSQL(ATableName:String;
//                              ADBType:String;
//                              APageIndex:Integer;
//                              APageSize:Integer;
//                              AWhere:String;
//                              AOrderBy:String):String;
//begin
//  Result:=' SELECT * FROM '+ATableName+' '//' A '//必须要带A,多表联合的时候,要判断is_deleted不能为1
//          +AWhere
//          +AOrderBy;
//  if (APageSize<>MaxInt) then
//  begin
//      //返回分页数据
//      if (ADBType='') or SameText(ADBType,'MYSQL') then
//      begin
//        Result:=' SELECT * FROM '+ATableName+' '//' A '//必须要带A,多表联合的时候,要判断is_deleted不能为1
//                +AWhere
//                +AOrderBy
//                //从0开始
//                +' LIMIT '+IntToStr((APageIndex-1)*APageSize)+','+IntToStr(APageSize)+' ';
//      end
//      else if SameText(ADBType,'MSSQL') then
//      begin
//        Result:=
//          ' SELECT TOP '+IntToStr(APageSize)+' * FROM ( '
//              +' SELECT '
//              +' ROW_NUMBER() OVER ('+AOrderBy+') AS RowNumber, '
//              +' * FROM '+ATableName+' '//' A '//必须要带A,多表联合的时候,要判断is_deleted不能为1
//            +' ) Z '
//            +' WHERE RowNumber > '+IntToStr(APageSize)+'*('+IntToStr(APageIndex)+'-1) '
//            +AOrderBy;
//      end;
//  end
//  else
//  begin
//      //不分页
//      //返回所有数据
//  end;
//end;



//  public
//    {$REGION 'Table'}
//    //允许调用接口的用户类型,有些接口可以给用户调用,有些接口只能员工调用
//    //获取记录列表
//    function GetTableRecordList(ADBModule: TBaseDatabaseModule;
//                            ASQLDBHelper:TBaseDBHelper;
//                           AAppID:Integer;
//                           APageIndex:Integer;
//                           APageSize:Integer;
//                           //查询条件,Json数组
//                           AWhereKeyJson:String;
//                           //排序
//                           AOrderBy:String;
//                           //自带的Where条件,如 AND (1=1),可以不使用AWhereKeyJson
//                           ACustomWhereSQL:String;
//                           //是否需要总数
//                           AIsNeedSumCount:Integer;
//                           var ACode:Integer;
//                           var ADesc:String;
//                           var ADataJson:ISuperObject
//                           ):Boolean;overload;
//    function GetTableRecord(ADBModule: TBaseDatabaseModule;
//                        ASQLDBHelper:TBaseDBHelper;
//                       AAppID:Integer;
//                       //查询条件,Json数组
//                       AWhereKeyJson:String;
//                       //自带的Where条件,如 AND (1=1),可以不使用AWhereKeyJson
//                       ACustomWhereSQL:String;
//                       var ACode:Integer;
//                       var ADesc:String;
//                       var ADataJson:ISuperObject
//                       ):Boolean;
//    //获取字段列表
//    function GetTableFieldList(ADBModule: TBaseDatabaseModule;
//                                ASQLDBHelper:TBaseDBHelper;
//                               var ACode:Integer;
//                               var ADesc:String;
//                               var ADataJson:ISuperObject
//                               ):Boolean;
//    {$ENDREGION 'Table'}



{ TCommonRestIntfList }


function TCommonRestIntfList.Find(AName: String): TCommonRestIntfItem;
begin
  Result:=TCommonRestIntfItem(inherited Find(AName));
end;

function TCommonRestIntfList.FindItemByCaption(ACaption: String): TCommonRestIntfItem;
begin
  Result:=TCommonRestIntfItem(inherited FindItemByCaption(ACaption));
end;

function TCommonRestIntfList.GetItem(Index: Integer): TCommonRestIntfItem;
begin
  Result:=TCommonRestIntfItem(Inherited Items[Index]);
end;



{ TCommonRestIntfItem }


procedure TCommonRestIntfItem.AssignTo(Dest: TPersistent);
var
  ADest:TCommonRestIntfItem;
begin
  inherited;

  if (Dest<>nil) and (Dest is TCommonRestIntfItem) then
  begin
    ADest:=TCommonRestIntfItem(Dest);

    if (ADest.DBModule<>nil) and (Self.DBModule<>nil) then
    begin

      ADest.DBModule.DBConfig.Assign(Self.DBModule.DBConfig);

    end;
  end;

end;

constructor TCommonRestIntfItem.Create(
                      //接口名称
                      AName:String;
                      //标题
                      ACaption:String;
                      //
                      ADBModule:TBaseDatabaseModule;
                      //表名
                      ATableName:String;
                      //查询语句
                      ASelect:String;
                      ADefaultWhere:String;
                      //删除字段
                      ADeleteFieldName:String;
                      //主键字段
                      APKFieldName:String;
                      //默认的排序字段
                      ADefaultOrderBy:String;
                      //是否拥有AppID字段
                      AHasAppIDField:Boolean;
                      ARelateToMasterFieldName:String
                      );
begin
  Inherited Create(
                    AName,
                    ACaption,
                    ATableName,
                    ASelect,
                    ADefaultWhere,
                    ADeleteFieldName,
                    APKFieldName,
                    ADefaultOrderBy,
                    AHasAppIDField,
                    ARelateToMasterFieldName
                    );

//  //数据库模块
//  if ADBModule=nil then
//  begin
//    //自已创建
//    IsDBModuleSelfOwn:=True;
//    DBModule := GlobalDatabaseModuleClass.Create;
//  end
//  else
//  begin
//    //引用别人的
//    IsDBModuleSelfOwn:=False;
//    DBModule:=ADBModule;
//  end;


  SetDBModule(ADBModule);


end;

constructor TCommonRestIntfItem.Create;
begin
  Inherited Create;

  SetDBModule(nil);
end;

function TCommonRestIntfItem.CustomLoadFromJson(ASuperObject: ISuperObject): Boolean;
begin
  Result:=False;

  Inherited CustomLoadFromJson(ASuperObject);


  if DBModule<>nil then
  begin
    Self.DBModule.DBConfig.FDBType:=ASuperObject.S['db_type'];//MYSQL
    Self.DBModule.DBConfig.FDBHostName:=ASuperObject.S['db_hostname'];//'www.orangeui.cn';
    Self.DBModule.DBConfig.FDBHostPort:=ASuperObject.S['db_port'];//'3306';
    Self.DBModule.DBConfig.FDBUserName:=ASuperObject.S['db_username'];//'root';
    Self.DBModule.DBConfig.FDBPassword:=ASuperObject.S['db_password'];//'138575wangneng';
    Self.DBModule.DBConfig.FDBDataBaseName:=ASuperObject.S['db_dbname'];//'basic_data_manage';
    Self.DBModule.DBConfig.FDBCharset:=ASuperObject.S['db_charset'];//'basic_data_manage';
  end;


  Result:=True;
end;

function TCommonRestIntfItem.CustomSaveToJson(ASuperObject: ISuperObject): Boolean;
begin
  Result:=False;

  Inherited CustomSaveToJson(ASuperObject);

  if DBModule<>nil then
  begin
    ASuperObject.S['db_type']:=Self.DBModule.DBConfig.FDBType;//MYSQL
    ASuperObject.S['db_hostname']:=Self.DBModule.DBConfig.FDBHostName;//'www.orangeui.cn';
    ASuperObject.S['db_port']:=Self.DBModule.DBConfig.FDBHostPort;//'3306';
    ASuperObject.S['db_username']:=Self.DBModule.DBConfig.FDBUserName;//'root';
    ASuperObject.S['db_password']:=Self.DBModule.DBConfig.FDBPassword;//'138575wangneng';
    ASuperObject.S['db_dbname']:=Self.DBModule.DBConfig.FDBDataBaseName;//'basic_data_manage';
    ASuperObject.S['db_charset']:=Self.DBModule.DBConfig.FDBCharset;//'basic_data_manage';
  end;


  Result:=True;
end;



//获取记录列表
function TCommonRestIntfItem.GetDataList(
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
                           ):Boolean;
var
  ACode:Integer;
begin
  Result:=GetRecordList(
                       ALoadDataSetting.AppID,
                       ALoadDataSetting.PageIndex,
                       ALoadDataSetting.PageSize,
                       //查询条件,Json数组
                       ALoadDataSetting.WhereKeyJson,
                       //排序
                       '',//ALoadDataSetting.OrderBy,
                       //自带的Where条件
                       '',//ALoadDataSetting.CustomWhereSQL,
                       //是否需要总数
                       1,//ALoadDataSetting.IsNeedSumCount,
                       //是否需要返回层级
                       0,//ALoadDataSetting.IsNeedReturnLevel,
                       //接口参数
                       '',//ALoadDataSetting.ParamRecordDataJsonStr,
                       //是否需要返回子表数据
                       ALoadDataSetting.IsNeedSubQueryList,
                       ACode,
                       ADataIntfResult.Desc,
                       ADataIntfResult.DataJson

                        );
  ADataIntfResult.DataType:=TDataIntfResultType.ldtJson;
  ADataIntfResult.Succ:=(ACode=SUCC);
end;


//获取记录
function TCommonRestIntfItem.GetDataDetail(
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
                       ):Boolean;
var
  ACode:Integer;
begin
  Result:=GetRecord(
                       ALoadDataSetting.AppID,
                       //查询条件,Json数组
                       ALoadDataSetting.WhereKeyJson,
                       //自带的Where条件
                       '',//ALoadDataSetting.CustomWhereSQL,
                       //接口参数
                       '',//ALoadDataSetting.ParamRecordDataJsonStr,
                       ACode,
                       ADataIntfResult.Desc,
                       ADataIntfResult.DataJson,
                       ALoadDataSetting.IsMustExist,
                       //是否需要返回子表数据
                       ALoadDataSetting.IsNeedSubQueryList

                        );
  ADataIntfResult.DataType:=TDataIntfResultType.ldtJson;
  ADataIntfResult.Succ:=(ACode=SUCC);
end;




function TCommonRestIntfItem.GetRecordList(
                       AAppID:Integer;
                       APageIndex:Integer;
                       APageSize:Integer;
                       //查询条件,Json数组
                       AWhereKeyJson:String;
                       //排序
                       AOrderBy:String;
                       //自带的Where条件
                       ACustomWhereSQL:String;
                       //是否需要总数
                       AIsNeedSumCount:Integer;
                       //是否需要返回层级
                       AIsNeedReturnLevel:Integer;
                       //接口参数
                       ARecordDataJsonStr:String;
                       //是否需要返回子表数据
                       AIsNeedSubQueryList:Integer;
                       var ACode:Integer;
                       var ADesc:String;
                       var ADataJson:ISuperObject;
                       AMasterRecordJson:ISuperObject=nil
                       ):Boolean;
begin
  Result:=GetRecordList(DBModule,
                        nil,
                        AAppID,
                        APageIndex,
                        APageSize,
                        AWhereKeyJson,
                        AOrderBy,
                        ACustomWhereSQL,
                        AIsNeedSumCount,
                        AIsNeedReturnLevel,
                        ARecordDataJsonStr,
                        AIsNeedSubQueryList,
                        ACode,
                        ADesc,
                        ADataJson,
                        AMasterRecordJson
                        );
end;

function TCommonRestIntfItem.GetRecord(
                   AAppID:Integer;
                   //查询条件,Json数组
                   AWhereKeyJson:String;
                   //自带的Where条件
                   ACustomWhereSQL:String;
                   //接口参数
                   ARecordDataJsonStr:String;
                   var ACode:Integer;
                   var ADesc:String;
                   var ADataJson:ISuperObject;
                   AIsMustExist:Boolean=True;
                   AIsNeedSubQueryList:Integer=1
                   ):Boolean;
begin
  Result:=GetRecord(DBModule,
                        nil,
                        AAppID,
                        AWhereKeyJson,
                        ACustomWhereSQL,
                        ARecordDataJsonStr,
                        ACode,
                        ADesc,
                        ADataJson,
                        AIsMustExist,
                        AIsNeedSubQueryList
                        );
end;


//constructor TCommonRestIntfItem.Create(ADBModule:TBaseDatabaseModule);
//begin
//  Inherited Create;
//
//
//  SetDBModule(ADBModule);
//
//
////  //数据库模块
////  if ADBModule=nil then
////  begin
////    //自已创建
////    IsDBModuleSelfOwn:=True;
////    DBModule := GlobalDatabaseModuleClass.Create;
////  end
////  else
////  begin
////    //引用别人的
////    IsDBModuleSelfOwn:=False;
////    DBModule:=ADBModule;
////  end;
//
//end;

destructor TCommonRestIntfItem.Destroy;
begin
  if IsDBModuleSelfOwn then
  begin
    FreeAndNil(DBModule);
  end;

  inherited;
end;

function TCommonRestIntfItem.DoPrepareStart(var AError:String): Boolean;
begin
  Result := False;

  if IsDBModuleSelfOwn then
  begin
    //自己的数据库模块
    //连接数据库
    Result := DBModule.DoPrepareStart(AError);
  end
  else
  begin
    //引用的数据库模块
    Result:=DBModule.DoPrepareStart(AError);
  end;

  if Result then
  begin
    Result:=Init(DBModule);
  end;

  Self.FIsStarted:=Result;

end;

function TCommonRestIntfItem.DoPrepareStop: Boolean;
begin
  Result := False;

  if IsDBModuleSelfOwn then
  begin
    //断开数据库
    Result := DBModule.DoPrepareStop;
  end
  else
  begin
    Result:=True;
  end;

  Self.FIsStarted:=False;
end;

function TCommonRestIntfItem.GetDBCharset: String;
begin
  Result:='';
  if DBModule<>nil then
  begin
    Result:=Self.DBModule.DBConfig.FDBCharset;//MYSQL
  end;

end;

function TCommonRestIntfItem.GetDBDataBaseName: String;
begin
  Result:='';
  if DBModule<>nil then
  begin
    Result:=Self.DBModule.DBConfig.FDBDataBaseName;//MYSQL
  end;

end;

function TCommonRestIntfItem.GetDBHostName: String;
begin
  Result:='';
  if DBModule<>nil then
  begin
    Result:=Self.DBModule.DBConfig.FDBHostName;//MYSQL
  end;

end;

function TCommonRestIntfItem.GetDBHostPort: String;
begin
  Result:='';
  if DBModule<>nil then
  begin
    Result:=Self.DBModule.DBConfig.FDBHostPort;//MYSQL
  end;

end;

function TCommonRestIntfItem.GetDBPassword: String;
begin
  Result:='';
  if DBModule<>nil then
  begin
    Result:=Self.DBModule.DBConfig.FDBPassword;//MYSQL
  end;

end;

function TCommonRestIntfItem.GetDBType: String;
begin
  Result:='';
  if DBModule<>nil then
  begin
    Result:=Self.DBModule.DBConfig.FDBType;//MYSQL
  end;

end;

function TCommonRestIntfItem.GetDBUserName: String;
begin
  Result:='';
  if DBModule<>nil then
  begin
    Result:=Self.DBModule.DBConfig.FDBUserName;//MYSQL
  end;

end;

procedure TCommonRestIntfItem.SetDBCharset(const Value: String);
begin
  if DBModule<>nil then
  begin
    Self.DBModule.DBConfig.FDBCharset:=Value;//MYSQL
  end;
end;

procedure TCommonRestIntfItem.SetDBDataBaseName(const Value: String);
begin
  if DBModule<>nil then
  begin
    Self.DBModule.DBConfig.FDBDataBaseName:=Value;//MYSQL
  end;
end;

procedure TCommonRestIntfItem.SetDBHostName(const Value: String);
begin
  if DBModule<>nil then
  begin
    Self.DBModule.DBConfig.FDBHostName:=Value;//MYSQL
  end;
end;

procedure TCommonRestIntfItem.SetDBHostPort(const Value: String);
begin
  if DBModule<>nil then
  begin
    Self.DBModule.DBConfig.FDBHostPort:=Value;//MYSQL
  end;
end;

procedure TCommonRestIntfItem.SetDBModule(ADBModule: TBaseDatabaseModule);
begin
  //数据库模块
  if ADBModule=nil then
  begin
    //自已创建
    IsDBModuleSelfOwn:=True;
    DBModule :=GlobalDatabaseModuleClass.Create;
  end
  else
  begin
    //引用别人的
    IsDBModuleSelfOwn:=False;
    DBModule:=ADBModule;
  end;

end;

procedure TCommonRestIntfItem.SetDBPassword(const Value: String);
begin
  if DBModule<>nil then
  begin
    Self.DBModule.DBConfig.FDBPassword:=Value;//MYSQL
  end;
end;

procedure TCommonRestIntfItem.SetDBType(const Value: String);
begin
  if DBModule<>nil then
  begin
    Self.DBModule.DBConfig.FDBType:=Value;//MYSQL
  end;

end;

procedure TCommonRestIntfItem.SetDBUserName(const Value: String);
begin
  if DBModule<>nil then
  begin
    Self.DBModule.DBConfig.FDBUserName:=Value;//MYSQL
  end;
end;

procedure TCommonRestIntfItem.SetIsInited(const Value: Boolean);
var
  AError:String;
begin
  if FIsInited<>Value then
  begin
    FIsInited:=Value;

    if FIsInited then
    begin
      FIsInited:=Self.DoPrepareStart(AError);
    end;
  end;

end;

{ TBaseQueryList }

function TBaseQueryList.FindItemByCaption(ACaption: String): TBaseQueryItem;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if SameText(Items[I].Caption,ACaption) then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TBaseQueryList.Find(AName: String): TBaseQueryItem;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if SameText(Items[I].Name,AName) then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;
function TBaseQueryList.GetItem(Index: Integer): TBaseQueryItem;
begin
  Result:=TBaseQueryItem(Inherited Items[Index]);
end;

{ TBaseQueryItem }

function TBaseQueryItem.GetSubQueryRecordListOfMasterRecord(
  ADBModule: TBaseDatabaseModule;
  AAppID:Integer;
  ASubQueryList: TBaseQueryList;
  AMasterJson: ISuperObject;
  ARecordDataJsonStr:String;
  ADBHelper: TBaseDBHelper;
  var ACode:Integer;
  var ADesc:String
  ): Boolean;
var
  I: Integer;
  ADataJson:ISuperObject;
  AMasterFieldName:String;
begin
  Result:=False;
  for I := 0 to ASubQueryList.Count-1 do
  begin
        //将每个从表的记录列表,存入一条主表记录


        if ASubQueryList[I].RelateToMasterFieldName='' then
        begin
          //做为子表,一定要和主表有关联的字段
          //比如商家商品主表和规格从表
          //规格从表与商品主表相关联的字段为shop_fid
          ACode:=FAIL;
          ADesc:=ASubQueryList[I].Name+'作为子表一定设置与主表的关联字段!';
          Exit;
        end;




        AMasterFieldName:=Self.PKFieldName;
        if ASubQueryList[I].RelateToMasterMasterFieldName<>'' then
        begin
          AMasterFieldName:=ASubQueryList[I].RelateToMasterMasterFieldName;
        end;



        //    //旧的格式,暂时去掉
        //    if Not ASubQueryList[I].GetSubDetailRecordList(
        //              ADBModule,
        //              AMasterJson.V[AMasterFieldName],
        //              AMasterJson,
        //              ADBHelper,
        //              ACode,
        //              ADesc
        //              ) then
        //    begin
        //      Exit;
        //    end;




        //新的格式
        if Not ASubQueryList[I].GetRecordList(
                  ADBModule,
                  ADBHelper,
                  AAppID,
                  1,
                  MaxInt,
                  //关联主表字段的条件
                  //比如order_fid=133
                  GetWhereConditions([ASubQueryList[I].RelateToMasterFieldName],
                                      [AMasterJson.V[AMasterFieldName]]),
                  '',
                  '',
                  1,
                  0,
                  //参数
                  ARecordDataJsonStr,
                  //查询子表
                  1,
                  ACode,
                  ADesc,
                  ADataJson,
                  AMasterJson
                  ) then
        begin
          Exit;
        end;


        //老的格式
        AMasterJson.A[ASubQueryList[I].Name+'List']:=ADataJson.A['RecordList'];



    //    //新的格式
    //    AMasterJson.A['SubQueryList'].O[I]:=ADataJson;
    //    AMasterJson.A['SubQueryList'].O[I].S['name']:=ASubQueryList[I].Name;
    //    AMasterJson.A['SubQueryList'].O[I].S['caption']:=ASubQueryList[I].Caption;

  end;
  Result:=True;
end;

function TBaseQueryItem.GetSubQueryRecordListOfMasterRecordArray(
  ADBModule: TBaseDatabaseModule;
  AAppID:Integer;
  ASubQueryList: TBaseQueryList;
  AMasterJsonArray: ISuperArray;
  ARecordDataJsonStr:String;
  ADBHelper: TBaseDBHelper;
  var ACode:Integer;
  var ADesc:String
  ): Boolean;
var
  I: Integer;
begin
  Result:=False;
  if (ASubQueryList.Count>0) and (AMasterJsonArray.Length>0) then
  begin
      for I := 0 to AMasterJsonArray.Length-1 do
      begin
        //遍历主表的每条记录
        if not GetSubQueryRecordListOfMasterRecord(
                  ADBModule,
                  AAppID,
                  ASubQueryList,
                  AMasterJsonArray.O[I],
                  ARecordDataJsonStr,
                  ADBHelper,
                  ACode,
                  ADesc) then
        begin
          Exit;
        end;
      end;
  end;
  Result:=True;
end;

function TBaseQueryItem.AddRecord(
  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper:TBaseDBHelper;
  AAppID:Integer;
  ARecordDataJson: ISuperObject;
  AMasterRecordDataJson:ISuperObject;
  var ACode:Integer;
  var ADesc:String;
  var ADataJson:ISuperObject
  ):Boolean;
var
  I: Integer;

  AParamNames:TStringDynArray;
  AParamValues:TVariantDynArray;

  AIsTempSQLDBHelper:Boolean;

  ASubQueryName:String;
  ASubQueryItem:TBaseQueryItem;

  ADataJson2:ISuperObject;

  ANewParamNames:TStringDynArray;
  ANewParamValues:TVariantDynArray;

  AGetFieldValueResult:Integer;

  AIndex:Integer;
  AUniqueFieldValueStr:String;
  ASelectAfterInsert:String;
begin
  ACode:=FAIL;
  ADesc:='';
  ADataJson:=nil;

  Result:=False;


  if Self.TableName='' then
  begin
    ADesc:=Trans(Name+'的TableName不能为空');
    Exit;
  end;



  if not FIsStarted then
  begin
    if not Self.DoPrepareStart(ADesc) then
    begin
      Exit;
    end;
    FIsStarted:=True;
  end;



  AIsTempSQLDBHelper:=False;
  if ASQLDBHelper=nil then
  begin
    //从连接池中取一个DBHelper
    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
    begin
      Exit;
    end;
    AIsTempSQLDBHelper:=True;
  end;
  try



      try


          //提交的字段检测,是否满足对应的条件,比如大于0,不能为空等
          if Self.FieldValueCheckList.Count>0 then
          begin
            if not Self.FieldValueCheckList.Check(ASQLDBHelper,ARecordDataJson,ADesc) then
            begin
              Exit;
            end;
          end;


          //如果这个表有appid,那么自动填入此字段
          if Self.HasAppIDField then
          begin
            ARecordDataJson.I['appid']:=AAppID;
          end;


          //如果是MYSQL的数据库,每个表我都会建这两个字段
          //初始这两个字段
          if (ASQLDBHelper.DBType='') or SameText(ASQLDBHelper.DBType,'MYSQL') then
          begin
            ARecordDataJson.S['createtime']:=StdDateTimeToStr(Now);
            ARecordDataJson.I['is_deleted']:=0;
          end;


          //处理添加数据之前的数据流转
          for I := 0 to Self.BeforeAddRecordDataFlowActionList.Count-1 do
          begin
            if not BeforeAddRecordDataFlowActionList[I].Process(
//                      ADBModule,
                      ASQLDBHelper,
                      AAppID,
                      ARecordDataJson,
                      nil,
                      ADataJson,
                      AMasterRecordDataJson,
                      ACode,
                      ADesc,
                      ADataJson2
                      ) then
            begin
              Exit;
            end;
          end;



          //获取需要添加的字段,去掉表中不存在的字段
          ConvertJsonToArray(ARecordDataJson,
                              AParamNames,
                              AParamValues,
                              TableFieldNameList);



          //作为从表,被添加记录时需要插入的字段
          if (AMasterRecordDataJson<>nil) and (Self.DetailAddRecordFieldList.Count>0) then
          begin
              SetLength(ANewParamNames,Length(AParamNames)+Self.DetailAddRecordFieldList.Count);
              SetLength(ANewParamValues,Length(AParamValues)+Self.DetailAddRecordFieldList.Count);
              //复制
              for I := 0 to Length(AParamNames)-1 do
              begin
                ANewParamNames[I]:=AParamNames[I];
                ANewParamValues[I]:=AParamValues[I];
              end;

              //加上新的
              AIndex:=0;
              for I := 0 to Self.DetailAddRecordFieldList.Count-1 do
              begin
                  AGetFieldValueResult:=DetailAddRecordFieldList[I].GetFieldValue(
//                          ADBModule,
                          ASQLDBHelper,
                          AAppID,
                          ARecordDataJson,
                          nil,
                          nil,
                          AMasterRecordDataJson,
                          ACode,
                          ADesc,
                          ANewParamValues[Length(AParamNames)+AIndex]
                          );
                  case AGetFieldValueResult of
                    0:
                    begin
                        //失败
                        Exit;
                    end;
                    1:
                    begin
                        //成功
                        ANewParamNames[Length(AParamNames)+AIndex]:=DetailAddRecordFieldList[I].FieldName;
                        Inc(AIndex);
                    end;
                    2:
                    begin
                        //不存在,但不是必须的
                        ANewParamNames[Length(AParamNames)+AIndex]:='';
                    end;
                  end;
              end;


              if AIndex<Self.DetailAddRecordFieldList.Count then
              begin
                  //存在没有的字段
                  //要去掉
                  ANewParamNames:=CutStringArray(ANewParamNames,Length(ANewParamNames)-(Self.DetailAddRecordFieldList.Count-AIndex));
                  ANewParamValues:=CutVariantArray(ANewParamValues,Length(ANewParamValues)-(Self.DetailAddRecordFieldList.Count-AIndex));
              end;


              //还原
              AParamNames:=ANewParamNames;
              AParamValues:=ANewParamValues;
          end;


          if Length(AParamNames)=0 then
          begin
            ACode:=SUCC;
            ADesc:=Trans('没有要插入的字段');
            Exit;
          end;



          //添加记录时字段重复性校验
          if (Self.UniqueFieldNameList.Count>0) and (Self.TableName<>'') then
          begin
            for I := 0 to UniqueFieldNameList.Count-1 do
            begin

                AUniqueFieldValueStr:='';
                if ARecordDataJson.Contains(UniqueFieldNameList[I]) and not VarIsNULL(ARecordDataJson.V[UniqueFieldNameList[I]]) then
                begin
                  AUniqueFieldValueStr:=ARecordDataJson.V[UniqueFieldNameList[I]];
                end;

                if AUniqueFieldValueStr<>'' then//有值
                begin
                    if not ASQLDBHelper.SelfQuery(' SELECT * FROM '+TableName
                                                      +' WHERE '+UniqueFieldNameList[I]+'=:'+UniqueFieldNameList[I]
                                                      //要加上appid的条件,不然所有app都只能一个name同名
                                                      +' AND appid=:appid '
                                                      +' AND '+GetIFNULLName(ASQLDBHelper.DBType)+'('+Self.DeleteFieldName+',0)=0 ',
                                                      [UniqueFieldNameList[I],'appid'],
                                                      [ARecordDataJson.V[UniqueFieldNameList[I]],AAppID],
                                                      asoOpen) then
                    begin
                      //查询失败
                      ADesc:=ASQLDBHelper.LastExceptMessage;
                      Exit;
                    end;
                    //存在
                    if not ASQLDBHelper.Query.Eof then
                    begin
                      ADesc:='已经存在相同的'+UniqueFieldCaptionList[I];
                      Exit;
                    end;
                end;
            end;
          end;



//          if (ASQLDBHelper.DBType='') or SameText(ASQLDBHelper.DBType,'MYSQL') then
//          begin



              //select @@IDENTITY
              ASelectAfterInsert:='SELECT * FROM '+TableName+' WHERE '+PKFieldName+'=last_insert_id()';
              if SameText(ASQLDBHelper.DBType,'MSSQL') then
              begin
                ASelectAfterInsert:='SELECT 1 ';

                  {$IFNDEF SQLSERVER_2000}
                  if PKFieldName<>'' then
                  begin
                    //将@@IDENTITY转换为字符串,不然会报错
                    ASelectAfterInsert:='SELECT * FROM '+TableName+' WHERE '+PKFieldName+'=CAST(@@IDENTITY AS nvarchar(20))  ';
                  end
                  else
                  begin
                    ASelectAfterInsert:='SELECT 1 ';
                  end;
                  {$ENDIF}
              end;



              //MYSQL的方式
              //需要返回数据集
              if not ASQLDBHelper.SelfQuery_EasyInsert(
                      TableName,
                      AParamNames,
                      AParamValues,
                      //获取刚插入的这条数据
                      ASelectAfterInsert,
                      asoOpen
                      ) then
              begin
                  //添加失败
                  ADesc:=ASQLDBHelper.LastExceptMessage;
                  Exit;
              end;

              ADataJson:=JSonFromRecord(ASQLDBHelper.Query);



              
              //处理子表的数据插入
              if ARecordDataJson.Contains('SubQueryList') then
              begin
                  if not Self.ProcessSubQueryListRecord(
                                ADBModule,
                                ASQLDBHelper,
                                AAppID,
                                ADataJson,
                                ARecordDataJson.A['SubQueryList'],
                                ACode,
                                ADesc,
                                ADataJson2
                                ) then
                  begin
                    Exit;
                  end;
              end;

              

              //处理添加数据的数据流转
              for I := 0 to Self.AddRecordDataFlowActionList.Count-1 do
              begin
                if not AddRecordDataFlowActionList[I].Process(
//                          ADBModule,
                          ASQLDBHelper,
                          AAppID,
                          ARecordDataJson,
                          nil,
                          ADataJson,
                          AMasterRecordDataJson,
                          ACode,
                          ADesc,
                          ADataJson2
                          ) then
                begin
                  Exit;
                end;
              end;





                  

                  
              //成功
              ADesc:=Trans(Caption+'添加成功');
              ACode:=SUCC;

              Result:=True;
                  
//<<<<<<< .mine
////          end
////          else
////          begin
////              //SQLSERVER�ķ�ʽ
////              //��Ҫ�������ݼ
////              if not ASQLDBHelper.SelfQuery_EasyInsert(
////                      TableName,
////                      AParamNames,
////                      AParamValues,
////                      //��ȡ�ղ������������,SQlSERVERȡ����
////                      '',
////                      asoExec
////                      ) then
////              begin
////                  //����ʧ��
////                  ADesc:=ASQLDBHelper.LastExceptMessage;
////                  Exit;
////              end;
////
////
////              //û����ת������������
////
////
////              //�ɹ
////              ADesc:=Trans(Caption+'���ӳɹ�');
////              ACode:=SUCC;
////
////
////              Result:=True;
////
////          end;
//||||||| .r10989
//          end
//          else
//          begin
//              //SQLSERVER�ķ�ʽ
//              //��Ҫ�������ݼ
//              if not ASQLDBHelper.SelfQuery_EasyInsert(
//                      TableName,
//                      AParamNames,
//                      AParamValues,
//                      //��ȡ�ղ������������,SQlSERVERȡ����
//                      '',
//                      asoExec
//                      ) then
//              begin
//                  //����ʧ��
//                  ADesc:=ASQLDBHelper.LastExceptMessage;
//                  Exit;
//              end;
//=======
//          end
//          else
//          begin
//              //SQLSERVER的方式
//              //需要返回数据集
//              if not ASQLDBHelper.SelfQuery_EasyInsert(
//                      TableName,
//                      AParamNames,
//                      AParamValues,
//                      //获取刚插入的这条数据,SQlSERVER取不出
//                      '',
//                      asoExec
//                      ) then
//              begin
//                  //添加失败
//                  ADesc:=ASQLDBHelper.LastExceptMessage;
//                  Exit;
//              end;
//>>>>>>> .r11181
//
//<<<<<<< .mine
//||||||| .r10989
//
//              //û����ת������������
//
//
//              //�ɹ
//              ADesc:=Trans(Caption+'���ӳɹ�');
//              ACode:=SUCC;
//
//
//              Result:=True;
//
//          end;
//
//=======
//
//              //没有流转等其他功能了
//
//
//              //成功
//              ADesc:=Trans(Caption+'添加成功');
//              ACode:=SUCC;
//
//
//              Result:=True;
//
//          end;
//
//>>>>>>> .r11181
      except
        on E:Exception do
        begin
          ADesc:=E.Message;
          uBaseLog.HandleException(E,'TTableCommonRestServerItem.AddRecord');
        end;
      end;

  finally
    if AIsTempSQLDBHelper then
    begin
      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
    end;
  end;
end;

function TBaseQueryItem.RealDeleteRecord(
  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper:TBaseDBHelper;
  AAppID:Integer;
  AWhereKeyJson, ACustomWhereSQL: String;
  var ACode:Integer;
  var ADesc:String;
  var ADataJson:ISuperObject
  ):Boolean;
var
  I: Integer;
  AWhereKeyJsonArray:ISuperArray;

  ATempWhere:String;


  AIsTempSQLDBHelper:Boolean;
begin
  ACode:=FAIL;
  ADesc:='';
  ADataJson:=nil;
  Result:=False;


  if (AWhereKeyJson='') and (ACustomWhereSQL='') then
  begin
    ADesc:=Trans('条件不能同时为空');
    Exit;
  end;



  AIsTempSQLDBHelper:=False;
  if ASQLDBHelper=nil then
  begin
    //从连接池中取一个DBHelper
    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
    begin
      Exit;
    end;
    AIsTempSQLDBHelper:=True;
  end;
  try


      try
          AWhereKeyJsonArray:=TSuperArray.Create(AWhereKeyJson);
          if Not CheckWhereKeyJsonArray(AWhereKeyJsonArray,ADesc) then
          begin
            Exit;
          end;



          //条件字段
          //ACustomWhereSQL,如WHERE fid=1
          //GetWhereConditionSQL,如 AND (user_fid=22)
          ATempWhere:=ACustomWhereSQL
                      +GetWhereConditionSQL(AWhereKeyJsonArray);

          //加上AppID的条件,避免查询到别的客户的数据
          if Self.HasAppIDField then
          begin
            ATempWhere:=ATempWhere+' AND appid='+IntToStr(AAppID)+' ';
          end;



          if (Trim(ATempWhere)<>'') then
          begin
            ATempWhere:=' WHERE (1=1) '+ATempWhere;
          end;


          if ASQLDBHelper.SelfQuery(
                  ' DELETE FROM '+TableName+' '
                  +ATempWhere,
                  [],
                  [],
                  asoExec
                  ) then
          begin
              //成功
              ADesc:=Trans(Caption+'删除成功');
              ACode:=SUCC;

              Result:=True;
          end
          else
          begin
              //删除失败
              ADesc:=ASQLDBHelper.LastExceptMessage;
          end;

      except
        on E:Exception do
        begin
          ADesc:=E.Message;
          uBaseLog.HandleException(E,'TTableCommonRestServerItem.RealDeleteRecord');
        end;
      end;

  finally
    if AIsTempSQLDBHelper then
    begin
      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
    end;
  end;
end;

function TBaseQueryItem.RealDeleteRecordList(ADBModule: TBaseDatabaseModule;
  ASQLDBHelper: TBaseDBHelper; AAppID: Integer; AWhereJsonArray: ISuperArray;
  var ACode: Integer; var ADesc: String; var ADataJson: ISuperObject): Boolean;
var
  I: Integer;
begin
  Result:=True;

  for I := 0 to AWhereJsonArray.Length-1 do
  begin
    if not RealDeleteRecord(
              ADBModule,
              ASQLDBHelper,
              AAppID,
              AWhereJsonArray.O[I].S['where_key_json'],
              AWhereJsonArray.O[I].S['where_sql'],
              ACode,
              ADesc,
              ADataJson) then
    begin
      Result:=False;
      Exit;
    end;
  end;
end;

procedure TBaseQueryItem.SetSelect(const Value: TStringList);
begin
  FSelect.Assign(Value);
end;

function TBaseQueryItem.AddRecordList(
  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper:TBaseDBHelper;
  AAppID:Integer;
  ARecordDataJsonArray: ISuperArray;
  AMasterRecordDataJson:ISuperObject;
  var ACode: Integer;
  var ADesc: String;
  var ADataJson: ISuperObject):Boolean;
var
  I: Integer;
begin
  Result:=True;

  for I := 0 to ARecordDataJsonArray.Length-1 do
  begin
    if not AddRecord(ADBModule,
                      ASQLDBHelper,
                      AAppID,
                      ARecordDataJsonArray.O[I],
                      AMasterRecordDataJson,
                      ACode,
                      ADesc,
                      ADataJson) then
    begin
      Result:=False;
      Exit;
    end;
  end;
end;

procedure TBaseQueryItem.AssignTo(Dest: TPersistent);
var
  ADest:TBaseQueryItem;
begin
  inherited;

  if (Dest<>nil) and (Dest is TBaseQueryItem) then
  begin
    ADest:=TBaseQueryItem(Dest);

//    ADest.DatabaseName:=DatabaseName;


    //表名,用于拼成查询语句
    ADest.TableName:=TableName;

    //列表查询语句,
    //比如:SELECT * FROM 维修项目
    ADest.Select:=Select;
    //默认的查询条件,需要包含AND,OR
    //比如:AND is_deleted=0
    ADest.DefaultWhere:=DefaultWhere;
    //默认的排序条件,不包含ORDER BY
    ADest.DefaultOrderBy:=DefaultOrderBy;


    //主键字段
    ADest.PKFieldName:=PKFieldName;


    //是否有AppID字段
    //如果有,那么在查询语句中会加入 AND appid=**** 的条件
    ADest.HasAppIDField:=HasAppIDField;


    //从表查询列表(引用)
//    SubQueryList:TBaseQueryList;


    //关联主表的字段名,比如维修单项目表中的维修单号是主表的主键
    ADest.RelateToMasterFieldName:=RelateToMasterFieldName;
    ADest.RelateToMasterMasterFieldName:=RelateToMasterMasterFieldName;

    //删除字段
    ADest.DeleteFieldName:=DeleteFieldName;



//  add_record_data_flow_action_list
//  before_add_record_data_flow_action_list
//  before_update_record_data_flow_action_list
//  update_record_data_flow_action_list
//
//
//  where_key_translator_list
//  select_param_list
//  detail_add_record_field_list
//  summary_query_field_list
//  no_update_field_name_list
//  no_update_field_caption_list
//  field_value_check_list




    //父层级节点的字段名
    ADest.LevelParentFieldName:=LevelParentFieldName;
    ADest.LevelChildFieldName:=LevelChildFieldName;
    //根节点的值
    ADest.LevelFieldRootNodeValue:=LevelFieldRootNodeValue;



//    //自定义查询条件的事件,用于处理特殊的查询字段
//    OnGetWhereConditionItemSQLEvent:TOnGetWhereConditionItemSQLEvent;

//    //根据用户类型所需要的条件
//    QueryUserTypeConditions:TUserTypeConditionList;




//    //添加记录时的数据流转列表
//    AddRecordDataFlowActionList:TDataFlowActionList;
//    BeforeAddRecordDataFlowActionList:TDataFlowActionList;
//
//    //修改记录时的数据流转列表
//    BeforeUpdateRecordDataFlowActionList:TDataFlowActionList;
//    UpdateRecordDataFlowActionList:TDataFlowActionList;
//
//
//    //自定义搜索条件字段列表,用于比如将一个keyword转换成多个数据库字段名name,phone
//    WhereKeyTranslatorList:TWhereKeyTranslatorList;
//
//    //查询语句的条件参数列表
//    SelectParamList:TSelectParamList;
//
//    //作为从表,被主表添加记录时的字段列表
//    DetailAddRecordFieldList:TDataFlowFieldList;
//
//
//    //汇总查询字段
//    SummaryQueryFieldList:TStringList;
//
//    //不更新的字段,比如主鍵,自增字段
//    NoUpdateFieldList:TStringList;
//
//    //不重复的字段,插入和更新之前需要检验
//    UniqueFieldNameList:TStringList;
//    UniqueFieldCaptionList:TStringList;
//
//    //数据提交时字段检测列表
//    FieldValueCheckList:TFieldValueCheckList;


  end;

end;

//function TBaseQueryItem.CheckQueryUserTypeCondition(AUserType: Integer;
//  AWhereKeyJson: String; var AError: String): Boolean;
//var
//  AUserTypeCondition:TUserTypeCondition;
//  AWhereKeyJsonArray:ISuperArray;
//  I: Integer;
//  AIndex:Integer;
//  AFieldNames:TStringList;
//begin
//  Result:=True;
//
//  AUserTypeCondition:=Self.QueryUserTypeConditions.Find(AUserType);
//  if AUserTypeCondition<>nil then
//  begin
//      AWhereKeyJsonArray:=TSuperArray.Create(AWhereKeyJson);
//      AFieldNames:=TStringList.Create;
//      AFieldNames.Assign(AUserTypeCondition.MustFieldNames);
//      try
//        for I := 0 to AWhereKeyJsonArray.Length-1 do
//        begin
//          AIndex:=AFieldNames.IndexOf(AWhereKeyJsonArray.O[I].S['name']);
//          if AIndex<>-1 then
//          begin
//            AFieldNames.Delete(AIndex);
//          end;
//        end;
//        if AFieldNames.Count>0 then
//        begin
//          Result:=False;
//          AError:='请传入条件:'+AFieldNames.CommaText+'';
//        end;
//      finally
//        FreeAndNil(AFieldNames);
//      end;
//
//  end;
//end;

function TBaseQueryItem.CheckWhereKeyJsonArray(AWhereKeyJsonArray: ISuperArray;
  var AError: String): Boolean;
var
  I: Integer;
begin
  Result:=False;
  try
      for I := 0 to AWhereKeyJsonArray.Length-1 do
      begin
        if    AWhereKeyJsonArray.O[I].Contains('logical_operator')
          and AWhereKeyJsonArray.O[I].Contains('name')
          and AWhereKeyJsonArray.O[I].Contains('operator')
          and AWhereKeyJsonArray.O[I].Contains('value')
          and (AWhereKeyJsonArray.O[I].S['name']<>'')
          and (AWhereKeyJsonArray.O[I].S['operator']<>'') then
        begin
          //格式正确
        end
        else
        begin
          AError:='WhereKeyJson的格式不正确 '+AWhereKeyJsonArray.AsJson;
          Exit;
        end;
      end;
      Result:=True;
  except
    on E:Exception do
    begin
      AError:='WhereKeyJson的格式不正确-未知';
      uBaseLog.HandleException(E,'TBaseQueryItem.CheckWhereKeyJsonArray Name:'+Name+' Caption:'+Caption+' WhereKeyJson的格式不正确');
    end;
  end;
end;

constructor TBaseQueryItem.Create;
begin
  Inherited Create;

  FSelect:=TStringList.Create;


  TableFieldNameList:=TStringList.Create;
//  QueryFieldNameList:=TStringList.Create;
  SubQueryList:=TBaseQueryList.Create(ooReference);


//  QueryUserTypeConditions:=TUserTypeConditionList.Create;

  //添加记录时的数据流转列表
  BeforeAddRecordDataFlowActionList:=TDataFlowActionList.Create;
  AddRecordDataFlowActionList:=TDataFlowActionList.Create;

  //修改记录时的数据流转列表
  BeforeUpdateRecordDataFlowActionList:=TDataFlowActionList.Create;
  UpdateRecordDataFlowActionList:=TDataFlowActionList.Create;


  //自定义搜索条件
  WhereKeyTranslatorList:=TWhereKeyTranslatorList.Create;


  SelectParamList:=TSelectParamList.Create;

  DetailAddRecordFieldList:=TDataFlowFieldList.Create;


  SummaryQueryFieldList:=TStringList.Create;

  NoUpdateFieldList:=TStringList.Create;

  UniqueFieldNameList:=TStringList.Create;
  UniqueFieldCaptionList:=TStringList.Create;


  LevelFieldRootNodeValue:='0';
  LevelParentFieldName:='parent_fid';
  LevelChildFieldName:='fid';


  FieldValueCheckList:=TFieldValueCheckList.Create;


end;

constructor TBaseQueryItem.Create(
  //接口名称
  AName:String;
  //标题
  ACaption:String;
  //表名
  ATableName:String;
  //查询语句
  ASelect:String;
  ADefaultWhere:String;
  //删除字段
  ADeleteFieldName:String;
  //主键字段
  APKFieldName:String;
  //默认的排序字段
  ADefaultOrderBy:String;
  //是否拥有AppID字段
  AHasAppIDField:Boolean;
  ARelateToMasterFieldName:String);
begin

  Create;


  //接口名称
  Name:=AName;
  //标题
  Caption:=ACaption;

  //表名
  TableName:=ATableName;

  //列表查询语句
  Select.Text:=ASelect;
  DefaultWhere:=ADefaultWhere;


  //删除字段
  DeleteFieldName:=ADeleteFieldName;


  //主键字段
  PKFieldName:=APKFieldName;
  //默认的排序
  DefaultOrderBy:=ADefaultOrderBy;

  HasAppIDField:=AHasAppIDField;

  RelateToMasterFieldName:=ARelateToMasterFieldName;


  //默认的查询条件
  if (Trim(Select.Text)='') and (Trim(TableName)<>'') then
  begin
    Select.Text:='SELECT * FROM '+TableName+' ';
  end;


//  if Trim(TableName)<>'' then
//  begin
//    //需要更新表格数据的
//    if Trim(PKFieldName)='' then
//    begin
//      raise Exception.Create(Trans('主键不能为空'));
//    end;
//  end;



end;

function TBaseQueryItem.CustomLoadFromJson(ASuperObject: ISuperObject): Boolean;
begin
    Result:=False;


    //
//    DatabaseName:=ASuperObject.S['database_name'];
    //表名,用于拼成查询语句
    TableName:=ASuperObject.S['table_name'];



    //列表查询语句,
    //比如:SELECT * FROM 维修项目
    Select.Text:=ASuperObject.S['select_sql'];
    //默认的查询条件,需要包含AND,OR
    //比如:AND is_deleted=0
    DefaultWhere:=ASuperObject.S['default_where'];
    //默认的排序条件,不包含ORDER BY
    DefaultOrderBy:=ASuperObject.S['default_order_by'];


    //主键字段
    PKFieldName:=ASuperObject.S['pk_field_name'];


    //是否有AppID字段
    //如果有,那么在查询语句中会加入 AND appid=**** 的条件
    try
//      HasAppIDField:=ASuperObject.B['has_appid_field'];
      HasAppIDField:=(ASuperObject.I['has_appid_field']=1);
    except

    end;


    //从表查询列表(引用)
//    SubQueryList:TBaseQueryList;


    //关联主表的字段名,比如维修单项目表中的维修单号是主表的主键
    RelateToMasterFieldName:=ASuperObject.S['relate_to_master_field_name'];
    RelateToMasterMasterFieldName:=ASuperObject.S['relate_to_master_master_field_name'];

    //删除字段
    DeleteFieldName:=ASuperObject.S['delete_field_name'];



//  add_record_data_flow_action_list
//  before_add_record_data_flow_action_list
//  before_update_record_data_flow_action_list
//  update_record_data_flow_action_list
//
//
//  where_key_translator_list
//  select_param_list
//  detail_add_record_field_list
//  summary_query_field_list
//  no_update_field_name_list
//  no_update_field_caption_list
//  field_value_check_list


    //父层级节点的字段名
    LevelParentFieldName:=ASuperObject.S['level_parent_field_name'];
    LevelChildFieldName:=ASuperObject.S['level_child_field_name'];
    //根节点的值
    LevelFieldRootNodeValue:=ASuperObject.S['level_field_root_node_value'];



//    //自定义查询条件的事件,用于处理特殊的查询字段
//    OnGetWhereConditionItemSQLEvent:TOnGetWhereConditionItemSQLEvent;

//    //根据用户类型所需要的条件
//    QueryUserTypeConditions:TUserTypeConditionList;




//    //添加记录时的数据流转列表
//    AddRecordDataFlowActionList:TDataFlowActionList;
//    BeforeAddRecordDataFlowActionList:TDataFlowActionList;
//
//    //修改记录时的数据流转列表
//    BeforeUpdateRecordDataFlowActionList:TDataFlowActionList;
//    UpdateRecordDataFlowActionList:TDataFlowActionList;
//
//
//    //自定义搜索条件字段列表,用于比如将一个keyword转换成多个数据库字段名name,phone
//    WhereKeyTranslatorList:TWhereKeyTranslatorList;
//
//    //查询语句的条件参数列表
//    SelectParamList:TSelectParamList;
//
//    //作为从表,被主表添加记录时的字段列表
//    DetailAddRecordFieldList:TDataFlowFieldList;
//
//
//    //汇总查询字段
//    SummaryQueryFieldList:TStringList;
//
//    //不更新的字段,比如主鍵,自增字段
//    NoUpdateFieldList:TStringList;
//
//    //不重复的字段,插入和更新之前需要检验
//    UniqueFieldNameList:TStringList;
//    UniqueFieldCaptionList:TStringList;
//
//    //数据提交时字段检测列表
//    FieldValueCheckList:TFieldValueCheckList;



    Result:=True;

end;

function TBaseQueryItem.CustomSaveToJson(ASuperObject: ISuperObject): Boolean;
begin

    Result:=False;

    //
//    ASuperObject.S['database_name']:=DatabaseName;
    //表名,用于拼成查询语句
    ASuperObject.S['table_name']:=TableName;

    //列表查询语句,
    //比如:SELECT * FROM 维修项目
    ASuperObject.S['select_sql']:=Select.Text;
    //默认的查询条件,需要包含AND,OR
    //比如:AND is_deleted=0
    ASuperObject.S['default_where']:=DefaultWhere;
    //默认的排序条件,不包含ORDER BY
    ASuperObject.S['default_order_by']:=DefaultOrderBy;


    //主键字段
    ASuperObject.S['pk_field_name']:=PKFieldName;


    //是否有AppID字段
    //如果有,那么在查询语句中会加入 AND appid=**** 的条件
    ASuperObject.I['has_appid_field']:=Ord(HasAppIDField);


    //从表查询列表(引用)
//    SubQueryList:TBaseQueryList;


    //关联主表的字段名,比如维修单项目表中的维修单号是主表的主键
    ASuperObject.S['relate_to_master_field_name']:=RelateToMasterFieldName;
    ASuperObject.S['relate_to_master_master_field_name']:=RelateToMasterMasterFieldName;

    //删除字段
    ASuperObject.S['delete_field_name']:=DeleteFieldName;



//  add_record_data_flow_action_list
//  before_add_record_data_flow_action_list
//  before_update_record_data_flow_action_list
//  update_record_data_flow_action_list
//
//
//  where_key_translator_list
//  select_param_list
//  detail_add_record_field_list
//  summary_query_field_list
//  no_update_field_name_list
//  no_update_field_caption_list
//  field_value_check_list




    //父层级节点的字段名
    ASuperObject.S['level_parent_field_name']:=LevelParentFieldName;
    ASuperObject.S['level_child_field_name']:=LevelChildFieldName;
    //根节点的值
    ASuperObject.S['level_field_root_node_value']:=LevelFieldRootNodeValue;



//    //自定义查询条件的事件,用于处理特殊的查询字段
//    OnGetWhereConditionItemSQLEvent:TOnGetWhereConditionItemSQLEvent;

//    //根据用户类型所需要的条件
//    QueryUserTypeConditions:TUserTypeConditionList;




//    //添加记录时的数据流转列表
//    AddRecordDataFlowActionList:TDataFlowActionList;
//    BeforeAddRecordDataFlowActionList:TDataFlowActionList;
//
//    //修改记录时的数据流转列表
//    BeforeUpdateRecordDataFlowActionList:TDataFlowActionList;
//    UpdateRecordDataFlowActionList:TDataFlowActionList;
//
//
//    //自定义搜索条件字段列表,用于比如将一个keyword转换成多个数据库字段名name,phone
//    WhereKeyTranslatorList:TWhereKeyTranslatorList;
//
//    //查询语句的条件参数列表
//    SelectParamList:TSelectParamList;
//
//    //作为从表,被主表添加记录时的字段列表
//    DetailAddRecordFieldList:TDataFlowFieldList;
//
//
//    //汇总查询字段
//    SummaryQueryFieldList:TStringList;
//
//    //不更新的字段,比如主鍵,自增字段
//    NoUpdateFieldList:TStringList;
//
//    //不重复的字段,插入和更新之前需要检验
//    UniqueFieldNameList:TStringList;
//    UniqueFieldCaptionList:TStringList;
//
//    //数据提交时字段检测列表
//    FieldValueCheckList:TFieldValueCheckList;


    Result:=True;

end;

function TBaseQueryItem.UpdateRecordList(
  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper:TBaseDBHelper;
  AAppID:Integer;
  ARecordDataJsonArray: ISuperArray;
  var ACode: Integer;
  var ADesc: String;
  var ADataJson: ISuperObject):Boolean;
var
  I: Integer;
begin
  Result:=True;

  for I := 0 to ARecordDataJsonArray.Length-1 do
  begin
    if not UpdateRecord(ADBModule,
                        ASQLDBHelper,
                        AAppID,
                        ARecordDataJsonArray.O[I].O['record_data_json'],
                        ARecordDataJsonArray.O[I].S['where_key_json'],
                        ARecordDataJsonArray.O[I].S['where_sql'],
                        ACode,ADesc,ADataJson) then
    begin
      Result:=False;
      Exit;
    end;
  end;
end;

function TBaseQueryItem.DeleteRecord(
  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper:TBaseDBHelper;
  AAppID:Integer;
  AWhereKeyJson,
  ACustomWhereSQL: String;
  var ACode:Integer;
  var ADesc:String;
  var ADataJson:ISuperObject
  ):Boolean;
var
  I: Integer;
  AWhereKeyJsonArray:ISuperArray;

  ATempWhere:String;


  AIsTempSQLDBHelper:Boolean;
begin
  ACode:=FAIL;
  ADesc:='';
  ADataJson:=nil;
  Result:=False;


  //从数据库连接池中取出可用链接
  if DeleteFieldName='' then
  begin
    ADesc:=Trans('DeleteFieldName不能为空');
    Exit;
  end;

  if (AWhereKeyJson='') and (ACustomWhereSQL='') then
  begin
    ADesc:=Trans('条件不能同时为空');
    Exit;
  end;



  AIsTempSQLDBHelper:=False;
  if ASQLDBHelper=nil then
  begin
    //从连接池中取一个DBHelper
    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
    begin
      Exit;
    end;
    AIsTempSQLDBHelper:=True;
  end;
  try



      try
          AWhereKeyJsonArray:=TSuperArray.Create(AWhereKeyJson);
          if Not CheckWhereKeyJsonArray(AWhereKeyJsonArray,ADesc) then
          begin
            Exit;
          end;



          //条件字段
          //ACustomWhereSQL,如WHERE fid=1
          //GetWhereConditionSQL,如 AND (user_fid=22)
          ATempWhere:=ACustomWhereSQL
                      +GetWhereConditionSQL(AWhereKeyJsonArray);


          //加上AppID的条件,避免查询到别的客户的数据
          if Self.HasAppIDField then
          begin
            ATempWhere:=ATempWhere+' AND appid='+IntToStr(AAppID)+' ';
          end;


          if (Trim(ATempWhere)<>'') then
          begin
            ATempWhere:=' WHERE (1=1) '+ATempWhere;
          end;


          if ASQLDBHelper.SelfQuery(
                  ' UPDATE '+TableName+' SET '+DeleteFieldName+'=1 '
                  +ATempWhere,
                  [],
                  [],
                  asoExec
                  ) then
          begin
              //成功
              ADesc:=Trans(Caption+'删除成功');
              ACode:=SUCC;
              Result:=True;
          end
          else
          begin
              //删除失败
              ADesc:=ASQLDBHelper.LastExceptMessage;
          end;

      except
        on E:Exception do
        begin
          ADesc:=E.Message;
          uBaseLog.HandleException(E,'TTableCommonRestServerItem.DeleteRecord');
        end;
      end;

  finally
    if AIsTempSQLDBHelper then
    begin
      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
    end;
  end;
end;

function TBaseQueryItem.DeleteRecordList(ADBModule: TBaseDatabaseModule;
  ASQLDBHelper: TBaseDBHelper; AAppID: Integer;
  AWhereJsonArray: ISuperArray;
  var ACode: Integer; var ADesc: String; var ADataJson: ISuperObject): Boolean;
var
  I: Integer;
begin
  Result:=True;

  for I := 0 to AWhereJsonArray.Length-1 do
  begin
    if not DeleteRecord(
              ADBModule,
              ASQLDBHelper,
              AAppID,
              AWhereJsonArray.O[I].A['where_key_json'].AsJson,
              AWhereJsonArray.O[I].S['where_sql'],
              ACode,ADesc,ADataJson) then
    begin
      Result:=False;
      Exit;
    end;
  end;

end;

destructor TBaseQueryItem.Destroy;
begin
  FreeAndNil(FSelect);

  FreeAndNil(SubQueryList);


  FreeAndNil(TableFieldNameList);
//  FreeAndNil(QueryFieldNameList);

//  FreeAndNil(QueryUserTypeConditions);

  FreeAndNil(BeforeAddRecordDataFlowActionList);
  FreeAndNil(AddRecordDataFlowActionList);
  FreeAndNil(BeforeUpdateRecordDataFlowActionList);
  FreeAndNil(UpdateRecordDataFlowActionList);

  FreeAndNil(WhereKeyTranslatorList);

  FreeAndNil(SelectParamList);

  FreeAndNil(DetailAddRecordFieldList);

  FreeAndNil(SummaryQueryFieldList);

  FreeAndNil(NoUpdateFieldList);

  FreeAndNil(UniqueFieldNameList);
  FreeAndNil(UniqueFieldCaptionList);


  FreeAndNil(FieldValueCheckList);
  inherited;
end;

function TBaseQueryItem.GetWhereConditionSQL(AWhereKeyJsonArray: ISuperArray): String;
var
  I:Integer;
  ASubWhereConditionSQL:String;
  AWhereConditionItemSQL:String;
  AWhereKeyTranslator:TWhereKeyTranslator;
begin
  Result:='';
  ASubWhereConditionSQL:='';

  for I := 0 to AWhereKeyJsonArray.Length-1 do
  begin
    if AWhereKeyJsonArray.O[I].Contains('conditions') then
    begin
        //子条件列表
        ASubWhereConditionSQL:=GetWhereConditionSQL(AWhereKeyJsonArray.O[I].A['conditions']);

        Result:=Result
              +' '+AWhereKeyJsonArray.O[I].S['logical_operator']
              +' ('+ASubWhereConditionSQL+') ';

    end
    else
    begin

        //自定义获取条件表达式
        AWhereKeyTranslator:=Self.WhereKeyTranslatorList.Find(AWhereKeyJsonArray.O[I].S['name']);
        if AWhereKeyTranslator<>nil then
        begin
            AWhereConditionItemSQL:=AWhereKeyTranslator.DoGetWhereConditionItemSQL(
                                        AWhereKeyJsonArray.O[I].S['logical_operator'],
                                        AWhereKeyJsonArray.O[I].S['operator'],
                                        AWhereKeyJsonArray.O[I].V['value']);
        end
        else
        begin

            if Assigned(Self.OnGetWhereConditionItemSQLEvent) then
            begin
              AWhereConditionItemSQL:=OnGetWhereConditionItemSQLEvent(Self,
                                        AWhereKeyJsonArray.O[I].S['logical_operator'],
                                        AWhereKeyJsonArray.O[I].S['name'],
                                        AWhereKeyJsonArray.O[I].S['operator'],
                                        AWhereKeyJsonArray.O[I].V['value']);
            end
            else
            begin
              //单个条件
              AWhereConditionItemSQL:=GetDefaultWhereConditionItemSQL(
                                          AWhereKeyJsonArray.O[I].S['logical_operator'],
                                          AWhereKeyJsonArray.O[I].S['name'],
                                          AWhereKeyJsonArray.O[I].S['operator'],
                                          AWhereKeyJsonArray.O[I].V['value']);

            end;

        end;


        Result:=Result+AWhereConditionItemSQL;
    end;
  end;
end;

function TBaseQueryItem.GetExecProcParamSQL(AWhereKeyJsonArray: ISuperArray): String;
var
  I:Integer;
  AValueStr:String;
//  ASubWhereConditionSQL:String;
//  AWhereConditionItemSQL:String;
//  AWhereKeyTranslator:TWhereKeyTranslator;
begin
  Result:='';
//  ASubWhereConditionSQL:='';

  for I := 0 to AWhereKeyJsonArray.Length-1 do
  begin
    if Result<>'' then Result:=Result+',';


//    if AWhereKeyJsonArray.O[I].Contains('conditions') then
//    begin
//        //子条件列表
//        ASubWhereConditionSQL:=GetWhereConditionSQL(AWhereKeyJsonArray.O[I].A['conditions']);
//
//        Result:=Result
//              +' '+AWhereKeyJsonArray.O[I].S['logical_operator']
//              +' ('+ASubWhereConditionSQL+') ';
//
//    end
//    else
//    begin
//
//        //自定义获取条件表达式
//        AWhereKeyTranslator:=Self.WhereKeyTranslatorList.Find(AWhereKeyJsonArray.O[I].S['name']);
//        if AWhereKeyTranslator<>nil then
//        begin
//            AWhereConditionItemSQL:=AWhereKeyTranslator.DoGetWhereConditionItemSQL(
//                                        AWhereKeyJsonArray.O[I].S['logical_operator'],
//                                        AWhereKeyJsonArray.O[I].S['operator'],
//                                        AWhereKeyJsonArray.O[I].V['value']);
//        end
//        else
//        begin
//
//            if Assigned(Self.OnGetWhereConditionItemSQLEvent) then
//            begin
//              AWhereConditionItemSQL:=OnGetWhereConditionItemSQLEvent(Self,
//                                        AWhereKeyJsonArray.O[I].S['logical_operator'],
//                                        AWhereKeyJsonArray.O[I].S['name'],
//                                        AWhereKeyJsonArray.O[I].S['operator'],
//                                        AWhereKeyJsonArray.O[I].V['value']);
//            end
//            else
//            begin


//              //单个条件
//              AWhereConditionItemSQL:=GetDefaultWhereConditionItemSQL(
//                                          AWhereKeyJsonArray.O[I].S['logical_operator'],
//                                          AWhereKeyJsonArray.O[I].S['name'],
//                                          AWhereKeyJsonArray.O[I].S['operator'],
//                                          AWhereKeyJsonArray.O[I].V['value']);

//            end;
//
//        end;

        AValueStr:=AWhereKeyJsonArray.O[I].V['value'];
        case AWhereKeyJsonArray.O[I].GetType('value') of
          varString,varUString:
          begin
            AValueStr:=QuotedStr(AWhereKeyJsonArray.O[I].V['value']);
          end;
        end;

        Result:=Result+''''+AValueStr+'''';
//    end;
  end;
end;


function TBaseQueryItem.Init(ADBModule: TBaseDatabaseModule): Boolean;
var
  ACode:Integer;
  ADesc:String;
  ADataJson:ISuperObject;
  I: Integer;
begin
  Result:=False;


  FFieldNameList.Clear;
  Self.TableFieldNameList.Clear;


//  if DirectoryExists('C:\MyFiles') then
//  begin
//    Result:=True;
//    Exit;
//  end;

      //获取表的字段列表
      if Self.TableName<>'' then
      begin

          if DoGetFieldList(ADBModule,
                            nil,
                            ' SELECT * FROM '+TableName+' ',
                            ACode,
                            ADesc,
                            ADataJson) then
          begin
              for I := 0 to ADataJson.A['FieldList'].Length-1 do
              begin
                if Self.NoUpdateFieldList.IndexOf(ADataJson.A['FieldList'].O[I].S['name'])=-1 then
                begin
                    TableFieldNameList.Add(ADataJson.A['FieldList'].O[I].S['name']);
                end;
              end;
              Result:=True;
          end;
      end
      else
      begin
          Result:=True;
      end;
      FFieldNameList.Assign(TableFieldNameList);




      if (Self.SelectParamList.Count=0) and (not IsStoreProcedure) then//(Pos('exec',LowerCase(Self.Select.Text))=0) then
      begin
          //获取查询语句的字段列表,避免查询出错
    //      Self.QueryFieldNameList.Clear;
          if DoGetFieldList(ADBModule,
    //<<<<<<< .mine
    //                      nil,
    //                      Select,
    //                      ACode,
    //                      ADesc,
    //                      ADataJson) then
    //||||||| .r10989
    //                      nil,
    //                      Self.Select,
    //                      ACode,
    //                      ADesc,
    //                      ADataJson) then
    //=======
                            nil,
                            Self.Select.Text,
                            ACode,
                            ADesc,
                            ADataJson) then
    //>>>>>>> .r11181
          begin
            for I := 0 to ADataJson.A['FieldList'].Length-1 do
            begin
    //          QueryFieldNameList.Add(ADataJson.A['FieldList'].O[I].S['name']);

              FFieldNameList.Add(ADataJson.A['FieldList'].O[I].S['name']);
            end;
            Result:=True;
          end;
      end;




      //初始子表,子查询
      if Result then
      begin
        for I := 0 to Self.SubQueryList.Count-1 do
        begin
          Self.SubQueryList[I].Init(ADBModule);
        end;
      end;

end;

function TBaseQueryItem.IsEmpty: Boolean;
begin
  Result:=(Inherited IsEmpty) and (FSelect.Text='');
end;

function TBaseQueryItem.IsStoreProcedure: Boolean;
begin
  Result:=(Pos('exec ',LowerCase(Self.Select.Text))>0);
end;

function TBaseQueryItem.ProcessSubQueryListRecord(
  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper:TBaseDBHelper;
  AAppID:Integer;
//  AMasterPKFieldValue:Variant;
  AMasterRecordDataJson:ISuperObject;
  ASubQueryListJsonArray:ISuperArray;
  var ACode:Integer;
  var ADesc:String;
  var ADataJson:ISuperObject
  ): Boolean;
var
  I: Integer;

  AIsTempSQLDBHelper:Boolean;

  ASubQueryName:String;
  ASubQueryItem:TBaseQueryItem;
begin
  ACode:=FAIL;
  ADesc:='';
  ADataJson:=nil;

  Result:=False;


  AIsTempSQLDBHelper:=False;
  if ASQLDBHelper=nil then
  begin
    //从连接池中取一个DBHelper
    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
    begin
      Exit;
    end;
    AIsTempSQLDBHelper:=True;
  end;
  try



      try
                
          for I := 0 to ASubQueryListJsonArray.Length-1 do
          begin
              if not ProcessSubQueryItemRecord(
                         ADBModule,
                         ASQLDBHelper,
                         AAppID,
//                         AMasterPKFieldValue,
                         AMasterRecordDataJson,
                         ASubQueryListJsonArray.O[I],
                         ACode,
                         ADesc,
                         ADataJson
                          ) then
              begin
                Exit;
              end;
          end;

                  
          //成功
          ADesc:=Trans('明细表处理成功');
          ACode:=SUCC;
                  
          Result:=True;


      except
        on E:Exception do
        begin
          ADesc:=E.Message;
          uBaseLog.HandleException(E,'TTableCommonRestServerItem.AddRecord');
        end;
      end;

  finally
    if AIsTempSQLDBHelper then
    begin
      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
    end;
  end;
end;

function TBaseQueryItem.ProcessSubQueryItemRecord(
  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper:TBaseDBHelper;
  AAppID:Integer;
//  AMasterPKFieldValue:Variant;
  AMasterRecordDataJson:ISuperObject;
  ASubQueryItemJson:ISuperObject;
  var ACode:Integer;
  var ADesc:String;
  var ADataJson:ISuperObject
  ): Boolean;
var
  I: Integer;

  AIsTempSQLDBHelper:Boolean;

  ASubQueryName:String;
  ASubQueryItem:TBaseQueryItem;
begin
  ACode:=FAIL;
  ADesc:='';
  ADataJson:=nil;

  Result:=False;


  AIsTempSQLDBHelper:=False;
  if ASQLDBHelper=nil then
  begin
    //从连接池中取一个DBHelper
    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
    begin
      Exit;
    end;
    AIsTempSQLDBHelper:=True;
  end;
  try



      try


          ASubQueryName:=ASubQueryItemJson.S['name'];
          ASubQueryItem:=Self.SubQueryList.Find(ASubQueryName);
          if ASubQueryItem=nil then
          begin
            ADesc:=Trans('找不到明细表')+ASubQueryName;
            Exit;
          end;



          //添加明细
          if ASubQueryItemJson.A['add_record_data_json_array'].Length>0 then
          begin
//              //添加明细
//              for I := 0 to ASubQueryItemJson.A['add_record_data_json_array'].Length-1 do
//              begin
//                  //添加的时候要主键的值
//                  ASubQueryItemJson.A['add_record_data_json_array']
//                    .O[I].V[ASubQueryItem.RelateToMasterFieldName]:=AMasterPKFieldValue;
//              end;

              if not ASubQueryItem.AddRecordList(
                        ADBModule,
                        ASQLDBHelper,
                        AAppID,
                        ASubQueryItemJson.A['add_record_data_json_array'],
                        AMasterRecordDataJson,
                        ACode,
                        ADesc,
                        ADataJson
                        ) then
              begin
                Exit;
              end;
          end;



          //修改明细
          if ASubQueryItemJson.A['update_record_data_json_array'].Length>0 then
          begin
              if not ASubQueryItem.UpdateRecordList(
                        ADBModule,
                        ASQLDBHelper,
                        AAppID,
                        ASubQueryItemJson.A['update_record_data_json_array'],
                        ACode,
                        ADesc,
                        ADataJson
                        ) then
              begin
                Exit;
              end;
          end;



          //删除明细
          if ASubQueryItemJson.A['del_where_json_array'].Length>0 then
          begin
              if not ASubQueryItem.DeleteRecordList(
                        ADBModule,
                        ASQLDBHelper,
                        AAppID,
                        ASubQueryItemJson.A['del_where_json_array'],
                        ACode,
                        ADesc,
                        ADataJson
                        ) then
              begin
                Exit;
              end;
          end;



          //成功
          ADesc:=Trans('明细表处理成功');
          ACode:=SUCC;
                  
          Result:=True;


      except
        on E:Exception do
        begin
          ADesc:=E.Message;
          uBaseLog.HandleException(E,'TTableCommonRestServerItem.AddRecord');
        end;
      end;

  finally
    if AIsTempSQLDBHelper then
    begin
      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
    end;
  end;
end;

function TBaseQueryItem.GetSubDetailRecordList(
  ADBModule: TBaseDatabaseModule;
  AMasterFieldValue: Variant;
  AMasterDataJson: ISuperObject;
  ADBHelper:TBaseDBHelper;
  var ACode:Integer;
  var ADesc:String
  ): Boolean;
var
  ASQL:String;
begin
  Result:=False;

//  //SELECT * FROM 养护套餐项目
//  ASQL:=GetQueryQueryPageSQL(Select,
//             ASQLDBHelper.DBType,
//             1,
//             MaxInt,
//             ' AND '+Self.RelateToMasterFieldName+'=:'+AMasterFieldValue+' ',
//    //                             ' AND '+Self.RelateToMasterFieldName+'=:'+Self.RelateToMasterFieldName+' ',
//             //GetDefaultWhereConditionItemSQL('AND',RelateToMasterFieldName,'=',AMasterFieldValue),
//             DefaultOrderBy
//             );


  //全部查出来
  ASQL:=Select.Text;
  ASQL:=ASQL+' WHERE (1=1) '+DefaultWhere;
  ASQL:=ASQL
        +' AND '+Self.RelateToMasterFieldName+'=:'+Self.RelateToMasterFieldName+' ';
  if DefaultOrderBy<>'' then
  begin
    ASQL:=ASQL
          +' ORDER BY '+DefaultOrderBy;
  end;

  if ADBHelper.SelfQuery(ASQL,
                        [Self.RelateToMasterFieldName],
                        [AMasterFieldValue],
                        asoOpen) then
  begin
      JSonFromDataSetTo(ADBHelper.Query,Name+'List',AMasterDataJson);
      
      Result:=True;
  end
  else
  begin
      //返回查询失败的原因
      ADesc:=ADBHelper.LastExceptMessage;
  end;  
end;



function TBaseQueryItem.GetFieldList(ADBModule: TBaseDatabaseModule;
  ASQLDBHelper: TBaseDBHelper;
  var ACode: Integer;
  var ADesc: String;
  var ADataJson: ISuperObject):Boolean;
begin
  if Self.SelectParamList.Count>0 then
  begin
    //如果有搜索条件,那么从表里查询出来
    Result:=DoGetFieldList(
              ADBModule,
              ASQLDBHelper,
              ' SELECT * FROM '+TableName+' ',
              ACode,
              ADesc,
              ADataJson
              );
  end
  else
  begin
    Result:=DoGetFieldList(
              ADBModule,
              ASQLDBHelper,
              Select.Text,
              ACode,
              ADesc,
              ADataJson
              );
  end;
end;

function TBaseQueryItem.DoGetFieldList(ADBModule: TBaseDatabaseModule;
  ASQLDBHelper: TBaseDBHelper;
  ASelect:String;
  var ACode: Integer;
  var ADesc: String;
  var ADataJson: ISuperObject):Boolean;
var
  I: Integer;

  ACode2: Integer;
  ADesc2: String;
  ADataJson2: ISuperObject;

  AIsTempSQLDBHelper:Boolean;
begin
  ACode:=FAIL;
  ADesc:='';
  ADataJson:=nil;
  Result:=False;


  AIsTempSQLDBHelper:=False;
  if ASQLDBHelper=nil then
  begin
    //从连接池中取一个DBHelper
    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
    begin
      Exit;
    end;
    AIsTempSQLDBHelper:=True;
  end;
  try


      try

          //需要返回数据集
          if not ASQLDBHelper.SelfQuery(
                  ASelect+' WHERE (1<>1) ',
                  [],
                  [],
                  asoOpen
                  ) then
          begin
              //查询失败
              ADesc:=ASQLDBHelper.LastExceptMessage;
              Exit;
          end;


          //成功
          ADataJson:=TSuperObject.Create();
          ADataJson.S['name']:=Self.Name;
          ADataJson.S['caption']:=Self.Caption;
          ADataJson.A['FieldList']:=GetDatasetFieldDefsJson(ASQLDBHelper.Query);


          //获取明细表的字段列表
          for I := 0 to Self.SubQueryList.Count-1 do
          begin
            if SubQueryList[I].GetFieldList(ADBModule,
                                            ASQLDBHelper,
                                            ACode2,
                                            ADesc2,
                                            ADataJson2) then
            begin
              ADataJson.A['SubQueryList'].O[I]:=ADataJson2;
            end
            else
            begin
              Exit;
            end;
          end;


          ADesc:=Trans(Caption+'的字段列表查询成功');
          ACode:=SUCC;

          Result:=True;

      except
        on E:Exception do
        begin
          ADesc:=E.Message;
          uBaseLog.HandleException(E,'TQueryCommonRestServerItem.GetRecordList');
        end;
      end;

  finally
    if AIsTempSQLDBHelper then
    begin
      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
    end;
  end;
end;


function TBaseQueryItem.DoPrepareStart(var AError: String): Boolean;
begin
  Result:=True;
  Self.FIsStarted:=True;

end;

function TBaseQueryItem.GetRecordList(
  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper:TBaseDBHelper;
  AAppID:Integer;
  APageIndex,
  APageSize: Integer;
  AWhereKeyJson: String;
  AOrderBy:String;
  //自带的Where条件
  ACustomWhereSQL:String;
  //是否需要总数
  AIsNeedSumCount:Integer;
  AIsNeedReturnLevel:Integer;
  ARecordDataJsonStr:String;
  AIsNeedSubQueryList:Integer;
  var ACode:Integer;
  var ADesc:String;
  var ADataJson:ISuperObject;
  AMasterRecordJson:ISuperObject
  ):Boolean;
var
  I: Integer;

  AWhereKeyJsonArray:ISuperArray;
  ARecordDataJson:ISuperObject;
  AOrderByJsonObject:ISuperObject;

  ATempExecProcParams:String;

  ASelect:String;
  ATempWhere:String;
  ATempOrderBy:String;

  AOrderByNames:TStringDynArray;
  AOrderByValues:TVariantDynArray;

  AIsTempSQLDBHelper:Boolean;
  ASumCount:Integer;

  AMasterJsonArray:ISuperArray;
  ADataJson2:ISuperObject;
  AUsedItemCount:Integer;

  ASelectParamNames:TStringDynArray;
  ASelectParamValues:TVariantDynArray;

  ASummaryQueryFields:String;
begin
  ACode:=FAIL;
  ADesc:='';
  ADataJson:=nil;

  Result:=False;





  if not FIsStarted then
  begin
    if not Self.DoPrepareStart(ADesc) then
    begin
      Exit;
    end;
    FIsStarted:=True;
  end;



  ADataJson:=TSuperObject.Create();

  //是否需要返回层级结构,比如树型分类
  if AIsNeedReturnLevel=1 then
  begin
    if Trim(Self.LevelParentFieldName)='' then
    begin
      ADesc:=Trans('LevelParentFieldName不能为空');
      Exit;
    end;
    if Trim(Self.LevelChildFieldName)='' then
    begin
      ADesc:=Trans('LevelChildFieldName不能为空');
      Exit;
    end;
  end;


  AIsTempSQLDBHelper:=False;
  if ASQLDBHelper=nil then
  begin
    //从连接池中取一个DBHelper
    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
    begin
      Exit;
    end;
    AIsTempSQLDBHelper:=True;
  end;
  try


      try
          if AWhereKeyJson='null' then
          begin
            AWhereKeyJsonArray:=TSuperArray.Create('');
          end
          else
          begin
            AWhereKeyJsonArray:=TSuperArray.Create(AWhereKeyJson);
          end;
          //检测查询条件的Json格式是否合法
          if Not CheckWhereKeyJsonArray(AWhereKeyJsonArray,ADesc) then
          begin
            Exit;
          end;


          ARecordDataJson:=TSuperObject.Create(ARecordDataJsonStr);


          ATempExecProcParams:=GetExecProcParamSQL(AWhereKeyJsonArray);



          //条件字段
          //ACustomWhereSQL,如WHERE fid=1
          //GetWhereConditionSQL,如 AND (user_fid=22)
          ATempWhere:=DefaultWhere
                      //自定义的条件字符串
                      +ACustomWhereSQL
                      //自定义的条件JSON
                      +GetWhereConditionSQL(AWhereKeyJsonArray);
          //加上AppID的条件,避免查询到别的客户的数据
          if Self.HasAppIDField then
          begin
            ATempWhere:=ATempWhere+' AND appid='+IntToStr(AAppID)+' ';
          end;

          //如果有删除字段,那么加一个条件,只显示没有删除的
          if (Trim(DeleteFieldName)<>'') then
          begin
//            if SameText(ASQLDBHelper.DBType,'MYSQL') or (ASQLDBHelper.DBType='') then
//            begin
              ATempWhere:=ATempWhere+' AND ('+GetIFNULLName(ASQLDBHelper.DBType)+'('+DeleteFieldName+',0)=0) ';
//            end;
          end;

          if (Trim(ATempWhere)<>'') then
          begin
            ATempWhere:=' WHERE (1=1) '+ATempWhere;
          end;


          //排序规则
          ATempOrderBy:='';
          if (AOrderBy<>'') then
          begin
            ATempOrderBy:=' ORDER BY '+AOrderBy;
          end
          else if DefaultOrderBy<>'' then
          begin
            ATempOrderBy:=' ORDER BY '+DefaultOrderBy;
          end;




          //处理自定义查询参数
          ASelectParamNames:=[];
          ASelectParamValues:=[];
          if Self.SelectParamList.Count>0 then
          begin

              SetLength(ASelectParamNames,Self.SelectParamList.Count);
              SetLength(ASelectParamValues,Self.SelectParamList.Count);
              for I := 0 to Self.SelectParamList.Count-1 do
              begin
                  if SelectParamList[I].GetFieldValue(
//                            ADBModule,
                            ASQLDBHelper,
                            AAppID,
                            ARecordDataJson,
                            AWhereKeyJsonArray,
                            nil,
                            AMasterRecordJson,
                            ACode,
                            ADesc,
                            ASelectParamValues[I])=0 then
                  begin
                    Exit;
                  end;
                  ASelectParamNames[I]:=SelectParamList[I].FieldName;
              end;
          end;





          //返回总记录数
          ASumCount:=0;
          if (AIsNeedSumCount=1) or (Self.SummaryQueryFieldList.Count>0) then
          begin
              SummaryQueryFieldList.QuoteChar:=#0;
              ASummaryQueryFields:=SummaryQueryFieldList.DelimitedText;
              if ASummaryQueryFields<>'' then
              begin
                ASummaryQueryFields:=','+ASummaryQueryFields;
              end;

              if ASQLDBHelper.SelfQuery(
                    'SELECT COUNT(*) AS SumCount'+ASummaryQueryFields+' FROM '
                        +'('+Select.Text+ATempWhere+') Z ',
                    ASelectParamNames,
                    ASelectParamValues,
                    asoOpen) then
              begin

                  ASumCount:=ASQLDBHelper.Query.FieldByName('SumCount').AsInteger;
                  ADataJson.I['SumCount']:=ASumCount;
                  ADataJson.O['Summary']:=JSonFromRecord(ASQLDBHelper.Query);

              end
              else
              begin
                  //查询失败
                  ADesc:=ASQLDBHelper.LastExceptMessage;
                  Exit;
              end;
          end;



          ASelect:=Self.Select.Text;
          if Select.Count=1 then
          begin
            ASelect:=Select[0];//避免产生换行符,造成调用存储过程格式不对
          end;



          //需要返回数据集
          if not ASQLDBHelper.SelfQuery(

                  //生成分页查询条件
                  GetQueryQueryPageSQL(
                                        ASQLDBHelper,
                                        ASelect,//Self.Select.Text,
                                        ASQLDBHelper.DBType,
                                        APageIndex,
                                        APageSize,
                                        ATempWhere,
                                        ATempOrderBy,
                                        ASelectParamNames,
                                        ASelectParamValues,
                                        IsStoreProcedure,
                                        ATempExecProcParams
                                        ),

                  ASelectParamNames,
                  ASelectParamValues,
                  asoOpen
                  ) then
          begin
              //查询失败
              ADesc:=ASQLDBHelper.LastExceptMessage;
              Exit;
          end;



          //成功
          //ADataJson:=JSonFromDataSet(ASQLDBHelper.Query,'RecordList');
          JSonFromDataSetTo(ASQLDBHelper.Query,'RecordList',ADataJson);



//          //需要返回总数
//          if AIsNeedSumCount=1 then
//          begin
//              ADataJson.I['SumCount']:=ASumCount;
//          end;



          //需要返回层级列表
          if (AIsNeedReturnLevel=1) then
          begin
              ADataJson2:=TSuperObject.Create;
              //转换成树型层级结构
              ConvertJsonArrayToLevel(
                  ADataJson.A['RecordList'],
                  LevelChildFieldName,
                  LevelParentFieldName,
                  LevelFieldRootNodeValue,//有些根节点的值是0,有些根节点的值是001
                  ADataJson2.A['RecordList']
                  );
              ADataJson:=ADataJson2;
          end;


          //返回从表的记录列表
          AMasterJsonArray:=ADataJson.A['RecordList'];
          if (AIsNeedSubQueryList=1)  and (SubQueryList.Count>0) and (AMasterJsonArray.Length>0) then
          begin
              if GetSubQueryRecordListOfMasterRecordArray(
                      ADBModule,
                      AAppID,
                      Self.SubQueryList,
                       AMasterJsonArray,
                       ARecordDataJsonStr,
                       ASQLDBHelper,
                       ACode,
                       ADesc
                       ) then
              begin
                ADesc:=Trans(Caption+'列表查询成功');
                ACode:=SUCC;
                Result:=True;
              end
              else
              begin
                Exit;
              end;
          end
          else
          begin
              ADesc:=Trans(Caption+'列表查询成功');
              ACode:=SUCC;
              Result:=True;
          end;
//
//
//          ADesc:=Trans(Caption+'列表查询成功');
//          ACode:=SUCC;
//          Result:=True;

      except
        on E:Exception do
        begin
          ADesc:=E.Message;
          uBaseLog.HandleException(E,'TQueryCommonRestServerItem.GetRecordList');
        end;
      end;

  finally
    if AIsTempSQLDBHelper then
    begin
      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
    end;
  end;

end;


function TBaseQueryItem.GetRecord(
  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper:TBaseDBHelper;
  AAppID:Integer;
  AWhereKeyJson: String;
  //自带的Where条件
  ACustomWhereSQL:String;
  ARecordDataJsonStr:String;

  var ACode:Integer;
  var ADesc:String;
  var ADataJson:ISuperObject;
  AIsMustExist:Boolean;
  AIsNeedSubQueryList:Integer
  ):Boolean;
var
//  AIsTempSQLDBHelper:Boolean;
  ARecordListDataJson:ISuperObject;
//  AMasterJsonArray:ISuperArray;
begin
  ACode:=FAIL;
  ADesc:='';
  ADataJson:=nil;
  Result:=False;



//  AIsTempSQLDBHelper:=False;
//  if ASQLDBHelper=nil then
//  begin
//    //从连接池中取一个DBHelper
//    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
//    begin
//      Exit;
//    end;
//    AIsTempSQLDBHelper:=True;
//  end;
//  try


      if Self.GetRecordList(ADBModule,
                            ASQLDBHelper,
                            AAppID,
                            1,
                            MaxInt,
                            AWhereKeyJson,
                            '',
                            ACustomWhereSQL,
                            0,
                            0,
                            ARecordDataJsonStr,
                            AIsNeedSubQueryList,//1,
                            ACode,
                            ADesc,
                            ARecordListDataJson
                            ) then
      begin



//          //返回从表的记录列表
//          AMasterJsonArray:=ARecordListDataJson.A['RecordList'];
//          if (SubQueryList.Count>0) and (AMasterJsonArray.Length>0) then
//          begin
//              if GetSubQueryRecordListOfMasterRecordArray(
//                      ADBModule,
//                      AAppID,
//                      Self.SubQueryList,
//                       AMasterJsonArray,
//                       ARecordDataJsonStr,
//                       ASQLDBHelper,
//                       ACode,
//                       ADesc
//                       ) then
//              begin
//                ADesc:=Trans(Caption+'列表查询成功');
//                ACode:=SUCC;
//                Result:=True;
//              end
//              else
//              begin
//                Exit;
//              end;
//          end
//          else
//          begin
//              ADesc:=Trans(Caption+'列表查询成功');
//              ACode:=SUCC;
//              Result:=True;
//          end;



          if AIsMustExist then
          begin
              if ARecordListDataJson.A['RecordList'].Length>0 then
              begin
                  //取第一条记录
                  ADataJson:=ARecordListDataJson.A['RecordList'].O[0];
                  Result:=True;
              end
              else
              begin
                  ACode:=FAIL;
                  ADesc:=Trans(Caption+'记录不存在');
              end;
          end
          else
          begin
              if ARecordListDataJson.A['RecordList'].Length>0 then
              begin
                  //取第一条记录
                  ADataJson:=ARecordListDataJson.A['RecordList'].O[0];
                  Result:=True;
              end;
              Result:=True;
          end;
      end;



//  finally
//    if AIsTempSQLDBHelper then
//    begin
//      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
//    end;
//  end;


end;



//function TBaseQueryItem.GetTableFieldList(
//  ADBModule: TBaseDatabaseModule;
//  ASQLDBHelper: TBaseDBHelper;
//  var ACode: Integer; var ADesc: String; var ADataJson: ISuperObject): Boolean;
//var
//  I: Integer;
//
//  AIsTempSQLDBHelper:Boolean;
//begin
//  ACode:=FAIL;
//  ADesc:='';
//  ADataJson:=nil;
//  Result:=False;
//
//
//
//  AIsTempSQLDBHelper:=False;
//  if ASQLDBHelper=nil then
//  begin
//    //从连接池中取一个DBHelper
//    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
//    begin
//      Exit;
//    end;
//    AIsTempSQLDBHelper:=True;
//  end;
//  try
//
//
//
//      try
//
//          //需要返回数据集
//          if ASQLDBHelper.SelfQuery(
//                  'SELECT * FROM '+TableName+' WHERE (1<>1) ',
//                  [],
//                  [],
//                  asoOpen
//                  ) then
//          begin
//              //成功
//              ADataJson:=TSuperObject.Create();
//              ADataJson.A['FieldList']:=GetDatasetFieldDefsJson(ASQLDBHelper.Query);
//
//              ADesc:=Trans(Caption+'的字段列表查询成功');
//              ACode:=SUCC;
//
//              Result:=True;
//
//          end
//          else
//          begin
//              //查询失败
//              ADesc:=ASQLDBHelper.LastExceptMessage;
//              Exit;
//          end;
//
//
//      except
//        on E:Exception do
//        begin
//          ADesc:=E.Message;
//          uBaseLog.HandleException(E,'TTableCommonRestServerItem.GetFieldList');
//        end;
//      end;
//
//  finally
//    if AIsTempSQLDBHelper then
//    begin
//      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
//    end;
//  end;
//end;
//
//function TBaseQueryItem.GetTableRecordList(
//  ADBModule: TBaseDatabaseModule;
//  ASQLDBHelper:TBaseDBHelper;
//  AAppID:Integer;
//  APageIndex,
//  APageSize: Integer;
//  AWhereKeyJson: String;
//  AOrderBy:String;
//  //自带的Where条件
//  ACustomWhereSQL:String;
//  //是否需要总数
//  AIsNeedSumCount:Integer;
//  var ACode:Integer;
//  var ADesc:String;
//  var ADataJson:ISuperObject
//  ):Boolean;
//var
//  I: Integer;
//
//  AWhereKeyJsonArray:ISuperArray;
//  AOrderByJsonObject:ISuperObject;
//
//  ATempWhere:String;
//  ATempOrderBy:String;
//
//  AIsTempSQLDBHelper:Boolean;
//
//  ASumCount:Integer;
//
//  AMasterJsonArray:ISuperArray;
//begin
//  ACode:=FAIL;
//  ADesc:='';
//  ADataJson:=nil;
//  Result:=False;
//
//
//
//  AIsTempSQLDBHelper:=False;
//  if ASQLDBHelper=nil then
//  begin
//    //从连接池中取一个DBHelper
//    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
//    begin
//      Exit;
//    end;
//    AIsTempSQLDBHelper:=True;
//  end;
//  try
//
//      try
//          AWhereKeyJsonArray:=TSuperArray.Create(AWhereKeyJson);
//
//
//          //条件字段
//          //ACustomWhereSQL,如WHERE fid=1
//          //GetWhereConditionSQL,如 AND (user_fid=22)
//          ATempWhere:=GetWhereConditionSQL(AWhereKeyJsonArray);
//
//
//          //只显示没有删除的
//          if (Trim(DeleteFieldName)<>'') then
//          begin
//            if SameText(ASQLDBHelper.DBType,'MYSQL') or (ASQLDBHelper.DBType='') then
//            begin
////              ATempWhere:=ATempWhere+' AND ('+GetIFNULLName(ASQLDBHelper.DBType)+'(A.'+DeleteFieldName+',0)=0) ';//必须要带A,多表联合的时候,要判断is_deleted不能为1
//              ATempWhere:=ATempWhere+' AND ('+GetIFNULLName(ASQLDBHelper.DBType)+'('+DeleteFieldName+',0)=0) ';//必须要带A,多表联合的时候,要判断is_deleted不能为1
//            end
//            else if SameText(ASQLDBHelper.DBType,'MSSQL') then
//            begin
////              ATempWhere:=ATempWhere+' AND (A.'+DeleteFieldName+' IS NOT NULL) ';//必须要带A,多表联合的时候,要判断is_deleted不能为1
//              ATempWhere:=ATempWhere+' AND ('+DeleteFieldName+' IS NOT NULL) ';//必须要带A,多表联合的时候,要判断is_deleted不能为1
//            end;
//          end;
//
//
//          //加上自定义条件
//          ATempWhere:=ACustomWhereSQL
//                      +ATempWhere;
//
//          //加上AppID的条件,避免查询到别的客户的数据
//          if Self.HasAppIDField then
//          begin
//            ATempWhere:=ATempWhere+' AND appid='+IntToStr(AAppID)+' ';
//          end;
//
//
//
//          if (Trim(ATempWhere)<>'') then
//          begin
//            ATempWhere:=' WHERE (1=1) '+ATempWhere;
//          end;
//
//
//
//          //排序规则
//          ATempOrderBy:='';
//          if AOrderBy<>'' then
//          begin
//            ATempOrderBy:=' ORDER BY '+AOrderBy;
//          end
//          else if DefaultOrderBy<>'' then
//          begin
//            ATempOrderBy:=' ORDER BY '+DefaultOrderBy;
//          end;
//
//
//          //返回总数
//          ASumCount:=0;
//          if (AIsNeedSumCount=1) then
//          begin
//            if ASQLDBHelper.SelfQuery('SELECT COUNT(*) FROM '+TableName+' '//' A '//必须要带A,多表联合的时候,要判断is_deleted不能为1
//                                      +ATempWhere,
//                  [],[],asoOpen) then
//            begin
//              ASumCount:=ASQLDBHelper.Query.Fields[0].AsInteger;
//            end
//            else
//            begin
//              //查询失败
//              ADesc:=ASQLDBHelper.LastExceptMessage;
//              Exit;
//            end;
//          end;
//
//
//          //需要返回数据集
//          if ASQLDBHelper.SelfQuery(
//                  GetTableQueryPageSQL(
//                    TableName,
//                    ASQLDBHelper.DBType,
//                    APageIndex,
//                    APageSize,
//                    ATempWhere,
//                    ATempOrderBy),
//                  [],
//                  [],
//                  asoOpen
//                  ) then
//          begin
//              //成功
//              ADataJson:=JSonFromDataSet(ASQLDBHelper.Query,'RecordList');
//              if AIsNeedSumCount=1 then
//              begin
//                ADataJson.I['SumCount']:=ASumCount;
//              end;
//
//
//              //返回明细
//              AMasterJsonArray:=ADataJson.A['RecordList'];
//              if (SubQueryList.Count>0) and (AMasterJsonArray.Length>0) then
//              begin
//                  if GetSubQueryRecordListOfMasterRecordArray(Self.SubQueryList,
//                                   AMasterJsonArray,
//                                   ASQLDBHelper.DBType,
//                                   ASQLDBHelper,
//                                   ADesc
//                                   ) then
//                  begin
//                    ADesc:=Trans(Caption+'列表查询成功');
//                    ACode:=SUCC;
//                    Result:=True;
//                  end
//                  else
//                  begin
//                    //查询失败
//                    Exit;
//                  end;
//              end
//              else
//              begin
//                  ADesc:=Trans(Caption+'列表查询成功');
//                  ACode:=SUCC;
//                  Result:=True;
//              end;
//
//          end
//          else
//          begin
//              //查询失败
//              ADesc:=ASQLDBHelper.LastExceptMessage;
//              Exit;
//          end;
//
//
//      except
//        on E:Exception do
//        begin
//          ADesc:=E.Message;
//          uBaseLog.HandleException(E,'TTableCommonRestServerItem.GetRecordList');
//        end;
//      end;
//
//  finally
//    if AIsTempSQLDBHelper then
//    begin
//      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
//    end;
//  end;
//
//end;
//
//function TBaseQueryItem.GetTableRecord(
//  ADBModule: TBaseDatabaseModule;
//  ASQLDBHelper:TBaseDBHelper;
//  AAppID:Integer;
//  AWhereKeyJson: String;
//  //自带的Where条件
//  ACustomWhereSQL:String;
//  var ACode:Integer;
//  var ADesc:String;
//  var ADataJson:ISuperObject
//  ):Boolean;
//var
//  ARecordListDataJson:ISuperObject;
//begin
//  ACode:=FAIL;
//  ADesc:='';
//  ADataJson:=nil;
//  Result:=False;
//
//  if Self.GetRecordList(ADBModule,
//                        ASQLDBHelper,
//                        AAppID,
//                        1,
//                        MaxInt,
//                        AWhereKeyJson,
//                        '',
//                        ACustomWhereSQL,
//                        0,
//                        ACode,
//                        ADesc,
//                        ARecordListDataJson
//                        ) then
//  begin
//    if ARecordListDataJson.A['RecordList'].Length>0 then
//    begin
//        ADataJson:=ARecordListDataJson.A['RecordList'].O[0];
//        Result:=True;
//    end
//    else
//    begin
//        ACode:=FAIL;
//        ADesc:=Trans(Caption+'记录不存在');
//    end;
//  end;
//
//end;



function TBaseQueryItem.UpdateRecord(
                          ADBModule: TBaseDatabaseModule;
                          ASQLDBHelper:TBaseDBHelper;
                          AAppID:Integer;
                          ARecordDataJson:ISuperObject;
                          //更新条件
                          AWhereKeyJson:String;
                          ACustomWhereSQL:String;
                          var ACode:Integer;
                          var ADesc:String;
                          var ADataJson:ISuperObject
                          ):Boolean;
var
  I: Integer;
  AWhereKeyJsonArray:ISuperArray;

  AParamNames:TStringDynArray;
  AParamValues:TVariantDynArray;

  ATempWhere:String;

  AUniqueFieldValueStr:String;
  APKFieldValue:Variant;

  AIsTempSQLDBHelper:Boolean;

  ADataJson2:ISuperObject;
begin
  ACode:=FAIL;
  ADesc:='';
  ADataJson:=nil;
  Result:=False;



  if Self.TableName='' then
  begin
    ADesc:=Trans(Name+'的TableName不能为空');
    Exit;
  end;

  if (AWhereKeyJson='') and (ACustomWhereSQL='') then
  begin
    ADesc:=Trans('条件不能同时为空');
    Exit;
  end;


  if not FIsStarted then
  begin
    if not Self.DoPrepareStart(ADesc) then
    begin
      Exit;
    end;
    FIsStarted:=True;
  end;




  AIsTempSQLDBHelper:=False;
  if ASQLDBHelper=nil then
  begin
    //从连接池中取一个DBHelper
    if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
    begin
      Exit;
    end;
    AIsTempSQLDBHelper:=True;
  end;
  try


      try



          //提交的字段检测
          if Self.FieldValueCheckList.Count>0 then
          begin
            if not Self.FieldValueCheckList.Check(ASQLDBHelper,ARecordDataJson,ADesc) then
            begin
              Exit;
            end;
          end;




          //放在这里,不然BeforeUpdateRecordDataFlowActionList里面没有了AWhereKeyJsonArray
          AWhereKeyJsonArray:=TSuperArray.Create(AWhereKeyJson);
          if Not CheckWhereKeyJsonArray(AWhereKeyJsonArray,ADesc) then
          begin
            Exit;
          end;






          //处理修改数据之前的数据流转
          for I := 0 to Self.BeforeUpdateRecordDataFlowActionList.Count-1 do
          begin
            if not BeforeUpdateRecordDataFlowActionList[I].Process(
//                      ADBModule,
                      ASQLDBHelper,
                      AAppID,
                      ARecordDataJson,
                      AWhereKeyJsonArray,
                      ADataJson,
                      nil,
                      ACode,
                      ADesc,
                      ADataJson2
                      ) then
            begin
              Exit;
            end;
          end;

          //需要更新的字段
          //��SQLServer�²�֧�ָ���fid
          ConvertJsonToArray(ARecordDataJson,AParamNames,AParamValues,Self.TableFieldNameList,'fid');




          if Length(AParamNames)=0 then
          begin
            ACode:=SUCC;
            ADesc:=Trans('没有要更新的字段');
            Exit;
          end;















          //条件字段
          //ACustomWhereSQL,如WHERE fid=1
          //GetWhereConditionSQL,如 AND (user_fid=22)
          ATempWhere:=GetWhereConditionSQL(AWhereKeyJsonArray);

          ATempWhere:=ACustomWhereSQL
                      +ATempWhere;


          //加上AppID的条件,避免查询到别的客户的数据
          if Self.HasAppIDField then
          begin
            ATempWhere:=ATempWhere+' AND appid='+IntToStr(AAppID)+' ';
          end;


          if (Trim(ATempWhere)<>'') then
          begin
            ATempWhere:=' WHERE (1=1) '+ATempWhere;
          end;




          //修改数据时的重复性校验
          if (Self.UniqueFieldNameList.Count>0)
            and (Self.TableName<>'')
            //存在主键
            and (Self.PKFieldName<>'')
            //条件中有主键,'[{"logical_operator":"AND","name":"fid","operator":"=","value":"39"}]'
            and (LocateJsonArray(AWhereKeyJsonArray,'name',PKFieldName)<>nil) then
          begin
            APKFieldValue:=LocateJsonArray(AWhereKeyJsonArray,'name',PKFieldName).V['value'];
            for I := 0 to UniqueFieldNameList.Count-1 do
            begin
                AUniqueFieldValueStr:='';
                if ARecordDataJson.Contains(UniqueFieldNameList[I]) and not VarIsNULL(ARecordDataJson.V[UniqueFieldNameList[I]]) then
                begin
                  AUniqueFieldValueStr:=ARecordDataJson.V[UniqueFieldNameList[I]];
                end;

                if AUniqueFieldValueStr<>'' then//有值
                begin
                    if not ASQLDBHelper.SelfQuery(' SELECT * FROM '+TableName
                                                      +' WHERE '+UniqueFieldNameList[I]+'=:'+UniqueFieldNameList[I]
                                                      +' AND '+PKFieldName+'<>:PKFieldValue '
                                                      //要加上appid的条件,不然所有app都只能一个name同名
                                                      +' AND appid=:appid '
                                                      +' AND '+GetIFNULLName(ASQLDBHelper.DBType)+'('+Self.DeleteFieldName+',0)=0 ',
                                                  [UniqueFieldNameList[I],
                                                  'PKFieldValue',
                                                  'appid'],
                                                  [ARecordDataJson.V[UniqueFieldNameList[I]],
                                                  APKFieldValue,
                                                  AAppID],
                                                  asoOpen) then
                    begin
                      //查询失败
                      ADesc:=ASQLDBHelper.LastExceptMessage;
                      Exit;
                    end;
                    //存在
                    if not ASQLDBHelper.Query.Eof then
                    begin
                      ADesc:='已经存在相同的'+UniqueFieldCaptionList[I];
                      Exit;
                    end;
                end;
            end;
          end;





          //需要返回数据集
          if not ASQLDBHelper.SelfQuery_EasyUpdate(
                  TableName,
                  AParamNames,
                  AParamValues,
                  ATempWhere,
                  [],
                  [],
                  'SELECT * FROM '+TableName+' '+ATempWhere,
                  asoOpen
                  ) then
          begin
              //修改失败
              ADesc:=ASQLDBHelper.LastExceptMessage;
              Exit;
          end;


          ADataJson:=JSonFromRecord(ASQLDBHelper.Query);



          //处理子表
          if ARecordDataJson.Contains('SubQueryList') then
          begin
              //需要主键
              //取出主键的值
//              APKFieldValue:=ADataJson.V[PKFieldName];


              if not Self.ProcessSubQueryListRecord(
                            ADBModule,
                            ASQLDBHelper,
                            AAppID,
//                            APKFieldValue,
                            ADataJson,
                            ARecordDataJson.A['SubQueryList'],
                            ACode,
                            ADesc,
                            ADataJson2
                            ) then
              begin
                Exit;
              end;
          end;



          //处理修改数据的数据流转
          for I := 0 to Self.UpdateRecordDataFlowActionList.Count-1 do
          begin
            if not UpdateRecordDataFlowActionList[I].Process(
//                      ADBModule,
                      ASQLDBHelper,
                      AAppID,
                      ARecordDataJson,
                      AWhereKeyJsonArray,
                      ADataJson,
                      nil,
                      ACode,
                      ADesc,
                      ADataJson2
                      ) then
            begin
              Exit;
            end;
          end;



          //成功
          ADesc:=Trans(Caption+'修改成功');
          ACode:=SUCC;



          Result:=True;


      except
        on E:Exception do
        begin
          ADesc:=E.Message;
          uBaseLog.HandleException(E,'TTableCommonRestServerItem.AddRecord');
        end;
      end;

  finally
    if AIsTempSQLDBHelper then
    begin
      ADBModule.FreeDBHelperToPool(ASQLDBHelper);
    end;
  end;
end;






//{ TUserTypeCondition }
//
//constructor TUserTypeCondition.Create;
//begin
//  MustFieldNames:=TStringList.Create;
//
//end;
//
//destructor TUserTypeCondition.Destroy;
//begin
//  FreeAndNil(MustFieldNames);
//
//  inherited;
//end;
//
//{ TUserTypeConditionList }
//
//function TUserTypeConditionList.Add(AUserType: Integer;
//  AFieldNamesCommaText:String; ADesc: String): TUserTypeCondition;
//begin
//  Result:=TUserTypeCondition.Create;
//  Result.UserType:=AUserType;
//  Result.MustFieldNames.CommaText:=AFieldNamesCommaText;
//  Result.Desc:=ADesc;
//  Inherited Add(Result)
//end;
//
//function TUserTypeConditionList.Find(AUserType: Integer): TUserTypeCondition;
//var
//  I: Integer;
//begin
//  Result:=nil;
//  for I := 0 to Self.Count-1 do
//  begin
//    if Items[I].UserType=AUserType then
//    begin
//      Result:=Items[I];
//      Break;
//    end;
//  end;
//end;
//
//function TUserTypeConditionList.GetItem(Index: Integer): TUserTypeCondition;
//begin
//  Result:=TUserTypeCondition(Inherited Items[Index]);
//end;

{ TAddRecordDataFlowAction }

constructor TAddRecordDataFlowAction.Create;
begin
  //要添加哪些字段
  FieldList:=TDataFlowFieldList.Create;
  RemoveFieldListInRecordDataJson:=TStringList.Create;

end;

destructor TAddRecordDataFlowAction.Destroy;
begin
  FreeAndNil(RemoveFieldListInRecordDataJson);
  FreeAndNil(FieldList);
  inherited;
end;

function TAddRecordDataFlowAction.Process(
//                ADBModule: TBaseDatabaseModule;
                ASQLDBHelper:TBaseDBHelper;
                AAppID:Integer;
                ARecordDataJson:ISuperObject;
                AWhereKeyJsonArray:ISuperArray;
                AAddedDataJson:ISuperObject;
                AMasterRecordDataJson:ISuperObject;
                var ACode:Integer;
                var ADesc:String;
                var ADataJson:ISuperObject):Boolean;
var
  I:Integer;
  AAddRecordDataJson:ISuperObject;
  AFieldValue:Variant;
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
  AGetFieldValueResult:Integer;
begin
  Result:=False;


  if RestIntfItem=nil then
  begin
    ACode:=FAIL;
    ADesc:='TAddRecordDataFlowAction.Process RestIntfItem不能为空';
    Exit;
  end;


  AAddRecordDataJson:=TSuperObject.Create;


  if (FieldList.Count=0) or IsNeedAllFieldInRecordDataJson then
  begin
      //没有设置字段,那么提交RecordDataJson中的全部字段
      //需要去掉ARecordDataJson中的主键,createtime,is_deleted,orderno等

      //遍历所有key
      ASuperEnumerator:=ARecordDataJson.GetEnumerator;

      while ASuperEnumerator.MoveNext do
      begin
        if Not (Self.RemoveFieldListInRecordDataJson.IndexOf(ASuperEnumerator.GetCurrent.Name)<>-1) then
        begin
          AAddRecordDataJson.V[ASuperEnumerator.GetCurrent.Name]:=ASuperEnumerator.GetCurrent.AsVariant;
        end;
      end;
  end;



  //设置了字段,获取字段的值
  for I := 0 to Self.FieldList.Count-1 do
  begin


      AGetFieldValueResult:=FieldList[I].GetFieldValue(
//              ADBModule,
              ASQLDBHelper,
              AAppID,
              ARecordDataJson,
              AWhereKeyJsonArray,
              AAddedDataJson,
              nil,//不需要AMasterRecordDataJson
              ACode,
              ADesc,
              AFieldValue);
      case AGetFieldValueResult of
        0:
        begin
            //获取失败
            Exit;
        end;
        1:
        begin
            //获取成功
            AAddRecordDataJson.V[FieldList[I].FieldName]:=AFieldValue;
        end;
        2:
        begin
            //不存在,可以忽略

        end;
      end;

  end;


  if not RestIntfItem.AddRecord(
                        nil,//ADBModule,
                        ASQLDBHelper,
                        AAppID,
                        AAddRecordDataJson,
                        nil,
                        ACode,
                        ADesc,
                        ADataJson
                        ) then
  begin
    Exit;
  end;


  Result:=True;

end;

{ TDataFlowActionList }

function TDataFlowActionList.GetItem(Index: Integer): TDataFlowAction;
begin
  Result:=TDataFlowAction(Inherited Items[Index]);
end;

{ TDataFlowFieldList }

function TDataFlowFieldList.Add(AFieldName: String;
  AValueFromType: TFieldValueFromType;
  AFieldValue: Variant;
  ATestQueryFieldValue:Variant;
  AIsMustExist:Boolean;
  AMasterRecordIntfItem:TCommonRestIntfItem): TDataFlowField;
begin
  Result:=TDataFlowField.Create;
  Result.FieldName:=AFieldName;
  Result.ValueFromType:=AValueFromType;
  Result.FieldValue:=AFieldValue;
  Result.TestQueryFieldValue:=ATestQueryFieldValue;
  Result.IsMustExist:=AIsMustExist;
  Result.MasterRecordIntfItem:=AMasterRecordIntfItem;
  Inherited Add(Result);
end;

function TDataFlowFieldList.GetItem(Index: Integer): TDataFlowField;
begin
  Result:=TDataFlowField(Inherited Items[Index]);
end;

{ TUpdateRecordDataFlowAction }

constructor TUpdateRecordDataFlowAction.Create;
begin
  //要修改哪些字段
  FieldList:=TDataFlowFieldList.Create;
  //根据什么条件来定位记录
  WhereKeyList:=TDataFlowWhereFieldList.Create;

  RemoveFieldListInRecordDataJson:=TStringList.Create;
  
end;

destructor TUpdateRecordDataFlowAction.Destroy;
begin
  FreeAndNil(FieldList);
  FreeAndNil(WhereKeyList);
  FreeAndNil(RemoveFieldListInRecordDataJson);
  inherited;
end;

function TUpdateRecordDataFlowAction.Process(
//                ADBModule: TBaseDatabaseModule;
                ASQLDBHelper:TBaseDBHelper;
                AAppID:Integer;
                ARecordDataJson:ISuperObject;
                AWhereKeyJsonArray:ISuperArray;
                AAddedDataJson:ISuperObject;
                AMasterRecordDataJson:ISuperObject;
                var ACode:Integer;
                var ADesc:String;
                var ADataJson:ISuperObject):Boolean;
var
  I:Integer;
  AUpdateRecordDataJson:ISuperObject;
  AUpdateWhereKeyJsonArray:ISuperArray;
  AUpdateWhereKeyJson:ISuperObject;
  AOldWhereKeyJson:ISuperObject;
  AFieldValue:Variant;
  ASuperEnumerator:TSuperEnumerator<IJSONPair>;
  AGetFieldValueResult:Integer;
begin
  Result:=False;


  if RestIntfItem=nil then
  begin
    ACode:=FAIL;
    ADesc:='TUpdateRecordDataFlowAction.Process RestIntfItem不能为空';
    Exit;
  end;
  if (Self.FieldList.Count=0) and not IsNeedAllFieldInRecordDataJson then
  begin
    ACode:=FAIL;
    ADesc:='FieldList不能为空';
    Exit;
  end;
  if Self.WhereKeyList.Count=0 then
  begin
    ACode:=FAIL;
    ADesc:='WhereKeyList不能为空';
    Exit;
  end;
  
  

  AUpdateRecordDataJson:=TSuperObject.Create;



  if IsNeedAllFieldInRecordDataJson then
  begin
      //没有设置字段,那么提交RecordDataJson中的全部字段
      //需要去掉ARecordDataJson中的主键,createtime,is_deleted,orderno等

      //遍历所有key
      ASuperEnumerator:=ARecordDataJson.GetEnumerator;

      while ASuperEnumerator.MoveNext do
      begin
        if Not (Self.RemoveFieldListInRecordDataJson.IndexOf(ASuperEnumerator.GetCurrent.Name)<>-1) then
        begin
          AUpdateRecordDataJson.V[ASuperEnumerator.GetCurrent.Name]:=ASuperEnumerator.GetCurrent.AsVariant;
        end;
      end;
  end;




  for I := 0 to Self.FieldList.Count-1 do
  begin


      AGetFieldValueResult:=FieldList[I].GetFieldValue(
//                ADBModule,
                ASQLDBHelper,
                AAppID,
                ARecordDataJson,
                AWhereKeyJsonArray,
                AAddedDataJson,
                nil,
                ACode,
                ADesc,
                AFieldValue);
      case AGetFieldValueResult of
        0:
        begin
            //失败
            Exit;
        end;
        1:
        begin
            //成功
            AUpdateRecordDataJson.V[FieldList[I].FieldName]:=AFieldValue;
        end;
        2:
        begin
            //不存在,且可以忽略

        end;
      end;

  end;

  
  AUpdateWhereKeyJsonArray:=TSuperArray.Create;
  for I := 0 to Self.WhereKeyList.Count-1 do
  begin
      AUpdateWhereKeyJson:=TSuperObject.Create;
      AUpdateWhereKeyJson.S['logical_operator']:='AND';
      AUpdateWhereKeyJson.S['name']:=WhereKeyList[I].FieldName;
      AUpdateWhereKeyJson.S['operator']:=WhereKeyList[I].Operator_;


      if WhereKeyList[I].GetFieldValue(
//                ADBModule,
                ASQLDBHelper,
                AAppID,
                ARecordDataJson,
                AWhereKeyJsonArray,
                AAddedDataJson,
                nil,
                ACode,
                ADesc,
                AFieldValue)=0 then
      begin
        Exit;
      end;
      AUpdateWhereKeyJson.V['value']:=AFieldValue;


      AUpdateWhereKeyJsonArray.O[I]:=AUpdateWhereKeyJson;
  end;

  
  if not RestIntfItem.UpdateRecord(
                        nil,//ADBModule,
                        ASQLDBHelper,
                        AAppID,
                        AUpdateRecordDataJson,
                        AUpdateWhereKeyJsonArray.AsJSON,
                        '',
                        ACode,
                        ADesc,
                        ADataJson
                        ) then  
  begin
    Exit;
  end;

  Result:=True;


end;

{ TDataFlowWhereFieldList }

function TDataFlowWhereFieldList.Add(AFieldName: String;
  AValueFromType: TFieldValueFromType; AFieldValue: Variant;
  AOperator: String): TDataFlowWhereField;
begin
  Result:=TDataFlowWhereField.Create;
  Result.FieldName:=AFieldName;
  Result.ValueFromType:=AValueFromType;
  Result.FieldValue:=AFieldValue;
  Result.Operator_:=AOperator;
  TBaseList(Self).Add(Result);
  
end;

function TDataFlowWhereFieldList.GetItem(Index: Integer): TDataFlowWhereField;
begin
  Result:=TDataFlowWhereField(Inherited Items[Index]);
end;

{ TWhereKeyTranslator }

constructor TWhereKeyTranslator.Create;
begin
  FieldNames:=TStringList.Create;

end;

destructor TWhereKeyTranslator.Destroy;
begin
  FreeAndNil(FieldNames);
  inherited;
end;

function TWhereKeyTranslator.DoGetWhereConditionItemSQL(ALogicOperator,
  AOperator: String; AValue: Variant): String;
var
  I: Integer;
begin
  Result:='';
  if (AValue<>'') and (Self.FieldNames.Count>0) then
  begin
      Result:=' '+ALogicOperator+' ( ';

      Result:=Result+' ( '+FieldNames[0]+' LIKE ''%'+AValue+'%'') ';
      for I := 1 to FieldNames.Count-1 do
      begin
        Result:=Result+' OR ( '+FieldNames[I]+' LIKE ''%'+AValue+'%'') ';
      end;

//            +'    (车牌号 LIKE ''%'+AValue+'%'') '
//            +' OR (车主 LIKE ''%'+AValue+'%'') '
//            +' OR (往来单位 LIKE ''%'+AValue+'%'') '
//            +' OR (名称输入码 LIKE ''%'+AValue+'%'') '
//            +' OR (联系人 LIKE ''%'+AValue+'%'') '
//            +' OR (联系电话 LIKE ''%'+AValue+'%'') '
//            +' OR (驾驶员电话 LIKE ''%'+AValue+'%'') '

      Result:=Result+' ) ';

  end;

end;

{ TWhereKeyTranslatorList }

function TWhereKeyTranslatorList.Add(AKey,AFieldNamesCommaText: String): TWhereKeyTranslator;
begin
  Result:=TWhereKeyTranslator.Create;

  Result.Key:=AKey;
  Result.FieldNames.CommaText:=AFieldNamesCommaText;

  Inherited Add(Result);
end;

function TWhereKeyTranslatorList.Find(AKey: String): TWhereKeyTranslator;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if SameText(Items[I].Key,AKey) then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TWhereKeyTranslatorList.GetItem(Index: Integer): TWhereKeyTranslator;
begin
  Result:=TWhereKeyTranslator(Inherited Items[Index]);
end;

{ TDataFlowField }

function TDataFlowField.GetFieldValue(
//  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper:TBaseDBHelper;
  AAppID: Integer;
  ARecordDataJson: ISuperObject;
  AWhereKeyJsonArray: ISuperArray;
  AAddedDataJson: ISuperObject;
  AMasterRecordDataJson:ISuperObject;
  var ACode:Integer;
  var ADesc:String;
  var AValue:Variant
  ): Integer;
var
  AOldWhereKeyJson:ISuperObject;
begin
    Result:=0;


    //设置了字段
    case Self.ValueFromType of
      fvftFromConst:
      begin
          //值为常量
          AValue:=Self.FieldValue;
          Result:=1;
      end;
      fvftFromRecordDataJson:
      begin
          //值从ARecordDataJson中获取
          if ARecordDataJson.Contains(Self.FieldValue) then
          begin
              AValue:=ARecordDataJson.V[Self.FieldValue];
              Result:=1;
          end
          else if Self.IsMustExist then               
          begin
              ACode:=FAIL;
              ADesc:='ARecordDataJson中不存在key为'+Self.FieldValue+'的项';
          end
          else
          begin
              Result:=2;
          end;
      end;
      fvftFromNewDataJson:
      begin
          if AAddedDataJson.Contains(Self.FieldValue) then
          begin
              //值从中刚插入的AAddedDataJson中获取
              AValue:=AAddedDataJson.V[Self.FieldValue];
              Result:=1;
          end
          else if Self.IsMustExist then
          begin
              ACode:=FAIL;
              ADesc:='AAddedDataJson中不存在key为'+Self.FieldValue+'的项';
          end
          else
          begin
              Result:=2;
          end;
      end;
      fvftFromWhereKeyJson:
      begin
          //WhereKeyList[I].FieldValue是WhereKeyJsonArray中的Key,从WhereKeyJsonArray中取
          AOldWhereKeyJson:=LocateJsonArray(AWhereKeyJsonArray,
                              'name',
                              Self.FieldValue);
          if AOldWhereKeyJson<>nil then
          begin
              AValue:=AOldWhereKeyJson.V['value'];
              Result:=1;
          end
          else if Self.IsMustExist then
          begin
              ACode:=FAIL;
              ADesc:='AWhereKeyJsonArray中不存在name为'+Self.FieldValue+'的项';
          end
          else
          begin
              Result:=2;
          end;

      end;
      fvftFromAppID:
      begin
          AValue:=AAppID;
          Result:=1;
      end;
      fvftFromMasterRecordDataJson:
      begin

          if (AMasterRecordDataJson=nil) and (Self.MasterRecordIntfItem<>nil) then
          begin
            if not MasterRecordIntfItem.GetRecord(nil,//ADBModule,
                                                ASQLDBHelper,
                                                AAppID,
                                                AWhereKeyJsonArray.AsJSON,
                                                '',
                                                ARecordDataJson.AsJSON,
                                                ACode,
                                                ADesc,
                                                AMasterRecordDataJson,
                                                True,
                                                0//不查询子表
                                                ) then
            begin
              Exit;
            end;
          end;


          if AMasterRecordDataJson<>nil then
          begin
              //值从AMasterRecordDataJson中获取
              if AMasterRecordDataJson.Contains(Self.FieldValue) then
              begin
                  AValue:=AMasterRecordDataJson.V[Self.FieldValue];
                  Result:=1;
              end
              else if Self.IsMustExist then
              begin
                  ACode:=FAIL;
                  ADesc:='AMasterRecordDataJson中不存在key为'+Self.FieldValue+'的项';
              end
              else
              begin
                  Result:=2;
              end;


          end
          else
          begin
              ACode:=FAIL;
              ADesc:='AMasterRecordDataJson不能为空';
          end;
      end;
      else
      begin
          ACode:=FAIL;
          ADesc:='字段'+Self.FieldName+'不支持该ValueFromType类型';
      end;
    end;


end;

{ TDataFlowAction }

function TDataFlowAction.Process(
//  ADBModule: TBaseDatabaseModule;
  ASQLDBHelper: TBaseDBHelper;
  AAppID: Integer;
  ARecordDataJson: ISuperObject;
  AWhereKeyJsonArray: ISuperArray;
  AAddedDataJson,
  AMasterRecordDataJson: ISuperObject;
  var ACode: Integer;
  var ADesc: String;
  var ADataJson: ISuperObject): Boolean;
begin
  Result:=OnCustomProcessDataFlowAction(
              Self,
//              ADBModule,
              ASQLDBHelper,
              AAppID,
              ARecordDataJson,
              AWhereKeyJsonArray,
              AAddedDataJson,
              AMasterRecordDataJson,
              ACode,
              ADesc,
              ADataJson
              );
end;

{ TFieldValueCheck }

function TFieldValueCheck.CheckFieldValueIsValid(ASQLDBHelper: TBaseDBHelper;
  ARecordDataJson: ISuperObject; var ADesc: String): Boolean;
begin
  Result:=False;

  //判断字段是否存在
  if not ARecordDataJson.Contains(FieldName) then
  begin
      if not IsMustExist then
      begin
        Result:=True;
        Exit;
      end
      else
      begin
        ADesc:=FieldCaption+'不能为空!';
        Result:=False;
        Exit;
      end;
  end;
  



  if CheckValueType='>' then
  begin
      if ARecordDataJson.V[FieldName]<=Value then
      begin
        ADesc:=FieldCaption+'必须大于'+ValueCaption+'!';
        Exit;
      end;
      Result:=True;
  end
  else if CheckValueType='<>' then
  begin
      if ARecordDataJson.V[FieldName]<=Value then
      begin
        ADesc:=FieldCaption+'不能为'+ValueCaption+'!';
        Exit;
      end;
      Result:=True;
  end
  else
  begin
      ADesc:='不支持该字段检测方法!';
  end;


end;

{ TFieldValueCheckList }

function TFieldValueCheckList.Add(AFieldCaption, AFieldName,
  ACheckValueType: String; AValue: Variant;
                 AValueCaption:String;
                 AIsMustExist:Boolean=False): TFieldValueCheck;
begin
  Result:=TFieldValueCheck.Create;

  Result.FieldCaption:=AFieldCaption;
  Result.FieldName:=AFieldName;
  Result.CheckValueType:=ACheckValueType;
  Result.Value:=AValue;
  Result.ValueCaption:=AValueCaption;
  Result.IsMustExist:=AIsMustExist;

  if AValueCaption='' then
  begin
    Result.ValueCaption:=AValue;
  end;


  Inherited Add(Result);
end;

function TFieldValueCheckList.Check(ASQLDBHelper: TBaseDBHelper;
  ARecordDataJson: ISuperObject; var ADesc: String): Boolean;
var
  I: Integer;
begin
  Result:=False;
  for I := 0 to Self.Count-1 do
  begin
    if not Items[I].CheckFieldValueIsValid(ASQLDBHelper,ARecordDataJson,ADesc) then
    begin
      Exit;
    end;
  end;
  Result:=True;
end;

function TFieldValueCheckList.GetItem(Index: Integer): TFieldValueCheck;
begin
  Result:=TFieldValueCheck(Inherited Items[Index]);
end;


//{ TDataInterface }
//
//procedure TDataInterface.AssignTo(Dest: TPersistent);
//var
//  ADest:TDataInterface;
//begin
//  inherited;
//
//  ADest:=TDataInterface(Dest);
//  if ADest<>nil then
//  begin
//    ADest.fid:=Self.fid;
//    ADest.appid:=Self.appid;
//    ADest.user_fid:=Self.user_fid;
//    ADest.program_template_fid:=Self.program_template_fid;
//    ADest.intf_type:=Self.intf_type;
//    ADest.data_server_fid:=Self.data_server_fid;
////    ADest.table_common_rest_name:=Self.table_common_rest_name;
//    ADest.name:=Self.name;
//    ADest.caption:=Self.caption;
//    ADest.desc:=Self.desc;
//  end;
//
//end;
//
//function TDataInterface.CustomLoadFromJson(ASuperObject: ISuperObject): Boolean;
//begin
//
//end;
//
//function TDataInterface.CustomSaveToJson(ASuperObject: ISuperObject): Boolean;
//begin
//
//end;
//
//function TDataInterface.LoadFromJson(ASuperObject: ISuperObject): Boolean;
//begin
//  Result:=False;
//
//
//  fid:=ASuperObject.I['fid'];
//  appid:=ASuperObject.I['appid'];
//  user_fid:=ASuperObject.V['user_fid'];
//  program_template_fid:=ASuperObject.I['program_template_fid'];
//  intf_type:=ASuperObject.S['type'];
//  data_server_fid:=ASuperObject.I['data_server_fid'];
////  table_common_rest_name:=ASuperObject.S['table_common_rest_name'];
//
//
//
//  //英文名称,主要用于定位
//  //比如:RepairItem
//  Name:=ASuperObject.S['name'];
//  //中文名称,
//  //比如:维修项目
//  Caption:=ASuperObject.S['caption'];
//  Desc:=ASuperObject.S['description'];
//
//
//
//  CustomLoadFromJson(ASuperObject);
//
//
//  Result:=True;
//end;
//
//function TDataInterface.SaveToJson(ASuperObject: ISuperObject): Boolean;
//begin
//  Result:=False;
//
//
//  if fid<>0 then ASuperObject.I['fid']:=fid;
//  ASuperObject.I['appid']:=Self.appid;
//  ASuperObject.V['user_fid']:=user_fid;
//  ASuperObject.I['program_template_fid']:=program_template_fid;
//  ASuperObject.S['type']:=intf_type;
//  ASuperObject.I['data_server_fid']:=data_server_fid;
//
//
//  ASuperObject.S['table_common_rest_name']:=Name;//table_common_rest_name;
//
//
//
//  //英文名称,主要用于定位
//  //比如:RepairItem
//  ASuperObject.S['name']:=Name;
//  //中文名称,
//  //比如:维修项目
//  ASuperObject.S['caption']:=Caption;
//  ASuperObject.S['description']:=Desc;
//
//
//  CustomSaveToJson(ASuperObject);
//
//  Result:=True;
//end;


initialization
  GlobalDataInterfaceClass:=TCommonRestIntfItem;



end.

