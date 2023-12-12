unit uTaskManager;

interface

uses
  SysUtils,
  Classes,
  {$IFDEF MSWINDOWS}
  Windows,
  uCommandLineHelper,
  {$ENDIF}
//  Dialogs,
  uBaseList,
  uBaseLog,
  uFuncCommon,
  DateUtils,



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



  SyncObjs,
  Math,

  uFileCommon,

//  uBaseDataBaseModule,
//  uBinaryObjectList,
  uOpenClientCommon,

//  uBaseDBHelper,
  uDataInterface,
  uDatasetToJson,


//  {$IFDEF HAS_LOCAL_DB_INTERFACE}
//  //使用本地数据库模式
//  uTableCommonRestCenter,
//  {$ELSE}
//  {$ENDIF}



  uRestInterfaceCall,
  uTimerTask;


Const
  Const_KeepConnectHeartbeat_Interval=10*1000;
  Const_RequestTask_Interval=3*1000;

const
  //任务类型
  //账号登录
  Const_TaskType_Login='Login';
//  Const_TaskType_LoginSubWork='Login_SubWork';
  Const_TaskType_GetAccountInfo='GetAccountInfo';
  Const_TaskType_GetUserInfo='GetUserInfo';
//  Const_TaskType_GetAccountInfoSubWork='GetAccountInfoSubWork';
  //账号退出登录
  Const_TaskType_Logout='Logout';
//  Const_TaskType_LogoutSubWork='Logout_SubWork';

  //商品分享
  Const_TaskType_GoodsShare='GoodsShare';
//  Const_TaskType_GoodsShareSubWork='GoodsShare_SubWork';
  //发交易帖
  Const_TaskType_UploadTradeContent='UploadTradeContent';
//  Const_TaskType_UploadTradeContentSubWork='UploadTradeContent_SubWork';

  //发布帖子
  Const_TaskType_UploadContent='UploadContent';
//  Const_TaskType_UploadContentSubWork='UploadContent_SubWork';
  //转发帖子
  Const_TaskType_TransferContent='TransferContent';
//  Const_TaskType_TransferContentSubWork='TransferContent_SubWork';
  //点赞帖子
  Const_TaskType_LikeContent='LikeContent';
  //评论帖子
  Const_TaskType_CommentContent='CommentContent';
    Const_TaskType_LinkComment='LinkComment';//链接评论
//  //帖子操作
//  Const_TaskType_ContentOperation='ContentOperation';
  //用户搜索
  Const_TaskType_UserSearch='UserSearch';
  //同行广告搜索
  Const_TaskType_ADSearch='ADSearch';
  //竞对潜客搜索
  Const_TaskType_Competitor='Competitor';
//  Const_TaskType_UserSearchSubWork='UserSearch_SubWork';
  //群组搜索
  Const_TaskType_GroupSearch='GroupSearch';
//  Const_TaskType_GroupSearchSubWork='GroupSearch_SubWork';
  //公司搜索
  Const_TaskType_CompanySearch='CompanySearch';
  //内容搜索
  Const_TaskType_ContentSearch='ContentSearch';
//  Const_TaskType_ContentSearchSubWork='ContentSearch_SubWork';
  //评论搜索
  Const_TaskType_CommentSearch='CommentSearch';
//  Const_TaskType_CommentSearchSubWork='CommentSearch_SubWork';
  //添加评论关键词订阅
  Const_TaskType_CommentSubscribe='CommentSubscribe';

  //LinkedIn动态搜索
  Const_TaskType_DynamicSearch='DynamicSearch';
//  Const_TaskType_DynamicSearchSubWork='DynamicSearch_SubWork';
  //LinkedIn添加用户
  Const_TaskType_AddUser='AddUser';
//  Const_TaskType_AddUserSubWork='AddUser_SubWork';
  //LinkedIn关注公司
  Const_TaskType_FollowCompany='FollowCompany';
//  Const_TaskType_FollowCompanySubWork='FollowCompany_SubWork';
  //LinkedIn添加群组
  Const_TaskType_JoinGroup='AddGroup';
//  Const_TaskType_JoinGroupSubWork='AddGroup_SubWork';
  //LinkedIn删除群组
  Const_TaskType_DeleteGroup='DeleteGroup';
//  Const_TaskType_DeleteGroupSubWork='DeleteGroup_SubWork';
  //LinkedIn群组评论
  Const_TaskType_GroupComment='GroupComment';
//  Const_TaskType_GroupCommentSubWork='GroupComment_SubWork';

  //批量私聊
  Const_TaskType_BatchChat='BatchChat';
//  Const_TaskType_BatchChatSubWork='BatchChat_SubWork';


  //Ins话题搜索
  Const_TaskType_TopicSearch='TopicSearch';
//  Const_TaskType_TopicSearchSubWork='TopicSearch_SubWork';

  //账号授权
  Const_TaskType_AccountAuth='AccountAuth';


  //MX自动营销开发
  Const_TaskType_FindAutoDev='FindAutoDev';

  //获取用户详情
  Const_TaskType_GetUserDetailByUrl='GetUserDetailByUrl';
  //获取群组/公司详情
  Const_TaskType_GetGroupDetailByUrl='GetGroupDetailByUrl';


const
//  DataFetchTask_TestLogin='TestLogin';
//  DataFetchTask_SearchTopic='SearchTopic';
//  DataFetchTask_TopicUserCollect='TopicUserCollect';
//  DataFetchTask_ContentLikersCollect='ContentLikersCollect';
//  DataFetchTask_ContentReviewersCollect='ContentReviewersCollect';
//  DataFetchTask_UserFansCollect='UserFansCollect';
//  DataFetchTask_UserFocusedCollect='UserFocusedCollect';
//  DataFetchTask_UserInfoCollect='UserInfoCollect';
  DataFetchTask_ContentSearch='ContentSearch';
  DataFetchTask_UserSearch='UserSearch';
  DataFetchTask_ContentSearchByUserList='ContentSearchByUserList';
  DataFetchTask_ContentTranslate='ContentTranslate';
  DataFetchTask_ContentUpload='ContentUpload';
//  DataFetchTask_BrandSearch='BrandSearch';
//
//  DataFetchTask_ContentsSearch='ContentsSearch';
//  DataFetchTask_ContentSearchByLink='ContentSearch_ByLink';
//  DataFetchTask_ContentSearchByIndustry='ContentSearch_ByIndustry';
//  DataFetchTask_ContentSearchByBrand='ContentSearch_ByBrand';






type
  TTaskManager=class;
  TTaskWorkThreadItem=class;
  TTaskWorkThreadItems=class;
  TTaskItem=class;
  TThreadClass=class of TThread;
  TWorkThreadExecuteEvent=procedure(Sender:TObject;AWorkThreadItem:TTaskWorkThreadItem;ATaskItem:TTaskItem) of object;




  TTaskWorkThreadItemClass=class of TTaskWorkThreadItem;
  TTaskList=class;
  TTaskCallback=procedure(Sender:TObject;AWorkThreadItem: TTaskWorkThreadItem;ATaskItem:TTaskItem;ADataIntfResult:TDataIntfResult) of object;
  TTaskState=(tsWaiting,
              tsWorking,
              //tsPause,
              //tsStop,
              tsFinished);
  //一次任务,比如获取话题,获取用户粉丝,获取内容评论
  //以及任务的配置
  TTaskItem=class
  public
    FAppID:String;
    FUserFID:String;
  public
    //开始工作了
    State:TTaskState;
  public
    //任务ID
    GUID:String;
    //任务名称
    Name:String;
    //任务类型
    Type_:String;
      //任务子类型
      SubType:String;

    //参数,或者说包含需要操作的子任务数
    Params:ISuperObject;

    Error:String;
    //开始时间
    StartTime:TDateTime;

    ParentTaskGUID:String;
    RootTaskGUID:String;

    ParamDetailList:ISuperArray;

    FJson:ISuperObject;
  public
    DataObject:TObject;
    //其他数据,数据库中不存该字段
    DataJson:ISuperObject;
//    Data:Pointer;
//    DataStr:String;

    //这个任务的最大协作线程数
    MaxWorkThreadCount:Integer;
    ParentTask:TTaskItem;

    //是否获取到了新的数据
    HasNewResultData:Boolean;
    FResultDataList:ISuperArray;
    FIsGereratedWorksJson:Boolean;

    FProgress:Integer;
    FProgressMax:Integer;
    FFromPlatform:String;

    //哪个子服务处理的这个任务，跟踪要用
    FProcessClientName:String;

    SearchProgressJson:ISuperObject;
  public
    function LoadFromJson(AJson:ISuperObject):Boolean;virtual;
    function SaveToJson:ISuperObject;virtual;

    //生成子工作
    procedure GererateSubWorks;
    function DoGererateSubWorks:Boolean;virtual;

    //从Json加载子工作
    procedure LoadSubWorksFromJsonArray(ASubWorkList:ISuperArray);virtual;
      //创建子工作
      function CreateSubWorkItem(ASubWorkIndex:Integer):TTaskItem;virtual;abstract;
      //为子工作准备参数
      procedure PrepareSubWorkParam(ASubWork:TTaskItem;ASubWorkIndex:Integer);virtual;

    procedure GenerateResultDataList;virtual;

    //获取保存数据的接口类
    function CreateSaveDataInterface:TDataInterface;virtual;
    //保存任务到数据库,任务历史,以便可以查看
    function AddToDB(//AAppID:String;
                      //AUserFID:String;
                      var ADesc:String;AIsSaveDetail:Boolean=True):Boolean;virtual;abstract;
      function AddSubWorksToDB(//AAppID:String;
                        //AUserFID:String;
                        var ADesc:String):Boolean;virtual;abstract;
    //从数据库加载,任务历史,以便可以查看
    function LoadFromDB(var ADesc:String):Boolean;virtual;abstract;
      function LoadSubWorksJsonFromDB(var ADesc:String):Boolean;virtual;abstract;
    //更新任务的状态
    function UpdateStateToDB(//AAppID:String;
                            //AUserFID:String;
                            var ADesc:String):Boolean;virtual;abstract;
    //更新任务的状态
    function UpdateToDB(//AAppID:String;
                            //AUserFID:String;
                            ARecordDataJson:ISuperObject;
                            var ADesc:String):Boolean;virtual;abstract;
    //添加子任务
    function AddSubWorkToDB(//AAppID:String;
                            //AUserFID:String;
                            ASubWorkGUID:String;
                            ASubWorkParmasStr:String;
                            ATaskType:String;
                            var ADesc:String):Boolean;virtual;abstract;

    procedure SaveTaskResultDataList(ATaskResultDataList:ISuperArray);
  public
    //执行任务
    procedure DoWorkInWorkThreadExecute(Sender:TObject;
                                        AWorkThreadItem:TTaskWorkThreadItem;
                                        ATaskItem:TTaskItem);virtual;
    procedure DoWorkThreadProgressEvent(ADataIntfResult:TDataIntfResult);virtual;

    //任务结束
    procedure DoFinishedInWorkThreadExecute(Sender:TObject;
                                            AWorkThreadItem:TTaskWorkThreadItem);virtual;


  public

    //这个任务的工作线程所要执行的方法
    OnWorkThreadExecute:TWorkThreadExecuteEvent;
    //进展方法,进度方法,如果任务比较耗时,那么用这个事件来通知
    OnWorkThreadProgress:TTaskCallback;
    //任务结束事件
    OnFinishedCallback:TTaskCallback;



    GetUnWorkLock:TCriticalSection;
    //工作列表
    Works:TTaskList;
    FWorkGUIDList:TStringList;
    //获取一个未工作的工作项,准备开工
    function GetUnWorkItem:TTaskItem;
    function UnWorkItemCount:Integer;
    function IsWorkFinished:Boolean;
  public
    Owner:TTaskManager;
    //接口执行返回的结果
    DataIntfResult:TDataIntfResult;

  public
    constructor Create(AOwner:TTaskManager);virtual;
    destructor Destroy;override;
  public
    //哪个线程执行的
    WorkThreadItem:TTaskWorkThreadItem;
    //属于我这个任务的工作线程列表
    ThreadItems:TTaskWorkThreadItems;
    //是否暂停
    IsPause:Boolean;
    IsStop:Boolean;
    //任务返回的结果数据
    ResultDataJson:ISuperObject;
    //开始任务,启动自己的工作线程
    procedure Start(ATaskWorkThreadItemClass:TTaskWorkThreadItemClass=nil);
    //停止自己的工作线程
    procedure Stop;virtual;
    //暂停自己的工作线程
    procedure Pause;virtual;
    //继续自己的工作线程
    procedure Resume;virtual;
  end;
  TTaskList=class(TBaseList)
  private
    FLock:TCriticalSection;
    function GetItem(Index: Integer): TTaskItem;
  public
    FFromPlatform:String;
    Owner:TTaskItem;
    procedure Lock;
    procedure UnLock;
    function Add(AObject:TObject):Integer;override;
    function Find(ATaskGUID:String):TTaskItem;
    function UnWorkItemsCount:Integer;
    property Items[Index:Integer]:TTaskItem read GetItem;default;
  public
    constructor Create(
                        const AObjectOwnership:TObjectOwnership=ooOwned;
                        const AIsCreateObjectChangeManager:Boolean=True
                        );virtual;
    destructor Destroy;override;
  end;




  //可以通过Rest接口保存到数据库的任务
  TTaskItem_SaveToRest=class(TTaskItem)
  public

    //从哪个接口存取任务,因为任务都放一个表里面，数据量太大了
    function GetTaskIntfName:String;virtual;
    //从哪个接口获取任务返回的数据
    function GetTaskResultDataIntfName:String;virtual;


    //执行任务,更新任务状态,更新任务的开始时间
    procedure DoWorkInWorkThreadExecute(Sender:TObject;
                                        AWorkThreadItem:TTaskWorkThreadItem;
                                        ATaskItem:TTaskItem);override;

    //任务结束,更新任务状态,更新任务的结束时间
    procedure DoFinishedInWorkThreadExecute(Sender:TObject;
                                            AWorkThreadItem:TTaskWorkThreadItem);override;
    procedure Stop;override;
    procedure Pause;override;
    procedure Resume;override;
    //
    function AddToDB(//AAppID:String;
                      //AUserFID:String;
                      var ADesc:String;AIsSaveDetail:Boolean=True):Boolean;override;
      function AddSubWorksToDB(//AAppID:String;
                        //AUserFID:String;
                        var ADesc:String):Boolean;override;
    //从数据库加载,任务历史,以便可以查看
    function LoadFromDB(var ADesc:String):Boolean;override;
      function CustomLoadFromDB(
                      ATaskJson:ISuperObject;
                      var ADesc:String):Boolean;virtual;
      function LoadSubWorksJsonFromDB(var ADesc:String):Boolean;override;
      function CustomLoadSubWorkJsonFromDB(ASubWorkJson:ISuperObject;var ADesc:String):Boolean;virtual;
    function UpdateStateToDB(//AAppID:String;
                            //AUserFID:String;
                            var ADesc:String):Boolean;override;
    //添加子任务
    function AddSubWorkToDB(//AAppID:String;
                            //AUserFID:String;
                            ASubWorkGUID:String;
                            ASubWorkParmasStr:String;
                            ATaskType:String;
                            var ADesc:String):Boolean;override;
    //更新任务的状态
    function UpdateToDB(//AAppID:String;
                            //AUserFID:String;
                            ARecordDataJson:ISuperObject;
                            var ADesc:String):Boolean;override;

  end;







  TProtectedThread=class(TThread)
  public
    property Terminated;
  end;


  TWorkThread=class(TProtectedThread)
  protected
    procedure Execute;override;
  public
    ThreadItem:TTaskWorkThreadItem;
  end;










  //查询表记录的任务,只查询一次
  TGetRecordListTaskItem=class(TTaskItem_SaveToRest)
  protected
    procedure DoGetRecordListTask(Sender:TObject;
                                        AWorkThreadItem:TTaskWorkThreadItem;
                                        ATaskItem:TTaskItem;
                                        AWhereSQL:String);
    procedure DoWorkInWorkThreadExecute(Sender:TObject;
                                        AWorkThreadItem:TTaskWorkThreadItem;
                                        ATaskItem:TTaskItem);override;
  public
    //接口名称
    FRestName:String;
    //查询条件
    FWhereSQL:String;
    FPageIndex:Integer;
    FPageSize:Integer;
  public
    constructor Create(AOwner:TTaskManager);override;
  end;



  //查询表更新记录的任务，重复查询
  TGetUpdatedRecordListTaskItem=class(TGetRecordListTaskItem)
  public
    FLastQueryResultDataUpdateTime:TDateTime;
    procedure DoWorkInWorkThreadExecute(Sender:TObject;
                                        AWorkThreadItem:TTaskWorkThreadItem;
                                        ATaskItem:TTaskItem);override;

  end;




  {$IFDEF MSWINDOWS}
  //Python命令行任务
  TPythonCommandLineTaskItem=class(TTaskItem_SaveToRest)
  public
    //命令行
    FCommandLine:String;
    FCommandParams:String;
    FCommandLineOutputHelper:TCommandLineOutputHelper;
    //进程信息
    FPI: TProcessInformation;
    //方法的名称,用于传弟给命令行,
    FFunctionName:String;

    //获取进度数据的名称
    FProgressDataName:String;
    //命令行的参数数据
    FParamsJson:ISuperObject;
    procedure DoGetDataEvent(Sender:TObject;AData:String;ADataJson:ISuperObject);
    procedure DoWorkInWorkThreadExecute(Sender:TObject;
                                        AWorkThreadItem:TTaskWorkThreadItem;
                                        ATaskItem:TTaskItem);override;
  public
    constructor Create(AOwner:TTaskManager);override;
    destructor Destroy;override;
  end;



  //一次任务,比如获取话题,获取用户粉丝,获取内容评论
  //以及任务的配置
  TCommonTaskDataFetchTaskItem=class(TTaskItem_SaveToRest)
  public
    //爬虫名称
    FSpiderName:String;
    //进程工作路径
    FWorkDir:String;
    //处理命令行日志输出的事件
    FOnGetCommandLineOutputEvent:TGetCommandLineOutputEvent;

//    {$IFDEF PYTHON_TASKMANAGER_MODE}
//    {$ELSE}
//      //每个任务单独一个python进程的模式
//      //执行命令的线程
//      FExecuteSpiderCommandThread:TExecuteCommandThread;
//    {$ENDIF}


    //数据表名
    FDataTableNames:TStringList;

    //数据表主键名
    FDataTableKeys:TStringList;
    //上次查询的数据ID
    //用于获取最新的数据
    FLastQueryResultDataFID:Integer;

    //数据表2
    FLastQueryResultDataFID2:Integer;
    FLastQueryResultDataUpdateTime:TDateTime;

    FCustomDataSelectWhereSQL:String;

    //查询数据的时候OR条件
    function GetDataRecordListSelectWhereSQL:String;
//    procedure Stop;override;
//    procedure Pause;override;
//    procedure Resume;override;
//
//    procedure DoUpdateTaskStateExecute(Sender:TObject);
  public
//    //终止爬虫进程
//    procedure StopExecuteCommandThread;
  public
    constructor Create(AOwner:TTaskManager);override;
    destructor Destroy;override;
  end;
  TCommonTaskDataFetchTaskItemClass=class of TCommonTaskDataFetchTaskItem;
  {$ENDIF}




  //获取待处理任务的线程
  TRequestTaskThread=class(TBaseServiceThread)
  private
  public
    FTaskManager:TTaskManager;
    //是否需要申请一个任务
    function NeedRequestTaskItem:Boolean;virtual;
    //获取一个待处理的工作
    function RequestTaskItem:TTaskItem;virtual;
    //工作线程函数
    procedure Execute;override;
    constructor Create(ACreateSuspended:Boolean;ATaskManager:TTaskManager);
  end;









  //工作线程
  TTaskWorkThreadItem=class//(TThread)
  public
    TaskManager:TTaskManager;

    //当前线程所要工作的任务
    TaskItem:TTaskItem;


    //当前所做的子工作
    WorkItem:TTaskItem;

    FThread:TWorkThread;
    FThreadClass:TThreadClass;
//    OnExecute:TWorkThreadExecuteEvent;


//    function GetCaption:String;virtual;


    //工作逻辑：执行任务的方法
    //先获取子工作,然后调用DoExecuteWorkItem处理工作,处理完再获取一个子工作去处理


    //工作线程函数
    procedure Execute;virtual;
        //线程开始初始
        procedure DoExecuteBegin;virtual;
        //是否可以退出线程了
        function CanExitThread:Boolean;virtual;
        //获取一个待处理的工作
        function GetTaskUnWorkItem
    //                  (AIsNeedCheckCanDoThisTask:Boolean=True)
                      :TTaskItem;virtual;
        //这个任务是否可以执行
        function CanDoThisTask(ATaskItem:TTaskItem):Boolean;virtual;
        //处理线程工作
        procedure DoExecuteWorkItem;virtual;
        //线程结束
        procedure DoExecuteEnd;virtual;
        //线程空闲
        procedure DoExecuteIdle;virtual;
    function CreateThread(ACreateSuspended:Boolean;ATaskItem:TTaskItem):TWorkThread;virtual;
    function GetLogID:String;
  public
    constructor Create(ACreateSuspended:Boolean;ATaskItem:TTaskItem;ATaskManager:TTaskManager);virtual;
    destructor Destroy;override;

  end;

  TTaskWorkThreadItems=class(TBaseList)
  public
  private
    function GetItem(Index: Integer): TTaskWorkThreadItem;
  public
    function FreeCount:Integer;
    property Items[Index:Integer]:TTaskWorkThreadItem read GetItem;default;
  end;








  //数据提取任务管理
  TTaskManager=class
  public

    //当前进程ID
    FCurrentProcessId:String;

    //任务列表
    TaskList:TTaskList;
    FinishedTaskList:TTaskList;
    FinishedTaskListCount:Integer;
    TaskWorkThreadItemClass:TTaskWorkThreadItemClass;

    //线程池
    ThreadItems:TTaskWorkThreadItems;

    MaxThreadCount:Integer;

    FEventManager:TSkinObjectChangeManager;


    //线程开始初始
    procedure DoWorkThreadExecuteBegin;virtual;
    //数据接口，可以支持SQL，支持Rest
//    FDataInterface:TDataInterface;
    function CanDoThisTask(ATaskItem:TTaskItem):Boolean;virtual;
    //获取一个待处理的工作
    function GetUnWorkTaskItem(ATaskWorkThreadItem:TTaskWorkThreadItem)
//                  (AIsNeedCheckCanDoThisTask:Boolean=True)
                  :TTaskItem;virtual;
    //如果本线程没有取到子工作，那么取其他线程没有做完的子工作
    function GetOtherThreadUnWorkTaskItem(ATaskWorkThreadItem:TTaskWorkThreadItem):TTaskItem;virtual;
//    function CreateDataInterface:TDataInterface;virtual;abstract;
    //处理线程工作
    procedure DoWorkThreadExecuteWorkItem(ATaskWorkThreadItem:TTaskWorkThreadItem;ATaskItem:TTaskItem;AWorkItem:TTaskItem);virtual;
    procedure DoWorkThreadIdle;virtual;
    //线程开始初始
    procedure DoWorkThreadExecuteEnd;virtual;
    procedure DoTaskFree(ATaskItem:TTaskItem);virtual;

    function GetMaxThreadCount:Integer;virtual;
    function CreateTaskWorkThreadItem:TTaskWorkThreadItem;virtual;

    //获取保存数据的接口类
    function CreateSaveDataInterface:TDataInterface;virtual;

    constructor Create;virtual;
    destructor Destroy;override;
  public
    function IsWorkThreadsSuspended:Boolean;virtual;
    procedure SuspendWorkThreads;virtual;
    procedure ResumeWorkThreads;virtual;
    function FindRunningTaskItem(ATaskGUID:String):TTaskItem;

    procedure StartWorkThread;virtual;
    function StartTask(ATaskItem:TTaskItem//;
//                        //任务执行事件
//                        AWorkThreadExecute:TWorkThreadExecuteEvent;
//                        //整个任务完成后的回调事件
//                        AFinishedCallback:TTaskCallback;
//                        //任务运行中获取到部分数据后的回调事件
//                        AProgressCallback:TTaskCallback=nil;
//                        //任务运行所需要的参数
//                        AParams:ISuperObject=nil
                        ):TTaskItem;virtual;
    procedure StopTaskList;virtual;
    //根据规则更新线程的数量
    procedure SyncWorkThreadItems;
    procedure FreeWorkThreadItems;virtual;

    //获取状态日志,要打印出来
    function GetStatusLog:String;virtual;
  end;




  //检查任务执行状态项
  TQueryTaskStateItem=class(TTimerTask)
//    TaskGUID:String;
    FAppID:String;
    FUserFID:String;
    //以秒为单位
    Timeout:Integer;
    //开始查询的时间
    StartTime:TDateTime;
    //开始工作了
    State:TTaskState;


    FExecuteTimerTask:TTimerTask;
    FTaskJson:ISuperObject;
  end;
//  TQueryTaskStateList=class(TBaseList)
//  private
//    function GetItem(Index: Integer): TQueryTaskStateItem;
//  public
//    property Items[Index:Integer]:TQueryTaskStateItem read GetItem;default;
//  end;
  //检查任务执行状态的管理者
  TQueryTaskStateMananger=class(TTimerThread)
  protected
    //检测任务状态
    function QueryTaskState(ATimerTask:TTimerTask):TTaskState;virtual;
    procedure DoExecute;override;
  public
    function AddQueryTask(AAppID:String;
                            AUserFID:String;
                            ATaskGUID:String;
                            AOnExecute:TTaskNotify;
                            AOnExecuteEnd:TTaskNotify;
                            ATimeout:Integer=60):TQueryTaskStateItem;overload;
    function AddQueryTask(AAppID:String;
                            AUserFID:String;
                            ATaskGUID:String;
                            AExecuteTimerTask:TTimerTask;
                            ATimeout:Integer=60):TQueryTaskStateItem;overload;

  end;








var
  GlobalQueryTaskStateMananger:TQueryTaskStateMananger;


  {$IFDEF MSWINDOWS}
//开启HttpServer的服务端进程,有些情况下需要,有些情况下不需要
procedure StartContentHttpServerProgress(AHttpInterfacePort:Integer);
  {$ENDIF}

function GetGlobalQueryTaskStateMananger:TQueryTaskStateMananger;

function GetStateStr(ATaskState:TTaskState):String;


implementation


  {$IFDEF MSWINDOWS}
procedure StartContentHttpServerProgress(AHttpInterfacePort:Integer);
begin
  //创建HttpServer的进程
  ExecuteCommandProcess('ContentHttpServer.exe',GetApplicationPath,IntToStr(AHttpInterfacePort));
end;
  {$ENDIF}

function GetStateStr(ATaskState:TTaskState):String;
begin
  Result:='';
  case ATaskState of
    tsWaiting: ;
    tsWorking: Result:='start';
    tsFinished: Result:='finished';
  end;
end;

function GetGlobalQueryTaskStateMananger:TQueryTaskStateMananger;
begin
  if GlobalQueryTaskStateMananger=nil then
  begin
    GlobalQueryTaskStateMananger:=TQueryTaskStateMananger.Create(True);
  end;
  Result:=GlobalQueryTaskStateMananger;
end;




{ TTaskWorkThreadItems }

function TTaskWorkThreadItems.FreeCount: Integer;
var
  I: Integer;
begin
  Result:=0;
  for I := 0 to Self.Count-1 do
  begin
    if Items[I].WorkItem=nil then
    begin
      Inc(Result);
    end;
  end;
end;

function TTaskWorkThreadItems.GetItem(Index: Integer): TTaskWorkThreadItem;
begin
  Result:=TTaskWorkThreadItem(Inherited Items[Index]);
end;

{ TTaskItem }

constructor TTaskItem.Create(AOwner:TTaskManager);
begin
  GUID:=CreateGUIDString;

  ParentTaskGUID:='';
  RootTaskGUID:=GUID;

  Owner:=AOwner;
  ThreadItems:=TTaskWorkThreadItems.Create;
  MaxWorkThreadCount:=1;
  DataIntfResult:=TDataIntfResult.Create;
  Params:=TSuperObject.Create();
  DataJson:=SO();
  ParamDetailList:=SA();

  Works:=TTaskList.Create;
  Works.Owner:=Self;

  GetUnWorkLock:=TCriticalSection.Create;
  FWorkGUIDList:=TStringList.Create;

  ResultDataJson:=TSuperObject.Create;

  FResultDataList:=SA();

  StartTime:=Now;
end;

//function TTaskItem.AddSubWorkToDB(AAppID: String; AUserFID: String;
//  ASubWorkGUID:String;
//  ASubWorkParmasStr:String;
////  ADBModule: TBaseDatabaseModule;
//  var ADesc: String): Boolean;
////var
////  ASQLDBHelper:TBaseDBHelper;
//
//begin
//  Result:=False;
//  ADesc:='';
//
////  if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
////  begin
////    Exit;
////  end;
////  try
////
//////    AParmasStr:='';
//////    if Params<>nil then
//////    begin
//////      AParmasStr:=Params.AsJSON;
//////    end;
////
//////    if not ASQLDBHelper.SelfQuery_EasyInsert('tbltask',
//////                                           ['appid','user_fid','task_guid','task_type','name','params_json','is_deleted','createtime','parent_task_guid','root_task_guid','process_id','works_count','finished_works_count'],
//////                                           [AAppID,AUserFID,GUID,Type_,Name,AParmasStr,0,StdDateTimeToStr(Now),'',GUID,'',0,0]
//////                                            ) then
//////    begin
//////      //数据库连接失败或异常
//////      ADesc := '添加任务' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
//////      Exit;
//////    end;
////
////    if not ASQLDBHelper.SelfQuery_EasyInsert('tbltask',
////                                           ConvertToStringDynArray(['appid','user_fid','task_guid','task_type','name','params_json','is_deleted','createtime','parent_task_guid','root_task_guid','process_id','works_count','finished_works_count']),
////                                           ConvertToVariantDynArray([AAppID,AUserFID,ASubWorkGUID,Type_,Name,ASubWorkParmasStr,0,StdDateTimeToStr(Now),GUID,GUID,IntToStr(GetCurrentProcessId),0,0]),
////                                           '',
////                                           asoExec,
////                                           nil
////                                            ) then
////    begin
////      //数据库连接失败或异常
////      ADesc := '添加子工作' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
////      Exit;
////    end;
////
////
////    FWorkGUIDList.Add(ASubWorkGUID);
////
////    //给父任务的子工作数+1
////    if not ASQLDBHelper.SelfQuery('UPDATE tbltask SET works_count=IFNULL(works_count,0)+1 WHERE task_guid='+QuotedStr(GUID),GetEmptyStringDynArray,GetEmptyVariantDynArray,asoExec) then
////    begin
////      //数据库连接失败或异常
////      ADesc := '添加子工作' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
////      Exit;
////    end;
////
////
////    Result:=True;
////  finally
////    ADBModule.FreeDBHelperToPool(ASQLDBHelper);
////  end;
//
//
//end;
//
//function TTaskItem.AddToDB(AAppID: String; AUserFID: String;
////  ADBModule:TBaseDatabaseModule;
//  var ADesc: String): Boolean;
//var
////  ASQLDBHelper:TBaseDBHelper;
//  AParmasStr:String;
//begin
//  Result:=False;
//  ADesc:='';
//
////  if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
////  begin
////    Exit;
////  end;
////  try
////
////    AParmasStr:='';
////    if Params<>nil then
////    begin
////      AParmasStr:=Params.AsJSON;
////    end;
////
//////    if not ASQLDBHelper.SelfQuery_EasyInsert('tbltask',
//////                                           ['appid','user_fid','task_guid','task_type','name','params_json','is_deleted','createtime','parent_task_guid','root_task_guid','process_id','works_count','finished_works_count'],
//////                                           [AAppID,AUserFID,GUID,Type_,Name,AParmasStr,0,StdDateTimeToStr(Now),'',GUID,'',0,0]
//////                                            ) then
//////    begin
//////      //数据库连接失败或异常
//////      ADesc := '添加任务' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
//////      Exit;
//////    end;
////    if not ASQLDBHelper.SelfQuery_EasyInsert('tbltask',
////                                           ConvertToStringDynArray(['appid','user_fid','task_guid','task_type','name','params_json','is_deleted','createtime']),
////                                           ConvertToVariantDynArray([AAppID,AUserFID,GUID,Type_,Name,AParmasStr,0,StdDateTimeToStr(Now)])
////                                            ) then
////    begin
////      //数据库连接失败或异常
////      ADesc := '添加任务' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
////      Exit;
////    end;
////
////    Result:=True;
////  finally
////    ADBModule.FreeDBHelperToPool(ASQLDBHelper);
////  end;
//end;


procedure TTaskItem.LoadSubWorksFromJsonArray(ASubWorkList: ISuperArray);
var
  I:Integer;
  ASubWorkItem:TTaskItem;
begin
  for I := 0 to ASubWorkList.Length-1 do
  begin
    ASubWorkItem:=CreateSubWorkItem(I);
    ASubWorkItem.LoadFromJson(ASubWorkList.O[I]);
    PrepareSubWorkParam(ASubWorkItem,I);
    Works.Add(ASubWorkItem);
  end;
end;

destructor TTaskItem.Destroy;
begin
  uBaseLog.HandleException(nil,'TTaskItem.Destroy');


  //不再这里Stop,在释放之前Stop
//  Self.Stop;



  FreeAndNil(DataIntfResult);
  FreeAndNil(ThreadItems);
  FreeAndNil(Works);
  FreeAndNil(GetUnWorkLock);
  FreeAndNil(FWorkGUIDList);
  inherited;
end;

procedure TTaskItem.DoFinishedInWorkThreadExecute(Sender: TObject;
  AWorkThreadItem: TTaskWorkThreadItem);
begin
  try


      if Assigned(Self.OnFinishedCallback) then
      begin
        Self.OnFinishedCallback(Self,AWorkThreadItem,Self,Self.DataIntfResult);
      end;


  except
    on E:Exception do
    begin
      Self.DataIntfResult.Desc:=E.Message;
      uBaseLog.HandleException(E,'TTaskItem.DoFinishedInWorkThreadExecute '+ClassName+' OnFinishedCallback Work:'+Self.Name+' Params:'+Self.Params.AsJSON);
    end;
  end;

end;

function TTaskItem.DoGererateSubWorks:Boolean;
begin
  Result:=True;
end;

procedure TTaskItem.DoWorkInWorkThreadExecute(Sender: TObject;
  AWorkThreadItem: TTaskWorkThreadItem; ATaskItem: TTaskItem);
begin
  ATaskItem.StartTime:=Now;
  if Assigned(Self.OnWorkThreadExecute) then
  begin
    Self.OnWorkThreadExecute(Sender,AWorkThreadItem,ATaskItem);
  end;
end;

procedure TTaskItem.DoWorkThreadProgressEvent(ADataIntfResult:TDataIntfResult);
begin
  if Assigned(Self.OnWorkThreadProgress) then
  begin
    Self.OnWorkThreadProgress(Self,Self.WorkThreadItem,Self,ADataIntfResult);
  end;
end;

function TTaskItem.CreateSaveDataInterface: TDataInterface;
begin
  if Self.Owner<>nil then
  begin
    Result:=Self.Owner.CreateSaveDataInterface;
  end
  else
  begin
    Result:=GlobalDataInterfaceClass.Create;
  end;
end;

procedure TTaskItem.GenerateResultDataList;
begin
end;

procedure TTaskItem.GererateSubWorks;
begin
  if not FIsGereratedWorksJson then
  begin
    FIsGereratedWorksJson:=DoGererateSubWorks();
  end;
end;

function TTaskItem.GetUnWorkItem: TTaskItem;
var
  I: Integer;
begin
  Result:=nil;

  GetUnWorkLock.Enter;
  try

    //任务没有被暂停
    if not Self.IsPause then
    begin
        if Works.Count>0 then
        begin
          //有子任务
          for I := 0 to Works.Count-1 do
          begin
            if (Works[I].State=tsWaiting) and Self.Owner.CanDoThisTask(Works[I]) then
            begin
              Result:=Works[I];
              Break;
            end;
          end;

        end
        else
        begin
          if State=tsWaiting then
          begin
            Result:=Self;
          end;
        end;
    end;


    //开工了
    if Result<>nil then
    begin
      Result.State:=tsWorking;
    end;

  finally
    GetUnWorkLock.Leave;
  end;
end;

function TTaskItem.UnWorkItemCount: Integer;
var
  I: Integer;
begin
  Result:=0;

  GetUnWorkLock.Enter;
  try


    //任务没有被暂停
    if not Self.IsPause then
    begin
        if Works.Count>0 then
        begin
          for I := 0 to Works.Count-1 do
          begin
            if Works[I].State=tsWaiting then
            begin
              Inc(Result);
            end;
          end;

        end
        else
        begin
          if State=tsWaiting then
          begin
            Inc(Result);
          end;
        end;
    end;


  finally
    GetUnWorkLock.Leave;
  end;


end;

//function TTaskItem.UpdateStateToDB(AAppID: String; AUserFID: String;
////  ADBModule: TBaseDatabaseModule;
//  var ADesc: String): Boolean;
//var
////  ASQLDBHelper:TBaseDBHelper;
//  AParmasStr:String;
//begin
//  Result:=False;
//  ADesc:='';
//
////  if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
////  begin
////    Exit;
////  end;
////  try
////
////    AParmasStr:='';
////    if Params<>nil then
////    begin
////      AParmasStr:=Params.AsJSON;
////    end;
////
////    if not ASQLDBHelper.SelfQuery('UPDATE tbltask SET is_stop=:is_stop,is_pause=:is_pause WHERE task_guid=:task_guid',
////                                   ConvertToStringDynArray(['task_guid','is_stop','is_pause']),
////                                   ConvertToVariantDynArray([GUID,Ord(IsStop),Ord(IsPause)]),
////                                   asoExec
////                                    ) then
////    begin
////      //数据库连接失败或异常
////      ADesc := '更新任务状态' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
////      Exit;
////    end;
////
////
////    if IsStop then
////    begin
////      if not ASQLDBHelper.SelfQuery('UPDATE tbltask SET state=''finished'' WHERE task_guid=:task_guid',
////                                     ConvertToStringDynArray(['task_guid']),
////                                     ConvertToVariantDynArray([GUID]),
////                                      asoExec
////                                      ) then
////      begin
////        //数据库连接失败或异常
////        ADesc := '更新任务状态' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
////        Exit;
////      end;
////    end;
////
////
////    Result:=True;
////  finally
////    ADBModule.FreeDBHelperToPool(ASQLDBHelper);
////  end;
//
//
//end;

function TTaskItem.IsWorkFinished: Boolean;
var
  I: Integer;
begin
  Result:=False;
  if Self.Works.Count>0 then
  begin
      for I := 0 to Works.Count-1 do
      begin
        if (Works[I].State<>tsFinished)
//          and (Works[I].State<>tsStop)
          then
        begin
          Exit;
        end;
      end;
      Result:=True;
  end
  else
  begin
      Result:=(Self.State=tsFinished)
              //or (Self.State=tsStop)
//              or (Self.IsStop)
              ;
  end;
end;

function TTaskItem.LoadFromJson(AJson: ISuperObject): Boolean;
var
  I: Integer;
  ASubWorkItem:TTaskItem;
begin
  Result:=False;

  FJson:=AJson;

  FAppID:=IntToStr(AJson.I['appid']);
  FUserFID:=AJson.S['user_fid'];
  if AJson.Contains('task_guid') then GUID:=AJson.S['task_guid'];
  Name:=AJson.S['name'];
  Type_:=AJson.S['task_type'];
  SubType:=AJson.S['sub_type'];
  FProcessClientName:=AJson.S['process_client_name'];

  if AJson.Contains('params') then
  begin
    Params:=AJson.O['params'];
  end
  else
  begin
    Params:=SO(AJson.S['params_json']);
  end;

//  DataJson:=SO();//AJson.S['data'];
  DataJson:=AJson.O['data'];

  ParentTaskGUID:=AJson.S['parent_task_guid'];
  RootTaskGUID:=AJson.S['root_task_guid'];
  StartTime:=StdStrToDateTime(AJson.S['start_time']);

  FProgress:=AJson.I['progress'];
  FProgressMax:=AJson.I['progress_max'];

  if AJson.Contains('result_data_list') then
  begin
    Self.FResultDataList:=AJson.A['result_data_list'];
  end;

  //如果有子工作,则加载子工作
  { TODO : 如果有子工作,则加载子工作 }
//  for I := 0 to AJson.A['sub_work_list'].Length-1 do
//  begin
//    ASubWorkItem:=CreateSubWorkItem(AJson.A['sub_work_list'].O[I]);
//    Works.Add(ASubWorkItem);
//  end;


  if AJson.Contains('param_detail_list') then
  begin
    ParamDetailList:=AJson.A['param_detail_list'];
  end;
  Self.FFromPlatform:=AJson.S['from_platform'];

  Result:=True;

//    FAppID:String;
//    FUserFID:String;
//  public
//    //开始工作了
//    State:TTaskState;
//  public
//    //任务ID
//    GUID:String;
//    //任务名称
//    Name:String;
//    //任务类型
//    Type_:String;
//
//    //参数,或者说包含需要操作的子任务数
//    Params:ISuperObject;
//    DataObject:TObject;
////    Data:Pointer;
////    DataStr:String;
//
//    //这个任务的最大协作线程数
//    MaxWorkThreadCount:Integer;
//    ParentTask:TTaskItem;
//
//    ParentTaskGUID:String;
//    RootTaskGUID:String;
//    StartTime:TDateTime;


end;

procedure TTaskItem.Pause;
var
  I: Integer;
begin

  IsPause:=True;


  for I := 0 to ThreadItems.Count-1 do
  begin
    ThreadItems[I].FThread.Suspended:=True;
  end;



end;

procedure TTaskItem.PrepareSubWorkParam(ASubWork: TTaskItem;ASubWorkIndex:Integer);
begin

end;

procedure TTaskItem.Resume;
var
  I: Integer;
begin

  IsPause:=False;

  for I := 0 to ThreadItems.Count-1 do
  begin
    ThreadItems[I].FThread.Suspended:=False;
  end;


end;

function TTaskItem.SaveToJson: ISuperObject;
var
  AParmasStr:String;
  I: Integer;
begin

  if FJson=nil then
  begin
    FJson:=SO();
  end;

  Result:=FJson;

  AParmasStr:='';
  if Params<>nil then
  begin
    AParmasStr:=Params.AsJSON;//(False,False);
//    uBaseLog.HandleException(nil,'AParmasStr:'+AParmasStr);
//    AParmasStr:=ReplaceStr(AParmasStr,'\/','/');
//    uBaseLog.HandleException(nil,'AParmasStr:'+AParmasStr);
//    AParmasStr:=Params.AsJSON(True,True);
//    uBaseLog.HandleException(nil,'AParmasStr:'+AParmasStr);
//    AParmasStr:=Params.AsJSON(False,True);
//    uBaseLog.HandleException(nil,'AParmasStr:'+AParmasStr);
//    AParmasStr:=Params.AsJSON(True,False);
//    uBaseLog.HandleException(nil,'AParmasStr:'+AParmasStr);
//    ShowMessage(AParmasStr);
  end;

  if not FJson.Contains('fid') then
  begin
    //没有保存过
//    uDatasetToJson.ConvertArrayToJson(
//        ConvertToStringDynArray(['appid','user_fid','task_guid','task_type','name','params_json','is_deleted','createtime','parent_task_guid','root_task_guid',
//          //'process_id',
//          'works_count','finished_works_count'
//          ]),
//        ConvertToVariantDynArray([FAppID,FUserFID,GUID,Type_,Name,AParmasStr,0,StdDateTimeToStr(Now),ParentTaskGUID,RootTaskGUID,
//          //Self.Owner.FCurrentProcessId,
//          0,0
//          ]),
//          Result
//          );

    Result.I['appid']:=StrToInt(FAppID);
    Result.S['user_fid']:=FUserFID;
    Result.S['task_guid']:=GUID;

    Result.S['task_type']:=Type_;
    Result.S['sub_type']:=SubType;
    Result.S['name']:=Name;
    Result.S['params_json']:=AParmasStr;
    Result.i['is_deleted']:=0;
    Result.S['createtime']:=StdDateTimeToStr(Now);
    Result.S['parent_task_guid']:=ParentTaskGUID;
    Result.S['root_task_guid']:=RootTaskGUID;
    Result.I['works_count']:=0;
    Result.I['finished_works_count']:=0;

  end;

  Result.S['name']:=Name;
  Result.S['task_type']:=Type_;
  Result.O['params']:=Params;
  Result.S['params_json']:=AParmasStr;
  if (Params<>nil) and (Type_=Const_TaskType_UserSearch) then
  begin
    Result.S['keyword']:=Params.S['keyword'];
    Result.S['country_code']:=Params.S['country_code'];
    Result.S['country_name']:=Params.S['country_name'];

  end;

  //不保存到数据中
  Result.O['data']:=DataJson;

  if ParamDetailList.Length>0 then
  begin
    Result.A['param_detail_list']:=ParamDetailList;
  end;
  Result.I['param_detail_count']:=ParamDetailList.Length;

  Result.I['progress']:=FProgress;
  Result.I['progress_max']:=FProgressMax;
  Result.S['from_platform']:=Self.FFromPlatform;
  Result.S['error']:=Self.Error;

  Result.S['process_client_name']:=Self.FProcessClientName;


  if FResultDataList.Length=0 then
  begin
    Self.GenerateResultDataList;
  end;
  if FResultDataList.Length>0 then
  begin
    Result.A['result_data_list']:=FResultDataList;
  end;

  //保存子工作
  { TODO : 保存子工作 }
  //生成子工作
//  GererateSubWorks;
//  for I := 0 to Self.Works.Count-1 do
//  begin
//    Result.A['sub_work_list'].O[I]:=Self.Works[I].SaveToJson;
//  end;


//    FAppID:String;
//    FUserFID:String;
//  public
//    //开始工作了
//    State:TTaskState;
//  public
//    //任务ID
//    GUID:String;
//    //任务名称
//    Name:String;
//    //任务类型
//    Type_:String;
//
//    //参数,或者说包含需要操作的子任务数
//    Params:ISuperObject;
//    DataObject:TObject;
////    Data:Pointer;
////    DataStr:String;
//
//    //这个任务的最大协作线程数
//    MaxWorkThreadCount:Integer;
//    ParentTask:TTaskItem;
//
//    ParentTaskGUID:String;
//    RootTaskGUID:String;
//    StartTime:TDateTime;


end;

procedure TTaskItem.Start(ATaskWorkThreadItemClass:TTaskWorkThreadItemClass=nil);
var
  I:Integer;
  AWorkThreadItem:TTaskWorkThreadItem;
begin
  for I := 0 to MaxWorkThreadCount-1 do
  begin

    if ATaskWorkThreadItemClass<>nil then
    begin
      //创建多个工作线程
      AWorkThreadItem:=ATaskWorkThreadItemClass.Create(False,Self,Owner);
    end
    else
    begin
      //创建多个工作线程
      AWorkThreadItem:=Owner.TaskWorkThreadItemClass.Create(False,Self,Owner);
    end;



    ThreadItems.Add(AWorkThreadItem);

  end;
end;

procedure TTaskItem.Stop;
var
  I: Integer;
begin
  uBaseLog.HandleException(nil,'TTaskItem.Stop Begin');


  //结束任务
  IsStop:=True;
//  State:=tsFinished;

//  Self.State:=tsStop;


  for I := 0 to Self.Works.Count-1 do
  begin
//    Self.Works[I].State:=tsFinished;
//    Self.Works[I].IsStop:=True;
    Self.Works[I].Stop;
  end;


//  Self.DataIntfResult.Succ:=True;
//  try
//    if Assigned(Self.OnFinishedCallback) then
//    begin
//      Self.OnFinishedCallback(Self,Self,Self.DataIntfResult);
//    end;
//  except
//    on E:Exception do
//    begin
//      Self.DataIntfResult.Desc:=E.Message;
//      uBaseLog.HandleException(E,'TTaskItem.Stop OnFinishedCallback Task:'+Self.Name);
//    end;
//  end;
//  FreeAndNil(Self.DataIntfResult);



  //属于我这个任务的工作线程列表
  for I := 0 to ThreadItems.Count-1 do
  begin
    if not TProtectedThread(ThreadItems[I].FThread).Terminated then
    begin
//      ThreadItems[I].Terminate;
//      ThreadItems[I].WaitFor;
      ThreadItems[I].Free;
    end;
  end;
  ThreadItems.Clear(False);


  uBaseLog.HandleException(nil,'TTaskItem.Stop End');
end;

{ TTaskList }

function TTaskList.Add(AObject: TObject): Integer;
begin
  Result:=Inherited Add(AObject);

  TTaskItem(AObject).ParentTask:=Owner;
end;

constructor TTaskList.Create(const AObjectOwnership: TObjectOwnership;
  const AIsCreateObjectChangeManager: Boolean);
begin
  Inherited;

  FLock:=TCriticalSection.Create;

end;

destructor TTaskList.Destroy;
begin
  FreeAndNil(FLock);
  inherited;
end;

function TTaskList.Find(ATaskGUID: String): TTaskItem;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if Items[I].GUID=ATaskGUID then
    begin
      Result:=Items[I];
      Break;
    end;
    Result:=Items[I].Works.Find(ATaskGUID);
    if Result<>nil then
    begin
      Break;
    end;
  end;
end;

function TTaskList.GetItem(Index: Integer): TTaskItem;
begin
  Result:=TTaskItem(Inherited Items[Index]);
end;

procedure TTaskList.Lock;
begin
  FLock.Enter;
end;

procedure TTaskList.UnLock;
begin
  FLock.Leave;
end;

function TTaskList.UnWorkItemsCount: Integer;
var
  I: Integer;
begin
  Result:=0;

  for I := 0 to Count-1 do
  begin
    Result:=Result+Items[I].UnWorkItemCount;
  end;
end;

{ TTaskManager }

function TTaskManager.CanDoThisTask(ATaskItem: TTaskItem): Boolean;
begin
  Result:=True;
end;

constructor TTaskManager.Create;
begin
  FCurrentProcessId:=CreateGUIDString();


  //任务列表
  TaskList:=TTaskList.Create;
  //已完成的任务列表
  FinishedTaskList:=TTaskList.Create();

  TaskWorkThreadItemClass:=TTaskWorkThreadItem;

//  FDataInterface:=Self.CreateDataInterface;

  MaxThreadCount:=1;
  //线程池
  ThreadItems:=TTaskWorkThreadItems.Create;

  FEventManager:=TSkinObjectChangeManager.Create(nil);


end;

//function TTaskManager.CreateDataInterface: TDataInterface;
//begin
//  Result:=nil;
//end;

function TTaskManager.CreateTaskWorkThreadItem: TTaskWorkThreadItem;
begin
  Result:=TaskWorkThreadItemClass.Create(False,nil,Self);
end;

destructor TTaskManager.Destroy;
var
  I: Integer;
begin
  FreeWorkThreadItems;

  FreeAndNil(ThreadItems);


  FreeAndNil(TaskList);

  FinishedTaskList.Clear(True);
  FreeAndNil(FinishedTaskList);

  FreeAndNil(FEventManager);

  inherited;
end;


procedure TTaskManager.DoTaskFree(ATaskItem: TTaskItem);
begin
  Self.FinishedTaskList.Add(ATaskItem);

end;

procedure TTaskManager.DoWorkThreadExecuteBegin;
begin

end;

procedure TTaskManager.DoWorkThreadExecuteEnd;
begin

end;

procedure TTaskManager.DoWorkThreadExecuteWorkItem(ATaskWorkThreadItem:TTaskWorkThreadItem;ATaskItem:TTaskItem;AWorkItem:TTaskItem);
begin
  if Assigned(AWorkItem.OnWorkThreadExecute) then
  begin
    AWorkItem.DoWorkInWorkThreadExecute(ATaskWorkThreadItem,ATaskWorkThreadItem,AWorkItem);
  end
  else
  begin
    ATaskItem.DoWorkInWorkThreadExecute(ATaskWorkThreadItem,ATaskWorkThreadItem,AWorkItem);
  end;

end;

procedure TTaskManager.DoWorkThreadIdle;
begin

end;

function TTaskManager.FindRunningTaskItem(ATaskGUID: String): TTaskItem;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.ThreadItems.Count-1 do
  begin
    if (Self.ThreadItems[I].TaskItem<>nil)
      and (Self.ThreadItems[I].TaskItem.GUID=ATaskGUID) then
    begin
      Result:=Self.ThreadItems[I].TaskItem;
      Break;
    end;
  end;
end;

procedure TTaskManager.FreeWorkThreadItems;
var
  I:Integer;
begin
  for I := 0 to ThreadItems.Count-1 do
  begin
    ThreadItems[I].Free;
  end;
  ThreadItems.Clear(False);

end;

function TTaskManager.GetMaxThreadCount: Integer;
//var
//  AUnWorkItemsCount:Integer;
begin
//  AUnWorkItemsCount:=Self.TaskList.UnWorkItemsCount;
  Result:=MaxThreadCount;//Min(AUnWorkItemsCount,MaxThreadCount);
end;


function TTaskManager.GetOtherThreadUnWorkTaskItem(
  ATaskWorkThreadItem: TTaskWorkThreadItem): TTaskItem;
begin
  Result:=nil;
end;

function TTaskManager.GetStatusLog: String;
begin
  Result:='待处理任务数：'+IntToStr(TaskList.Count)+#13#10
          +'已完成任务数：'+IntToStr(FinishedTaskListCount)+#13#10
          +'最大线程数：'+IntToStr(MaxThreadCount)+#13#10
          +'当前线程数：'+IntToStr(ThreadItems.Count);


end;

function TTaskManager.GetUnWorkTaskItem(ATaskWorkThreadItem:TTaskWorkThreadItem): TTaskItem;
var
  I:Integer;
  ATaskItem:TTaskItem;
begin
    Result:=nil;

    for I := 0 to Self.TaskList.Count-1 do
    begin
      ATaskItem:=Self.TaskList[I];
      if //(not AIsNeedCheckCanDoThisTask or AIsNeedCheckCanDoThisTask and CanDoThisTask(ATaskItem))
        ATaskWorkThreadItem.CanDoThisTask(ATaskItem)
        and Self.CanDoThisTask(ATaskItem)
        and not ATaskItem.IsPause
        and not ATaskItem.IsWorkFinished then
      begin
        Result:=ATaskItem.GetUnWorkItem;

        if Result<>nil then
        begin
          ATaskWorkThreadItem.TaskItem:=ATaskItem;
          Self.TaskList.Remove(ATaskItem,False);
          Exit;
        end;

      end;

    end;

    //如果没有获取到WorkItem,看看别的ThreadItem有没有需要协助的子工作需要处理
    //这里偶尔会报错
    if Result=nil then
    begin
      Result:=GetOtherThreadUnWorkTaskItem(ATaskWorkThreadItem);
    end;

end;

function TTaskManager.IsWorkThreadsSuspended: Boolean;
var
  I: Integer;
begin
  Result:=True;
  for I := 0 to ThreadItems.Count-1 do
  begin
    Result:=Result and ThreadItems[I].FThread.Suspended;
  end;
end;

procedure TTaskManager.ResumeWorkThreads;
var
  I: Integer;
begin
  for I := 0 to ThreadItems.Count-1 do
  begin
    ThreadItems[I].FThread.Resume;
  end;
end;

function TTaskManager.CreateSaveDataInterface: TDataInterface;
begin
  Result:=GlobalDataInterfaceClass.Create;
end;

function TTaskManager.StartTask(ATaskItem:TTaskItem
//                                AWorkThreadExecute:TWorkThreadExecuteEvent;
//                                //整个任务完成后的回调事件
//                                AFinishedCallback:TTaskCallback;
//                                //任务运行中获取到部分数据后的回调事件
//                                AProgressCallback:TTaskCallback=nil;
//                                //任务运行所需要的参数
//                                AParams:ISuperObject=nil
                                ): TTaskItem;
begin
  Result:=ATaskItem;

//  Result.OnWorkThreadExecute:=AWorkThreadExecute;
//  Result.OnWorkThreadProgress:=AProgressCallback;
//  Result.OnFinishedCallback:=AFinishedCallback;
//
//  Result.Params:=AParams;
//  Result.MaxWorkThreadCount:=AMaxWorkThreadCount;

  Self.TaskList.Add(Result);



//  //将任务保存到数据库
//  Result.AddToDB(AppID,
//                  UserFID,

  StartWorkThread;

end;

procedure TTaskManager.StartWorkThread;
var
//  ADesc:String;
  ATaskWorkThreadItem:TTaskWorkThreadItem;
begin

  //没有空闲的工作线程就创建
//  if ThreadItems.FreeCount=0 then//这样也不行，会导致线程数无限增大
//  begin
//    ATaskWorkThreadItem:=CreateTaskWorkThreadItem;
//    ThreadItems.Add(ATaskWorkThreadItem);
//  end;
  Self.SyncWorkThreadItems;
end;

procedure TTaskManager.StopTaskList;
var
  I:Integer;
begin

  for I := TaskList.Count-1 downto 0 do
  begin
    //TaskList[I].Stop;
    TaskList.Delete(I);
  end;

  for I := 0 to ThreadItems.Count-1 do
  begin
    if ThreadItems[I].TaskItem<>nil then
    begin
      ThreadItems[I].TaskItem.Stop;
    end;
  end;

end;

procedure TTaskManager.SuspendWorkThreads;
var
  I: Integer;
begin
  for I := 0 to ThreadItems.Count-1 do
  begin
    ThreadItems[I].FThread.Suspend;
  end;
end;

procedure TTaskManager.SyncWorkThreadItems;
var
  I: Integer;
  ANeedCreateCount:Integer;
  ATaskWorkThreadItem:TTaskWorkThreadItem;
begin
  ANeedCreateCount:=GetMaxThreadCount-Self.ThreadItems.Count;
  for I := 0 to ANeedCreateCount-1 do
  begin
    ATaskWorkThreadItem:=CreateTaskWorkThreadItem;
    ThreadItems.Add(ATaskWorkThreadItem);
  end;
end;

{ TTaskWorkThreadItem }

function TTaskWorkThreadItem.CanDoThisTask(ATaskItem: TTaskItem): Boolean;
begin
  Result:=True;//Self.TaskManager.CanDoThisTask(ATaskItem);
end;

function TTaskWorkThreadItem.CanExitThread: Boolean;
begin
  Result:=False;//(WorkItem=nil);
end;

constructor TTaskWorkThreadItem.Create(ACreateSuspended: Boolean;
  ATaskItem: TTaskItem;ATaskManager:TTaskManager);
begin
  //Inherited Create(ACreateSuspended);

//  if AThreadClass=nil then
//  begin
//    AThreadClass:=TThread;
//  end;
//  FThread:=AThreadClass.Create(ACreateSuspended);

  //创建一个线程
  FThread:=CreateThread(ACreateSuspended,ATaskItem);

  TaskItem:=ATaskItem;
  TaskManager:=ATaskManager;
//  OnExecute:=TaskItem.OnWorkThreadExecute;
end;

function TTaskWorkThreadItem.CreateThread(ACreateSuspended:Boolean;ATaskItem:TTaskItem): TWorkThread;
begin
  Result:=TWorkThread.Create(ACreateSuspended);
  TWorkThread(Result).ThreadItem:=Self;

end;

destructor TTaskWorkThreadItem.Destroy;
begin
  uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Destroy Begin');

  FThread.Terminate;
  FThread.WaitFor;
  FreeAndNil(FThread);


  inherited;
  uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Destroy End');
end;

procedure TTaskWorkThreadItem.DoExecuteBegin;
begin
  if TaskManager<>nil then
  begin
    TaskManager.DoWorkThreadExecuteBegin;
  end;

end;

procedure TTaskWorkThreadItem.DoExecuteEnd;
begin
  if TaskManager<>nil then
  begin
    TaskManager.DoWorkThreadExecuteEnd;
  end;

end;

procedure TTaskWorkThreadItem.DoExecuteIdle;
begin
  Sleep(3000);

  if TaskManager<>nil then
  begin
    TaskManager.DoWorkThreadIdle;
  end;

end;

procedure TTaskWorkThreadItem.DoExecuteWorkItem;
begin
  if TaskManager<>nil then
  begin
    TaskManager.DoWorkThreadExecuteWorkItem(Self,TaskItem,WorkItem);
  end;
end;

procedure TTaskWorkThreadItem.Execute;
begin
      uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+Self.GetLogID+' Begin');



      while not TProtectedThread(FThread).Terminated do
      begin


          //获取一个合适的账号
          DoExecuteBegin;


          //有几个主题,就开几个账号和几个线程一起获取
//          {$IFDEF OPEN_PLATFORM_SERVER}
          uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+Self.GetLogID+' 准备获取任务');
//          {$ELSE}
//          {$ENDIF}


          //从Params中获取一个待处理的工作
//          uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+ClassName+' TaskList Count 任务数：'+IntToStr(TaskManager.TaskList.Count));
          WorkItem:=GetTaskUnWorkItem;//TaskItem.GetUnWorkItem;


          if CanExitThread then//WorkItem=nil then
          begin
            Exit;
          end;


          if WorkItem<>nil then
          begin
              uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+Self.GetLogID+' 获取到任务');

              try


                  if not TaskItem.IsStop then//任务没有被停止
                  begin
                      try

                         DoExecuteWorkItem;

                      except
                        on E:Exception do
                        begin
                          WorkItem.Error:=E.Message;
                          WorkItem.DataIntfResult.Desc:=E.Message;
                          uBaseLog.HandleException(E,'TTaskWorkThreadItem.Execute '+GetLogID+' OnExecute Work:'+WorkItem.Name+' Params:'+WorkItem.Params.AsJSON);
                        end;
                      end;
                  end
                  else
                  begin
                      uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+GetLogID+' 任务停止了');
                      WorkItem.State:=tsFinished;
                  end;



                  //一个子工作结束的事件
                  if WorkItem.Works.Count=0 then//没有子工作
                  begin
                        WorkItem.State:=tsFinished;
                        WorkItem.DoFinishedInWorkThreadExecute(Self,Self);
                  end;


              finally
                  if WorkItem<>TaskItem then
                  begin
                      //子任务执行结束
                      uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+Self.GetLogID+' 是一个子任务执行结束了');
                  end;

                  //所有工作完成就表示任务结束了
                  if TaskItem.IsWorkFinished then
                  begin
                      uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+Self.GetLogID+' 父任务执行结束了');
                      TaskItem.State:=tsFinished;
                      Inc(Self.TaskManager.FinishedTaskListCount);
                      //放到DoTaskFree
                      //TaskManager.FinishedTaskList.Add(TaskItem);


                      if WorkItem<>TaskItem then
                      begin
                        //执行父任务的结束事件
                        if TaskItem.DataIntfResult<>nil then TaskItem.DataIntfResult.Succ:=True;
                        TaskItem.DoFinishedInWorkThreadExecute(Self,Self);

                      end;


                      //父任务执行结束
                      uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+Self.GetLogID+' 是一个父任务执行结束了');

//                      FreeAndNil(TaskItem);

                      //用户搜索任务因为账号失效而搜索中断,会重新将任务加入到TaskList中,这种情况不需要释放
                      if Self.TaskManager.TaskList.IndexOf(TaskItem)=-1 then
                      begin
                        //有些任务是执行完直接释放,有些由任务创建者释放,所以
                        Self.TaskManager.DoTaskFree(TaskItem);
                      end
                      else
                      begin
                        TaskItem.State:=tsWaiting;
                      end;
                      Self.TaskItem:=nil;

                  end;

//                  if WorkItem<>TaskItem then
//                  begin
//                      //子任务执行结束
//                      uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+Self.GetLogID+' 是一个子任务执行结束了');
//
////                      if TaskItem.IsWorkFinished then
////                      begin
////
////                          if TaskItem.DataIntfResult<>nil then TaskItem.DataIntfResult.Succ:=True;
////                          TaskItem.DoFinishedInWorkThreadExecute(Self,Self);
//////                          try
//////
//////
//////                            if Assigned(TaskItem.OnFinishedCallback) then
//////                            begin
//////                              TaskItem.OnFinishedCallback(Self,Self,TaskItem,TaskItem.DataIntfResult);
//////                            end;
//////
//////
//////                          except
//////                            on E:Exception do
//////                            begin
//////                              TaskItem.DataIntfResult.Desc:=E.Message;
//////                              uBaseLog.HandleException(E,'TTaskWorkThreadItem.Execute '+ClassName+' OnFinishedCallback Task:'+TaskItem.Name);
//////                            end;
//////                          end;
////
//////                          FreeAndNil(TaskItem.DataIntfResult);
////
//////                          FreeAndNil(TaskItem);
////                          //用户搜索任务因为账号失效而搜索中断,会重新将任务加入到TaskList中,这种情况不需要释放
////                          if Self.TaskManager.TaskList.IndexOf(TaskItem)=-1 then
////                          begin
////                            Self.TaskManager.DoTaskFree(TaskItem);
////                          end
////                          else
////                          begin
////                            TaskItem.State:=tsWaiting;
////                          end;
////                          Self.TaskItem:=nil;
////                      end;
//                  end
//                  else
//                  begin
////
////                      //子任务执行结束
////                      uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+Self.GetLogID+' 是一个子任务执行结束了');
////
//////                      FreeAndNil(TaskItem);
////                      //用户搜索任务因为账号失效而搜索中断,会重新将任务加入到TaskList中,这种情况不需要释放
////                      if Self.TaskManager.TaskList.IndexOf(TaskItem)=-1 then
////                      begin
////                        Self.TaskManager.DoTaskFree(TaskItem);
////                      end
////                      else
////                      begin
////                        TaskItem.State:=tsWaiting;
////                      end;
////                      Self.TaskItem:=nil;
////
//                  end;

              end;


          end
          else
          begin
              //空闲,休息
              {$IFDEF OPEN_PLATFORM_SERVER}
              uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+Self.GetLogID+' 没有取到任务');
              {$ELSE}
              {$ENDIF}
//              uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+ClassName+' NO WorkItem, Can Sleep');
//              uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+ClassName+' Thread Count 工作线程数： '+IntToStr(TaskManager.ThreadItems.Count));
              Sleep(1000);
              DoExecuteIdle;
          end;

          DoExecuteEnd;

      end;



  uBaseLog.HandleException(nil,'TTaskWorkThreadItem.Execute '+GetLogID+' End');

end;


function TTaskWorkThreadItem.GetLogID: String;
begin
  Result:='线程'+IntToStr(Self.TaskManager.ThreadItems.IndexOf(Self));
end;

function TTaskWorkThreadItem.GetTaskUnWorkItem//(AIsNeedCheckCanDoThisTask:Boolean=True)
                                              : TTaskItem;
var
  I: Integer;
  ATaskItem:TTaskItem;
begin
  //根据线程模式来判断使用

  Result:=nil;

  if TaskItem<>nil then
  begin
    Result:=TaskItem.GetUnWorkItem;
  end;

  if Result<>nil then
  begin
    //执行TaskItem.Progress事件时要传WorkThreadItem
    Result.WorkThreadItem:=Self;
    Exit;
  end;

  if TaskManager<>nil then
  begin
    Result:=TaskManager.GetUnWorkTaskItem(Self);
  end;


  if Result<>nil then
  begin
    //执行TaskItem.Progress事件时要传WorkThreadItem
    Result.WorkThreadItem:=Self;
  end;
end;

{ TWorkThread }

procedure TWorkThread.Execute;
begin
  ThreadItem.Execute;

end;


{$IFDEF MSWINDOWS}

{ TCommonTaskDataFetchTaskItem }
constructor TCommonTaskDataFetchTaskItem.Create(AOwner: TTaskManager);
begin
  inherited;

  //数据表名
  FDataTableNames:=TStringList.Create;

  //数据表主键名
  FDataTableKeys:=TStringList.Create;
end;

destructor TCommonTaskDataFetchTaskItem.Destroy;
begin
//  {$IFDEF PYTHON_TASKMANAGER_MODE}
//      //常驻一个Python的taskmanager.py的进程,它会定时检测任务并运行任务
//  {$ELSE}
//      //每个任务单独一个python进程的模式
//      StopExecuteCommandThread;
//  {$ENDIF}

  FreeAndNil(FDataTableNames);
  FreeAndNil(FDataTableKeys);
  inherited;
end;

//procedure TCommonTaskDataFetchTaskItem.DoUpdateTaskStateExecute(
//  Sender: TObject);
//var
//  ADesc:String;
//begin
//  uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.DoUpdateTaskStateExecute Begin');
//
//  //这里会卡死,所以放线程里面了
//  uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.DoUpdateTaskStateExecute UpdateStateToDB');
////  GlobalWebSearchTaskManager.DBModuleLock.Enter;
////  try
//    Self.UpdateStateToDB(GlobalWebSearchTaskManager.AppID,
//                            GlobalWebSearchTaskManager.UserFID,
////                            GlobalWebSearchTaskManager.DBModule,
//                            ADesc);
////  finally
////    GlobalWebSearchTaskManager.DBModuleLock.Leave;
////  end;
//
//  uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.DoUpdateTaskStateExecute End');
//end;

function TCommonTaskDataFetchTaskItem.GetDataRecordListSelectWhereSQL: String;
begin

  if FCustomDataSelectWhereSQL='' then
  begin
    Result:=' AND task_guid='+QuotedStr(Self.GUID)+' ';
  end
  else
  begin
    Result:=FCustomDataSelectWhereSQL;
  end;
end;

//procedure TCommonTaskDataFetchTaskItem.Pause;
//var
//  ADesc:String;
//begin
//  inherited;
//
////  GlobalWebSearchTaskManager.DBModuleLock.Enter;
////  try
//    Self.UpdateStateToDB(FAppID,
//                        FUserFID,//GlobalBaseManager.User.fid,
////                        GlobalWebSearchTaskManager.DBModule,
//                        ADesc);
////  finally
////    GlobalWebSearchTaskManager.DBModuleLock.Leave;
////  end;
//
//end;
//
//procedure TCommonTaskDataFetchTaskItem.Resume;
//var
//  ADesc:String;
//begin
//  inherited;
//
//
////  GlobalWebSearchTaskManager.DBModuleLock.Enter;
////  try
//    Self.UpdateStateToDB(AppID,
//                        GlobalBaseManager.User.fid,
////                        GlobalWebSearchTaskManager.DBModule,
//                        ADesc);
////  finally
////    GlobalWebSearchTaskManager.DBModuleLock.Leave;
////  end;
//end;
//
//procedure TCommonTaskDataFetchTaskItem.Stop;
//var
//  ADesc:String;
//begin
//
//  uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.Stop Begin');
//
//  inherited;
//
//
////  {$IFDEF PYTHON_TASKMANAGER_MODE}
////      //常驻一个Python的taskmanager.py的进程,它会定时检测任务并运行任务
////  {$ELSE}
////      //每个任务单独一个python进程的模式
////      uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.Stop StopExecuteCommandThread');
////      StopExecuteCommandThread;
////  {$ENDIF}
//
//
////  GlobalWebSearchTaskManager.DBModuleLock.Enter;
////  try
//    Self.UpdateStateToDB(AppID,
//                        GlobalBaseManager.User.fid,
////                        GlobalWebSearchTaskManager.DBModule,
//                        ADesc);
////  finally
////    GlobalWebSearchTaskManager.DBModuleLock.Leave;
////  end;
//
////  GetGlobalTimerThread.RunTempTask(Self.DoUpdateTaskStateExecute,nil);
//
//
//  uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.Stop End');
//end;

//procedure TCommonTaskDataFetchTaskItem.StopExecuteCommandThread;
//begin
//  uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.StopExecuteCommandThread Begin');
//
//  {$IFDEF PYTHON_TASKMANAGER_MODE}
//      //常驻一个Python的taskmanager.py的进程,它会定时检测任务并运行任务
//  {$ELSE}
//      //每个任务单独一个python进程的模式
//      if FExecuteSpiderCommandThread<>nil then
//      begin
//        //手动终止进程
//        //每个python进程自己有线程会检测任务是否停止，如果停止就停止执行
//        //    if FExecuteSpiderCommandThread.FPI.hProcess>0 then
//        //    begin
//        //      uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.StopExecuteCommandThread TerminateProcess Begin');
//        //      TerminateProcess(FExecuteSpiderCommandThread.FPI.hProcess,0);
//        //      uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.StopExecuteCommandThread TerminateProcess End');
//        //    end;
//
//        //scrapy中有TaskListenThread，定时检测任务的状态,如果为stop或者finished
//        //那么它会自动终止进程
//        FExecuteSpiderCommandThread.Terminate;
//        FExecuteSpiderCommandThread.WaitFor;
//        FreeAndNil(FExecuteSpiderCommandThread);
//      end;
//  {$ENDIF}
//
//  uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.StopExecuteCommandThread End');
//end;
{$ENDIF}


{ TTaskItem_SaveToRest }

function TTaskItem_SaveToRest.AddSubWorksToDB(//AAppID, AUserFID: String;
  var ADesc: String): Boolean;
var
  I:Integer;
begin
  //保存子工作到数据库
  //生成子工作
  GererateSubWorks;
  for I := 0 to Self.Works.Count-1 do
  begin
    Self.Works[I].AddToDB(//AAppID,AUserFID,
                          ADesc);
  end;

end;

function TTaskItem_SaveToRest.AddSubWorkToDB(//AAppID: String; AUserFID,
  ASubWorkGUID, ASubWorkParmasStr: String;
  ATaskType:String;
  var ADesc: String): Boolean;
var
  ACode:Integer;
  ADataJson:ISuperObject;
  AParmasStr:String;
  ARecordDataJson:ISuperObject;
  AStringStream:TStringStream;

  ADataInterface:TDataInterface;
  ASaveDataSetting:TSaveDataSetting;
  ADataIntfResult:TDataIntfResult;
begin
  Result:=False;
  ADesc:='';


  AParmasStr:='';
  if Params<>nil then
  begin
    AParmasStr:=Params.AsJSON;
  end;

  if ATaskType='' then
  begin
    ATaskType:=Type_;
  end;

  ARecordDataJson:=SO();
  uDatasetToJson.ConvertArrayToJson(
      ConvertToStringDynArray(['appid','user_fid','task_guid','task_type','name','params_json','is_deleted','createtime','parent_task_guid','root_task_guid','process_id','works_count','finished_works_count']),
      ConvertToVariantDynArray([FAppID,FUserFID,ASubWorkGUID,ATaskType,Name+'_SubWork',ASubWorkParmasStr,0,StdDateTimeToStr(Now),GUID,GUID,Self.Owner.FCurrentProcessId,0,0]),
      ARecordDataJson
      );
  AParmasStr:=ARecordDataJson.AsJSON;

  { TODO : 注释掉了 }
//  {$IFDEF HAS_LOCAL_DB_INTERFACE}
//  //使用本地数据库模式
//  GlobalCommonRestIntfList.Find('task').AddRecord(GlobalCommonRestIntfList.Find('task').DBModule,
//                                                  nil,AAppID,ARecordDataJson,nil,ACode,ADesc,ADataJson);


  //使用本地数据库模式
  ADataInterface:=Self.CreateSaveDataInterface;
  ADataInterface.Name:=GetTaskIntfName;//'task';
  ADataIntfResult:=TDataIntfResult.Create;
  try
    ASaveDataSetting.Clear;
    ASaveDataSetting.AppID:=FAppID;
    ASaveDataSetting.RecordDataJson:=ARecordDataJson;
    if not ADataInterface.SaveData(ASaveDataSetting,ADataIntfResult) then
    begin
//      ShowMessage(ADesc);
      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.AddToDB 插入任务add_record_post_2 '+ADesc);
      Exit;
    end;

  finally
    FreeAndNil(ADataInterface);
    FreeAndNil(ADataIntfResult);
  end;

//  {$ELSE}
//
//  AStringStream:=TStringStream.Create(AParmasStr,TEncoding.UTF8);
//  AStringStream.Position:=0;
//  try
//
//
//    if not SimpleCallAPI('add_record_post_2',
//                        nil,
//                        TableRestCenterInterfaceUrl,
//                        ConvertToStringDynArray(['appid',
//                                                'user_fid',
//                                                'key',
//                                                'rest_name'//,
//                        //                        'record_data_json'
//                                                ]),
//                        ConvertToVariantDynArray([AAppID,
//                                                  0,
//                                                  '',
//                                                  'task'//,
//                          //                        AParmasStr
//                                                  ]),
//                        ACode,
//                        ADesc,
//                        ADataJson,
//                        GlobalRestAPISignType,
//                        GlobalRestAPIAppSecret,
//                        True,
//                        AStringStream
//                        ) or (ACode<>200) then
//    begin
////      ShowMessage(ADesc);
//      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.AddSubWorkToDB 添加子任务add_record_post_2 '+ADesc);
//      Exit;
//    end;
//
//
//
//
//  finally
//    FreeAndNil(AStringStream);
//  end;
//
//  {$ENDIF}


  Result:=True;


end;

procedure TTaskItem_SaveToRest.Pause;
var
  ADesc:String;
begin
  inherited;

//  GlobalWebSearchTaskManager.DBModuleLock.Enter;
//  try
    Self.UpdateStateToDB(//FAppID,
                        //FUserFID,//GlobalBaseManager.User.fid,
//                        GlobalWebSearchTaskManager.DBModule,
                        ADesc);
//  finally
//    GlobalWebSearchTaskManager.DBModuleLock.Leave;
//  end;

end;

procedure TTaskItem_SaveToRest.Resume;
var
  ADesc:String;
begin
  inherited;


//  GlobalWebSearchTaskManager.DBModuleLock.Enter;
//  try
    Self.UpdateStateToDB(//FAppID,
                        //FUserFID,//GlobalBaseManager.User.fid,
//                        GlobalWebSearchTaskManager.DBModule,
                        ADesc);
//  finally
//    GlobalWebSearchTaskManager.DBModuleLock.Leave;
//  end;
end;

procedure TTaskItem.SaveTaskResultDataList(
  ATaskResultDataList: ISuperArray);
var
  ARecordDataJson:ISuperObject;
  ADataInterface:TDataInterface;
  ASaveDataSetting:TSaveDataSetting;
  ASaveDataIntfResult:TDataIntfResult;
  I: Integer;
  ADataIntfResultRecordJson:ISuperObject;
begin
    //使用本地数据库模式
    ADataInterface:=Self.CreateSaveDataInterface;
    ADataInterface.Name:='task_result_data';
    ASaveDataIntfResult:=TDataIntfResult.Create;
    try
      ASaveDataSetting.Clear;
      ASaveDataSetting.AppID:=Self.FAppID;
//      ASaveDataSetting.IsAddIfNotExist:=True;
//      ASaveDataSetting.CheckExistFieldNames:='fid';
//      ASaveDataSetting.RecordDataJson:=ARecordDataJson;
//      if not ADataInterface.SaveData(ASaveDataSetting,ASaveDataIntfResult) then
//      begin
//        //ShowMessage(ADesc);
//        uBaseLog.HandleException(nil,'TWebSearchTaskManager.DoUploadContentWorkInWorkThreadExecute 添加发帖任务结果数据add_record_post_2 '+ASaveDataIntfResult.Desc);
//    //    Exit;
//      end;
      if ADataInterface.SaveDataList(ASaveDataSetting,ATaskResultDataList,ASaveDataIntfResult) then
      begin
            for I := 0 to ASaveDataIntfResult.DataJson.A['RecordList'].Length-1 do
            begin
                ADataIntfResultRecordJson:=ASaveDataIntfResult.DataJson.A['RecordList'].O[I];
                if ADataIntfResultRecordJson.I['Code']<>SUCC then
                begin

                    //保存失败,一般是记录已经存在
  //                      ADataIntfResult.DataJson.A['RecordList'].O[I].S['fid']:='';//清除新生成的FID
                    ATaskResultDataList.O[I].B['is_saved_succ']:=False;


//                    if ADataIntfResultRecordJson.O['Data'].I['fid']=0 then//换成原来已经存在的数据的FID
//                    begin
//                      ATaskResultDataList.O[I].I['fid']:=ADataIntfResultRecordJson.O['Data'].I['fid'];
//                    end;

                    uBaseLog.HandleException(nil,'TWebSearchTaskManager.DoUserSearchWorkInWorkThreadExecute 添加用户搜索子任务结果数据add_record_post_2 ' + ADataIntfResultRecordJson.S['Desc']);

                end
                else
                begin
                    ATaskResultDataList.O[I].B['is_saved_succ']:=True;
                    ATaskResultDataList.O[I].I['fid']:=ADataIntfResultRecordJson.O['Data'].I['fid'];

                end;
            end;
      end;

    finally
      FreeAndNil(ADataInterface);
      FreeAndNil(ASaveDataIntfResult);
    end;

end;

procedure TTaskItem_SaveToRest.Stop;
var
  ADesc:String;
begin

  uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.Stop Begin');

  inherited;


//  {$IFDEF PYTHON_TASKMANAGER_MODE}
//      //常驻一个Python的taskmanager.py的进程,它会定时检测任务并运行任务
//  {$ELSE}
//      //每个任务单独一个python进程的模式
//      uBaseLog.HandleException(nil,'TCommonTaskDataFetchTaskItem.Stop StopExecuteCommandThread');
//      StopExecuteCommandThread;
//  {$ENDIF}


//  GlobalWebSearchTaskManager.DBModuleLock.Enter;
//  try
    Self.UpdateStateToDB(//FAppID,
                        //FUserFID,//GlobalBaseManager.User.fid,
//                        GlobalWebSearchTaskManager.DBModule,
                        ADesc);
//  finally
//    GlobalWebSearchTaskManager.DBModuleLock.Leave;
//  end;

//  GetGlobalTimerThread.RunTempTask(Self.DoUpdateTaskStateExecute,nil);


  uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.Stop End');
end;

function TTaskItem_SaveToRest.GetTaskIntfName: String;
begin
  Result:='task';
end;

function TTaskItem_SaveToRest.GetTaskResultDataIntfName: String;
begin
  Result:='task_result_data';
end;

function TTaskItem_SaveToRest.AddToDB(//AAppID: String; AUserFID: String;
//  ADBModule: TBaseDatabaseModule;
  var ADesc: String;AIsSaveDetail:Boolean=True): Boolean;
var
//  ASQLDBHelper:TBaseDBHelper;
  ACode:Integer;
  ADataJson:ISuperObject;
  AParmasStr:String;
  ARecordDataJson:ISuperObject;
  AStringStream:TStringStream;

  ADataInterface:TDataInterface;
  ASaveDataSetting:TSaveDataSetting;
  ADataIntfResult:TDataIntfResult;
  I: Integer;
begin
  Result:=False;
  ADesc:='';

//'appid','user_fid','task_guid','task_type','name','params_json','is_deleted','createtime','parent_task_guid','root_task_guid','process_id','works_count','finished_works_count']),
//[AAppID,AUserFID,GUID,Type_,Name,AParmasStr,0,StdDateTimeToStr(Now),'',GUID,GlobalWebSearchTaskManager.FCurrentProcessId,0,0])


//  AParmasStr:='';
//  if Params<>nil then
//  begin
//    AParmasStr:=Params.AsJSON;//(False,False);
////    uBaseLog.HandleException(nil,'AParmasStr:'+AParmasStr);
////    AParmasStr:=ReplaceStr(AParmasStr,'\/','/');
////    uBaseLog.HandleException(nil,'AParmasStr:'+AParmasStr);
////    AParmasStr:=Params.AsJSON(True,True);
////    uBaseLog.HandleException(nil,'AParmasStr:'+AParmasStr);
////    AParmasStr:=Params.AsJSON(False,True);
////    uBaseLog.HandleException(nil,'AParmasStr:'+AParmasStr);
////    AParmasStr:=Params.AsJSON(True,False);
////    uBaseLog.HandleException(nil,'AParmasStr:'+AParmasStr);
////    ShowMessage(AParmasStr);
//  end;

//  ARecordDataJson:=SO();
//  uDatasetToJson.ConvertArrayToJson(
//      ConvertToStringDynArray(['appid','user_fid','task_guid','task_type','name','params_json','is_deleted','createtime','parent_task_guid','root_task_guid','process_id','works_count','finished_works_count']),
//      ConvertToVariantDynArray([AAppID,AUserFID,GUID,Type_,Name,AParmasStr,0,StdDateTimeToStr(Now),ParentTaskGUID,RootTaskGUID,Self.Owner.FCurrentProcessId,0,0]),
//      ARecordDataJson
//      );
  ARecordDataJson:=Self.SaveToJson;
  AParmasStr:=ARecordDataJson.AsJSON;//(False,False);
  uBaseLog.HandleException(nil,'ARecordDataJson:'+AParmasStr);
//  AParmasStr:=ReplaceStr(AParmasStr,'\/','/');
//  uBaseLog.HandleException(nil,'ARecordDataJson:'+AParmasStr);





  { TODO : 注释掉了 }
//  {$IFDEF HAS_LOCAL_DB_INTERFACE}
  //使用本地数据库模式
  ADataInterface:=Self.CreateSaveDataInterface;
  ADataIntfResult:=TDataIntfResult.Create;
  try
    ADataInterface.Name:=GetTaskIntfName;//'task';
    ASaveDataSetting.Clear;
    ASaveDataSetting.AppID:=FAppID;
    ASaveDataSetting.RecordDataJson:=ARecordDataJson;
    if not ADataInterface.SaveData(ASaveDataSetting,ADataIntfResult) then
    begin
//      ShowMessage(ADesc);
      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.AddToDB 插入任务add_record_post_2 '+ADesc);
      Exit;
    end;

    FJson.I['fid']:=ADataIntfResult.DataJson.I['fid'];


    //保存任务数据列表
    if AIsSaveDetail and (FResultDataList.Length>0) then
    begin
      ADataInterface.Name:='task_result_data';
      ASaveDataSetting.Clear;
      ASaveDataSetting.AppID:=FAppID;
      ASaveDataSetting.RecordDataJson:=ARecordDataJson;
  //    ASaveDataSetting.IsAddIfNotExist:=True;
  //    ASaveDataSetting.CheckExistFieldNames:='task_guid,type,from_id';
      if not ADataInterface.AddDataList(ASaveDataSetting,Self.FResultDataList,ADataIntfResult) then
      begin
  //      ShowMessage(ADesc);
        uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.AddToDB 插入任务add_record_post_2 '+ADesc);
        Exit;
      end;
    end;


    //AddSubWorksToDB(AAppID,AUserFID,ADesc);


  finally
    FreeAndNil(ADataInterface);
    FreeAndNil(ADataIntfResult);
  end;
//  {$ELSE}
//  AStringStream:=TStringStream.Create(AParmasStr,TEncoding.UTF8);
//  AStringStream.Position:=0;
//  try
//
//    if not SimpleCallAPI('add_record_post_2',
//                        nil,
//                        TableRestCenterInterfaceUrl,
//                        ConvertToStringDynArray(['appid',
//                                                'user_fid',
//                                                'key',
//                                                'rest_name'//,
////                                                'record_data_json'
//                                                ]),
//                        ConvertToVariantDynArray([AAppID,
//                                                  0,
//                                                  '',
//                                                  'task'//,
////                                                  AParmasStr//(False,False)
//                                                  ]),
//                        ACode,
//                        ADesc,
//                        ADataJson,
//                        GlobalRestAPISignType,
//                        GlobalRestAPIAppSecret,
//                        True,
//                        AStringStream
//                        ) or (ACode<>200) then
//    begin
////      ShowMessage(ADesc);
//      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.AddToDB 插入任务add_record_post_2 '+ADesc);
//      Exit;
//    end;
//
//  finally
//    FreeAndNil(AStringStream);
//  end;
//  {$ENDIF}



//  if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
//  begin
//    Exit;
//  end;
//  try
//
//    AParmasStr:='';
//    if Params<>nil then
//    begin
//      AParmasStr:=Params.AsJSON;
//    end;
//
//    if not ASQLDBHelper.SelfQuery_EasyInsert('tbltask',
//                                           ConvertToStringDynArray(['appid','user_fid','task_guid','task_type','name','params_json','is_deleted','createtime','parent_task_guid','root_task_guid','process_id','works_count','finished_works_count']),
//                                           ConvertToVariantDynArray([AAppID,AUserFID,GUID,Type_,Name,AParmasStr,0,StdDateTimeToStr(Now),'',GUID,GlobalWebSearchTaskManager.FCurrentProcessId,0,0])
//                                            ) then
//    begin
//      //数据库连接失败或异常
//      ADesc := '添加任务' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
//      Exit;
//    end;
////    if not ASQLDBHelper.SelfQuery_EasyInsert('tbltask',
////                                           ['appid','user_fid','task_guid','task_type','name','params_json','is_deleted','createtime'],
////                                           [AAppID,AUserFID,GUID,Type_,Name,AParmasStr,0,StdDateTimeToStr(Now)]
////                                            ) then
////    begin
////      //数据库连接失败或异常
////      ADesc := '添加任务' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
////      Exit;
////    end;



  //父任务需要保存,子工作不需要保存
  if AIsSaveDetail and (ParamDetailList.Length>0) and (Self.ParentTask=nil) then
  begin
    for I := 0 to ParamDetailList.Length-1 do
    begin
      ParamDetailList.O[I].S['appid']:=FAppID;
      ParamDetailList.O[I].S['user_fid']:=FUserFID;
      ParamDetailList.O[I].S['task_guid']:=GUID;
    end;
    //使用本地数据库模式
    ADataInterface:=Self.CreateSaveDataInterface;
    ADataInterface.Name:='task_param_detail';
    ADataIntfResult:=TDataIntfResult.Create;
    try
      ASaveDataSetting.Clear;
      ASaveDataSetting.AppID:=FAppID;
      //如果不存在,则添加
      ASaveDataSetting.IsAddIfNotExist:=True;
      ASaveDataSetting.CheckExistFieldNames:='task_guid,type,value';
  //    ASaveDataSetting.RecordDataJson:=ARecordDataJson;
      if not ADataInterface.SaveDataList(ASaveDataSetting,Self.ParamDetailList,ADataIntfResult) then
      begin
  //      ShowMessage(ADesc);
        uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.AddToDB 插入任务参数明细add_record_post_2 '+ADesc);
        Exit;
      end;

    finally
      FreeAndNil(ADataInterface);
      FreeAndNil(ADataIntfResult);
    end;
  end;







    Result:=True;
//  finally
//    ADBModule.FreeDBHelperToPool(ASQLDBHelper);
//  end;

end;

function TTaskItem_SaveToRest.CustomLoadFromDB(
  ATaskJson: ISuperObject; var ADesc: String): Boolean;
begin
  Result:=True;
end;

function TTaskItem_SaveToRest.CustomLoadSubWorkJsonFromDB(
  ASubWorkJson: ISuperObject; var ADesc: String): Boolean;
begin

end;

procedure TTaskItem_SaveToRest.DoFinishedInWorkThreadExecute(Sender: TObject;
  AWorkThreadItem: TTaskWorkThreadItem);
var
//  ACode:Integer;
  ADesc:String;
//  ADataJson:ISuperObject;
//  ARecordDataJson:ISuperObject;
begin

//  //更新任务结束时间
//  ARecordDataJson:=SO();
//  ARecordDataJson.S['end_time']:=StdDateTimeToStr(Now);
//  UpdateToDB(FAppID,FUserFID,ARecordDataJson,ADesc);

  //要将状态保存到数据库，因为通知网页后会取一下数据,如果不先存，则取到的任务状态为未完成
  UpdateStateToDB(//FAppID,FUserFID,
                  ADesc);

//  SimpleCallAPI('update_record',
//                      nil,
//                      TableRestCenterInterfaceUrl,
//                      ConvertToStringDynArray(['appid',
//                                              'user_fid',
//                                              'key',
//                                              'rest_name',
//                                              'record_data_json',
//                                              'where_sql']),
//                      ConvertToVariantDynArray([AppID,
//                                                0,
//                                                '',
//                                                'task',
//                                                ARecordDataJson.AsJSON,
//                                                ' AND task_guid='+QuotedStr(Self.GUID)+' ']),
//                      ACode,
//                      ADesc,
//                      ADataJson,
//                      GlobalRestAPISignType,
//                      GlobalRestAPIAppSecret
//                      );
  //再通知网页
  inherited;

end;

procedure TTaskItem_SaveToRest.DoWorkInWorkThreadExecute(Sender: TObject;
  AWorkThreadItem: TTaskWorkThreadItem; ATaskItem: TTaskItem);
var
//  ACode:Integer;
  ADesc:String;
//  ADataJson:ISuperObject;
  ARecordDataJson:ISuperObject;
begin
  //更新子任务开始时间
  ARecordDataJson:=SO();
  ARecordDataJson.S['start_time']:=StdDateTimeToStr(Now);
  ARecordDataJson.S['state']:='start';
  ATaskItem.UpdateToDB(//FAppID,FUserFID,
                        ARecordDataJson,ADesc);
//  SimpleCallAPI('update_record',
//                      nil,
//                      TableRestCenterInterfaceUrl,
//                      ConvertToStringDynArray(['appid',
//                                              'user_fid',
//                                              'key',
//                                              'rest_name',
//                                              'record_data_json',
//                                              'where_sql']),
//                      ConvertToVariantDynArray([AppID,
//                                                0,
//                                                '',
//                                                'task',
//                                                ARecordDataJson.AsJSON,
//                                                ' AND task_guid='+QuotedStr(ATaskItem.GUID)+' ']),
//                      ACode,
//                      ADesc,
//                      ADataJson,
//                      GlobalRestAPISignType,
//                      GlobalRestAPIAppSecret
//                      );
//

  inherited;

end;


function TTaskItem_SaveToRest.LoadFromDB(
  var ADesc: String): Boolean;
var
//  ATaskJson:ISuperObject;
  ALoadDataSetting:TLoadDataSetting;
  ADataInterface:TDataInterface;
  ADataIntfResult:TDataIntfResult;
  I: Integer;
begin
  Result:=False;

  //使用本地数据库模式
  ADataInterface:=Self.CreateSaveDataInterface;
  ADataInterface.Name:=GetTaskIntfName;//'task';
  ADataIntfResult:=TDataIntfResult.Create;
  ALoadDataSetting:=TLoadDataSetting.Create;
  ALoadDataSetting.AppID:=FAppID;
  ALoadDataSetting.WhereKeyJson:=GetWhereConditions(['task_guid'],[GUID]);
  try
    if not ADataInterface.GetDataDetail(ALoadDataSetting,ADataIntfResult) then
    begin
      ADesc:=ADataIntfResult.Desc;
      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.LoadFromDB 获取数据get_record '+ADataIntfResult.Desc);
      Exit;
    end;
    FJson:=ADataIntfResult.DataJson;


    if ADataIntfResult.DataJson.I['param_detail_count']>0 then
    begin
      ADataInterface.Name:='task_param_detail';
      ALoadDataSetting.WhereKeyJson:=GetWhereConditions(['task_guid'],[GUID]);
      if not ADataInterface.GetDataList(ALoadDataSetting,ADataIntfResult) then
      begin
        ADesc:=ADataIntfResult.Desc;
        uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.LoadFromDB 获取数据get_record '+ADataIntfResult.Desc);
        Exit;
      end;

      FJson.A['param_detail_list']:=ADataIntfResult.DataJson.A['RecordList'];
    end;



    ADataInterface.Name:=GetTaskResultDataIntfName;
    ALoadDataSetting.PageSize:=MaxInt;
    ALoadDataSetting.WhereKeyJson:=GetWhereConditions(['task_guid'],[GUID]);
    if not ADataInterface.GetDataList(ALoadDataSetting,ADataIntfResult) then
    begin
      ADesc:=ADataIntfResult.Desc;
      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.LoadFromDB 获取数据get_record '+ADataIntfResult.Desc);
      Exit;
    end;

    if ADataIntfResult.DataJson.A['RecordList'].Length>0 then
    begin
      FJson.A['result_data_list']:=ADataIntfResult.DataJson.A['RecordList'];
    end;
    FResultDataList:=ADataIntfResult.DataJson.A['RecordList'];




    if not CustomLoadFromDB(FJson,ADesc) then
    begin
      Exit;
    end;


//    //再加载子工作
//    ADataInterface.Name:=GetTaskIntfName;//'task';
//    ALoadDataSetting.WhereKeyJson:=GetWhereConditions(['parent_task_guid'],[GUID]);
//    if not ADataInterface.GetDataList(ALoadDataSetting,ADataIntfResult) then
//    begin
//      ADesc:=ADataIntfResult.Desc;
//      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.LoadFromDB 获取数据get_record '+ADataIntfResult.Desc);
//      Exit;
//    end;
//    FJson.A['sub_work_list']:=ADataIntfResult.DataJson.A['RecordList'];

    Result:=LoadFromJson(FJson);

  finally
    FreeAndNil(ADataInterface);
    FreeAndNil(ADataIntfResult);
    FreeAndNil(ALoadDataSetting);
  end;
end;

function TTaskItem_SaveToRest.LoadSubWorksJsonFromDB(var ADesc: String): Boolean;
var
//  ATaskJson:ISuperObject;
  ALoadDataSetting:TLoadDataSetting;
  ADataInterface:TDataInterface;
  ADataIntfResult:TDataIntfResult;
  I: Integer;
  ASubWorkJson:ISuperObject;
begin
  Result:=False;

  //使用本地数据库模式
  ADataInterface:=Self.CreateSaveDataInterface;
  ADataIntfResult:=TDataIntfResult.Create;
  ALoadDataSetting:=TLoadDataSetting.Create;
  ALoadDataSetting.AppID:=FAppID;
  try

    //再加载子工作
    ADataInterface.Name:=GetTaskIntfName;//'task';
    ALoadDataSetting.WhereKeyJson:=GetWhereConditions(['parent_task_guid'],[GUID]);
    if not ADataInterface.GetDataList(ALoadDataSetting,ADataIntfResult) then
    begin
      ADesc:=ADataIntfResult.Desc;
      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.LoadFromDB 获取数据get_record '+ADataIntfResult.Desc);
      Exit;
    end;
    FJson.A['sub_work_list']:=ADataIntfResult.DataJson.A['RecordList'];


    for I := 0 to FJson.A['sub_work_list'].Length-1 do
    begin
        ASubWorkJson:=FJson.A['sub_work_list'].O[I];

    //    if ADataIntfResult.DataJson.I['param_detail_count']>0 then
        begin
          ADataInterface.Name:=GetTaskResultDataIntfName;//'task_result_data';
          ALoadDataSetting.PageSize:=MaxInt;
          ALoadDataSetting.WhereKeyJson:=GetWhereConditions(['task_guid'],[ASubWorkJson.S['task_guid']]);
          if not ADataInterface.GetDataList(ALoadDataSetting,ADataIntfResult) then
          begin
            ADesc:=ADataIntfResult.Desc;
            uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.LoadFromDB 获取数据get_record '+ADataIntfResult.Desc);
            Exit;
          end;

          ASubWorkJson.A['result_data_list']:=ADataIntfResult.DataJson.A['RecordList'];
        end;

        //给它设置一个account
        CustomLoadSubWorkJsonFromDB(ASubWorkJson,ADesc);
    end;


  finally
    FreeAndNil(ADataInterface);
    FreeAndNil(ADataIntfResult);
    FreeAndNil(ALoadDataSetting);
  end;

end;

function TTaskItem_SaveToRest.UpdateStateToDB(//AAppID: String;
  //AUserFID: String;
//  ADBModule: TBaseDatabaseModule;
  var ADesc: String): Boolean;
var
  ACode:Integer;
//  ADesc:String;
  ADataJson:ISuperObject;

//  ASQLDBHelper:TBaseDBHelper;
//  AParmasStr:String;
  ARecordDataJson:ISuperObject;

//  AStopTaskItem:TTaskItem_SaveToRest;
//  AParams:ISuperObject;

  ADataInterface:TDataInterface;
  ASaveDataSetting:TSaveDataSetting;
  ADataIntfResult:TDataIntfResult;

begin
  Result:=False;
  ADesc:='';

//  if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
//  begin
//    Exit;
//  end;
//  try

//    AParmasStr:='';
//    if Params<>nil then
//    begin
//      AParmasStr:=Params.AsJSON;
//    end;

//    if not ASQLDBHelper.SelfQuery('UPDATE tbltask SET is_stop=:is_stop,is_pause=:is_pause WHERE task_guid=:task_guid',
//                                   ConvertToStringDynArray(['task_guid','is_stop','is_pause']),
//                                   ConvertToVariantDynArray([GUID,Ord(IsStop),Ord(IsPause)]),
//                                   asoExec
//                                    ) then
//    begin
//      //数据库连接失败或异常
//      ADesc := '更新任务状态' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
//      Exit;
//    end;

    ARecordDataJson:=SO();
    ARecordDataJson.I['is_stop']:=Ord(IsStop);
    ARecordDataJson.I['is_pause']:=Ord(IsPause);
    //进度
    ARecordDataJson.I['progress']:=FProgress;

    if IsStop or (Self.State=tsFinished) then
    begin
      ARecordDataJson.S['state']:=GetStateStr(State);//'finished';
      ARecordDataJson.S['end_time']:=StdDateTimeToStr(Now);
      //保持临时结果,比如当前搜索中断时的下标、是否有下一页
      ARecordDataJson.S['result_data_json']:=Self.ResultDataJson.AsJSON;
    end;

    ARecordDataJson.S['error']:=Error;

  { TODO : 注释掉了 }
//  {$IFDEF HAS_LOCAL_DB_INTERFACE}
  //使用本地数据库模式
  ADataInterface:=Self.CreateSaveDataInterface;
  ADataInterface.Name:=GetTaskIntfName;//'task';
  ADataInterface.FKeyFieldName:='task_guid';
  ADataIntfResult:=TDataIntfResult.Create;
  try
    ASaveDataSetting.Clear;
    ASaveDataSetting.AppID:=FAppID;
    ASaveDataSetting.EditingRecordKeyValue:=GUID;
    ASaveDataSetting.RecordDataJson:=ARecordDataJson;
    if not ADataInterface.SaveData(ASaveDataSetting,ADataIntfResult) then
    begin
//      ShowMessage(ADesc);
      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.UpdateStateToDB 更新任务状态update_record '+ADataIntfResult.Desc);
      Exit;
    end;

  finally
    FreeAndNil(ADataInterface);
    FreeAndNil(ADataIntfResult);
  end;
//  {$ELSE}
//
//    if not SimpleCallAPI('update_record',
//                        nil,
//                        TableRestCenterInterfaceUrl,
//                        ConvertToStringDynArray(['appid',
//                                                'user_fid',
//                                                'key',
//                                                'rest_name',
//                                                'record_data_json',
//                                                'where_sql']),
//                        ConvertToVariantDynArray([AAppID,
//                                                  0,
//                                                  '',
//                                                  'task',
//                                                  ARecordDataJson.AsJSON,
//                                                  ' AND task_guid='+QuotedStr(GUID)+' ']),
//                        ACode,
//                        ADesc,
//                        ADataJson,
//                        GlobalRestAPISignType,
//                        GlobalRestAPIAppSecret
//                        ) or (ACode<>200) then
//    begin
////      ShowMessage(ADesc);
//      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.UpdateStateToDB 更新任务状态update_record '+ADesc);
//      Exit;
//    end;
//  {$ENDIF}




//    if Self.IsStop then
//    begin
//
//      //加入停止任务的任务
//      //停止任务的进程
//      AParams:=TSuperObject.Create;
//      AParams.S['task_guid']:=Self.GUID;
//
//
//      AStopTaskItem:=TTaskItem_SaveToRest.Create(Self.Owner);
//      try
//        AStopTaskItem.GUID:=CreateGUIDString();
//        AStopTaskItem.Type_:='stop_task';
//        AStopTaskItem.Params:=AParams;
//        AStopTaskItem.AddToDB(AppID,GlobalBaseManager.User.fid,ADesc);
//      finally
//        FreeAndNil(AStopTaskItem);
//      end;
//
//
//    end;






//    if IsStop then
//    begin
////      if not ASQLDBHelper.SelfQuery('UPDATE tbltask SET state=''finished'' WHERE task_guid=:task_guid',
////                                     ConvertToStringDynArray(['task_guid']),
////                                     ConvertToVariantDynArray([GUID]),
////                                      asoExec
////                                      ) then
////      begin
////        //数据库连接失败或异常
////        ADesc := '更新任务状态' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
////        Exit;
////      end;
//        ARecordDataJson:=TSuperObject.Create;
//        ARecordDataJson.S['state']:='finished';
//        if not SimpleCallAPI('update_record',
//                            nil,
//                            TableRestCenterInterfaceUrl,
//                            ['appid',
//                            'user_fid',
//                            'key',
//                            'rest_name',
//                            'record_data_json',
//                            'where_sql'],
//                            [AAppID,
//                            0,
//                            '',
//                            'task',
//                            ARecordDataJson.AsJSON,
//                            ' AND task_guid='+QuotedStr(GUID)+' '
//                            ],
//                            ACode,
//                            ADesc,
//                            ADataJson,
//                            GlobalRestAPISignType,
//                            GlobalRestAPIAppSecret
//                            ) or (ACode<>200) then
//        begin
//          ShowMessage(ADesc);
//          Exit;
//        end;
//    end;


    Result:=True;
//  finally
//    ADBModule.FreeDBHelperToPool(ASQLDBHelper);
//  end;


end;

function TTaskItem_SaveToRest.UpdateToDB(//AAppID:String;
                                        //AUserFID:String;
                                        ARecordDataJson: ISuperObject;
                                        var ADesc: String): Boolean;
var
  ACode:Integer;
//  ADesc:String;
  ADataJson:ISuperObject;

//  ASQLDBHelper:TBaseDBHelper;
//  AParmasStr:String;
//  ARecordDataJson:ISuperObject;
  ADataInterface:TDataInterface;
  ASaveDataSetting:TSaveDataSetting;
  ADataIntfResult:TDataIntfResult;
begin
  Result:=False;
  ADesc:='';

//  if not ADBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
//  begin
//    Exit;
//  end;
//  try

//    AParmasStr:='';
//    if Params<>nil then
//    begin
//      AParmasStr:=Params.AsJSON;
//    end;





//    if not ASQLDBHelper.SelfQuery('UPDATE tbltask SET is_stop=:is_stop,is_pause=:is_pause WHERE task_guid=:task_guid',
//                                   ConvertToStringDynArray(['task_guid','is_stop','is_pause']),
//                                   ConvertToVariantDynArray([GUID,Ord(IsStop),Ord(IsPause)]),
//                                   asoExec
//                                    ) then
//    begin
//      //数据库连接失败或异常
//      ADesc := '更新任务状态' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
//      Exit;
//    end;



  { TODO : 注释掉了 }
//  {$IFDEF HAS_LOCAL_DB_INTERFACE}
  //使用本地数据库模式
  ADataInterface:=Self.CreateSaveDataInterface;
  ADataInterface.Name:=GetTaskIntfName;//'task';
  ADataInterface.FKeyFieldName:='task_guid';
  ADataIntfResult:=TDataIntfResult.Create;
  try
    ASaveDataSetting.Clear;
    ASaveDataSetting.AppID:=FAppID;
    ASaveDataSetting.EditingRecordKeyValue:=GUID;
    ASaveDataSetting.RecordDataJson:=ARecordDataJson;
    if not ADataInterface.SaveData(ASaveDataSetting,ADataIntfResult) then
    begin
//      ShowMessage(ADesc);
      uBaseLog.HandleException(nil,'TTaskItem_SaveToRest.UpdateStateToDB 更新任务状态update_record '+ADataIntfResult.Desc);
      Exit;
    end;

  finally
    FreeAndNil(ADataInterface);
    FreeAndNil(ADataIntfResult);
  end;
//  {$ELSE}
//
//
//    if not SimpleCallAPI('update_record',
//                        nil,
//                        TableRestCenterInterfaceUrl,
//                        ConvertToStringDynArray(['appid',
//                                                'user_fid',
//                                                'key',
//                                                'rest_name',
//                                                'record_data_json',
//                                                'where_sql']),
//                        ConvertToVariantDynArray([AAppID,
//                                                  0,
//                                                  '',
//                                                  'task',
//                                                  ARecordDataJson.AsJSON,
//                                                  ' AND task_guid='+QuotedStr(GUID)+' ']),
//                        ACode,
//                        ADesc,
//                        ADataJson,
//                        GlobalRestAPISignType,
//                        GlobalRestAPIAppSecret
//                        ) or (ACode<>200) then
//    begin
////      ShowMessage(ADesc);
//      uBaseLog.HandleException(nil,'TWebSearchTaskManager.TTaskItem_SaveToRest.UpdateToDB 更新任务update_record '+ADesc);
//      Exit;
//    end;
//  {$ENDIF}



//    if IsStop then
//    begin
////      if not ASQLDBHelper.SelfQuery('UPDATE tbltask SET state=''finished'' WHERE task_guid=:task_guid',
////                                     ConvertToStringDynArray(['task_guid']),
////                                     ConvertToVariantDynArray([GUID]),
////                                      asoExec
////                                      ) then
////      begin
////        //数据库连接失败或异常
////        ADesc := '更新任务状态' + '时' + '数据库连接失败或异常' + ' ' + ASQLDBHelper.LastExceptMessage;
////        Exit;
////      end;
//        ARecordDataJson:=TSuperObject.Create;
//        ARecordDataJson.S['state']:='finished';
//        if not SimpleCallAPI('update_record',
//                            nil,
//                            TableRestCenterInterfaceUrl,
//                            ['appid',
//                            'user_fid',
//                            'key',
//                            'rest_name',
//                            'record_data_json',
//                            'where_sql'],
//                            [AAppID,
//                            0,
//                            '',
//                            'task',
//                            ARecordDataJson.AsJSON,
//                            ' AND task_guid='+QuotedStr(GUID)+' '
//                            ],
//                            ACode,
//                            ADesc,
//                            ADataJson,
//                            GlobalRestAPISignType,
//                            GlobalRestAPIAppSecret
//                            ) or (ACode<>200) then
//        begin
//          ShowMessage(ADesc);
//          Exit;
//        end;
//    end;


    Result:=True;
//  finally
//    ADBModule.FreeDBHelperToPool(ASQLDBHelper);
//  end;

end;


{ TGetRecordListTaskItem }

procedure TGetRecordListTaskItem.DoWorkInWorkThreadExecute(Sender: TObject;
  AWorkThreadItem: TTaskWorkThreadItem; ATaskItem: TTaskItem);
begin
  try

    Self.DoGetRecordListTask(Sender,AWorkThreadItem,ATaskItem,FWhereSQL);

  finally
    ATaskItem.State:=tsFinished;
  end;
end;

constructor TGetRecordListTaskItem.Create(AOwner: TTaskManager);
begin
  inherited;

  FPageIndex:=1;
  FPageSize:=MaxInt;

end;

procedure TGetRecordListTaskItem.DoGetRecordListTask(Sender: TObject;
  AWorkThreadItem: TTaskWorkThreadItem; ATaskItem: TTaskItem;
                                        AWhereSQL:String);
var
  ACode:Integer;
  ADesc:String;
  ADataJson:ISuperObject;
  ARecordList:ISuperArray;

  ALoadDataSetting:TLoadDataSetting;
  ADataInterface:TDataInterface;
  ADataIntfResult:TDataIntfResult;
begin
  Inherited;
  uBaseLog.HandleException(nil,'TGetRecordListTaskItem.DoWorkInWorkThreadExecute Begin');
  try
      ARecordList:=nil;

      { TODO : 注释掉了 }
//      {$IFDEF HAS_LOCAL_DB_INTERFACE}
      //使用本地数据库模式
      ADataInterface:=Self.CreateSaveDataInterface;
      ADataInterface.Name:=FRestName;
      ADataIntfResult:=TDataIntfResult.Create;
      ALoadDataSetting:=TLoadDataSetting.Create;
      ALoadDataSetting.AppID:=FAppID;
      ALoadDataSetting.PageIndex:=FPageIndex;
      ALoadDataSetting.PageSize:=FPageSize;
      ALoadDataSetting.CustomWhereSQL:=AWhereSQL;
      try
        if not ADataInterface.GetDataList(ALoadDataSetting,ADataIntfResult) then
        begin
          uBaseLog.HandleException(nil,'TGetRecordListTaskItem.DoGetRecordListTask 获取数据get_record_list '+ADataIntfResult.Desc);
          Exit;
        end;

      finally
        FreeAndNil(ADataInterface);
        FreeAndNil(ADataIntfResult);
        FreeAndNil(ALoadDataSetting);
      end;
//      {$ELSE}
//          if not SimpleCallAPI('get_record_list',
//                             nil,
//                             TableRestCenterInterfaceUrl,
//                            ConvertToStringDynArray(['appid','rest_name','where_sql','pageindex','pagesize']),
//                            ConvertToVariantDynArray([FAppID,FRestName,AWhereSQL,FPageIndex,FPageSize]),
//                            ACode,
//                            ADesc,
//                            ADataJson,
//                            GlobalRestAPISignType,
//                            GlobalRestAPIAppSecret
//                            ) or (ACode<>200) then
//          begin
//            uBaseLog.HandleException(nil,'TGetRecordListTaskItem.DoGetRecordListTask 获取数据get_record_list '+ADesc);
//            Exit;
//          end;
//      {$ENDIF}






      if ADataJson.A['RecordList'].Length>0 then
      begin
        ARecordList:=ADataJson.A['RecordList'];
      end;

      if (ARecordList<>nil) then
      begin
          ATaskItem.DataIntfResult.DataJson:=ADataJson;//TSuperObject.Create;
//          ATaskItem.DataIntfResult.DataJson.I['Code']:=SUCC;
//          if ARecordList<>nil then
//          begin
//            ATaskItem.DataIntfResult.DataJson.A['RecordList']:=ARecordList;
//          end;

          //再通知界面去查询数据库,获取最新的数据
          if Assigned(ATaskItem.OnWorkThreadProgress) then
          begin
            ATaskItem.OnWorkThreadProgress(Self,
                                            nil,
                                            ATaskItem,
                                            ATaskItem.DataIntfResult
                                            );
          end;

      end;


  except
    on E:Exception do
    begin
      uBaseLog.HandleException(E,'TGetRecordListTaskItem.DoWorkInWorkThreadExecute Error');
    end;
  end;

  uBaseLog.HandleException(nil,'TGetRecordListTaskItem.DoWorkInWorkThreadExecute End');


end;



{ TGetUpdatedRecordListTaskItem }

procedure TGetUpdatedRecordListTaskItem.DoWorkInWorkThreadExecute(
  Sender: TObject; AWorkThreadItem: TTaskWorkThreadItem; ATaskItem: TTaskItem);
var
  ACode:Integer;
  ADesc:String;
  ADataJson:ISuperObject;
  AWhereSQL:String;
  ALastQueryResultDataUpdateTime:TDateTime;

  ALoadDataSetting:TLoadDataSetting;
  ADataInterface:TDataInterface;
  ADataIntfResult:TDataIntfResult;
begin
  FLastQueryResultDataUpdateTime:=Now;

  while (not TProtectedThread(AWorkThreadItem.FThread).Terminated)
        and (ATaskItem.State<>tsFinished) do
  begin

      Sleep(3000);


      { TODO : 注释掉了 }
//      {$IFDEF HAS_LOCAL_DB_INTERFACE}
      //使用本地数据库模式
      ADataInterface:=Self.CreateSaveDataInterface;
      ADataInterface.Name:=FRestName;
      ADataIntfResult:=TDataIntfResult.Create;
      ALoadDataSetting:=TLoadDataSetting.Create;
      ALoadDataSetting.AppID:=FAppID;
      ALoadDataSetting.CustomWhereSQL:=' AND task_guid='+QuotedStr(ATaskItem.GUID)+' ';
      try
        if not ADataInterface.GetDataDetail(ALoadDataSetting,ADataIntfResult) then
        begin
          uBaseLog.HandleException(nil,'TGetRecordListTaskItem.DoGetRecordListTask 获取任务get_record '+ADataIntfResult.Desc);
          Exit;
        end;

      finally
        FreeAndNil(ADataInterface);
        FreeAndNil(ADataIntfResult);
        FreeAndNil(ALoadDataSetting);
      end;
//      {$ELSE}
//          if not SimpleCallAPI('get_record',
//                             nil,
//                             TableRestCenterInterfaceUrl,
//                            ConvertToStringDynArray(['appid',
//                                                    'rest_name',
//                                                    'where_sql'
//                                                    ]),
//                            ConvertToVariantDynArray([AppID,
//                                                      'task',
//                                                      ' AND task_guid='+QuotedStr(ATaskItem.GUID)+' '
//                                                      ]),
//                            ACode,
//                            ADesc,
//                            ADataJson,
//                            GlobalRestAPISignType,
//                            GlobalRestAPIAppSecret
//                            ) or (ACode<>200) then
//          begin
//            uBaseLog.HandleException(nil,'TGetRecordListTaskItem.DoGetRecordListTask 获取任务get_record '+ADesc);
//            Exit;
//          end;
//      {$ENDIF}



      //  TTaskState=(tsWaiting,
      //              tsWorking,//tsStop,
      //              tsFinished);

//          if ASQLDBHelper.Query.FieldByName('state').AsString='finished' then
//          begin
//            AWorkItem.State:=tsFinished;
//          end;
      if ADataJson.S['state']='finished' then
      begin
        ATaskItem.State:=tsFinished;
      end;



      ALastQueryResultDataUpdateTime:=FLastQueryResultDataUpdateTime;
      FLastQueryResultDataUpdateTime:=Now;
      Self.DoGetRecordListTask(Sender,AWorkThreadItem,ATaskItem,FWhereSQL+' AND updatetime>='+QuotedStr(StdDateTimeToStr(ALastQueryResultDataUpdateTime))+' ');



  end;

end;


  {$IFDEF MSWINDOWS}

{ TPythonCommandLineTaskItem }

constructor TPythonCommandLineTaskItem.Create(AOwner: TTaskManager);
begin
  inherited;

  FCommandLineOutputHelper:=TCommandLineOutputHelper.Create;
  FCommandLineOutputHelper.FOnGetData:=Self.DoGetDataEvent;
end;

destructor TPythonCommandLineTaskItem.Destroy;
begin
  FreeAndNil(FCommandLineOutputHelper);
  inherited;
end;

procedure TPythonCommandLineTaskItem.DoGetDataEvent(Sender: TObject; AData: String;
  ADataJson: ISuperObject);
begin
  if ADataJson.S['FunctionName']=FProgressDataName then
  begin
    Self.DataIntfResult.Succ:=(ADataJson.I['Code']<>SUCC);
    Self.DataIntfResult.Desc:=ADataJson.S['Desc'];
    Self.DataIntfResult.DataJson:=ADataJson.O['Data'];

    //任务执行中的进度数据
    if Assigned(Self.OnWorkThreadProgress) then
    begin
      Self.OnWorkThreadProgress(Self,nil,Self,Self.DataIntfResult);
    end;

  end;

end;

procedure TPythonCommandLineTaskItem.DoWorkInWorkThreadExecute(Sender: TObject;
  AWorkThreadItem: TTaskWorkThreadItem; ATaskItem: TTaskItem);
//var
//  ACode:Integer;
//  ADesc:String;
//  ADataJson:ISuperObject;
//  AStartTime:TDateTime;
//
//  AGroupsCount: Integer;
var
  ADesc:String;
  APythonExePath:String;
  ACommandLineData:TCommandLineData;
  AParamsJsonFilePath:String;
  //工作路径
  AWorkDir:String;
begin
  //发帖,一些其他操作在AParams中,比如发布到个人中心,发布到小组
  //返回的Json中要包含：
  //like_count，int，点赞数、
  //share_to_my_homepage_count，int，分享到个人主页数
  //share_to_my_dynamic_count，int，转发到个人动态数
  //share_to_group_count，int，转发小组数
  //share_to_friend_count，int，转发好友数



//  Result:=nil;
//
//
//  ACode:=FAIL;
//  ADesc:='';
//  ADataJson:=nil;


//    ATaskJson.O['content']:=AContentJson;
//    ATaskJson.O['account']:=FAccount;
//    ATaskJson.O['params']:=AParams;


  //模拟发帖
  //Result:=FAPIFrame.UploadContent(AContentJson, AParams);
  //直接调用Python中的方法进行发帖


  try
      //工作路径
      AWorkDir:=
                                        {$IFDEF DEV_MODE}
    //                                    //王能的开发环境
    //                                    GetApplicationPath+'..\union_search\',
                                        //C:\MyFiles\OrangeUIProduct\网站爬虫\union_search\union_search\
                                        //GetApplicationPath+'..\union_search\',
                                        //C:\MyFiles\OrangeUIProduct\网站爬虫\union_search\
                                        GetApplicationPath+'..\'

                                        //zkn的开发环境
                                        //'D:\PythonProjects\union_search\',

                                        {$ELSE}
                                        //发布环境
    //                                    GetApplicationPath+'lib\Lib\site-packages\union_search\',
                                        //改成了
    //                                    GetApplicationPath+'lib\union_search\',
                                        GetApplicationPath+'lib\'
                                        {$ENDIF}
      ;
      //'ScrapyTaskManager.py'

      //保存参数到Json
      AParamsJsonFilePath:=GetApplicationPath+'log\'+'CommandLineParams_'+FFunctionName+'_'+FormatDateTime('YYYY_MM_DD_HH_MM_SS_ZZZ',Now)+CreateGUIDString+'.json';
      SaveStringToFile(FParamsJson.AsJSON,AParamsJsonFilePath,TEncoding.UTF8);

      APythonExePath:=GetApplicationPath+'lib\'+'python.exe';
      {$IFDEF DEV_MODE}
      //开发模式,不需要指定路径，直接用PATH指定的即可
      APythonExePath:='python.exe';
      {$ENDIF DEV_MODE}
      FCommandParams:='CommandLineHelper.py'
                                    +' '+FFunctionName
                                    +' '+AParamsJsonFilePath
                                    ;
      FCommandLine:=APythonExePath;//+' '+'CommandLineHelper.py'
//                                    +' '+FFunctionName
//                                    +' '+AParamsJsonFilePath
//                                    ;
      //ShellExecute(0, 'open', PWideChar(), '', '', SW_SHOWNORMAL);

  //    FExecuteTaskManagerCommandThread:=TExecuteCommandThread.Create(False,
  //    //                                                                                            AWorkItem,
  //                                                                    ACommandLine,
  //                                                                    AWorkDir,
  //                                                                    AOnGetCommandLineOutput,
  //                                                                    DoExecuteTaskManagerCommandThreadExecuteEnd,
  //                                                                    DoGetTaskManagerScriptCommandLineData,
  //                                                                    nil);

      ExecuteCommand(APythonExePath,FCommandLine,FCommandParams,AWorkDir,'',nil,FCommandLineOutputHelper,ADesc);


      //获取到命令行的结果
      //有结果返回
      //取指定的结果
      ACommandLineData:=FCommandLineOutputHelper.FCommandLineDataList.Find(FFunctionName);
//      if ACommandLineData<>nil then
//      begin
//        Result:=ACommandLineData.DataJson;
//      end;

//    //判断发帖是否成功
//    //等待发帖结束
//    while (DateUtils.MilliSecondsBetween(Now,AStartTime) < 30*1000) do
//    begin
//      Sleep(1000);
//    end;
//
//
//    if (DateUtils.MilliSecondsBetween(Now,AStartTime)>=Self.FUploadContentTimeoutInterval) then
//    begin
//      //发帖超时
//      ADesc:='发帖超时';
//      Exit;
//    end;

//    if AParams.I['is_published_to_group'] = 1 then
//    begin
//      if FAPIFrame.FUserInfoJsonObj.I['groupsCount'] <= 20 then
//      begin
//        AGroupsCount:= FAPIFrame.FUserInfoJsonObj.I['groupsCount'];
//      end
//      else
//      begin
//        AGroupsCount:= 20;
//      end;
//    end
//    else
//    begin
//      AGroupsCount:= 0;
//    end;
//
//    ADataJson:=TSuperObject.Create();
////    ADataJson.I['like_count']:= 1;
//    ADataJson.I['share_to_my_homepage_count']:= 1;
////    ADataJson.I['share_to_my_dynamic_count']:= 3;
//    ADataJson.I['share_to_group_count']:= AGroupsCount;
////    ADataJson.I['share_to_friend_count']:= 5;


    if (ACommandLineData<>nil) then
    begin
      Self.DataIntfResult.Succ:=(ACommandLineData.DataJson.I['Code']=SUCC);
      Self.DataIntfResult.Desc:=ACommandLineData.DataJson.S['Desc'];
      Self.DataIntfResult.DataJson:=ACommandLineData.DataJson.O['Data'];
    end;

  finally
  end;

end;
  {$ENDIF}

//{ TQueryTaskStateList }
//
//function TQueryTaskStateList.GetItem(Index: Integer): TQueryTaskStateItem;
//begin
//  Result:=TQueryTaskStateItem(Inherited Items[Index]);
//end;

{ TQueryTaskStateMananger }

function TQueryTaskStateMananger.AddQueryTask(AAppID:String;AUserFID:String;ATaskGUID: String; AOnExecute,
  AOnExecuteEnd: TTaskNotify; ATimeout: Integer): TQueryTaskStateItem;
var
  ATimerTask:TQueryTaskStateItem;
begin
  ATimerTask:=TQueryTaskStateItem.Create;
  ATimerTask.FAppID:=AAppID;
  ATimerTask.FUserFID:=AUserFID;
  ATimerTask.TaskID:=ATaskGUID;
  ATimerTask.Timeout:=ATimeout;
  ATimerTask.StartTime:=Now;
  ATimerTask.OnExecute:=AOnExecute;
  ATimerTask.OnExecuteEnd:=AOnExecuteEnd;
  Result:=ATimerTask;
  Self.RunTask(ATimerTask,False);
end;

function TQueryTaskStateMananger.AddQueryTask(AAppID:String;AUserFID:String;ATaskGUID: String;
  AExecuteTimerTask: TTimerTask; ATimeout: Integer): TQueryTaskStateItem;
var
  ATimerTask:TQueryTaskStateItem;
begin
  ATimerTask:=TQueryTaskStateItem.Create;
  ATimerTask.FAppID:=AAppID;
  ATimerTask.FUserFID:=AUserFID;
  ATimerTask.TaskID:=ATaskGUID;
  ATimerTask.Timeout:=ATimeout;
  ATimerTask.StartTime:=Now;
  ATimerTask.FExecuteTimerTask:=AExecuteTimerTask;
  Result:=ATimerTask;
  Self.RunTask(ATimerTask,False);


end;

procedure TQueryTaskStateMananger.DoExecute;
var
  I: Integer;
  AQueryTaskStateItem:TQueryTaskStateItem;
begin
  //inherited;

  while (Self.TimerTaskList.Count>0) and not Self.Terminated do
  begin

      I:=0;
      while I < Self.TimerTaskList.Count do
      begin
          AQueryTaskStateItem:=TQueryTaskStateItem(TimerTaskList[I]);
          AQueryTaskStateItem.State:=QueryTaskState(AQueryTaskStateItem);
          if AQueryTaskStateItem.State=tsFinished then
          begin
            if AQueryTaskStateItem.FExecuteTimerTask<>nil then
            begin
              DoExecuteTask(AQueryTaskStateItem.FExecuteTimerTask);
              DoExecuteTaskEnd(AQueryTaskStateItem.FExecuteTimerTask);
            end
            else
            begin
              DoExecuteTask(AQueryTaskStateItem);
              DoExecuteTaskEnd(AQueryTaskStateItem);
            end;
            TimerTaskList.Remove(AQueryTaskStateItem);
            continue;
          end;
          if DateUtils.SecondsBetween(Now,AQueryTaskStateItem.StartTime)>AQueryTaskStateItem.Timeout then
          begin
            //超时了
            DoExecuteTaskEnd(AQueryTaskStateItem);
            TimerTaskList.Remove(AQueryTaskStateItem);
          end;

          Inc(I);
      end;

      //休息两秒
      Sleep(3*1000);
  end;
end;

function TQueryTaskStateMananger.QueryTaskState(ATimerTask: TTimerTask): TTaskState;
var
  ACode:Integer;
  ADesc:String;
  ADataJson:ISuperObject;
begin
  Result:=TTaskState.tsWaiting;

  //调用Rest接口,查询任务状态
  if not SimpleCallAPI('get_record',
                     nil,
                     TableRestCenterInterfaceUrl,
                    ConvertToStringDynArray(['appid',
                                            'user_fid',
                                            'rest_name',
                                            'where_key_json'
                                            ]),
                    ConvertToVariantDynArray([TQueryTaskStateItem(ATimerTask).FAppID,
                                            TQueryTaskStateItem(ATimerTask).FUserFID,
                                            'task',
                                            GetWhereKeyJson(['task_guid'],[TQueryTaskStateItem(ATimerTask).TaskID])
                                            ]),
                    ACode,
                    ADesc,
                    ADataJson,
                    GlobalRestAPISignType,
                    GlobalRestAPIAppSecret
                    ) or (ACode<>200) then
  begin
    uBaseLog.HandleException(nil,'TQueryTaskStateMananger.QueryTaskState '+ADesc);
    Exit;
  end;

  //接下来的任务要用,里面有result_data_json，里面有cursor、has_next_page等
  TQueryTaskStateItem(ATimerTask).FTaskJson:=ADataJson;

  //  TTaskState=(tsWaiting,
  //              tsWorking,//tsStop,
  //              tsFinished);

  if ADataJson.S['state']='finished' then
  begin
    Result:=tsFinished;
  end;

end;


{ TRequestTaskThread }

constructor TRequestTaskThread.Create(ACreateSuspended: Boolean;
  ATaskManager: TTaskManager);
begin
  Inherited Create(ACreateSuspended);
  FTaskManager:=ATaskManager;
end;

procedure TRequestTaskThread.Execute;
var
  ATaskItem:TTaskItem;
begin
  while not Self.Terminated do
  begin
//    uBaseLog.HandleException(nil,'TRequestTaskThread.Execute');

    if NeedRequestTaskItem then
    begin
//      uBaseLog.HandleException(nil,'TRequestTaskThread.Execute 能获取任务');

      ATaskItem:=Self.RequestTaskItem;

//      if ATaskItem<>nil then
//      begin
//        Self.FTaskManager.TaskList.Add(ATaskItem);
//      end;

    end
    else
    begin
      uBaseLog.HandleException(nil,'TRequestTaskThread.Execute 没有空闲的工作线程或API，不需要获取任务');

    end;

    Sleep(Const_RequestTask_Interval);
  end;

end;

function TRequestTaskThread.RequestTaskItem: TTaskItem;
begin
  Result:=nil;
end;

function TRequestTaskThread.NeedRequestTaskItem: Boolean;
begin
  Result:=True;
end;

initialization


finalization
  if GlobalQueryTaskStateMananger<>nil then
  begin
    GlobalQueryTaskStateMananger.Terminate;
    GlobalQueryTaskStateMananger.WaitFor;
  end;
  SysUtils.FreeAndNil(GlobalQueryTaskStateMananger);


end.

