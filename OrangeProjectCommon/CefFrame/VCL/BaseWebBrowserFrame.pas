unit BaseWebBrowserFrame;

interface


{$I Framework.inc}

{$I SearchClient.inc}

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Math, uBaseLog, uFileCommon, uFuncCommon, StrUtils, DateUtils,
  System.IOUtils,
  uBaseList, uCEFProcess,
//  uConst,
  uWebSearchAPI, XSuperObject, uDatasetToJson,
  Clipbrd,
//  WebbrowserControlUtils,
//  uManager,
  IniFiles, uTaskManager,
//  System.NetEncoding,

  uBaseHttpControl,
  uWebMessageProcesser,

  ActiveX,
  ShlObj,


  uDataInterface, uOpenClientCommon, uRestInterfaceCall, uGraphicCommon,
//  BaseWebSearchAPIFrame,
  uCEFChromium, uCEFWindowParent, uCEFInterfaces,
  uCEFApplication, uCEFTypes, uCEFConstants, uCEFWinControl, uCEFSentinel,
  uCEFChromiumCore, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

const
  MINIBROWSER_SHOWTEXTVIEWER = WM_APP + $100;
//  MINIBROWSER_CONTEXTMENU_SETJSEVENT   = MENU_ID_USER_FIRST + 1;
//  MINIBROWSER_CONTEXTMENU_JSVISITDOM   = MENU_ID_USER_FIRST + 2;
  //显示开发者工具
  MINIBROWSER_CONTEXTMENU_SHOWDEVTOOLS = MENU_ID_USER_FIRST + 3;
//  MINIBROWSER_CONTEXTMENU_OFFLINE      = MENU_ID_USER_FIRST + 4;
  //拷贝链接
  MINIBROWSER_CONTEXTMENU_COPYURL = MENU_ID_USER_FIRST + 5;
  MINIBROWSER_CONTEXTMENU_SYNC = MENU_ID_USER_FIRST + 6;
  MINIBROWSER_CONTEXTMENU_DEFAULTURL = MENU_ID_USER_FIRST + 7;
  MINIBROWSER_CONTEXTMENU_LOADJS = MENU_ID_USER_FIRST + 8;
//  MOUSEOVER_MESSAGE_NAME  = 'mouseover';
//  CUSTOMNAME_MESSAGE_NAME = 'customname';
//

//  USER_NAME = 'email';

//  PASSWORD = 'pass';
//  LoginName = 'login';


{const
  MINIBROWSER_SHOWTEXTVIEWER = WM_APP + $100;
  MINIBROWSER_CONTEXTMENU_SETJSEVENT   = MENU_ID_USER_FIRST + 1;
  MINIBROWSER_CONTEXTMENU_JSVISITDOM   = MENU_ID_USER_FIRST + 2;
  MINIBROWSER_CONTEXTMENU_SHOWDEVTOOLS = MENU_ID_USER_FIRST + 3;
  MINIBROWSER_CONTEXTMENU_OFFLINE      = MENU_ID_USER_FIRST + 4;
  MOUSEOVER_MESSAGE_NAME  = 'mouseover';
  CUSTOMNAME_MESSAGE_NAME = 'customname';

  USER_NAME = 'email';

  PASSWORD = 'pass';
  LoginName = 'login'; }

type
  TNotifyAddAccountSuccEvent = procedure(Sender: TObject; AWebsearchAPI: TWebSearchAPI) of object;

  TFrameBaseWebBrowser = class(TFrame)
    tmrInit: TTimer;
    CEFWindowParent1: TCEFWindowParent;
    Chromium1: TChromium;
    Button1: TButton;
    Button2: TButton;
    pnlTest: TPanel;
    btnLoadFacebookAPI: TButton;
    btnTransferPicContent: TButton;
    btnTransferVideoContent: TButton;
    btnTransferGroupContent: TButton;
    btnLogin: TButton;
    btnGetLoginCaptcha: TButton;
    btnSetSearchWord: TButton;
    btnOpenSearch: TButton;
    btnIsShop: TButton;
    btnCertified: TButton;
    btnCatrgory: TButton;
    btnChoseCountry: TButton;
    btnLoadFacebook: TButton;
    Button3: TButton;
    edtX: TEdit;
    edtY: TEdit;
    Button4: TButton;
    Timer1: TTimer;
    Button5: TButton;
    Timer2: TTimer;
    ComboBox1: TComboBox;
    btnGetAccountInfo: TButton;
    StatusBar1: TStatusBar;
    tmrProcessCustomMessage: TTimer;
    pnlUrl: TPanel;
    edtUrl: TEdit;
    procedure tmrInitTimer(Sender: TObject);virtual;
    procedure Button1Click(Sender: TObject);virtual;
    procedure Chromium1AfterCreated(Sender: TObject; const browser: ICefBrowser);virtual;
    procedure Chromium1BeforeContextMenu(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const params: ICefContextMenuParams; const model: ICefMenuModel);virtual;
    procedure Chromium1ContextMenuCommand(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const params: ICefContextMenuParams; commandId: Integer; eventFlags: Cardinal; out Result: Boolean);virtual;
    procedure Chromium1ProcessMessageReceived(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; sourceProcess: TCefProcessId; const message: ICefProcessMessage; out Result: Boolean);virtual;
    procedure Button2Click(Sender: TObject);virtual;
    procedure Chromium1LoadEnd(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);virtual;

    procedure Chromium1FileDialog(Sender: TObject; const browser: ICefBrowser; mode: Cardinal; const title, defaultFilePath: ustring; const acceptFilters: TStrings; selectedAcceptFilter: Integer; const callback: ICefFileDialogCallback; out Result: Boolean);virtual;

    procedure Chromium1DialogClosed(Sender: TObject; const browser: ICefBrowser);virtual;
    procedure btnLoadFacebookAPIClick(Sender: TObject);virtual;
    procedure btnLoadFacebookClick(Sender: TObject);virtual;
    procedure btnTransferPicContent_ClickShareButtonClick(Sender: TObject);virtual;
    procedure btnTransferPicContentClick(Sender: TObject);virtual;
    procedure btnTransferVideoContentClick(Sender: TObject);virtual;
    procedure btnTransferGroupContentClick(Sender: TObject);virtual;
    procedure btnLoginClick(Sender: TObject);virtual;
    procedure btnGetLoginCaptchaClick(Sender: TObject);virtual;
    procedure btnSetSearchWordClick(Sender: TObject);virtual;
    procedure btnOpenSearchClick(Sender: TObject);virtual;
    procedure btnIsShopClick(Sender: TObject);virtual;
    procedure btnCertifiedClick(Sender: TObject);virtual;
    procedure btnCatrgoryClick(Sender: TObject);virtual;
    procedure btnChoseCountryClick(Sender: TObject);virtual;
    procedure Button3Click(Sender: TObject);virtual;
    procedure Button4Click(Sender: TObject);virtual;
    procedure Timer1Timer(Sender: TObject);virtual;
    procedure Chromium1Close(Sender: TObject; const browser: ICefBrowser; var aAction: TCefCloseBrowserAction);virtual;
    procedure Chromium1BeforeClose(Sender: TObject; const browser: ICefBrowser);virtual;
    procedure btnGetAccountInfoClick(Sender: TObject);virtual;
    procedure Chromium1CookieVisitorDestroyed(Sender: TObject; aID: Integer);virtual;
    procedure Chromium1CookiesVisited(Sender: TObject; const name_, value, domain, path: ustring; secure, httponly, hasExpires: Boolean; const creation, lastAccess, expires: TDateTime; count, total, aID: Integer; same_site: TCefCookieSameSite; priority: Integer; var aDeleteCookie, aResult: Boolean);virtual;
    procedure Chromium1LoadingStateChange(Sender: TObject; const browser: ICefBrowser; isLoading, canGoBack, canGoForward: Boolean);virtual;
    procedure Chromium1SetFocus(Sender: TObject; const browser: ICefBrowser; source: TCefFocusSource; out Result: Boolean);virtual;
    procedure Chromium1FullScreenModeChange(Sender: TObject; const browser: ICefBrowser; fullscreen: Boolean);virtual;
    procedure Chromium1LoadingProgressChange(Sender: TObject; const browser: ICefBrowser; const progress: Double);virtual;
    procedure Chromium1RenderCompMsg(Sender: TObject; var aMessage: TMessage; var aHandled: Boolean);virtual;
    procedure Chromium1DownloadUpdated(Sender: TObject; const browser: ICefBrowser; const downloadItem: ICefDownloadItem; const callback: ICefDownloadItemCallback);virtual;
    procedure Chromium1StatusMessage(Sender: TObject; const browser: ICefBrowser; const value: ustring);virtual;
    procedure Chromium1ZoomPctAvailable(Sender: TObject; const aZoomPct: Double);virtual;
    procedure Chromium1LoadError(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; errorCode: Integer; const errorText, failedUrl: ustring);virtual;
    procedure tmrProcessCustomMessageTimer(Sender: TObject);virtual;
    procedure Chromium1BeforeDownload(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const suggestedName: ustring; const callback: ICefBeforeDownloadCallback);
    procedure Chromium1BeforePopup(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; const targetUrl, targetFrameName: ustring;
      targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean;
      const popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo;
      var client: ICefClient; var settings: TCefBrowserSettings;
      var extra_info: ICefDictionaryValue; var noJavascriptAccess,
      Result: Boolean);

  private
//    function ExecuteScript(AScript:String):String;

    procedure LoginTest_ThreadProc;
    procedure TestTransferPicContent_ThreadProc;
    procedure TestChoseCountry_ThreadProc;
    procedure TestGetLogin2FACaptcha_ThreadProc;
    procedure TestSetSearchWord_ThreadProc;
    procedure TestGetInputPos_ThreadProc;

//    //执行自动化脚本，或者执行Delphi脚本
//    procedure ExecuteAutomaticScript(AAutomaticScript:TStrings);
    { Private declarations }
  protected
    FContext: ICefRequestContext;
    FCookieText: string;
    FCookieArray: ISuperArray;

    FIsDestorying: Boolean;
    //浏览器初始成功
    procedure WebBrowserInited; virtual;
    function CheckInited: Boolean;
    function GetName:String;virtual;

    procedure LoadDefaultUrl;virtual;
    //释放消息
    procedure DO_WM_FRAME_FREE(var AMessage: TMessage); message WM_FRAME_FREE;
    //CEF关闭消息
    procedure DO_CEF_DESTROY(var AMessage: TMessage); message CEF_DESTROY;
  public
    FIsCanFree:Boolean;
    //是否可以释放WebSearchAPIFrame,一般用于释放操作中心的Tab页
    FOnCanFree:TNotifyEvent;
    procedure ShowBrowser;
    procedure HideBrowser;
    //准备释放
    procedure PrepareFree;

    //发消息给网页
    procedure NotityMsgToWeb(AMessageID:String;AMessageJson:ISuperObject;AType:String);
  public
//    //子浏览器页面
//    FFacebookPageSearchAPIFrame: TFrameFacebookWebSearchAPI;

//    FAPI: TWebSearchAPI;
    FIsInited: Boolean;
//    FSetedValue:String;
//    FIsReadOnly: Boolean;
//    FIsLoaded: Boolean;


    //屏幕缩放比例
    FScreenScaleRate: Double;

    //登录结果日志
    GlobalLoginLog: TBaseLog;

    //搜索结果日志
    GlobalSearchLog: TBaseLog;

//    //==================== 登录 ====================
//
//    //是否为添加新账号
//    FIsAddAccount: Boolean;
//
//    //是否为失效账号重新登录
//    FIsReLogin: Boolean;
//
//    //facebook页面是否加载成功
//    FisFbPageLoadSucc: string;
//
//    //登录状态
//    FisLogin: string;
////    FifLoginFinished:String;
//
//    //登录事件是否结束
//    FLoginFinished: Boolean;
//
//    //登录前检测
//    FBeforeLoginState: Boolean;
//    //登录后检测
//    FAfterLoginState: Boolean;
//
//    //第几次检测
//    FCheckCount: Integer;
//
//    //当前登录用户信息
//    FUserInfoJsonObj: ISuperObject;

    //==================== 发帖 ====================

    //发帖媒体
    FContentFiles: TStringList;

//    //==================== 搜索 ====================
//
//    //当前搜索词的关联词数组
//    FRelatedWordsArray: ISuperArray;
//
//    //当前搜索城市区域位置
//    FNowCityAreaIndex: Integer;
//
//    //当前页起始搜索用户位置
//    FStartPageUserIndex: Integer;
//    //已获取用户个数
//    FGetFinishedCount: Integer;
//
//    //当前页起始搜索群组位置
//    FStartGroupIndex: Integer;
//    //已获取群组个数
//    FGetGroupFinishedCount: Integer;
//
//    //城市过滤输入框坐标
//    FcountryWidth: Integer;
//    FcountryHeight: Integer;
//
//    //单个公共主页用户信息对象
//    FReceivedUserDataJson: ISuperObject;


    //接收到的HTML内容
    FContentStr: string;
    //接收到的消息列表
    FGetedMessageList: TCEFMessageContentList;

    DefaultURL:String;
    //添加账号成功事件
    FOnAddAccountSuccEvent: TNotifyAddAccountSuccEvent;

//    function CustomSaveToINI(AIniFile: TIniFile; AIniObj: ISuperObject): Boolean;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure CustomInitContext;virtual;
    procedure AddCookieInfo(const aCookie: TCookie);

    //获取HTML内容
//    function GetHTML:String;
    function GetHTMLContent: string;
    procedure SetHTMLContent(AHTML: string);
    //获取文本内容
    function GetPlainText: string;

    procedure SetIsReadOnly(AValue: Boolean);

    procedure LoadJs;virtual;abstract;

    //新增账号
    procedure AddNewPlatformAccount(AAPI: TWebSearchAPI);virtual;abstract;

////    //授权
////    function Auth(APlastformSetting:ISuperObject):ISuperObject;
//
//    //获取FAPI
//    procedure GetAPI(AAPI: TWebSearchAPI);
//
//    //检查登录状态
//    procedure CheckLoginState(AAPI: TWebSearchAPI; ACheckCount: Integer);
//
//    //登录
//    function Login(AAPI: TWebSearchAPI): ISuperObject;
//
//    //退出登录
//    function Logout: ISuperObject;

    //获取界面的状态,比如当前在什么页面,是否在主页搜索页面,是否在群组搜索页面,当前用于控制悬浮按钮是否显示
    function GetUIStausJson: ISuperObject;

//    //获取双重验证码
//    function GetLogin2FACaptcha(AAPI: TWebSearchAPI): ISuperObject;
//
//    //发帖
//    procedure UploadContent(AContent: ISuperObject; AParams: ISuperObject);
//    //推广商品
//    procedure UploadGoods(AContent: ISuperObject; AParams: ISuperObject);
//
//    //刷新当前页面
//    procedure RefreshNowPage;
//
//
//    //转发
//    function TransferContent(AContent: ISuperObject; AParams: ISuperObject): ISuperObject;
//    //搜索用户公共主页
//    function SearchUserPublicPage(ATaskItem: TTaskItem; ASearchType: string; AParams: ISuperObject; APageIndex: Integer): ISuperObject;
//    //搜索群组
//    function SearchPublicGroup(ATaskItem: TTaskItem; ASearchType: string; AParams: ISuperObject; APageIndex: Integer): ISuperObject;
//    //添加群组
//    function JoinGroup(AGroupJson: ISuperObject): ISuperObject;
//    //删除群组
//    function DeleteGroup: ISuperObject;
//    //群组评论
//    function GroupComment(AContent: string; AParams: ISuperObject): ISuperObject;
//    //批量私聊
//    function BatchChat(AContentJson: ISuperObject; AParams: ISuperObject): ISuperObject;
//
//    //加载脚本
//    procedure LoadFacebookAPI;
//    //获取用户信息
//    function GetAccountInfo: ISuperObject;
//
//    //搜索帖子列表
//    function SearchNextPageContents(ASearchType: string; AParams: ISuperObject; APageIndex: Integer): ISuperObject;


    //鼠标左键点击(x,y轴坐标值，x,y轴计算值)
    procedure SetMouseClick(Sender: TObject; SiteX: Integer; SiteY: Integer; CalcX: Integer; CalcY: Integer);
//    //输入搜索内容
//    procedure SetSearchText(Sender: TObject; AT: string);
//    //输入帖子内容
//    procedure SetArticleText(Sender: TObject; AText: string);
    //发送键盘输入文本事件
    procedure SendKeyPressEnter;

    property HTMLContent: string read GetHTMLContent write SetHTMLContent;

    procedure ShowStatusText(const aText: string);

    { Public declarations }
  end;


var
  GlobalWebBrowserFrameList:TBaseList;

  //脚本休眠时间配置
  FSleepConfig:ISuperObject;
    FmyIniFile: TIniFile;
    FNameArray: TStringDynArray;
    FValueArray: TVariantDynArray;

    FDefaultSleepIni:string;

    // 默认网络检测状态
    FNetChecked: Boolean;

    // 右键菜单默认不可用
    FMenuEnable: Boolean=False;

    //加载和更新配置
    function CustomLoadFromINI: Boolean;
    function CustomSaveToINI(AIniFile:TIniFile;AIniStr:string): Boolean;
    // 设置初始网络检测为false
    //function SetNetCheckToINI(AIniFile:TIniFile;AIniStr:string): Boolean;

implementation

uses
  uCEFRequestContext, uCEFMiscFunctions;


{$R *.dfm}


function CustomLoadFromINI(): Boolean;
var
  ASleepConfigStr:string;
  AMenuConfigStr:string;

  I:Integer;
  AUtilsSleepObj:ISuperObject;
  ANewParamsCount:Integer;
begin
    FDefaultSleepIni:='{"loadHome":3,"loadApi":5,"openPublish":5,"confirmPublish":7,"checkPublish":90,"setClick":2,"setContent":3,"setDownContent":3,"clickDownItem":3,"loadNextPage":5,"loadPage":60,"doPagesSearch":7,"getCompetitor":100}';

    try
        //获取配置文件数据
        FmyIniFile := TIniFile.Create(GetApplicationPath + 'Config.ini');
        ASleepConfigStr := FmyIniFile.ReadString('','SleepConfig', '');

        if ASleepConfigStr = '' then
        begin
            //如果为空则赋初值保存
            CustomSaveToINI(FMyIniFile, FDefaultSleepIni);
            FSleepConfig:= TSuperObject.Create(FDefaultSleepIni);
        end
        else
        begin

            //不为空则先自检，然后添加新增的键值对再保存
            FSleepConfig:= TSuperObject.Create(ASleepConfigStr);
            uBaseLog.HandleException(nil,'====================【加载休眠配置 成功：' + FSleepConfig.AsJSON + '】====================');

            //转初始配置值为对象
            AUtilsSleepObj:= TSuperObject.Create(FDefaultSleepIni);
            //遍历初始配置对象，把新的值添加进本地配置
            ConvertJsonToArray(AUtilsSleepObj, FNameArray, FValueArray);
            ANewParamsCount:= 0;
            for I := 0 to Length(FNameArray)-1 do
            begin
                if not FSleepConfig.Contains(FNameArray[I]) then
                begin
                    ANewParamsCount:= ANewParamsCount+1;
                    FSleepConfig.I[FNameArray[I]]:= FValueArray[I];
                end;
            end;
            if ANewParamsCount > 0 then
            begin
                CustomSaveToINI(FMyIniFile, FSleepConfig.AsJSON);
                uBaseLog.HandleException(nil,'====================【新增：' + IntToStr(ANewParamsCount) + ' | 最终：' + FSleepConfig.AsJSON + '】====================');
            end;

        end;

        //设置默认网络检测值
        FNetChecked:= False;
        //SetNetCheckToINI(FMyIniFile, 'false');

        //======================================================================

        // 获取浏览器右键菜单可用状态
        AMenuConfigStr := FmyIniFile.ReadString('','ShowDev', '');
        if AMenuConfigStr = '' then
        begin
            //如果为空则赋初值保存
            FMyIniFile.WriteString('','ShowDev', 'False');
        end
        else
        begin

            if AMenuConfigStr = 'True' then
              FMenuEnable:= True
            else
              FMenuEnable:= False;

        end;

    finally
        FmyIniFile.Free;
    end;

    Result:=True;
end;

function CustomSaveToINI(AIniFile: TIniFile; AIniStr:string): Boolean;
begin

    try
        AIniFile.WriteString('','SleepConfig', AIniStr);
    finally

    end;

    Result:=True;
end;

// 每次程序启动设置网络检测为false
{function SetNetCheckToINI(AIniFile: TIniFile; AIniStr:string): Boolean;
begin

    try
        AIniFile.WriteString('','NetChecked', AIniStr);
    finally

    end;

    Result:=True;
end;}


{ TFrameFacebookWebSearchAPI }


//发送键盘输入文本事件
procedure TFrameBaseWebBrowser.SendKeyPressEnter;
var
  TempKeyEvent: TCefKeyEvent;
begin
  FillChar(TempKeyEvent, SizeOf(TCefKeyEvent), 0);
  // WM_KEYDOWN
  TempKeyEvent.kind := KEYEVENT_RAWKEYDOWN;
  TempKeyEvent.modifiers := 0;
  TempKeyEvent.windows_key_code := 13; //Msg.wParam
  TempKeyEvent.native_key_code := 1835009;
  TempKeyEvent.is_system_key := ord(False);
  TempKeyEvent.character := #13; //AText[i];//#0;
  TempKeyEvent.unmodified_character := #13;
  TempKeyEvent.focus_on_editable_field := ord(False);
  Chromium1.SendKeyEvent(@TempKeyEvent);
  // KEYEVENT_CHAR
  TempKeyEvent.kind := KEYEVENT_CHAR;
  TempKeyEvent.windows_key_code := 13;
  TempKeyEvent.native_key_code := 28;
  TempKeyEvent.character := #13; //AText[i];//#0;
  TempKeyEvent.unmodified_character := #13;
  Chromium1.SendKeyEvent(@TempKeyEvent);
  // WM_KEYDOWN
  TempKeyEvent.kind := KEYEVENT_KEYUP;
  TempKeyEvent.windows_key_code := 13;
  TempKeyEvent.native_key_code := -1071906815;
  TempKeyEvent.character := #13; //AText[i];//#0;
  TempKeyEvent.unmodified_character := #13;
  Chromium1.SendKeyEvent(@TempKeyEvent);
  Exit;
end;

procedure TFrameBaseWebBrowser.LoadDefaultUrl;
begin
        //ShowMessage('加载'+Self.DefaultURL);
  Chromium1.LoadURL(Self.DefaultURL);

end;

procedure TFrameBaseWebBrowser.LoginTest_ThreadProc;
var
  ASuperObject: ISuperObject;
begin
//  ASuperObject := Self.Login(FAPI);
  uBaseLog.HandleException(nil, '====================【登录结果：' + ASuperObject.AsJson + '】====================');
end;

procedure TFrameBaseWebBrowser.NotityMsgToWeb(AMessageID: String;
  AMessageJson: ISuperObject; AType: String);
begin
  AMessageJson.S['Type']:=AType;
  uBaseLog.HandleException('TFrameBaseWebBrowser.NotityMsgToWeb '+AMessageID+' '+AMessageJson.AsJson);
  //Self.Chromium1.ExecuteJavaScript('vue.global_executeOperate(' + QuotedStr(AMessageID) + ', ' + QuotedStr(AMessageJson.AsJson) + ')', 'about:blank');
  Self.Chromium1.ExecuteJavaScript('vue.global_executeOperate(' + QuotedStr(AMessageID) + ', `' + AMessageJson.AsJson + '`)', 'about:blank');
end;

procedure TFrameBaseWebBrowser.PrepareFree;
//var
//  AMessage: TMessage;
begin
//  DO_WM_FRAME_FREE(AMessage);
  PostMessage(Handle, WM_FRAME_FREE, 0, 0);
end;

procedure TFrameBaseWebBrowser.btnLoginClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(LoginTest_ThreadProc).Start;
end;

procedure TFrameBaseWebBrowser.btnTransferGroupContentClick(Sender: TObject);
begin
//  TThread.CreateAnonymousThreadprocedure
//  var
//    AContent:ISuperObject;
//    AParams:ISuperObject;
//    ASuperObject:ISuperObject;
//  begin
//    AContent:=TSuperObject.Create;
//    //图片帖子             `
////    AContent.S['from_url']:='https://www.facebook.com/photo?fbid=1068336627310212&set=pcb.1068337370643471';
////    AContent.S['from_url']:='https://fb.watch/99U0kKhlGs/';
//    AContent.S['from_url']:='https://www.facebook.com/groups/288824616256694/posts/399611491844672/';
//    AContent.S['content']:='good';
//
//
//    AParams:=TSuperObject.Create;
//    //是否需要点赞
//    AParams.I['is_need_like_content']:=1;
//    //分享到主页
//    AParams.I['is_upload_to_my_homepage']:=1;
//    //转发到个人动态
//    AParams.I['is_upload_to_my_dynamic']:=1;
//    //转发到小组
//    AParams.I['is_upload_to_group']:=1;
//    //转发到好友个人主页
//    AParams.I['is_upload_to_friend_homepage']:=1;
//
//    ASuperObject:=Self.TransferContent(AContent,AParams);
//
//    TThread.Synchronize(nil,procedure
//    begin
////      if ASuperObject.I['Code']<>SUCC then
////      begin
//        ShowMessage(ASuperObject.S['Desc']);
////      end;
//    end);
//
//  end).Start;

end;

procedure TFrameBaseWebBrowser.TestTransferPicContent_ThreadProc;
var
  AContent: ISuperObject;
  AParams: ISuperObject;
  ASuperObject: ISuperObject;
begin
  AContent := TSuperObject.Create;
    //图片帖子             `
  AContent.S['from_url'] := 'https://www.facebook.com/photo?fbid=1068336627310212&set=pcb.1068337370643471';
//    AContent.S['from_url']:='https://fb.watch/99U0kKhlGs/';
  AContent.S['content'] := 'good';

  AParams := TSuperObject.Create;
//    //是否需要点赞
//    AParams.I['is_need_like_content']:=1;
//    //分享到主页
//    AParams.I['is_upload_to_my_homepage']:=1;
    //转发到个人动态
  AParams.I['is_upload_to_my_dynamic'] := 1;
//    //转发到小组
//    AParams.I['is_upload_to_group']:=1;
//    //转发到好友个人主页
//    AParams.I['is_upload_to_friend_homepage']:=1;

//  ASuperObject := Self.TransferContent(AContent, AParams);

//    TThread.Synchronize(nil,procedure
//    begin
////      if ASuperObject.I['Code']<>SUCC then
////      begin
//        ShowMessage(ASuperObject.S['Desc']);
////      end;
//    end);

end;

procedure TFrameBaseWebBrowser.btnTransferPicContentClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(TestTransferPicContent_ThreadProc).Start;
end;

procedure TFrameBaseWebBrowser.btnTransferPicContent_ClickShareButtonClick(Sender: TObject);
begin
  //图文帖子-点击分享按钮
  chromium1.ExecuteJavaScript('document.querySelector(''[class="jmbispl3 olo4ujb6"] > div > div:nth-child(3) > div'').click();', 'about:blank');

end;

procedure TFrameBaseWebBrowser.btnTransferVideoContentClick(Sender: TObject);
begin
//  TThread.CreateAnonymousThreadprocedure
//  var
//    AContent:ISuperObject;
//    AParams:ISuperObject;
//    ASuperObject:ISuperObject;
//  begin
//    AContent:=TSuperObject.Create;
//    //视频帖子             `
////    AContent.S['from_url']:='https://www.facebook.com/photo?fbid=1068336627310212&set=pcb.1068337370643471';
//    AContent.S['from_url']:='https://fb.watch/99U0kKhlGs/';
//    AContent.S['content']:='good';
//
//
//    AParams:=TSuperObject.Create;
//    //是否需要点赞
//    AParams.I['is_need_like_content']:=1;
//    //分享到主页
//    AParams.I['is_upload_to_my_homepage']:=1;
//    //转发到个人动态
//    AParams.I['is_upload_to_my_dynamic']:=1;
//    //转发到小组
//    AParams.I['is_upload_to_group']:=1;
//    //转发到好友个人主页
//    AParams.I['is_upload_to_friend_homepage']:=1;
//
//    ASuperObject:=Self.TransferContent(AContent,AParams);
//
////    TThread.Synchronize(nil,procedure
////    begin
//////      if ASuperObject.I['Code']<>SUCC then
//////      begin
////        ShowMessage(ASuperObject.S['Desc']);
//////      end;
////    end);
//
//  end).Start;

end;

procedure TFrameBaseWebBrowser.Button1Click(Sender: TObject);
begin

  Self.tmrInit.Enabled := True;

////  WebBrowserInited;
end;

procedure TFrameBaseWebBrowser.Button2Click(Sender: TObject);
begin

//  chromium1.ExecuteJavaScript('getUserInfo();', 'about:blank');
  chromium1.ExecuteJavaScript('ShowTest();', 'about:blank');

end;

procedure TFrameBaseWebBrowser.TestGetInputPos_ThreadProc;
var
  ADesc: string;
  ASuperObject: ISuperObject;
begin

  chromium1.ExecuteJavaScript('getInputPos("getInputPos");', 'about:blank');
  ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getInputPos', 10, True);
  if ASuperObject.I['Code'] <> SUCC then
  begin
    ADesc := '获取输入框位置失败!';
    uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 获取输入框位置失败');
  //            Exit;
  end
  else
  begin
    TThread.Synchronize(nil,
      procedure
      begin
        Self.edtX.Text := IntToStr(Ceil(ASuperObject.F['X']));
        Self.edtY.Text := IntToStr(Ceil(ASuperObject.F['Y']));
      end);

              //发送鼠标点击
//              SetMouseClick(nil, CEFWindowParent1.Width div 2, CEFWindowParent1.Height div 2 - 60);
//              SetMouseClick(nil, Ceil(ASuperObject.F['X'])+2, Ceil(ASuperObject.F['Y'])+2);
//              Sleep(FSleepConfig.I['setClick'] * 1000);

  end;

end;

procedure TFrameBaseWebBrowser.Button3Click(Sender: TObject);
begin
  TThread.CreateAnonymousThread(TestGetInputPos_ThreadProc).Start;
end;

procedure TFrameBaseWebBrowser.Button4Click(Sender: TObject);
begin
  Self.Timer1.Enabled := True;
end;

procedure TFrameBaseWebBrowser.btnLoadFacebookClick(Sender: TObject);
begin
//  //图文帖子-点击点赞按钮
//  chromium1.ExecuteJavaScript('document.querySelector(''[class="jmbispl3 olo4ujb6"] > div > div:nth-child(1) > div'').click();', 'about:blank');

  Self.Chromium1.LoadUrl('https://www.facebook.com/');

end;

procedure TFrameBaseWebBrowser.TestGetLogin2FACaptcha_ThreadProc;
begin
//  Self.GetLogin2FACaptcha(FAPI);
end;

procedure TFrameBaseWebBrowser.btnGetAccountInfoClick(Sender: TObject);
begin
  //测试获取用户信息
  TThread.CreateAnonymousThread(
    procedure
    begin
//      Self.GetAccountInfo;

//    //操作界面控件注意要加同步哦
//    TThread.Synchronize(nil,procedure
//    begin
//      Self.lblName.Caption:=FAccount.S['Name'];
//    end);

    end).Start;
end;

procedure TFrameBaseWebBrowser.btnGetLoginCaptchaClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(TestGetLogin2FACaptcha_ThreadProc).Start;
end;

procedure TFrameBaseWebBrowser.btnLoadFacebookAPIClick(Sender: TObject);
begin
//  LoadFacebookAPI;
//  if FFacebookPageSearchAPIFrame <> nil then
//  begin
//    FFacebookPageSearchAPIFrame.LoadFacebookAPI;
//  end;
end;

////加载facebookAPI脚本
//procedure TFrameBaseWebBrowser.LoadFacebookAPI;
//var
//  AfacebookAPI: string;
//begin
//
//  AfacebookAPI := GetStringFromFile(GetApplicationPath + 'FaceBookAPI.js', TEncoding.UTF8);
//  chromium1.ExecuteJavaScript(AfacebookAPI, 'about:blank');
//
//  AfacebookAPI := GetStringFromFile(GetApplicationPath + 'jquery-1.12.3.min.js', TEncoding.UTF8);
//  chromium1.ExecuteJavaScript(AfacebookAPI, 'about:blank');
//
//end;

function TFrameBaseWebBrowser.CheckInited: Boolean;
var
  AStartTime: TDateTime;
begin

//  if not Result then
//  begin
//    ShowMessage('未初始');
//  end;

  AStartTime := Now();

//  while not Self.FIsInited do
//  begin
//    if DateUtils.SecondsBetween(AStartTime,Now)>10 then
//    begin
//      ShowMessage('HTML编辑器初始超时');
//      Break;
//    end;
//    Application.ProcessMessages;
//  end;

  Result := Self.FIsInited;

end;

procedure TFrameBaseWebBrowser.Chromium1BeforeClose(Sender: TObject; const browser: ICefBrowser);
begin
  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.Chromium1BeforeClose');

  FIsCanFree:=True;


  //表示可以释放了
  if Assigned(FOnCanFree) then
  begin
    FOnCanFree(Self);
  end;

  if GlobalWebBrowserFrameList<>nil then
  begin
    GlobalWebBrowserFrameList.Remove(Self,False);
  end;


//  Free;

end;

procedure TFrameBaseWebBrowser.Chromium1BeforeContextMenu(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const params: ICefContextMenuParams; const model: ICefMenuModel);
begin

  // 如果配置允许，或者是fb界面
  if FMenuEnable
  or (Pos('https://www.facebook.com/', browser.MainFrame.Url) > 0)
  or (Pos('https://www.linkedin.com/', browser.MainFrame.Url) > 0) then
  begin

    // 添加一些自定义右键菜单项
    model.AddSeparator;

    // model.AddItem(MINIBROWSER_CONTEXTMENU_SETJSEVENT,   'Set mouseover event');
    // model.AddItem(MINIBROWSER_CONTEXTMENU_JSVISITDOM,   'Visit DOM in JavaScript');
    model.AddItem(MINIBROWSER_CONTEXTMENU_COPYURL, 'Copy Url');
    model.AddItem(MINIBROWSER_CONTEXTMENU_SHOWDEVTOOLS, 'Show DevTools');
    model.AddItem(MINIBROWSER_CONTEXTMENU_SYNC, 'Reload');
    model.AddItem(MINIBROWSER_CONTEXTMENU_DEFAULTURL, 'Load Default URL');
//    model.AddItem(MINIBROWSER_CONTEXTMENU_LOADJS, 'Load JS');
    // model.AddCheckItem(MINIBROWSER_CONTEXTMENU_OFFLINE, 'Offline');
    // model.SetChecked(MINIBROWSER_CONTEXTMENU_OFFLINE,   FOffline);

  end;

end;

function PathToMyDocuments : string;
var
  Allocator : IMalloc;
  Path      : pchar;
  idList    : PItemIDList;
begin
  Result   := '';
  Path     := nil;
  idList   := nil;

  try
    if (SHGetMalloc(Allocator) = S_OK) then
      begin
        GetMem(Path, MAX_PATH);
        if (SHGetSpecialFolderLocation(0, CSIDL_PERSONAL, idList) = S_OK) and
           SHGetPathFromIDList(idList, Path) then
          Result := string(Path);
      end;
  finally
    if (Path   <> nil) then FreeMem(Path);
    if (idList <> nil) then Allocator.Free(idList);
  end;
end;

procedure TFrameBaseWebBrowser.Chromium1BeforeDownload(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const suggestedName: ustring; const callback: ICefBeforeDownloadCallback);
var
  TempMyDocuments, TempFullPath, TempName : string;
begin
  if not(Chromium1.IsSameBrowser(browser)) or
     (downloadItem = nil) or
     not(downloadItem.IsValid) then
    exit;

  TempMyDocuments := PathToMyDocuments;

  if (length(suggestedName) > 0) then
    TempName := suggestedName
   else
    TempName := 'DownloadedFile';

  if (length(TempMyDocuments) > 0) then
    TempFullPath := IncludeTrailingPathDelimiter(TempMyDocuments) + TempName
   else
    TempFullPath := TempName;

  callback.cont(TempFullPath, True);
end;

// 接管弹出窗，在浏览器本身显示
procedure TFrameBaseWebBrowser.Chromium1BeforePopup(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const targetUrl,
  targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition;
  userGesture: Boolean; const popupFeatures: TCefPopupFeatures;
  var windowInfo: TCefWindowInfo; var client: ICefClient;
  var settings: TCefBrowserSettings; var extra_info: ICefDictionaryValue;
  var noJavascriptAccess, Result: Boolean);
begin
  // 取消弹出新窗口
  Result := True;

  // 在当前浏览器中加载新链接
  Chromium1.LoadURL(targetUrl);
end;

procedure TFrameBaseWebBrowser.Chromium1Close(Sender: TObject; const browser: ICefBrowser; var aAction: TCefCloseBrowserAction);
begin
  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.Chromium1Close Begin');

  if not FIsDestorying then
  begin
    Exit;
  end;

  if (browser <> nil) and
     (Chromium1.BrowserId = browser.Identifier) and
     (CEFWindowParent1 <> nil) then
  begin
    uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.Chromium1Close 父Frame');
    //发消息释放Frame
    PostMessage(Handle, CEF_DESTROY, 0, 0);
    //默认是关闭Chromium所在的窗体,如果为Delay表示不关闭窗体
    aAction := cbaDelay;
  end;

//  FIsChromiumClosed:=True;

  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.Chromium1Close End');

end;

procedure TFrameBaseWebBrowser.Chromium1ContextMenuCommand(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const params: ICefContextMenuParams; commandId: Integer; eventFlags: Cardinal; out Result: Boolean);
var
  TempPoint: TPoint;
  TempJSCode: string;
begin
  Result := False;
  // Here is the code executed for each custom context menu entry
  case commandId of
//    MINIBROWSER_CONTEXTMENU_SETJSEVENT :
//      if (frame <> nil) and frame.IsValid then
//        begin
//          TempJSCode := 'document.body.addEventListener("mouseover", function(evt){'+
//                          'function getpath(n){'+
//                            'var ret = "<" + n.nodeName + ">";'+
//                            'if (n.parentNode){return getpath(n.parentNode) + ret} else '+
//                            'return ret'+
//                          '};'+
//                          'myextension.mouseover(getpath(evt.target))}'+
//                        ')';
//
//          frame.ExecuteJavaScript(TempJSCode, 'about:blank', 0);
//        end;
//
//    MINIBROWSER_CONTEXTMENU_JSVISITDOM :
//      if (frame <> nil) and frame.IsValid then
//        begin
//          TempJSCode := 'var testhtml = document.body.innerHTML; ' +
//                        'myextension.sendresulttobrowser(testhtml, ' + quotedstr(CUSTOMNAME_MESSAGE_NAME) + ');';
//
//          frame.ExecuteJavaScript(TempJSCode, 'about:blank', 0);
//        end;
    MINIBROWSER_CONTEXTMENU_SHOWDEVTOOLS:
      begin
        TempPoint.x := params.XCoord;
        TempPoint.y := params.YCoord;
        Chromium1.ShowDevTools(TempPoint, nil);
      end;
    MINIBROWSER_CONTEXTMENU_COPYURL:
      begin
        //复制链接到剪贴板
        Clipboard.SetTextBuf(PChar(Self.Chromium1.Browser.MainFrame.Url));
      end;
    MINIBROWSER_CONTEXTMENU_SYNC:
      begin
        //刷新
        Chromium1.Reload;
      end;
    MINIBROWSER_CONTEXTMENU_DEFAULTURL:
      begin
        //加载首页
        //ShowMessage('加载'+Self.DefaultURL);
        //Chromium1.LoadURL(Self.DefaultURL);
        LoadDefaultUrl;
      end;
    MINIBROWSER_CONTEXTMENU_LOADJS:
      begin
        //加载JS
        LoadJs;
      end;
//    MINIBROWSER_CONTEXTMENU_OFFLINE :
//      SwitchOfflineMode;
  end;

end;

//循环获取cookie
procedure TFrameBaseWebBrowser.Chromium1CookiesVisited(Sender: TObject; const name_, value, domain, path: ustring; secure, httponly, hasExpires: Boolean; const creation, lastAccess, expires: TDateTime; count, total, aID: Integer; same_site: TCefCookieSameSite; priority: Integer; var aDeleteCookie, aResult: Boolean);
var
  TempCookie: TCookie;
  ACookieJson:ISuperObject;
begin
  aDeleteCookie := False;


//  TCookie = record
//    name        : ustring;
//    value       : ustring;
//    domain      : ustring;
//    path        : ustring;
//    creation    : TDateTime;
//    last_access : TDateTime;
//    expires     : TDateTime;
//    secure      : boolean;
//    httponly    : boolean;
//    has_expires : boolean;
//    same_site   : TCefCookieSameSite;
//    priority    : TCefCookiePriority;
//  end;

  TempCookie.name := name_;
  TempCookie.value := value;
  TempCookie.domain := domain;
  TempCookie.path := path;
  TempCookie.secure := secure;
  TempCookie.httponly := httponly;
  TempCookie.creation := creation;
  TempCookie.last_access := lastAccess;
  TempCookie.has_expires := hasExpires;
  TempCookie.expires := expires;
  TempCookie.same_site := same_site;
  TempCookie.priority := priority;

  AddCookieInfo(TempCookie);


  ACookieJson:=SO();
  ACookieJson.S['name'] := name_;
  ACookieJson.S['value'] := value;
  ACookieJson.S['domain'] := domain;
  ACookieJson.S['path'] := path;

  ACookieJson.B['secure'] := secure;
  ACookieJson.B['httponly'] := httponly;
  ACookieJson.B['has_expires'] := hasExpires;

  ACookieJson.S['creation'] := StdDateTimeToStr(creation);
  ACookieJson.S['last_access'] := StdDateTimeToStr(lastAccess);
  ACookieJson.S['expires'] := StdDateTimeToStr(expires);

//  TCefCookieSameSite = (
//    CEF_COOKIE_SAME_SITE_UNSPECIFIED,
//    CEF_COOKIE_SAME_SITE_NO_RESTRICTION,
//    CEF_COOKIE_SAME_SITE_LAX_MODE,
//    CEF_COOKIE_SAME_SITE_STRICT_MODE
//  );

  ACookieJson.I['same_site'] := Ord(same_site);
  ACookieJson.I['priority'] := priority;

  Self.FCookieArray.O[FCookieArray.Length]:=ACookieJson;


  aResult := (count <> pred(total));
end;

//获取cookie结束，执行需要的操作
procedure TFrameBaseWebBrowser.Chromium1CookieVisitorDestroyed(Sender: TObject; aID: Integer);
begin
  uBaseLog.HandleException(nil, '====================【浏览器加载完成,Cookie：' + #13#10 + FCookieText + '】====================');

  if GlobalLoginLog = nil then
  begin
    GlobalLoginLog := TBaseLog.Create('addOrReLogin.log');
  end;
  //写入本次登录日志
  GlobalLoginLog.IsWriteLog := True;
  GlobalLoginLog.WriteLog(FCookieText + #13#10);
  GlobalLoginLog.WriteLog(FCookieArray.AsJSON + #13#10);
  FreeAndNil(GlobalLoginLog);


end;

//选择图片、视频
procedure TFrameBaseWebBrowser.Chromium1FileDialog(Sender: TObject;
  const browser: ICefBrowser; mode: Cardinal;
  const title, defaultFilePath: ustring;
  const acceptFilters: TStrings; selectedAcceptFilter: Integer;
  const callback: ICefFileDialogCallback;
  out Result: Boolean);
var
  I: Integer;
  ATempFilePath:String;
var
  AFiles:TStringList;
begin
  uBaseLog.HandleException('TFrameFacebookWebSearchAPI.Chromium1FileDialog Begin');
  //title:
  //defaultFilePath:
  //acceptFilters:image/*
  //image/heif
  //image/heic
  //video/*
  //video/mp4
  //video/x-m4v
  //video/x-matroska
  //.mkv
  // selectedAcceptFilter:0

  if FContentFiles.Count > 0 then
  begin

    AFiles:=TStringList.Create;

    uBaseLog.HandleException('TFrameFacebookWebSearchAPI.Chromium1FileDialog ' + #13#10
                           + ' title:' + title + #13#10
                           + ' defaultFilePath:' + defaultFilePath + #13#10
                           + ' acceptFilters:' + acceptFilters.Text + #13#10
                           + ' selectedAcceptFilter:' + IntToStr(selectedAcceptFilter));

    try
      //如果是链接,则先下载再添加
      //https://faceom.oss-us-east-1.aliyuncs.com/fbsearch/QQ%E6%88%AA%E5%9B%BE20230321104746.png
      for I := 0 to FContentFiles.Count-1 do
      begin
        if SameText(Copy(FContentFiles[I],1,7),'http://')
        or SameText(Copy(FContentFiles[I],1,8),'https://') then
        begin
          ATempFilePath:=//System.IOUtils.TPath.GetTempPath()+
                          System.IOUtils.TPath.GetTempFileName()
                          +ExtractFileExt(GetFileNameFromUrl(FContentFiles[I]))
                          ;
          if uBaseHttpControl.DownloadImage(FContentFiles[I],ATempFilePath) then
          begin
            AFiles.Add(ATempFilePath);
          end;
        end
        else
        begin
          AFiles.Add(FContentFiles[I]);
        end;
      end;

  //    AFiles.Add('C:\Users\Administrator\Desktop\你很弱.jpg');
  //    AFiles.Add('C:\Users\Administrator\Desktop\傲途演示视频.mp4');
  //    AFiles.Add('C:\Users\Administrator\Desktop\不要.jpg');

      //AFiles.Add('C:\Users\Administrator\Desktop\blackcat.jpg');

      uBaseLog.HandleException('【已选媒体】：' + AFiles.CommaText);

      //callback.Cont(selectedAcceptFilter, AFiles);
      {$IFDEF WIN64}
        // 用户选择了文件，将文件名传递给浏览器
        callback.Cont(AFiles);
      {$ELSE}
        callback.Cont(selectedAcceptFilter, AFiles);
      {$ENDIF}
      Result := True;

    finally
  //    FContentFiles.Clear;
      FreeAndNil(AFiles);
    end;

  end;

  uBaseLog.HandleException('TFrameFacebookWebSearchAPI.Chromium1FileDialog End');

end;

procedure TFrameBaseWebBrowser.Chromium1FullScreenModeChange(Sender: TObject; const browser: ICefBrowser; fullscreen: Boolean);
begin
  if not (Chromium1.IsSameBrowser(browser)) then
  begin
    uBaseLog.HandleException(nil, '====================【TFrameBaseWebBrowser.Chromium1FullScreenModeChange 框架不匹配，退出】====================');
    Exit;
  end;

  if fullscreen then
  begin
    StatusBar1.Visible := False;
  end
  else
  begin
    StatusBar1.Visible := True;
  end;
end;

procedure TFrameBaseWebBrowser.Chromium1DialogClosed(Sender: TObject; const browser: ICefBrowser);
begin
  //
end;

procedure TFrameBaseWebBrowser.Chromium1DownloadUpdated(Sender: TObject; const browser: ICefBrowser; const downloadItem: ICefDownloadItem; const callback: ICefDownloadItemCallback);
var
  TempString: string;
begin
  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.Chromium1DownloadUpdated Begin');
  if not (Chromium1.IsSameBrowser(browser)) then
    exit;

  if downloadItem.IsComplete then
    ShowStatusText(downloadItem.FullPath + ' completed')
  else if downloadItem.IsCanceled then
    ShowStatusText(downloadItem.FullPath + ' canceled')
  else if downloadItem.IsInProgress then
  begin
    if (downloadItem.PercentComplete >= 0) then
      TempString := downloadItem.FullPath + ' : ' + inttostr(downloadItem.PercentComplete) + '%'
    else
      TempString := downloadItem.FullPath + ' : ' + inttostr(downloadItem.ReceivedBytes) + ' bytes received';

    ShowStatusText(TempString);
  end;
  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.Chromium1DownloadUpdated Begin');
end;

procedure TFrameBaseWebBrowser.Chromium1ProcessMessageReceived(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; sourceProcess: TCefProcessId; const message: ICefProcessMessage; out Result: Boolean);
var
//  bIsInnerMsg: Boolean;
  sName, sData: string;
  ACEFMessageContent: TCEFMessageContent;
  ARecordList: ISuperArray;
  ARecordDataJson: ISuperObject;
  ALoginState: ISuperObject;
begin
  if Self.Chromium1.IsSameBrowser(browser) then
  begin
    sName := message.Name;
    sData := message.ArgumentList.GetString(0);
    uBaseLog.HandleException(nil, '====================【JS收到回复：' + sName + ' ' + sData + ' 】====================');

    ACEFMessageContent := TCEFMessageContent.Create;
    ACEFMessageContent.ID := sName;
    ACEFMessageContent.Data := sData;
    Self.FGetedMessageList.Add(ACEFMessageContent);





    //消息处理
    ACEFMessageContent := TCEFMessageContent.Create;
    ACEFMessageContent.ID := sName;
    ACEFMessageContent.Data := sData;
    ACEFMessageContent.WebBrowserFrame:=Self;
    GetGlobalWebMessageProcesser.FGetedMessageList.Add(ACEFMessageContent);


    { TODO : 被我注释了 }
//    //获取登录状态结束回调
//    if sName = 'getLoginState' then
//    begin
//      ALoginState := TSuperObject.Create(sData);
//
//      Self.FisLogin := ALoginState.S['loginState'];
//      Self.FisFbPageLoadSucc := ALoginState.S['pageLoadSucc'];
//
//      uBaseLog.HandleException(nil, '====================【第 ' + IntToStr(FCheckCount) + ' 次检测登录状态完毕：' + sData + '】====================');
//
//      if Self.FisLogin = 'True' then
//      begin
//        Self.FAPI.FLoginState := lsSucc;
//        uBaseLog.HandleException(nil, '====================【登陆 成功！！！】====================');
//      end
//      else
//      begin
//        uBaseLog.HandleException(nil, '====================【登陆 失败！！！】====================');
//      end;
//
//      if FCheckCount = 1 then
//      begin
//        Self.FBeforeLoginState := True;
//      end
//      else
//      begin
//        Self.FAfterLoginState := True;
//      end;
//    end;
//
//    //登录调用结束回调
//    if sName = 'loginFinished' then
//    begin
//      uBaseLog.HandleException(nil, '====================【登录JS执行完毕：' + sData + '】====================');
//
//      Self.FLoginFinished := True;
//    end;
//
//    //获取用户信息结束回调
////    if sName ='getUserInfoFinished' then
////    begin
////      FUserInfoJsonObj:= TSuperObject.Create(sData);
////      uBaseLog.HandleException(nil,'====================【获取用户信息JS收到回复：' + sData + '】====================');
////    end;
//
//    //获取当前页公共主页用户个数结束回调
////    if sName ='getPublishPageCountFinished' then
////    begin
////      FNowPublicPageUserCount:= StrToInt(sData);
////      uBaseLog.HandleException(nil,'====================【当前页公共主页用户个数成功：' + sData + '】====================');
////    end;
//
//    //获取公共主页用户联系方式结束回调
////    if sName = 'getContactFinished' then
////    begin
////      FReceivedUserDataJson:= TSuperObject.Create(sData);
////      uBaseLog.HandleException(nil,'====================【获取当前公共主页用户联系方式成功：' + sData + '】====================');
////    end;
//
////==============================================================================
//
////    if sName='getContentStr' then
////    begin
////      FContentStr:=sData;
////    end;
//
////    FGetedMessageList.Values[sName]:=sData;
//
////    bIsInnerMsg := IsInnerMsg(sName);
////    if bIsInnerMsg then
////    begin
////      try
////        DoInnerMsgData(sName, sData);
////      except on e: Exception do
////        LogWriter.Add('WhatsAppView Received', 642, lkErr, e.ClassName + ':' + e.Message);
////      end;
////    end;
////
////    if TaskRuning then
////      FTaskDispatcher.MessageReceived(sName, sData);
////
////    if not bIsInnerMsg then
////      App.UpdateDatas(sName, sData);
  end;
end;

procedure TFrameBaseWebBrowser.Chromium1RenderCompMsg(Sender: TObject; var aMessage: TMessage; var aHandled: Boolean);
begin
  if aMessage.Msg = WM_MOUSEMOVE then
  begin
    StatusBar1.Panels[2].Text := 'x : ' + inttostr(aMessage.lParam and $FFFF);
    StatusBar1.Panels[3].Text := 'y : ' + inttostr((aMessage.lParam and $FFFF0000) shr 16);
  end;
end;

constructor TFrameBaseWebBrowser.Create(AOwner: TComponent);
begin

  inherited;

  ShowStatusText('正在初始化浏览器，请稍候。。。');

  FGetedMessageList := TCEFMessageContentList.Create;

//  SetIEFeatureModeCorrespond;
//  // GlobalCEFApp.GlobalContextInitialized has to be TRUE before creating any browser
//  // If it's not initialized yet, we use a simple timer to create the browser later.
//  if not(Chromium1.CreateBrowser(CEFWindowParent1, '')) then
//  begin
//    tmrInit.Enabled := True;
//  end
//  else
//  begin
//  end;

  FScreenScaleRate := GetScreenScaleRate;
  uBaseLog.HandleException(nil, '====================【当前屏幕缩放比率：' + FloatToStr(FScreenScaleRate) + '】====================');

  FContentFiles := TStringList.Create;


  Self.tmrInit.Enabled := True;


//  GlobalChromiumFrameList.Add(Chromium1,Self);

//  {$IFDEF DEV_MODE}
//
//  {$ELSE}
  //发布模式不显示日志页面
  Self.pnlTest.Visible := False;
//  {$ENDIF}


  GlobalWebBrowserFrameList.Add(Self);

end;

procedure TFrameBaseWebBrowser.CustomInitContext;
begin

end;

procedure TFrameBaseWebBrowser.AddCookieInfo(const aCookie: TCookie);
begin
  // This should be protected by a mutex.
  FCookieText := FCookieText + aCookie.name + ' : ' + aCookie.value + ' (' + aCookie.domain + ')' + #13 + #10;
end;

procedure TFrameBaseWebBrowser.Chromium1AfterCreated(Sender: TObject; const browser: ICefBrowser);
begin
  FIsInited := True;
  WebBrowserInited;
end;

procedure TFrameBaseWebBrowser.WebBrowserInited;
//var
//  AUrl:String;
//var
//  ACookieJson:ISuperObject;
//  ACookieArray:ISuperArray;
//  I: Integer;
begin
  //file:///C:/MyFiles/OrangeUIProduct/%E5%86%85%E5%AE%B9%E7%88%AC%E8%99%AB/python_project/client/html_editor/index.html
//  AUrl:='file:///'+GetApplicationPath+'html_editor'+PathDelim+'index.html';

//  AUrl:='http://www.facebook.com';
//
//  AUrl:=ReplaceStr(AUrl,'\','/');
//  Self.Chromium1.LoadURL(AUrl);

//  ACookieArray:=SA(GetStringFromFile('C:\MyFiles\OrangeUIProduct\facebook运营\16.Facebook登陆的Cookie.log',TEncoding.UTF8));
//  for I := 0 to ACookieArray.Length-1 do
//  begin
//    //function TChromiumCore.SetCookie(const url, name_, value, domain, path: ustring;
//    //                                       secure, httponly, hasExpires: Boolean;
//    //                                 const creation, lastAccess, expires: TDateTime;
//    //                                       same_site : TCefCookieSameSite;
//    //                                       priority : TCefCookiePriority;
//    //                                       aSetImmediately : boolean;
//    //                                       aID : integer): Boolean;
//    //  ACookieJson:=SO();
//    //  ACookieJson.S['name'] := name_;
//    //  ACookieJson.S['value'] := value;
//    //  ACookieJson.S['domain'] := domain;
//    //  ACookieJson.S['path'] := path;
//    //
//    //  ACookieJson.B['secure'] := secure;
//    //  ACookieJson.B['httponly'] := httponly;
//    //  ACookieJson.B['has_expires'] := hasExpires;
//    //
//    //  ACookieJson.S['creation'] := StdDateTimeToStr(creation);
//    //  ACookieJson.S['last_access'] := StdDateTimeToStr(lastAccess);
//    //  ACookieJson.S['expires'] := StdDateTimeToStr(expires);
//    //
//    ////  TCefCookieSameSite = (
//    ////    CEF_COOKIE_SAME_SITE_UNSPECIFIED,
//    ////    CEF_COOKIE_SAME_SITE_NO_RESTRICTION,
//    ////    CEF_COOKIE_SAME_SITE_LAX_MODE,
//    ////    CEF_COOKIE_SAME_SITE_STRICT_MODE
//    ////  );

//    //
//    //  ACookieJson.I['same_site'] := Ord(same_site);
//    //  ACookieJson.I['priority'] := priority;
//    ACookieJson:=ACookieArray.O[I];
//    Self.Chromium1.SetCookie('https://www.facebook.com',
//                             ACookieJson.S['name'],
//                             ACookieJson.S['value'],
//                             ACookieJson.S['domain'],
//                             ACookieJson.S['path'],
//
//                             ACookieJson.B['secure'],
//                             ACookieJson.B['httponly'],
//                             ACookieJson.B['has_expires'],
//
//                             StdStrToDateTime(ACookieJson.S['creation']),
//                             StdStrToDateTime(ACookieJson.S['last_access']),
//                             StdStrToDateTime(ACookieJson.S['expires']),
//
//                             TCefCookieSameSite(ACookieJson.I['same_site']),
//                             TCefCookiePriority(ACookieJson.I['priority']),
//
//                             True,
//                             I
//                             );
//  end;

//  Chromium1.DefaultURL       := AUrl;
//  Chromium1.LoadUrl('http://www.orangeui.cn');


  if DefaultURL<>'' then
  begin
    Self.Chromium1.LoadUrl(DefaultURL);
  end;
end;

procedure TFrameBaseWebBrowser.Chromium1LoadEnd(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);
var
  ASuperObject: ISuperObject;
  TempHandle: THandle;
begin

  Self.edtUrl.Text:= Self.Chromium1.Browser.MainFrame.Url;

  if (frame = nil) or not (frame.IsValid) or (browser = nil) then
  begin
    uBaseLog.HandleException(nil, '====================【框架为空/框架不可用/浏览器为空，退出】====================');
    Exit;
  end;

  if Chromium1.IsSameBrowser(browser) then
  begin
    if frame.IsMain then
      StatusBar1.Panels[1].Text := '主框架已加载 : ' + quotedstr(frame.name)
    else
      StatusBar1.Panels[1].Text := '框架已加载 : ' + quotedstr(frame.name);
  end
  else
  begin
    // 这是CEF处理的弹出窗口中焦点问题的解决方法
    TempHandle := WinApi.Windows.GetWindow(browser.Host.WindowHandle, GW_OWNER);
    if (TempHandle <> Handle) then
      WinApi.Windows.SetFocus(TempHandle);
  end;

  //----------------------------------------------------------------------------
  { TODO : 被我注释了 }
//  if Self.Chromium1.Browser.MainFrame.Url <> 'about:blank' then
//  begin
//    FIsLoaded := True;
//    uBaseLog.HandleException(nil, '====================【浏览器加载完成：' + Self.Chromium1.Browser.MainFrame.Url + '】====================');
//  end;
//
//  //如果是添加账号 / 失效账号重新登录
//  if (FIsAddAccount = True) or (FIsReLogin = True) then
//  begin
//
//    //获取cookie
//    if Pos('https://www.facebook.com/', Self.Chromium1.Browser.MainFrame.Url) > 0 then
//    begin
//      FCookieText := '';
//      Chromium1.VisitAllCookies;
//    end;
//
//  end;

end;

//加载失败显示
procedure TFrameBaseWebBrowser.Chromium1LoadError(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; errorCode: Integer; const errorText, failedUrl: ustring);
var
  TempString: string;
begin
  if (errorCode = ERR_ABORTED) then
    exit;

  TempString := '<html><body bgcolor="white">' + '<h2>Failed to load URL ' + failedUrl + ' with error ' + errorText + ' (' + inttostr(errorCode) + ').</h2></body></html>';

  Chromium1.LoadString(TempString, frame);
end;

//================================ 取消程序置顶 ================================

procedure TFrameBaseWebBrowser.Chromium1LoadingProgressChange(Sender: TObject; const browser: ICefBrowser; const progress: Double);
begin
  StatusBar1.Panels[0].Text := 'Loading... ' + FloatToStrF(progress * 100, ffFixed, 3, 0) + '%';
end;

procedure TFrameBaseWebBrowser.Chromium1LoadingStateChange(Sender: TObject; const browser: ICefBrowser; isLoading, canGoBack, canGoForward: Boolean);
begin
  Chromium1.DefaultWindowInfoExStyle := Chromium1.DefaultWindowInfoExStyle;

  //----------------------------------------------------------------------------

  if not (Chromium1.IsSameBrowser(browser)) then
  begin
    uBaseLog.HandleException(nil, '====================【TFrameBaseWebBrowser.Chromium1LoadingStateChange 框架不匹配，退出】====================');
    Exit;
  end;

  if isLoading then
  begin
    StatusBar1.Panels[0].Text := 'Loading...';
  end
  else
  begin
    StatusBar1.Panels[0].Text := 'Finished';
  end;

end;

procedure TFrameBaseWebBrowser.Chromium1SetFocus(Sender: TObject; const browser: ICefBrowser; source: TCefFocusSource; out Result: Boolean);
begin
  Result := True;
end;

procedure TFrameBaseWebBrowser.Chromium1StatusMessage(Sender: TObject; const browser: ICefBrowser; const value: ustring);
begin
  if Chromium1.IsSameBrowser(browser) then
    ShowStatusText(value);
end;

procedure TFrameBaseWebBrowser.Chromium1ZoomPctAvailable(Sender: TObject; const aZoomPct: Double);
begin
  ShowStatusText('Zoom : ' + floattostr(aZoomPct) + '%');
end;

//==============================================================================

destructor TFrameBaseWebBrowser.Destroy;
begin
  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.Destroy Begin');


  FreeAndNil(FGetedMessageList);
  FreeAndNil(FContentFiles);
  FreeAndNil(GlobalSearchLog);
  inherited;

  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.Destroy End');
end;

procedure TFrameBaseWebBrowser.DO_CEF_DESTROY(var AMessage: TMessage);
begin
  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.DO_CEF_DESTROY 父Frame Begin');
  //Free之后会调用BeforeClose
  if CEFWindowParent1<>nil then
  begin
    CEFWindowParent1.Parent:=nil;
    FreeAndNil(CEFWindowParent1);//这里容易卡死
  end;


  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.DO_CEF_DESTROY 父Frame End');
end;

procedure TFrameBaseWebBrowser.DO_WM_FRAME_FREE(var AMessage: TMessage);
begin
  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.DO_WM_FRAME_FREE 父Frame Begin');
  FIsDestorying := True;



  //在消息中,先关闭Chromium，然后Chromium会触发它的OnClose事件，在OnClose事件中发送CEF_DESTROY给自己，表示可以释放了
  if Chromium1.Initialized then
  begin
    uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.DO_WM_FRAME_FREE 父Frame Chromium1.CloseBrowser(True) Begin');
    Chromium1.CloseBrowser(True);
    uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.DO_WM_FRAME_FREE 父Frame Chromium1.CloseBrowser(True) End');
  end
  else
  begin
    //没有初始,直接释放
    PostMessage(Handle, CEF_DESTROY, 0, 0);
  end;

end;

//procedure TFrameFacebookWebSearchAPI.ExecuteAutomaticScript(
//  AAutomaticScript: TStrings);
////var
////  AScriptLine:String;
//begin
//  //
//  //能用js的就用js，或者全部用JS，需要Delphi去执行的就用扩展去执行
//  //一句句执行
//  //Delphi的变量如何传给JS?比如Content,比如Params
//  //var content = json.decode($param1)
//  //var params = json.decode($param2)
//  //然后将$param1用字符串替换
//  //什么时候去执行delphi的代码？用扩展去执行
//  //还要能标识当前这段JS代码是在哪里被执行的？
//
////  for I := 0 to AAutomaticScript.Count-1 do
////  begin
////    AScriptLine:=AAutomaticScript[I];
////    chromium1.ExecuteJavaScript(AScriptLine, 'about:blank');
////
////
////  end;
//end;

//function TFrameFacebookWebSearchAPI.GetHTML: String;
//begin
//  Result:='';//WebBrowser1.OleObject.document.parentWindow.getAllHtmlSource();
//  if not CheckInited then
//  begin
//    Exit;
//  end;
//
////  Self.Chromium1.ExecuteJavaScript('getAllHtmlSource()',Chromium1.Browser.MainFrame.GetURL, 0);
//
//end;

//procedure TFrameBaseWebBrowser.GetAPI(AAPI: TWebSearchAPI);
//begin
//  FAPI := AAPI;
//end;

function TFrameBaseWebBrowser.GetHTMLContent: string;
var
  AContent: TCEFMessageContent;
begin
  Result := ''; //WebBrowser1.OleObject.document.parentWindow.getContentStr();
  if not CheckInited then
  begin
    Exit;
  end;

  Self.Chromium1.ExecuteJavaScript('getContentStr()', Chromium1.Browser.MainFrame.GetURL, 0);
  //等到获取到了结果
  AContent := Self.FGetedMessageList.CheckMessageIsReceived('getContentStr', 10);
  if AContent = nil then
  begin
    ShowMessage('getContentStr超时');
    Exit;
  end;

  Result := AContent.Data;
  FreeAndNil(AContent);

end;

function TFrameBaseWebBrowser.GetName: String;
begin
  Result:='';
end;

function TFrameBaseWebBrowser.GetPlainText: string;
begin
  Result := ''; //WebBrowser1.OleObject.document.parentWindow.getPlainTxtStr();
  if not CheckInited then
  begin
    Exit;
  end;

//  Self.Chromium1.ExecuteJavaScript('getPlainTxtStr()',Chromium1.Browser.MainFrame.GetURL, 0);

end;

////检查登录状态
//procedure TFrameBaseWebBrowser.CheckLoginState(AAPI: TWebSearchAPI; ACheckCount: Integer);
//begin
//  FCheckCount := ACheckCount;
//
//  TThread.Synchronize(nil,
//    procedure
//    begin
//      chromium1.ExecuteJavaScript('checkLoginState("getLoginState");', 'about:blank');
//    end);
//end;

////执行登录
//function TFrameBaseWebBrowser.Login(AAPI: TWebSearchAPI): ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  AStartTime: TDateTime;
////var
////  AContent:TCEFMessageContent;
////  AMessageData:String;
//  ASuperObject: ISuperObject;
//  ALastStep: string;
//begin
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  AAPI.FLoginState := lsFail;
//
//  try
//    AStartTime := Now;
//
//
//    //等待FFacebookWebSearchAPIFrame在OperationCenterFrame运营中心页创建完成
//    while (not Self.FIsInited) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) and not AAPI.FIsWillLogout do
//    begin
//      uBaseLog.HandleException(nil, '====================【API登录 前 检测浏览器是否初始完成】====================' + AAPI.FAccount.S['nickname']);
//      Sleep(1000);
//    end;
//
//
//    //在Chrome中执行登录，
//    //模拟登录
//    //    Sleep(7*1000);
//    Self.FIsLoaded := False;
//    Self.Chromium1.LoadUrl('https://www.facebook.com/');
//    while (not Self.FIsLoaded) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) and not AAPI.FIsWillLogout do
//    begin
//      uBaseLog.HandleException(nil, '====================【API登录 前 检测页面是否加载完成】====================' + AAPI.FAccount.S['nickname']);
//      Sleep(1000);
//    end;
//    //登录前检测
//    //加载facebookAPI脚本
//    Sleep(1500);
//    Self.LoadFacebookAPI;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//
//    //登录前检测该账号是否已经通过缓存登录
//    FBeforeLoginState := False;
//    FisFbPageLoadSucc := '';
//
//    Self.CheckLoginState(AAPI, 1);
//
//    //      //等到获取到了结果
//    //      AContent:=Self.FGetedMessageList.CheckMessageIsReceived('getLoginState',10);
//    //      if AContent=nil then
//    //      begin
//    //        //ShowMessage('getContentStr超时');
//    //        Exit;
//    //      end;
//    //等待登录前检测结束
//    while (Self.FBeforeLoginState = False) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) and not AAPI.FIsWillLogout do
//    begin
//      Sleep(1000);
//    end;
//    uBaseLog.HandleException(nil, '====================【API登录 前 检测结束，账号登录状态：' + IntToStr(Ord(AAPI.FLoginState)) + '】====================');
//
//    if FisFbPageLoadSucc = 'False' then
//    begin
//      uBaseLog.HandleException(nil, '====================【Facebook页面加载失败，执行退出】====================');
//      Exit;
//    end;
//
//
//    //登录前检测结束后判断登录状态，是否需要登录
//    if AAPI.FLoginState <> lsSucc then
//    begin
//        //需要登录
//
//        //老版本，存在账号密码，自动登录
//      if (FAPI.FAccount.S['username'] <> '') and (FAPI.FAccount.S['password'] <> '') then
//      begin
//
//        if (AAPI.FAccount.S['facebook_2fa_secret'] <> '') then
//        begin
//                //买来的账号,需要双重验证码
//                {$REGION '购买的账号登录'}
//
//                //买来的账号第一次需要登录https://mbasic.facebook.com/
//          Self.FIsLoaded := False;
//          Self.Chromium1.LoadUrl('https://mbasic.facebook.com/');
//          while (not Self.FIsLoaded) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) and not AAPI.FIsWillLogout do
//          begin
//            uBaseLog.HandleException(nil, '====================【API登录前检测页面是否加载完成】====================' + AAPI.FAccount.S['username']);
//            Sleep(1000);
//          end;
//
//                //加载facebookAPI脚本
//          Self.LoadFacebookAPI;
//          Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//          ALastStep := '';
//          while (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) and not AAPI.FIsWillLogout do
//          begin
//
//
//                    //获取登录页面的步骤
//            chromium1.ExecuteJavaScript('getCurrentLoginStepType("getCurrentLoginStepType");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getCurrentLoginStepType', 10, True);
//            if ASuperObject.I['Code'] <> SUCC then
//            begin
//              uBaseLog.HandleException(nil, '====================【获取当前登录状态JS执行完毕：执行失败】====================');
//              Exit;
//            end
//            else
//            begin
//              uBaseLog.HandleException(nil, '====================【获取当前登录状态JS执行完毕：' + ASuperObject.AsJson + '】====================');
//            end;
//
//            if ALastStep = ASuperObject.S['Step'] then
//            begin
//              uBaseLog.HandleException(nil, '====================【登录步骤不能继续：执行失败】====================');
//              Exit;
//            end;
//            ALastStep := ASuperObject.S['Step'];
//
//            if ASuperObject.S['Step'] = 'select_account' then
//            begin
//
//                        //请选择账户
//              chromium1.ExecuteJavaScript('selectLoginAnotherAccount("selectLoginAnotherAccount");', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('selectLoginAnotherAccount', 10, True);
//              if ASuperObject.I['Code'] <> SUCC then
//              begin
//                uBaseLog.HandleException(nil, '====================【选择账户JS执行完毕：执行失败】====================');
//                Exit;
//              end
//              else
//              begin
//                uBaseLog.HandleException(nil, '====================【选择账户JS执行完毕：' + ASuperObject.AsJson + '】====================');
//              end;
//
//            end
//            else if ASuperObject.S['Step'] = 'login' then
//            begin
//
//                        //等Facebook加载完
//                        { TODO : 等Facebook加载完 }
//                        //判断当前是否能输账号，能输的话，输入账号
//              chromium1.ExecuteJavaScript('doLogin_M("doLogin_M",' + QuotedStr(FAPI.FAccount.S['username']) + ', ' + QuotedStr(FAPI.FAccount.S['password']) + ');', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('doLogin_M', 10, True);
//              if ASuperObject.I['Code'] <> SUCC then
//              begin
//                uBaseLog.HandleException(nil, '====================【登录JS执行完毕：执行失败】====================');
//                Exit;
//              end
//              else
//              begin
//                uBaseLog.HandleException(nil, '====================【登录JS执行完毕：' + ASuperObject.AsJson + '】====================');
//              end;
//
//            end
//            else if ASuperObject.S['Step'] = 'login_error' then
//            begin
//
//              uBaseLog.HandleException(nil, '====================【登录JS执行完毕：执行失败】====================');
//              Exit;
//            end
//            else if ASuperObject.S['Step'] = 'input_captcha' then
//            begin
//
//                        //输入登录验证码并继续操作
//                        //'https://mbasic.facebook.com/checkpoint/?_rdr'
//                        //去获取验证码
//              ASuperObject := Self.GetLogin2FACaptcha(Self.FAPI);
//
//                        //填入验证码,登录
//              chromium1.ExecuteJavaScript('submitLogin2FACaptcha("submitLogin2FACaptcha",' + QuotedStr(ASuperObject.O['Data'].S['Captcha']) + ');', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('submitLogin2FACaptcha', 10, True);
//              if ASuperObject.I['Code'] <> SUCC then
//              begin
//                uBaseLog.HandleException(nil, '====================【输入登录验证码JS执行完毕：执行失败】====================');
//                Exit;
//              end
//              else
//              begin
//                uBaseLog.HandleException(nil, '====================【输入登录验证码JS执行完毕：' + ASuperObject.AsJson + '】====================');
//              end;
//
//            end
//            else if ASuperObject.S['Step'] = 'remember_this_browser' then
//            begin
//
//                        //不记住浏览器
//              chromium1.ExecuteJavaScript('selectIfNeedRememberThisBrowser("selectIfNeedRememberThisBrowser");', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('selectIfNeedRememberThisBrowser', 10, True);
//              if ASuperObject.I['Code'] <> SUCC then
//              begin
//                uBaseLog.HandleException(nil, '====================【不记住浏览器JS执行完毕：执行失败】====================');
//                Exit;
//              end
//              else
//              begin
//                uBaseLog.HandleException(nil, '====================【不记住浏览器JS执行完毕：' + ASuperObject.AsJson + '】====================');
//              end;
//
//              Sleep(5000);
//            end
//            else if ASuperObject.S['Step'] = 'login_succ' then
//            begin
//              Self.FLoginFinished := True;
//              AAPI.FLoginState := lsSucc;
//              ACode := SUCC;
//              ADesc := '登录成功';
//
//                        //等待一会
//              Sleep(5000);
//
//              Self.FIsLoaded := False;
//              Self.Chromium1.LoadUrl('https://www.facebook.com/');
//              while (not Self.FIsLoaded) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) do
//              begin
//                uBaseLog.HandleException(nil, '====================【API登录前检测页面是否加载完成】====================' + AAPI.FAccount.S['username']);
//                Sleep(1000);
//              end;
//                        //每次操作完,页面会刷新,所以要重新加载facebookAPI脚本
//              Self.LoadFacebookAPI;
//              Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//              Break;
//
//            end
//            else
//            begin
//              Break;
//            end;
//
//
//                    //等待页面跳转
//            Sleep(5000);
//                    //每次操作完,页面会刷新,所以要重新加载facebookAPI脚本
//            Self.LoadFacebookAPI;
//            Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//          end;
//
//          if (DateUtils.MilliSecondsBetween(Now, AStartTime) >= AAPI.FLoginTimeoutInterval) then
//          begin
//            ADesc := '登录超时';
//            uBaseLog.HandleException(nil, '====================【登录超时】====================');
//          end;
//                {$ENDREGION}
//
//        end
//        else
//        begin
//                //自己的账号，账号密码即可登录
//
//          FLoginFinished := False;
//
//          chromium1.ExecuteJavaScript('doLogin(' + QuotedStr(FAPI.FAccount.S['username']) + ', ' + QuotedStr(FAPI.FAccount.S['password']) + ');', 'about:blank');
//
//                //等待登录结束，或者超时
//          while (Self.FLoginFinished = False) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) and not AAPI.FIsWillLogout do
//          begin
//            uBaseLog.HandleException(nil, '====================【等待登录操作结束中~~~】====================');
//            Sleep(1000);
//          end;
//          uBaseLog.HandleException(nil, '====================【API登录结束】====================');
//          Sleep(4000);
//
//                //点击登录后重新加载facebookAPI脚本
//          Self.LoadFacebookAPI;
//          Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//                //执行登录后状态检测
//          FAfterLoginState := False;
//
//          Self.CheckLoginState(AAPI, 2);
//
//                //等待登录结束后的检测，或者超时
//          while (Self.FAfterLoginState = False) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) and not AAPI.FIsWillLogout do
//          begin
//            Sleep(1000);
//          end;
//
//          uBaseLog.HandleException(nil, '====================【API登录 后 检测结束，账号登录状态：' + IntToStr(Ord(AAPI.FLoginState)) + '】====================');
//
//        end;
//
//      end
//      else //新版本，不存在账号密码，手动登录
//      begin
//
//        ShowMessage('当前账号登录已失效，请到运营中心重新登录。');
//        FIsReLogin := True;
//
//        Sleep(3000);
//
//            //持续等待，判断用户是否重新登录
//        while (Self.FIsReLogin = True) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) and not AAPI.FIsWillLogout do
//        begin
//          uBaseLog.HandleException(nil, '====================【等待用户重新手动登录】====================');
//          Sleep(2000);
//        end;
//
//            //手动登录成功后重置计时
//        AStartTime := Now;
//
//            //登录成功后重新加载js
//        Self.LoadFacebookAPI;
//        Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//            //执行登录后状态检测
//        FAfterLoginState := False;
//
//        Self.CheckLoginState(AAPI, 2);
//
//            //等待登录结束后的检测，或者超时
//        while (Self.FAfterLoginState = False) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) and not AAPI.FIsWillLogout do
//        begin
//          Sleep(1000);
//        end;
//
//        uBaseLog.HandleException(nil, '====================【手动登录 后 检测结束，账号登录状态：' + IntToStr(Ord(AAPI.FLoginState)) + '】====================');
//
//      end;
//
//    end;
//
//    if AAPI.FLoginState <> lsSucc then
//    begin
//      Exit;
//    end;
//
//
//    //登录成功
//    ADataJson := TSuperObject.Create;
//
////    //获取IP所在国家
////    ADataJson.S['login_country']:=GetCurrentIPCountryCode;
//
//    ACode := SUCC;
//
//    uBaseLog.HandleException(nil, '====================【API登录 成功】====================');
//
//    //获取账号信息
//    Self.GetAccountInfo;
//
//    if (DateUtils.MilliSecondsBetween(Now, AStartTime) >= AAPI.FLoginTimeoutInterval) then
//    begin
//      //登录超时
//      uBaseLog.HandleException(nil, '====================【获取账号信息超时】====================');
//
//      if Self.FUserInfoJsonObj <> nil then
//      begin
//        ADataJson.O['UserInfo'] := Self.FUserInfoJsonObj;
//      end;
//
//      Exit;
//    end;
//
//    while (Self.FUserInfoJsonObj = nil) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) and not AAPI.FIsWillLogout do
//    begin
//      Sleep(1000);
//    end;
//
//    if Self.FUserInfoJsonObj <> nil then
//    begin
//      ADataJson.O['UserInfo'] := Self.FUserInfoJsonObj;
//    end;
//
//  finally
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//
////    //执行登录结束事件，告诉任务，登录结束了
////    if Assigned(FOnLogined) then
////    begin
////      FOnLogined(Self);
////    end;
//
//  end;
//
//end;
//
//function TFrameBaseWebBrowser.Logout: ISuperObject;
//begin
//  //
//
//end;
//
////刷新当前页面
//procedure TFrameBaseWebBrowser.RefreshNowPage;
//begin
////  chromium1.ExecuteJavaScript('refreshNowPage();', 'about:blank');
//  chromium1.ExecuteJavaScript('location.reload(true);', 'about:blank');
//end;
//
////获取已登录账号信息
//function TFrameBaseWebBrowser.GetLogin2FACaptcha(AAPI: TWebSearchAPI): ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  AStartTime: TDateTime;
////var
////  AContent:TCEFMessageContent;
////  AMessageData:String;
//  ASuperObject: ISuperObject;
//begin
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  try
//    AStartTime := Now;
//
//
//    //等待FFacebookWebSearchAPIFrame在OperationCenterFrame运营中心页创建完成
//    while (not Self.FIsInited) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) do
//    begin
//      uBaseLog.HandleException(nil, '====================【获取验证码前检测浏览器是否初始完成】====================' + AAPI.FAccount.S['nickname']);
//      Sleep(1000);
//    end;
//
//    Self.FIsLoaded := False;
//    Self.Chromium1.LoadUrl('https://2fa.live/');
//    while (not Self.FIsLoaded) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < AAPI.FLoginTimeoutInterval) do
//    begin
//      uBaseLog.HandleException(nil, '====================【获取验证码前检测页面是否加载完成】====================' + AAPI.FAccount.S['nickname']);
//      Sleep(1000);
//    end;
//
//    //加载facebookAPI脚本
//    Self.LoadFacebookAPI;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//    //等Facebook加载完
//    { TODO : 等Facebook加载完 }
//    //判断当前是否能输账号，能输的话，输入账号
//    chromium1.ExecuteJavaScript('submitLogin2FASecret("submitLogin2FASecret","' + AAPI.FAccount.S['facebook_2fa_secret'] + '");', 'about:blank');
//    ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('submitLogin2FASecret', 10, True);
//    if ASuperObject.I['Code'] <> SUCC then
//    begin
//      uBaseLog.HandleException(nil, '====================【获取验证码JS执行完毕：执行失败】====================');
//      Exit;
//    end
//    else
//    begin
//      uBaseLog.HandleException(nil, '====================【获取验证码JS执行完毕，' + ASuperObject.AsJson + '】====================');
//    end;
//    //等待页面跳转
//    Sleep(5000);
//
//    chromium1.ExecuteJavaScript('getLogin2FACaptcha("getLogin2FACaptcha");', 'about:blank');
//    ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getLogin2FACaptcha', 10, True);
//    if ASuperObject.I['Code'] <> SUCC then
//    begin
//      uBaseLog.HandleException(nil, '====================【获取验证码JS执行完毕：执行失败】====================');
//      Exit;
//    end
//    else
//    begin
//      uBaseLog.HandleException(nil, '====================【获取验证码JS执行完毕：' + ASuperObject.AsJson + '】====================');
//    end;
//
//
//
//    //MGLDROJA47OZ3W3TTIA3RU6DMFH7RK55|852222
//    //把验证码拆出来
////    if Pos('|',AMessageData)>0 then
////    begin
////      AMessageData:=Copy(AMessageData,Pos('|',AMessageData)+1,MaxInt);
//    ADataJson := TSuperObject.Create;
//    ADataJson.S['Captcha'] := ASuperObject.S['Captcha'];
////
////    end;
//
//    //返回上一页
//    Self.Chromium1.GoBack;
//    Sleep(5000);
//    //重新加载facebookAPI脚本
//    Self.LoadFacebookAPI;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//  finally
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//
//  end;
//
//end;
//
////获取用户信息
//function TFrameBaseWebBrowser.GetAccountInfo: ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  AStartTime: TDateTime;
//  ALinkSuperObject: ISuperObject;
//  AInfoSuperObject: ISuperObject;
//  AFriendsPageLinkSuperObject: ISuperObject;
//  AFriendsSuperObject: ISuperObject;
//  AGroupsSuperObject: ISuperObject;
//  APagesSuperObject: ISuperObject;
//  APageIndex: Integer;
//  AHasNextPage: Boolean;
//  I: Integer;
//
//  //配置文件
////  AmyIniFile: TIniFile;
////  ALastLoginTime: string;
//
//  //配置文件读取的账号上一次登陆事时间
//  AmyIniFile: TIniFile;
//  ALastLoginTimeObjStr: string;
//  ALastLoginTimeObj: ISuperObject;
//  ALastLoginTime: string;
//  ANeedGetGroupList: Boolean;
//begin
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  try
//
//        {$REGION '0、判断当前登录角色，如果是公共主页则切换回用户'}
//    chromium1.ExecuteJavaScript('getUserIdentity("getUserIdentityFinished");', 'about:blank');
//    ALinkSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getUserIdentityFinished', 10, True);
//    if ALinkSuperObject.I['Code'] <> SUCC then
//    begin
//      uBaseLog.HandleException(nil, '====================【获取当前登录角色成功：公共主页，开始切换回用户】====================');
//
//      chromium1.ExecuteJavaScript('returnUser();', 'about:blank');
//          //判断页面加载状态(暂缓，用延时代替)
//      Sleep(10 * 1000);
//
//          //加载facebookAPI脚本
//      Self.LoadFacebookAPI;
//      Sleep(FSleepConfig.I['loadApi'] * 1000);
//    end
//    else
//    begin
//      uBaseLog.HandleException(nil, '====================【获取当前登录角色成功：用户】====================');
//    end;
//        {$ENDREGION}
//
//        {$REGION '1、获取用户详情页链接（最终版）'}
//    chromium1.ExecuteJavaScript('getUserInfoPageLink("getUserInfoPageLinkFinished");', 'about:blank');
//    ALinkSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getUserInfoPageLinkFinished', 10, True);
//    if ALinkSuperObject.I['Code'] <> SUCC then
//    begin
//      ADesc := '获取用户详情页链接 失败' + ALinkSuperObject.S['Desc'];
//      uBaseLog.HandleException(nil, '====================【获取用户详情页链接 失败】：' + ALinkSuperObject.AsJson + '====================');
//      Exit;
//    end
//    else
//    begin
//      uBaseLog.HandleException(nil, '====================【获取用户详情页链接 成功】：' + ALinkSuperObject.AsJson + '====================');
//    end;
//        {$ENDREGION}
//
//        {$REGION '2、跳转到用户详情页（最终版）'}
//    AStartTime := Now;
//    Self.FIsLoaded := False;
//    Self.Chromium1.LoadUrl(ALinkSuperObject.S['userInfoLink']);
//    while (not Self.FIsLoaded) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not FAPI.FIsWillLogout do
//    begin
//      uBaseLog.HandleException(nil, '====================【检测用戶详情页面是否加载完成】====================');
//      Sleep(1000);
//    end;
//    if FAPI.FIsWillLogout then
//      Exit;
//
//        //加载超时就判断为失败
//    if (DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage']) then
//    begin
//      ADesc := '用户详情页加载 超时';
//      uBaseLog.HandleException(nil, '====================【用户详情页加载超时】：' + IntToStr(DateUtils.SecondsBetween(Now, AStartTime)) + '====================');
//      Exit;
//    end;
//
//    Self.LoadFacebookAPI;
//    if FAPI.FIsWillLogout then
//      Exit;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//        {$ENDREGION}
//
//        {$REGION '3、获取用户详情（最终版）'}
//    chromium1.ExecuteJavaScript('getUserInfo("getUserInfoFinished");', 'about:blank');
//    AInfoSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getUserInfoFinished', 10, True);
//    if AInfoSuperObject.I['Code'] <> SUCC then
//    begin
//      ADesc := '获取用户信息 失败' + AInfoSuperObject.S['Desc'];
//      uBaseLog.HandleException(nil, '====================【获取用户信息 失败】：' + AInfoSuperObject.AsJson + '====================');
//      Exit;
//    end
//    else
//    begin
//      uBaseLog.HandleException(nil, '====================【获取用户信息 成功】：' + AInfoSuperObject.AsJson + '====================');
//      FUserInfoJsonObj := TSuperObject.Create(AInfoSuperObject.AsJSON);
//      Sleep(2000);
//    end;
//        {$ENDREGION}
//
//        //判断一下好友个数，如果相比之前增加了,或者是第一次，就开始获取
//    if (FAPI.FAccount.I['is_first_get_friend_list'] = 0) or (FUserInfoJsonObj.V['friendsCount'] > FAPI.FAccount.V['friend_count']) then
//    begin
//
//            {$REGION '加载完全部好友后获取列表（已弃用）'}
//            {chromium1.ExecuteJavaScript('getAllFriends("getAllFriendsFinished");', 'about:blank');
//            AFriendsSuperObject:=Self.FGetedMessageList.CheckMessageIsReceivedJson('getAllFriendsFinished', 60, True);
//            if AFriendsSuperObject.I['Code']<>SUCC then
//            begin
//              ADesc:='获取好友列表 失败';
//              uBaseLog.HandleException(nil,'====================【获取好友列表 失败】：' + AFriendsSuperObject.AsJson + '====================');
//              //Exit;
//            end
//            else
//            begin
//              uBaseLog.HandleException(nil,'====================【获取好友列表 成功】：' + AFriendsSuperObject.AsJson + '====================');
//
//              FUserInfoJsonObj.A['fbFriendsArray']:= AFriendsSuperObject.A['fbFriendsArray'];
//            end;}
//            {$ENDREGION}
//
//            {$REGION '4、获取用户好友列表界面链接（最终版）'}
//      chromium1.ExecuteJavaScript('getFriendsPageLink("getFriendsPageLinkFinished");', 'about:blank');
//      AFriendsPageLinkSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getFriendsPageLinkFinished', 10, True);
//      if AFriendsPageLinkSuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '获取用户好友列表界面链接 失败' + AFriendsPageLinkSuperObject.S['Desc'];
//        uBaseLog.HandleException(nil, '====================【获取用户好友列表界面链接 失败】：' + AFriendsPageLinkSuperObject.AsJson + '====================');
//        Exit;
//      end
//      else
//      begin
//        uBaseLog.HandleException(nil, '====================【获取用户好友列表界面链接 成功】：' + AFriendsPageLinkSuperObject.AsJson + '====================');
//        Sleep(1000);
//      end;
//            {$ENDREGION}
//
//            {$REGION '5、跳转到好友列表（最终版）'}
//      AStartTime := Now;
//      Self.FIsLoaded := False;
//      Self.Chromium1.LoadUrl(AFriendsPageLinkSuperObject.S['friendsPageLink']);
//      while (not Self.FIsLoaded) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not FAPI.FIsWillLogout do
//      begin
//        uBaseLog.HandleException(nil, '====================【检测跳转到好友页面是否完成】====================');
//        Sleep(1000);
//      end;
//      if FAPI.FIsWillLogout then
//        Exit;
//
//            //加载超时就判断为失败
//      if (DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage']) then
//      begin
//        ADesc := '跳转到好友页面 超时';
//        uBaseLog.HandleException(nil, '====================【跳转到好友页面 超时】：' + IntToStr(DateUtils.SecondsBetween(Now, AStartTime)) + '====================');
//        Exit;
//      end;
//
//      Self.LoadFacebookAPI;
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(FSleepConfig.I['loadApi'] * 1000);
//            {$ENDREGION}
//
//            {$REGION '6、分页获取好友列表'}
//      AStartTime := Now;
//      APageIndex := 1;
//      AHasNextPage := True;
//      while AHasNextPage and not FAPI.FIsWillLogout and (DateUtils.SecondsBetween(Now, AStartTime) < 120) do
//      begin
//
//        if FAPI.FAccount.I['is_first_get_friend_list'] = 0 then
//        begin
//          chromium1.ExecuteJavaScript('getPageFriends(' + IntToStr(APageIndex) + ', "getPageFriendsFinished", false);', 'about:blank');
//        end
//        else if FUserInfoJsonObj.V['friendsCount'] > FAPI.FAccount.V['friend_count'] then
//        begin
//          chromium1.ExecuteJavaScript('getPageFriends(' + IntToStr(APageIndex) + ', "getPageFriendsFinished", true);', 'about:blank');
//        end;
//        AFriendsSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getPageFriendsFinished', 10, True);
//        if AFriendsSuperObject.I['Code'] <> SUCC then
//        begin
//          uBaseLog.HandleException(nil, '====================【获取好友列表 失败】：' + AFriendsSuperObject.AsJson + '】====================');
//          AHasNextPage := False;
//                  // Exit;
//        end
//        else
//        begin
//
//          uBaseLog.HandleException(nil, '====================【获取好友列表 成功】：' + AFriendsSuperObject.AsJson + '】====================');
//
//          if AFriendsSuperObject.I['hasNextPage'] = 1 then
//          begin
//            uBaseLog.HandleException(nil, '====================【有 下一页】====================');
//            AHasNextPage := True;
//          end
//          else
//          begin
//            uBaseLog.HandleException(nil, '====================【无 下一页】====================');
//            AHasNextPage := False;
//          end;
//
//                    //取出好友列表赋值
//          for I := 0 to AFriendsSuperObject.A['fbFriendsArray'].Length - 1 do
//          begin
//            FUserInfoJsonObj.A['fbFriendsArray'].O[FUserInfoJsonObj.A['fbFriendsArray'].Length] := AFriendsSuperObject.A['fbFriendsArray'].O[I];
//          end;
//
//          APageIndex := APageIndex + 1;
//
//        end;
//        if FAPI.FIsWillLogout then
//          Exit;
//
//      end;
//            {$ENDREGION}
//
//    end;
//
//
//        {$REGION '加载完全部小组后获取列表（已弃用）'}
//        {chromium1.ExecuteJavaScript('getGroupsCount("getGroupsCountFinished");', 'about:blank');
//        AGroupsSuperObject:=Self.FGetedMessageList.CheckMessageIsReceivedJson('getGroupsCountFinished', 120, True);
//        if AGroupsSuperObject.I['Code']<>SUCC then
//        begin
//          ADesc:='获取获取小组个数 失败';
//          uBaseLog.HandleException(nil,'====================【获取获取小组个数 失败】：' + AGroupsSuperObject.AsJson + '====================');
//          //Exit;
//        end
//        else
//        begin
//          uBaseLog.HandleException(nil,'====================【获取获取小组个数 成功】：' + AGroupsSuperObject.AsJson + '====================');
//
//          FUserInfoJsonObj.I['groupsCount']:= AGroupsSuperObject.I['groupsCount'];
//
//          uBaseLog.HandleException(nil,'====================【获取全部用户信息 成功】：' + FUserInfoJsonObj.AsJson + '====================');
//        end;}
//        {$ENDREGION}
//
//        {$REGION '7、先查询一遍配置文件，看看今天有没有获取过 公共主页/小组列表（最终版）'}
//    try
//      try
//        uBaseLog.HandleException(nil, '====================先查询一遍配置文件，看看今天有没有获取过 公共主页/小组列表 开始====================');
//        ANeedGetGroupList := False;
//
//        AmyIniFile := TIniFile.Create(GetApplicationPath + 'Config.ini');
//        ALastLoginTimeObjStr := AmyIniFile.ReadString('', 'LastLoginTime', '');
//        ALastLoginTimeObj := TSuperObject.Create(ALastLoginTimeObjStr);
//
//            // 取出当前账号历史登陆时间，不是当天就重新获取
//        ALastLoginTime := ALastLoginTimeObj.S[FAPI.FAccount.S['nickname']];
//        if ALastLoginTime <> FormatDateTime('YYYY-MM-DD', Now) then
//        begin
//
//          Self.CustomSaveToINI(AmyIniFile, ALastLoginTimeObj);
//          ANeedGetGroupList := True;
//
//        end;
//        uBaseLog.HandleException(nil, '====================先查询一遍配置文件，看看今天有没有获取过 公共主页/小组列表 结束====================');
//      except
//        on E: Exception do
//        begin
//          uBaseLog.HandleException(E, '====================先查询一遍配置文件，看看今天有没有获取过 公共主页/小组列表====================');
//        end;
//      end;
//
//    finally
//      AmyIniFile.Free;
//    end;
//        {$ENDREGION}
//
//        //7.1、判断当次是否需要获取 公共主页 和 小组列表
//    if ANeedGetGroupList = True then
//    begin
//      uBaseLog.HandleException(nil, '====================【准备跳转到公共主页】====================');
//            //Taskmanager里用来判断是否需要更新数据库
//      FUserInfoJsonObj.B['NeedUpdateGroup'] := True;
//      Sleep(1500);
//
//            {$REGION '7.2、跳转到公共主页'}
//      AStartTime := Now;
//      Self.FIsLoaded := False;
//      Self.Chromium1.LoadUrl('https://www.facebook.com/pages/?category=your_pages&ref=bookmarks');
//      while (not Self.FIsLoaded) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not FAPI.FIsWillLogout do
//      begin
//        uBaseLog.HandleException(nil, '====================【检测跳转到公共主页是否完成】====================');
//        Sleep(1000);
//      end;
//      if FAPI.FIsWillLogout then
//        Exit;
//
//            //加载超时就判断为失败
//      if (DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage']) then
//      begin
//        ADesc := '跳转到公共主页 超时';
//        uBaseLog.HandleException(nil, '====================【跳转到公共主页 超时】：' + IntToStr(DateUtils.SecondsBetween(Now, AStartTime)) + '====================');
//        Exit;
//      end;
//
//      Self.LoadFacebookAPI;
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(FSleepConfig.I['loadApi'] * 1000);
//            {$ENDREGION}
//
//            {$REGION '7.3、获取我的公共主页'}
//      chromium1.ExecuteJavaScript('getAllPublicPages("getAllPublicPagesFinished");', 'about:blank');
//      APagesSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getAllPublicPagesFinished', 10, True);
//      if APagesSuperObject.I['Code'] <> SUCC then
//      begin
//        uBaseLog.HandleException(nil, '====================【获取我的公共主页列表 失败】：' + APagesSuperObject.AsJson + '】====================');
//      end
//      else
//      begin
//
//        uBaseLog.HandleException(nil, '====================【获取我的公共主页列表 成功】：' + APagesSuperObject.AsJson + '】====================');
//
//                //取出公共主页列表赋值
//        for I := 0 to APagesSuperObject.A['fbPublicPagesArray'].Length - 1 do
//        begin
//          FUserInfoJsonObj.A['fbPublicPagesArray'].O[FUserInfoJsonObj.A['fbPublicPagesArray'].Length] := APagesSuperObject.A['fbPublicPagesArray'].O[I];
//        end;
//
//        Sleep(1000);
//
//      end;
//      if FAPI.FIsWillLogout then
//        Exit;
//            {$ENDREGION}
//
//            {$REGION '7.4、跳转到小组页面'}
//      AStartTime := Now;
//      Self.FIsLoaded := False;
//      Self.Chromium1.LoadUrl('https://www.facebook.com/groups/feed/');
//      while (not Self.FIsLoaded) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not FAPI.FIsWillLogout do
//      begin
//        uBaseLog.HandleException(nil, '====================【检测跳转到小组页面是否完成】====================');
//        Sleep(1000);
//      end;
//      if FAPI.FIsWillLogout then
//        Exit;
//
//            //加载超时就判断为失败
//      if (DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage']) then
//      begin
//        ADesc := '跳转到小组页面 超时';
//        uBaseLog.HandleException(nil, '====================【跳转到小组页面 超时】：' + IntToStr(DateUtils.SecondsBetween(Now, AStartTime)) + '====================');
//        Exit;
//      end;
//
//      Self.LoadFacebookAPI;
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(FSleepConfig.I['loadApi'] * 1000);
//            {$ENDREGION}
//
//            {$REGION '7.5、分页获取小组列表'}
//      AStartTime := Now;
//      APageIndex := 1;
//      AHasNextPage := True;
//      while AHasNextPage and not FAPI.FIsWillLogout and (DateUtils.SecondsBetween(Now, AStartTime) < 120) do
//      begin
//
//        chromium1.ExecuteJavaScript('getPageGroups(' + IntToStr(APageIndex) + ', "getPageFriendsFinished");', 'about:blank');
//        AGroupsSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getPageFriendsFinished', 10, True);
//        if AGroupsSuperObject.I['Code'] <> SUCC then
//        begin
//          uBaseLog.HandleException(nil, '====================【获取我的小组列表 失败】：' + AGroupsSuperObject.AsJson + '】====================');
//          AHasNextPage := False;
//                  // Exit;
//        end
//        else
//        begin
//
//          uBaseLog.HandleException(nil, '====================【获取我的小组列表 成功】：' + AGroupsSuperObject.AsJson + '】====================');
//
//          if AGroupsSuperObject.I['hasNextPage'] = 1 then
//          begin
//            uBaseLog.HandleException(nil, '====================【有 下一页】====================');
//            AHasNextPage := True;
//          end
//          else
//          begin
//            uBaseLog.HandleException(nil, '====================【无 下一页】====================');
//            AHasNextPage := False;
//          end;
//
//                    //取出小组列表赋值
//          for I := 0 to AGroupsSuperObject.A['fbGroupsArray'].Length - 1 do
//          begin
//            FUserInfoJsonObj.A['fbGroupsArray'].O[FUserInfoJsonObj.A['fbGroupsArray'].Length] := AGroupsSuperObject.A['fbGroupsArray'].O[I];
//          end;
//
//          APageIndex := APageIndex + 1;
//
//          Sleep(1000);
//
//        end;
//        if FAPI.FIsWillLogout then
//          Exit;
//
//      end;
//            {$ENDREGION}
//
//      FUserInfoJsonObj.I['groupsCount'] := FUserInfoJsonObj.A['fbGroupsArray'].Length;
//
//    end
//    else
//    begin
//          //返回首页
//      chromium1.ExecuteJavaScript('document.querySelector(''[href="/"]'').click();', 'about:blank');
//    end;
//
//    ACode := SUCC;
//    ADesc := '获取用户信息成功';
//    ADataJson := FUserInfoJsonObj;
//
//  finally
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//  end;
//
//end;
//
//function TFrameBaseWebBrowser.CustomSaveToINI(AIniFile: TIniFile; AIniObj: ISuperObject): Boolean;
//begin
//
//  try
//    AIniObj.S[FAPI.FAccount.S['nickname']] := FormatDateTime('YYYY-MM-DD', Now);
//    //一定要去掉換行符號，不然讀取的時候會報錯
//    AIniFile.WriteString('', 'LastLoginTime', ReplaceStr(AIniObj.AsJSON,#13#10,''));
//  finally
//
//  end;
//
//  Result := True;
//end;
//
//发送鼠标左键点击事件
procedure TFrameBaseWebBrowser.SetMouseClick(Sender: TObject; SiteX: Integer; SiteY: Integer; CalcX: Integer; CalcY: Integer);
var
  TempEvent: TCefMouseEvent;
begin
  if Self.CEFWindowParent1.CanFocus then
  begin
    Self.CEFWindowParent1.SetFocus;
  end;

  if (GlobalCEFApp <> nil) then
  begin                    //乘缩放比率，截取 整数部分，加上偏移计算值
    TempEvent.x := integer(Trunc(SiteX * FScreenScaleRate)) + CalcX;
    TempEvent.y := integer(Trunc(SiteY * FScreenScaleRate)) + CalcY;
    TempEvent.modifiers := GetCefMouseModifiers;
    DeviceToLogical(TempEvent, GlobalCEFApp.DeviceScaleFactor);
    Chromium1.SendMouseClickEvent(@TempEvent, MBT_LEFT, False, 1);
    Chromium1.SendMouseClickEvent(@TempEvent, MBT_LEFT, True, 1);

    uBaseLog.HandleException(nil, '====================【 缩放比率：' + FloatToStr(FScreenScaleRate) + '， 鼠标点击位置：X[' + IntToStr(TempEvent.x) + ']，Y[' + IntToStr(TempEvent.y) + '] 】====================');
  end;
end;

procedure TFrameBaseWebBrowser.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  if Self.CEFWindowParent1.CanFocus then
  begin

    Self.CEFWindowParent1.SetFocus;

    //发送鼠标点击
    SetMouseClick(nil, StrToInt(edtX.Text), StrToInt(edtY.Text), 10, 10);
//    //设置文本
//    SetArticleText(nil, 'Its very nice');

  end;

end;

////发送搜索文本
//procedure TFrameBaseWebBrowser.SetSearchText(Sender: TObject; AText: string);
//var
//  i: integer;
//  TempKeyEvent: TCefKeyEvent;
//begin
//
//      //复制
//  Clipboard.SetTextBuf(PChar(AText));
//
//
//      //全选
//  FillChar(TempKeyEvent, SizeOf(TCefKeyEvent), 0);
//      // WM_KEYDOWN
//  TempKeyEvent.kind := KEYEVENT_RAWKEYDOWN;
//  TempKeyEvent.modifiers := 4;
//  TempKeyEvent.windows_key_code := 65;
//  TempKeyEvent.native_key_code := 3080193;
//  TempKeyEvent.is_system_key := ord(False);
//  TempKeyEvent.character := #0; //AText[i];//#0;
//  TempKeyEvent.unmodified_character := #0;
//  TempKeyEvent.focus_on_editable_field := ord(False);
//  Chromium1.SendKeyEvent(@TempKeyEvent);
//      // WM_KEYDOWN
//  TempKeyEvent.kind := KEYEVENT_KEYUP;
//  TempKeyEvent.modifiers := 4;
//  TempKeyEvent.windows_key_code := 65;
//  TempKeyEvent.native_key_code := -1070661631;
//  TempKeyEvent.is_system_key := ord(False);
//  TempKeyEvent.character := #0; //AText[i];//#0;
//  TempKeyEvent.unmodified_character := #0;
//  TempKeyEvent.focus_on_editable_field := ord(False);
//  Chromium1.SendKeyEvent(@TempKeyEvent);
//
//  Sleep(1500);
//
//  FillChar(TempKeyEvent, SizeOf(TCefKeyEvent), 0);
//      // WM_KEYDOWN
//  TempKeyEvent.kind := KEYEVENT_RAWKEYDOWN;
//  TempKeyEvent.modifiers := 4;
//  TempKeyEvent.windows_key_code := 86; //V
//  TempKeyEvent.native_key_code := 3080193;
//  TempKeyEvent.is_system_key := ord(False);
//  TempKeyEvent.character := #0; //AText[i];//#0;
//  TempKeyEvent.unmodified_character := #0;
//  TempKeyEvent.focus_on_editable_field := ord(False);
//  Chromium1.SendKeyEvent(@TempKeyEvent);
//      // WM_KEYDOWN
//  TempKeyEvent.kind := KEYEVENT_KEYUP;
//  TempKeyEvent.modifiers := 4;
//  TempKeyEvent.windows_key_code := 86; //V
//  TempKeyEvent.native_key_code := -1070661631;
//  TempKeyEvent.is_system_key := ord(False);
//  TempKeyEvent.character := #0; //AText[i];//#0;
//  TempKeyEvent.unmodified_character := #0;
//  TempKeyEvent.focus_on_editable_field := ord(False);
//  Chromium1.SendKeyEvent(@TempKeyEvent);
//  Exit;
//
//end;

procedure TFrameBaseWebBrowser.ShowBrowser;
begin

end;

procedure TFrameBaseWebBrowser.ShowStatusText(const aText: string);
begin
  StatusBar1.Panels[1].Text := aText;
end;

////发送键盘输入文本事件
//procedure TFrameBaseWebBrowser.SetArticleText(Sender: TObject; AText: string);
//var
//  i: integer;
//  TempKeyEvent: TCefKeyEvent;
//begin
////    if (Pos('(', AText) > 0) or (Pos(')', AText) > 0) then
////    begin
////        AText := StringReplace(AText, '(', '（', [rfReplaceAll]);
////        AText := StringReplace(AText, ')', '）', [rfReplaceAll]);
////    end;
////
////    for i := 1 to length(AText) do
////    begin
////      // WM_KEYDOWN
////      TempKeyEvent.kind                    := KEYEVENT_RAWKEYDOWN;
////      TempKeyEvent.modifiers               := 0;
////      TempKeyEvent.windows_key_code        := ord(AText[i]);
////      TempKeyEvent.native_key_code         := 0;
////      TempKeyEvent.is_system_key           := ord(False);
////      TempKeyEvent.character               := #0;
////      TempKeyEvent.unmodified_character    := #0;
////      TempKeyEvent.focus_on_editable_field := ord(False);
////      Chromium1.SendKeyEvent(@TempKeyEvent);
////
////      // WM_CHAR
////      TempKeyEvent.kind := KEYEVENT_CHAR;
////      Chromium1.SendKeyEvent(@TempKeyEvent);
////
////      // WM_KEYUP
////      TempKeyEvent.kind := KEYEVENT_KEYUP;
////      Chromium1.SendKeyEvent(@TempKeyEvent);
////    end;
//
//      //复制
//  Clipboard.SetTextBuf(PChar(AText));
//
//
//      {//全选
//      FillChar(TempKeyEvent,SizeOf(TCefKeyEvent),0);
//      // WM_KEYDOWN
//      TempKeyEvent.kind                    := KEYEVENT_RAWKEYDOWN;
//      TempKeyEvent.modifiers               := 4;
//      TempKeyEvent.windows_key_code        := 65;
//      TempKeyEvent.native_key_code         := 3080193;
//      TempKeyEvent.is_system_key           := ord(False);
//      TempKeyEvent.character               := #0;//AText[i];//#0;
//      TempKeyEvent.unmodified_character    := #0;
//      TempKeyEvent.focus_on_editable_field := ord(False);
//      Chromium1.SendKeyEvent(@TempKeyEvent);
//      // WM_KEYDOWN
//      TempKeyEvent.kind                    := KEYEVENT_KEYUP;
//      TempKeyEvent.modifiers               := 4;
//      TempKeyEvent.windows_key_code        := 65;
//      TempKeyEvent.native_key_code         := -1070661631;
//      TempKeyEvent.is_system_key           := ord(False);
//      TempKeyEvent.character               := #0;//AText[i];//#0;
//      TempKeyEvent.unmodified_character    := #0;
//      TempKeyEvent.focus_on_editable_field := ord(False);
//      Chromium1.SendKeyEvent(@TempKeyEvent);
//
//      Sleep(1000);}
//
//      //Debug Output: 2021-11-17 15:36:07:536  Method:TFrameBaseWebSearchAPI.Chromium1PreKeyEvent  kind:0 modifiers:1028 windows_key_code:17 native_key_code:1900545 is_system_key:0 character: Process TestTwitterWebSearchAPIFrame.exe (26580)
//      //Debug Output: 2021-11-17 15:36:07:557  Method:TFrameBaseWebSearchAPI.Chromium1PreKeyEvent  kind:0 modifiers:4 windows_key_code:86 native_key_code:3080193 is_system_key:0 character: unmodified_character: Process TestTwitterWebSearchAPIFrame.exe (26580)
//      //Debug Output: 2021-11-17 15:36:07:587  Method:TFrameBaseWebSearchAPI.Chromium1PreKeyEvent  kind:3 modifiers:4 windows_key_code:22 native_key_code:47 is_system_key:0 character: unmodified_character: Process TestTwitterWebSearchAPIFrame.exe (26580)
//      //Debug Output: 2021-11-17 15:36:07:615  Method:TFrameBaseWebSearchAPI.Chromium1PreKeyEvent  kind:2 modifiers:4 windows_key_code:86 native_key_code:-1070661631 is_system_key:0 character: unmodified_character: Process TestTwitterWebSearchAPIFrame.exe (26580)
//      //Debug Output: 2021-11-17 15:36:07:652  Method:TFrameBaseWebSearchAPI.Chromium1PreKeyEvent  kind:2 modifiers:1024 windows_key_code:17 native_key_code:-1071841279 is_system_key:0 character: Process TestTwitterWebSearchAPIFrame.exe (26580)
//      //粘贴
//  FillChar(TempKeyEvent, SizeOf(TCefKeyEvent), 0);
//      // WM_KEYDOWN
//  TempKeyEvent.kind := KEYEVENT_RAWKEYDOWN;
//  TempKeyEvent.modifiers := 4;
//  TempKeyEvent.windows_key_code := 86; //V
//  TempKeyEvent.native_key_code := 3080193;
//  TempKeyEvent.is_system_key := ord(False);
//  TempKeyEvent.character := #0; //AText[i];//#0;
//  TempKeyEvent.unmodified_character := #0;
//  TempKeyEvent.focus_on_editable_field := ord(False);
//  Chromium1.SendKeyEvent(@TempKeyEvent);
//      // WM_KEYDOWN
//  TempKeyEvent.kind := KEYEVENT_KEYUP;
//  TempKeyEvent.modifiers := 4;
//  TempKeyEvent.windows_key_code := 86; //V
//  TempKeyEvent.native_key_code := -1070661631;
//  TempKeyEvent.is_system_key := ord(False);
//  TempKeyEvent.character := #0; //AText[i];//#0;
//  TempKeyEvent.unmodified_character := #0;
//  TempKeyEvent.focus_on_editable_field := ord(False);
//  Chromium1.SendKeyEvent(@TempKeyEvent);
//
//  uBaseLog.HandleException(nil, '====================【 输入文本内容：[ ' + AText + ' ] 】====================');
//
//  Exit;
//
//end;

procedure TFrameBaseWebBrowser.SetHTMLContent(AHTML: string);
begin
//  FSetedValue:=AHTML;
//  if not FIsInited then
//  begin
//    //未初始好
//  end
//  else
//  begin
//    //已初始好
////    WebBrowser1.OleObject.document.parentWindow.setHTMLContentStr(AHTML);
//  end;
  if not CheckInited then
  begin
    Exit;
  end;

  Self.Chromium1.ExecuteJavaScript('setHTMLContentStr(' + QuotedStr(AHTML) + ')', Chromium1.Browser.MainFrame.GetURL, 0);
end;

procedure TFrameBaseWebBrowser.SetIsReadOnly(AValue: Boolean);
begin
//  FIsReadOnly:=AValue;
//  if not FIsInited then
//  begin
//    //未初始好
//  end
//  else
//  begin
//    //已初始好
//    if FIsReadOnly then
//    begin
//      WebBrowser1.OleObject.document.parentWindow.setDisabled();
//    end
//    else
//    begin
//      WebBrowser1.OleObject.document.parentWindow.setEnabled();
//    end;
//  end;

end;

procedure TFrameBaseWebBrowser.tmrInitTimer(Sender: TObject);
begin
  tmrInit.Enabled := False;

  CustomInitContext;

  if not (Chromium1.CreateBrowser(CEFWindowParent1, '', FContext)) and not (Chromium1.Initialized) then
  begin
    tmrInit.Enabled := True;
    Exit;
  end;

//  tmrInited.Enabled:=False;
//  SetHTMLContent(FSetedValue);
//  SetIsReadOnly(FIsReadOnly);
end;

procedure TFrameBaseWebBrowser.tmrProcessCustomMessageTimer(Sender: TObject);
begin
  //
end;

//发帖
function TFrameBaseWebBrowser.GetUIStausJson: ISuperObject;
begin


  //获取界面的状态,比如当前在什么页面,是否在主页搜索页面,是否在群组搜索页面,当前用于控制悬浮按钮是否显示
  Result := TSuperObject.Create;

  //c)	主页搜索
  //i.	https://www.facebook.com/search/pages/?q=delphi
  //d)	群组搜索
  //i.	https://www.facebook.com/search/groups?q=delphi

  if (Self.Chromium1.Browser <> nil) and (Self.Chromium1.Browser.MainFrame <> nil) then
  begin
    if Pos('www.facebook.com/search/pages', Self.Chromium1.Browser.MainFrame.Url) > 0 then
    begin
      Result.B['at_search_user_page'] := True;
    end
    else if Pos('www.facebook.com/search/groups', Self.Chromium1.Browser.MainFrame.Url) > 0 then
    begin
      Result.B['at_search_group_page'] := True;
    end;
  end;

end;

procedure TFrameBaseWebBrowser.HideBrowser;
begin

end;

////发布
//procedure TFrameBaseWebBrowser.UploadContent(AContent, AParams: ISuperObject);
//var
//  I: Integer;
//  ADesc: string;
//  ASuperObject: ISuperObject;
//  ApublicPageCount: Integer;
//  AStartTime: TDateTime;
//  AGroupCount: Integer;
//  AGroupUrls: ISuperArray;
//  AMediaWaitingTime: Integer;
//
//  //判断当前公共主页是否需要切换身份
//  ANeedSwitchUser: Boolean;
//begin
//
//  //加载facebookAPI脚本
//  Self.LoadFacebookAPI;
//  Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//  //加载首页
//  chromium1.ExecuteJavaScript('loadHome();', 'about:blank');
//  if FAPI.FIsWillLogout then
//    Exit;
//  Sleep(FSleepConfig.I['loadHome'] * 1000);
//
//  //计算媒体加载等待时间
//  AMediaWaitingTime := 0;
//  if FContentFiles.Count = 1 then
//  begin
//    AMediaWaitingTime := 10;
//  end
//  else if FContentFiles.Count > 1 then
//  begin
//    AMediaWaitingTime := FContentFiles.Count * 5 + 5;
//  end;
//
//  //如果是交易帖（交易帖暂时不用）
//  if AParams.I['is_trade_tontent'] = 1 then
//  begin
//      {$REGION '交易帖'}
//
//      //进入交易帖界面
//    Self.FIsLoaded := False;
//    TThread.Synchronize(nil,
//      procedure
//      begin
//        uBaseLog.HandleException(nil, '====================【跳转到发布交易帖界面】====================');
//        chromium1.LoadURL('www.facebook.com/marketplace');
//      end);
//
//      //等待加载结束
//    AStartTime := Now;
//    while not FIsLoaded and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) do
//    begin
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(1000);
//    end;
//
//    if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//    begin
//          //页面加载超时
//      uBaseLog.HandleException(nil, '====================【跳转到发布交易帖界面 加载超时】====================');
//      ADesc := '页面加载超时';
//      Exit;
//    end;
//
//      //加载JS脚本
//    Self.LoadFacebookAPI;
//    if FAPI.FIsWillLogout then
//      Exit;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//
//      //先判断当前账号是否能够发布交易帖
//    chromium1.ExecuteJavaScript('ifCanPublishTrade("ifCanPublishTradeFinished");', 'about:blank');
//    ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifCanPublishTradeFinished', 10, True);
//    if ASuperObject.I['Code'] <> SUCC then
//    begin
//      uBaseLog.HandleException(nil, '====================【当前账号 不能 发布交易帖：' + ASuperObject.AsJson() + '】====================');
//
////          TThread.Synchronize(nil,procedure
////          begin
////            ShowMessage('当前账号无法发布交易帖');
////          end);
//
//      Exit;
//    end
//    else
//    begin
//
//      uBaseLog.HandleException(nil, '====================【当前账号 可以 发布交易帖：' + ASuperObject.AsJson() + '】====================');
//
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(1000);
//
//          //进入发布界面
//      chromium1.ExecuteJavaScript('openPublishPage();', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(10000);
//      uBaseLog.HandleException(nil, '====================【进入发布界面 结束】====================');
//
//
//
//          //设置商品图片
//      if FContentFiles.Count > 0 then
//      begin
//        chromium1.ExecuteJavaScript('getGoodsPos("getGoodsPosFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getGoodsPosFinished', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '获取商品图片选择框位置失败!';
//          uBaseLog.HandleException(nil, '====================【获取商品图片选择框位置 失败】====================');
//          Exit;
//        end
//        else
//        begin
//                  //点击商品图片选择
//          SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 20, 20);
//          Sleep(FSleepConfig.I['setClick'] * 1000);
//        end;
//
//      end;
//
//          //设置标题
//      chromium1.ExecuteJavaScript('getEditPos("标题","getTitleEditPosFinished");', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getTitleEditPosFinished', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '获取标题输入框位置失败!';
//        uBaseLog.HandleException(nil, '====================【获取标题输入框位置 失败】====================');
//        Exit;
//      end
//      else
//      begin
//              //点击标题框
//        SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//        Sleep(FSleepConfig.I['setClick'] * 1000);
//
//              //设置标题文本
//        SetArticleText(nil, AContent.S['content']);
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['setContent'] * 1000);
//      end;
//
//          //设置价格
//      chromium1.ExecuteJavaScript('getEditPos("价格","getPriceEditPosFinished");', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getPriceEditPosFinished', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '获取价格输入框位置失败!';
//        uBaseLog.HandleException(nil, '====================【获取价格输入框位置 失败】====================');
//        Exit;
//      end
//      else
//      begin
//              //点击价格框
//        SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//        Sleep(FSleepConfig.I['setClick'] * 1000);
//
//              //设置价格文本
//        SetArticleText(nil, AContent.S['price']);
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['setContent'] * 1000);
//      end;
//
//          //选择类别
//      chromium1.ExecuteJavaScript('setListbox("类别","' + AContent.S['type'] + '");', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(2000);
//
//          //选择商品状况
//      chromium1.ExecuteJavaScript('setListbox("状况","' + AContent.S['status'] + '");', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(2000);
//
//          //设置商品说明（非必填）
//      if AContent.S['description'] <> '' then
//      begin
//        chromium1.ExecuteJavaScript('getDescriptionPos("getDescriptionPosFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getDescriptionPosFinished', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '获取商品说明输入框位置失败!';
//          uBaseLog.HandleException(nil, '====================【获取标题输入框位置 失败】====================');
//  //                Exit;
//        end
//        else
//        begin
//                  //点击商品说明框
//          SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//          Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                  //设置商品说明文本
//          SetArticleText(nil, AContent.S['description']);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setContent'] * 1000);
//        end;
//      end;
//
//          //选择商品库存
//      chromium1.ExecuteJavaScript('setListbox("库存","' + AContent.S['storage_satus'] + '");', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(2000);
//
//          //下拉到底
//      chromium1.ExecuteJavaScript('loadToBottom();', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(1000);
//
//          //设置发布位置
//      chromium1.ExecuteJavaScript('getEditPos("位置","getLocationEditPosFinished");', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getLocationEditPosFinished', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '获取发布位置输入框位置失败!';
//        uBaseLog.HandleException(nil, '====================【获取发布位置输入框位置 失败】====================');
//        Exit;
//      end
//      else
//      begin
//              //点击发布位置框
//        SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//        Sleep(FSleepConfig.I['setClick'] * 1000);
//
//              //设置发布位置文本
//        SetArticleText(nil, AContent.S['location']);
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['setContent'] * 1000);
//
//              //选择预选位置第一项
//        chromium1.ExecuteJavaScript('setFirstLocation();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(2000);
//
//      end;
//
//          //勾选 发布后加强推广商品
//      if AContent.B['spread_after_published'] = True then
//      begin
//        chromium1.ExecuteJavaScript('spreadOrHide("推广");', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(1500);
//      end;
//
//          //勾选 向朋友隐藏
//      if AContent.B['hide_from_friends'] = True then
//      begin
//        chromium1.ExecuteJavaScript('spreadOrHide("隐藏");', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(1500);
//      end;
//
//          //点击继续
//      chromium1.ExecuteJavaScript('confirmTrade();', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(2000);
//
//          //选择小组（暂时不用）
//
//          //确认发布
//      chromium1.ExecuteJavaScript('confirmTrade();', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(2000);
//
//    end;
//    if FAPI.FIsWillLogout then
//      Exit;
//
//      {$ENDREGION}
//  end
//  else
//  begin
//
//      {$REGION '发布到个人主页'}
//    if AParams.I['is_publish_to_my_homepage'] = 1 then
//    begin
//      Sleep(1000);
//
//          //点击打开个人主页发帖框
//      chromium1.ExecuteJavaScript('openHomePublish();', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(FSleepConfig.I['setContent'] * 1000);
//
//          //判断发布弹窗是否加载完成
//      AStartTime := Now;
//      while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) do
//      begin
//        chromium1.ExecuteJavaScript('getPublishBoxState("getPublishBoxStateFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getPublishBoxStateFinished', 5, True);
//        if ASuperObject.I['Code'] = SUCC then
//        begin
//          ADesc := '发布弹窗加载结束';
//          uBaseLog.HandleException(nil, '====================【主页发布弹窗加载 结束】====================');
//          Break;
//        end;
//
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(5000);
//      end;
//      if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//      begin
//              //媒体加载超时
//        uBaseLog.HandleException(nil, '====================【主发布弹窗加载 超时】====================');
//        ADesc := '主页发布弹窗加载 超时';
//      end;
//
//          //添加媒体
//      if FContentFiles.Count > 0 then
//      begin
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadContent FContentFiles.Count > 0');
//
//        chromium1.ExecuteJavaScript('getAddMediasPos("getAddMediasPosFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getAddMediasPosFinished', 15, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          uBaseLog.HandleException(nil, '====================【获取个人主页媒体输入框坐标 失败】====================');
//        end
//        else
//        begin
//
//          uBaseLog.HandleException(nil, '====================【获取个人主页媒体输入框坐标 成功】====================');
//          Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                  //设置鼠标点击添加媒体（媒体过宽，横坐标需要多加点）
//          SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 20, 20);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['clickDownItem'] * 1000);
//
//                  //判断媒体是否加载结束
//          AStartTime := Now;
//          while (DateUtils.SecondsBetween(Now, AStartTime) < AMediaWaitingTime) do
//          begin
//            chromium1.ExecuteJavaScript('ifAddMediasFinished("ifAddHomeMediasFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifAddHomeMediasFinished', 5, True);
//            if ASuperObject.I['Code'] = SUCC then
//            begin
//              ADesc := '主页媒体加载结束';
//              uBaseLog.HandleException(nil, '====================【主页媒体加载 结束】====================');
//              Break;
//            end;
//
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(5000);
//          end;
//
//          if DateUtils.SecondsBetween(Now, AStartTime) > AMediaWaitingTime then
//          begin
//                      //媒体加载超时
//            uBaseLog.HandleException(nil, '====================【发布到主页 媒体加载 超时】====================');
//            ADesc := '发布到主页媒体加载超时';
//          end;
//
//        end;
//
//      end
//      else
//      begin
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadContent FContentFiles.Count = 0');
//      end;
//
//          //设置文案
//      chromium1.ExecuteJavaScript('getInputPos("getInputPos");', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getInputPos', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '获取输入框位置失败!';
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadContent 获取输入框位置失败');
//      end
//      else
//      begin
//
//              //发送鼠标点击
//        SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//        Sleep(FSleepConfig.I['setClick'] * 1000);
//
//              //设置文本
//        SetArticleText(nil, AContent.S['content']);
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['setContent'] * 1000);
//
//              //确认发布
//        chromium1.ExecuteJavaScript('confirmPublish();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['confirmPublish'] * 1000);
//
//              //检测主页发布是否结束
//        AStartTime := Now;
//        while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['checkPublish']) do
//        begin
//          chromium1.ExecuteJavaScript('ifPublishFinished("ifPublishFinished");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifPublishFinished', 5, True);
//          if ASuperObject.I['Code'] = SUCC then
//          begin
//            ADesc := '主页发布 已结束';
//            uBaseLog.HandleException(nil, '====================【主页发布 已结束】====================');
//            Break;
//          end;
//
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(5000);
//        end;
//
//        if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['checkPublish'] then
//        begin
//                  //检测发布超时
//          uBaseLog.HandleException(nil, '====================【检测主页发布状态 超时】====================');
//          ADesc := '检测主页发布状态 超时';
//        end;
//
//      end;
//
//    end;
//      {$ENDREGION}
//
//
//    Sleep(1500);
//
//
//      {$REGION '发布到公共主页'}
//    if AParams.A['public_pages_array'].Length > 0 then
//    begin
//
//          //开始遍历公共主页发布
//      for I := 0 to AParams.A['public_pages_array'].Length - 1 do
//      begin
//
//              //默认设置不需要切换当前身份
//        ANeedSwitchUser := False;
//
//        if FAPI.FIsWillLogout then
//          Exit;
//
//              //检测页面是否加载结束
//        AStartTime := Now;
//        Self.FIsLoaded := False;
//        Self.Chromium1.LoadUrl(AParams.A['public_pages_array'].O[I].S['website']);
//        while (not Self.FIsLoaded) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not FAPI.FIsWillLogout do
//        begin
//          uBaseLog.HandleException(nil, '====================【API检测 公共主页 是否加载完成】====================');
//          Sleep(1000);
//        end;
//        if FAPI.FIsWillLogout then
//          Exit;
//
//        if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//        begin
//                //加载公共主页超时，跳过当前继续下一个
//          uBaseLog.HandleException(nil, '====================【加载公共主页 超时，继续下一个】====================');
//          Continue;
//        end;
//
//              //加载facebookAPI脚本
//        Self.LoadFacebookAPI;
//        Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//              //判断是否需要切换身份
//        chromium1.ExecuteJavaScript('ifNeedSwitchUser("ifNeedSwitchUserFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifNeedSwitchUserFinished', 20, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '不需要 切换发布身份!';
//          uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadContent 不需要 切换发布身份');
//        end
//        else
//        begin
//          ANeedSwitchUser := True;
//          uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadContent 切换到当前公共主页身份 成功');
//
//                  //切换身份重新加载需要10秒
//          Sleep(10000);
//
//                  //加载facebookAPI脚本
//          Self.LoadFacebookAPI;
//          Sleep(FSleepConfig.I['loadApi'] * 1000);
//        end;
//
//              //点击打开发布框
//        chromium1.ExecuteJavaScript('openPublicPagePublish("openPublicPagePublishFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('openPublicPagePublishFinished', 15, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '打开公共主页发布框 失败!';
//          uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadContent 打开公共主页发布框 失败');
//        end
//        else
//        begin
//
//          Sleep(FSleepConfig.I['setContent'] * 1000);
//                  //判断发布弹窗是否加载完成
//          AStartTime := Now;
//          while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) do
//          begin
//            chromium1.ExecuteJavaScript('getPublishBoxState("getPublishBoxStateFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getPublishBoxStateFinished', 5, True);
//            if ASuperObject.I['Code'] = SUCC then
//            begin
//              ADesc := '公共主页发布弹窗加载结束';
//              uBaseLog.HandleException(nil, '====================【公共主页发布弹窗加载 结束】====================');
//              Break;
//            end;
//
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(5000);
//          end;
//          if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//          begin
//                      //媒体加载超时
//            uBaseLog.HandleException(nil, '====================【公共主发布弹窗加载 超时】====================');
//            ADesc := '公共主发布弹窗加载 超时';
//          end;
//
//                  //添加媒体
//          if FContentFiles.Count > 0 then
//          begin
//
//            chromium1.ExecuteJavaScript('getAddMediasPos("getAddMediasPosFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getAddMediasPosFinished', 15, True);
//            if ASuperObject.I['Code'] <> SUCC then
//            begin
//              uBaseLog.HandleException(nil, '====================【获取公共主页媒体输入框坐标 失败】====================');
//            end
//            else
//            begin
//
//              uBaseLog.HandleException(nil, '====================【获取公共主页媒体输入框坐标 成功】====================');
//              Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                          //设置鼠标点击添加媒体
//              SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 20, 20);
//              if FAPI.FIsWillLogout then
//                Exit;
//              Sleep(FSleepConfig.I['clickDownItem'] * 1000);
//
//                          //判断媒体是否加载结束
//              AStartTime := Now;
//              while (DateUtils.SecondsBetween(Now, AStartTime) < AMediaWaitingTime) do
//              begin
//                chromium1.ExecuteJavaScript('ifAddMediasFinished("ifAddPublicMediasFinished");', 'about:blank');
//                ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifAddPublicMediasFinished', 5, True);
//                if ASuperObject.I['Code'] = SUCC then
//                begin
//                  ADesc := '公共主页媒体加载结束';
//                  uBaseLog.HandleException(nil, '====================【公共主页 媒体加载 结束】====================');
//                  Break;
//                end;
//
//                if FAPI.FIsWillLogout then
//                  Exit;
//                Sleep(5000);
//              end;
//
//              if DateUtils.SecondsBetween(Now, AStartTime) > AMediaWaitingTime then
//              begin
//                              //媒体加载超时
//                uBaseLog.HandleException(nil, '====================【发布到公共主页 媒体加载 超时】====================');
//                ADesc := '发布到公共主页媒体加载超时';
//              end;
//
//            end;
//
//          end;
//
//                  //获取文本输入框位置，设置发布文案
//          chromium1.ExecuteJavaScript('getInputPos("getInputPosFinished");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getInputPosFinished', 10, True);
//          if ASuperObject.I['Code'] <> SUCC then
//          begin
//            ADesc := '获取输入框位置失败!';
//            uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadContent 获取输入框位置失败');
//          end
//          else
//          begin
//
//                      //发送鼠标点击
//            SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//            Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                      //设置文本
//            SetArticleText(nil, AContent.S['content']);
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['setContent'] * 1000);
//
//                      //确认发布
//            chromium1.ExecuteJavaScript('confirmPublish();', 'about:blank');
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['confirmPublish'] * 1000);
//
//                      //检测公共主页发布是否结束
//            AStartTime := Now;
//            while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['checkPublish']) do
//            begin
//              chromium1.ExecuteJavaScript('ifPublishFinished("ifPublishFinished");', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifPublishFinished', 5, True);
//              if ASuperObject.I['Code'] = SUCC then
//              begin
//                ADesc := '公共主页发布 已结束';
//                uBaseLog.HandleException(nil, '====================【公共主页发布 已结束】====================');
//                Break;
//              end;
//
//              if FAPI.FIsWillLogout then
//                Exit;
//              Sleep(5000);
//            end;
//
//            if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['checkPublish'] then
//            begin
//                          //检测发布超时
//              uBaseLog.HandleException(nil, '====================【检测公共主页发布状态 超时】====================');
//              ADesc := '检测公共主页发布状态 超时';
//            end;
//
//          end;
//
//        end;
//
//              //发布结束切换回用户身份
//        if ANeedSwitchUser = True then
//        begin
//
//          chromium1.ExecuteJavaScript('returnUser();', 'about:blank');
//          Sleep(10000);
//
//        end;
//
//      end;
//
//    end;
//      {$ENDREGION}
//
//
//    Sleep(1500);
//
//
//      {$REGION '转发到小组'}
//    if AParams.A['groups_array'].Length > 0 then
//    begin
//
//      for I := 0 to AParams.A['groups_array'].Length - 1 do
//      begin
//
//              //检测页面是否加载结束
//        AStartTime := Now;
//        Self.FIsLoaded := False;
//        Self.Chromium1.LoadUrl(AParams.A['groups_array'].O[I].S['website']);
//        while (not Self.FIsLoaded) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not FAPI.FIsWillLogout do
//        begin
//          uBaseLog.HandleException(nil, '====================【API检测 群组页面 是否加载完成】====================');
//          Sleep(1000);
//        end;
//        if FAPI.FIsWillLogout then
//          Exit;
//
//        if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//        begin
//                //加载群组页面超时，跳过当前继续下一个
//          uBaseLog.HandleException(nil, '====================【加载 群组页面 超时，继续下一个】====================');
//          Continue;
//        end;
//
//              //加载facebookAPI脚本
//        Self.LoadFacebookAPI;
//        Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//              //================================================================
//
//              //打开小组发帖
//        chromium1.ExecuteJavaScript('openGroupsPublish();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['setContent'] * 1000);
//              //判断发布弹窗是否加载完成
//        AStartTime := Now;
//        while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) do
//        begin
//          chromium1.ExecuteJavaScript('getPublishBoxState("getPublishBoxStateFinished");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getPublishBoxStateFinished', 5, True);
//          if ASuperObject.I['Code'] = SUCC then
//          begin
//            ADesc := '小组发布弹窗加载结束';
//            uBaseLog.HandleException(nil, '====================【小组发布弹窗加载 结束】====================');
//            Break;
//          end;
//
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(5000);
//        end;
//        if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//        begin
//                  //媒体加载超时
//          uBaseLog.HandleException(nil, '====================【小组布弹窗加载 超时】====================');
//          ADesc := '小组布弹窗加载 超时';
//        end;
//
//              //添加媒体
//        if FContentFiles.Count > 0 then
//        begin
//
//          chromium1.ExecuteJavaScript('getAddMediasPos("getAddMediasPosFinished");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getAddMediasPosFinished', 15, True);
//          if ASuperObject.I['Code'] <> SUCC then
//          begin
//            uBaseLog.HandleException(nil, '====================【获取小组媒体输入框坐标 失败】====================');
//          end
//          else
//          begin
//
//            uBaseLog.HandleException(nil, '====================【获取小组媒体输入框坐标 成功】====================');
//            Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                      //设置鼠标点击添加媒体
//            SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 20, 20);
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['clickDownItem'] * 1000);
//
//                      //判断媒体是否加载结束
//            AStartTime := Now;
//            while (DateUtils.SecondsBetween(Now, AStartTime) < AMediaWaitingTime) do
//            begin
//              chromium1.ExecuteJavaScript('ifAddMediasFinished("ifAddGroupMediasFinished");', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifAddGroupMediasFinished', 5, True);
//              if ASuperObject.I['Code'] = SUCC then
//              begin
//                ADesc := '小组媒体加载结束';
//                uBaseLog.HandleException(nil, '====================【小组媒体加载 结束】====================');
//                Break;
//              end;
//
//              if FAPI.FIsWillLogout then
//                Exit;
//              Sleep(5000);
//            end;
//
//            if DateUtils.SecondsBetween(Now, AStartTime) > AMediaWaitingTime then
//            begin
//                          //媒体加载超时
//              uBaseLog.HandleException(nil, '====================【发布到小组 媒体加载 超时】====================');
//              ADesc := '发布到小组媒体加载超时';
//            end;
//
//          end;
//
//        end;
//
//              //设置发布文案
//        chromium1.ExecuteJavaScript('getInputPos("getInputPos");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getInputPos', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '获取小组发帖输入框位置失败!';
//          uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadContent 发帖到小组获取输入框位置失败');
//        end
//        else
//        begin
//                  //发送鼠标点击
//          SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//          Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                  //设置文本
//          SetArticleText(nil, AContent.S['content']);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setContent'] * 1000);
//
//                  //确认发布
//          chromium1.ExecuteJavaScript('confirmPublish();', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['confirmPublish'] * 1000);
//
//                  //检测小组发布是否结束
//          AStartTime := Now;
//          while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['checkPublish']) do
//          begin
//            chromium1.ExecuteJavaScript('ifPublishFinished("ifPublishFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifPublishFinished', 5, True);
//            if ASuperObject.I['Code'] = SUCC then
//            begin
//              ADesc := '小组发布 已结束';
//              uBaseLog.HandleException(nil, '====================【小组发布 已结束】====================');
//              Break;
//            end;
//
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(5000);
//          end;
//
//          if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['checkPublish'] then
//          begin
//                      //检测发布超时
//            uBaseLog.HandleException(nil, '====================【检测小组发布状态 超时】====================');
//            ADesc := '检测小组发布状态 超时';
//          end;
//
//                  //小组间发布间隔时间
//          if I <> AParams.A['groups_array'].Length - 1 then
//          begin
//            uBaseLog.HandleException(nil, '====================【小组间发布休眠 ' + IntToStr(AParams.I['interval_time']) + ' 秒】====================');
//            Sleep(AParams.I['interval_time'] * 1000);
//          end;
//
//        end;
//
//      end;
//
//    end;
//      {$ENDREGION}
//
//  end;
//
//  FContentFiles.Clear;
//
//end;
//
////推广商品
//procedure TFrameBaseWebBrowser.UploadGoods(AContent, AParams: ISuperObject);
//var
//  I, J: Integer;
//  ADesc: string;
//  ASuperObject: ISuperObject;
//  ApublicPageCount: Integer;
//  AStartTime: TDateTime;
//  AGroupCount: Integer;
////  AGroupUrls: ISuperArray;
//
//  //判断当前公共主页是否需要切换身份
//  ANeedSwitchUser: Boolean;
//  AHomeGoodsState, APageGoodsState, AGroupGoodsState: Boolean;
//begin
//  //加载facebookAPI脚本
//  Self.LoadFacebookAPI;
//  Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//  //加载首页
//  chromium1.ExecuteJavaScript('loadHome();', 'about:blank');
//  if FAPI.FIsWillLogout then
//    Exit;
//  Sleep(FSleepConfig.I['loadHome'] * 1000);
//
//  {$REGION '发布到个人主页'}
//  if AParams.I['is_publish_to_my_homepage'] = 1 then
//  begin
//    Sleep(1000);
//
//    for I := 0 to AParams.A['goods_array'].length - 1 do
//    begin
//
//          //打开个人主页发帖框
//      chromium1.ExecuteJavaScript('openHomePublish();', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(FSleepConfig.I['setContent'] * 1000);
//          //判断发布弹窗是否加载完成
//      AStartTime := Now;
//      while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) do
//      begin
//        chromium1.ExecuteJavaScript('getPublishBoxState("getPublishBoxStateFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getPublishBoxStateFinished', 5, True);
//        if ASuperObject.I['Code'] = SUCC then
//        begin
//          ADesc := '发布弹窗加载结束';
//          uBaseLog.HandleException(nil, '====================【主页发布弹窗加载 结束】====================');
//          Break;
//        end;
//
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(5000);
//      end;
//      if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//      begin
//              //媒体加载超时
//        uBaseLog.HandleException(nil, '====================【主发布弹窗加载 超时】====================');
//        ADesc := '主发布弹窗加载 超时';
//      end;
//
//      chromium1.ExecuteJavaScript('getInputPos("getInputPos");', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getInputPos', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '获取输入框位置失败!';
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadGoods 获取输入框位置失败');
//
//      end
//      else
//      begin
//
//              //发送鼠标点击
//        SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//        Sleep(FSleepConfig.I['setClick'] * 1000);
//
//              //设置文本
//        SetArticleText(nil, AParams.A['goods_array'].S[I]);
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['setContent'] * 1000);
//
//              //检查商品是否加载完成
//        AStartTime := Now;
//        AHomeGoodsState := False;
//        while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and (AHomeGoodsState = False) do
//        begin
//          chromium1.ExecuteJavaScript('checkGoodsState("checkGoodsStateFinished");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('checkGoodsStateFinished', 5, True);
//          if ASuperObject.I['Code'] = SUCC then
//          begin
//            ADesc := '商品加载完成';
//            uBaseLog.HandleException(nil, '====================【商品加载 完成】====================');
//            AHomeGoodsState := True;
//            Break;
//          end;
//
//          uBaseLog.HandleException(nil, '====================【检测商品加载状态中~~~】====================');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(5000);
//        end;
//
//        if (DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage']) and (AHomeGoodsState = False) then
//        begin
//                  //商品加载超时
//          uBaseLog.HandleException(nil, '====================【商品加载 超时】====================');
//          ADesc := '商品加载超时';
//        end;
//
//              //确认发布
//        chromium1.ExecuteJavaScript('confirmPublish();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['confirmPublish'] * 1000);
//
//              //检测主页商品发布是否结束
//        AStartTime := Now;
//        while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['checkPublish']) do
//        begin
//          chromium1.ExecuteJavaScript('ifPublishFinished("ifPublishFinished");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifPublishFinished', 5, True);
//          if ASuperObject.I['Code'] = SUCC then
//          begin
//            ADesc := '主页商品发布 已结束';
//            uBaseLog.HandleException(nil, '====================【主页商品发布 已结束】====================');
//            Break;
//          end;
//
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(5000);
//        end;
//
//        if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['checkPublish'] then
//        begin
//                  //检测发布超时
//          uBaseLog.HandleException(nil, '====================【检测主页商品发布状态 超时】====================');
//          ADesc := '检测主页商品发布状态 超时';
//        end;
//
//      end;
//
//    end;
//
//  end;
//  {$ENDREGION}
//
//
//  Sleep(1500);
//
//
//  {$REGION '发布到公共主页'}
//  if AParams.A['public_pages_array'].Length > 0 then
//  begin
//
//      //开始遍历公共主页发布
//    for I := 0 to AParams.A['public_pages_array'].Length - 1 do
//    begin
//
//          //默认设置不需要切换当前身份
//      ANeedSwitchUser := False;
//
//      if FAPI.FIsWillLogout then
//        Exit;
//
//          //检测页面是否加载结束
//      AStartTime := Now;
//      Self.FIsLoaded := False;
//      Self.Chromium1.LoadUrl(AParams.A['public_pages_array'].O[I].S['website']);
//      while (not Self.FIsLoaded) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not FAPI.FIsWillLogout do
//      begin
//        uBaseLog.HandleException(nil, '====================【API检测 公共主页 是否加载完成】====================');
//        Sleep(1000);
//      end;
//      if FAPI.FIsWillLogout then
//        Exit;
//
//      if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//      begin
//            //加载公共主页超时，跳过当前继续下一个
//        uBaseLog.HandleException(nil, '====================【加载公共主页 超时，继续下一个】====================');
//        Continue;
//      end;
//
//          //加载facebookAPI脚本
//      Self.LoadFacebookAPI;
//      Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//          //判断是否需要切换身份
//      chromium1.ExecuteJavaScript('ifNeedSwitchUser("ifNeedSwitchUserFinished");', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifNeedSwitchUserFinished', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '不需要 切换发布身份!';
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadContent 不需要 切换发布身份');
//      end
//      else
//      begin
//        ANeedSwitchUser := True;
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadContent 切换到当前公共主页身份 成功');
//
//              //切换身份重新加载需要10秒
//        Sleep(10000);
//
//              //加载facebookAPI脚本
//        Self.LoadFacebookAPI;
//        Sleep(FSleepConfig.I['loadApi'] * 1000);
//      end;
//
//      for J := 0 to AParams.A['goods_array'].length - 1 do
//      begin
//
//              //打开发布框
//        chromium1.ExecuteJavaScript('openPublicPagePublish("openGoodsPublishFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('openGoodsPublishFinished', 15, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '打开公共主页发布框 失败!';
//          uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadGoods 打开公共主页发布框 失败');
//        end
//        else
//        begin
//
//          Sleep(FSleepConfig.I['setContent'] * 1000);
//                  //判断发布弹窗是否加载完成
//          AStartTime := Now;
//          while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) do
//          begin
//            chromium1.ExecuteJavaScript('getPublishBoxState("getPublishBoxStateFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getPublishBoxStateFinished', 5, True);
//            if ASuperObject.I['Code'] = SUCC then
//            begin
//              ADesc := '公共主页发布弹窗加载结束';
//              uBaseLog.HandleException(nil, '====================【公共主页发布弹窗加载 结束】====================');
//              Break;
//            end;
//
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(5000);
//          end;
//          if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//          begin
//                      //媒体加载超时
//            uBaseLog.HandleException(nil, '====================【公共主页布弹窗加载 超时】====================');
//            ADesc := '公共主页布弹窗加载 超时';
//          end;
//
//                  //获取文本输入框位置，设置文本
//          chromium1.ExecuteJavaScript('getInputPos("getInputPosFinished");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getInputPosFinished', 5, True);
//          if ASuperObject.I['Code'] <> SUCC then
//          begin
//            ADesc := '获取输入框位置失败!';
//            uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadGoods 获取输入框位置失败');
//          end
//          else
//          begin
//                      //发送鼠标点击
//            SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//            Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                      //设置文本
//            SetArticleText(nil, AParams.A['goods_array'].S[J]);
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['setContent'] * 1000);
//
//                      //检查商品是否加载完成
//            AStartTime := Now;
//            APageGoodsState := False;
//            while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and (APageGoodsState = False) do
//            begin
//              chromium1.ExecuteJavaScript('checkGoodsState("checkGoodsStateFinished");', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('checkGoodsStateFinished', 5, True);
//              if ASuperObject.I['Code'] = SUCC then
//              begin
//                ADesc := '商品加载完成';
//                uBaseLog.HandleException(nil, '====================【商品加载 完成】====================');
//                APageGoodsState := True;
//                Break;
//              end;
//
//              uBaseLog.HandleException(nil, '====================【检测商品加载状态中~~~】====================');
//              if FAPI.FIsWillLogout then
//                Exit;
//              Sleep(5000);
//            end;
//
//            if (DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage']) and (APageGoodsState = False) then
//            begin
//                          //商品加载超时
//              uBaseLog.HandleException(nil, '====================【商品加载 超时】====================');
//              ADesc := '商品加载超时';
//            end;
//
//                      //确认发布
//            chromium1.ExecuteJavaScript('confirmPublish();', 'about:blank');
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['confirmPublish'] * 1000);
//
//                      //检测公共主页商品发布是否结束
//            AStartTime := Now;
//            while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['checkPublish']) do
//            begin
//              chromium1.ExecuteJavaScript('ifPublishFinished("ifPublishFinished");', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifPublishFinished', 5, True);
//              if ASuperObject.I['Code'] = SUCC then
//              begin
//                ADesc := '公共主页商品发布 已结束';
//                uBaseLog.HandleException(nil, '====================【公共主页商品发布 已结束】====================');
//                Break;
//              end;
//
//              if FAPI.FIsWillLogout then
//                Exit;
//              Sleep(5000);
//            end;
//
//            if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['checkPublish'] then
//            begin
//                          //检测发布超时
//              uBaseLog.HandleException(nil, '====================【检测公共主页商品发布状态 超时】====================');
//              ADesc := '检测公共主页商品发布状态 超时';
//            end;
//
//          end;
//
//        end;
//
//      end;
//
//          //发布结束切换回用户身份
//      if ANeedSwitchUser = True then
//      begin
//
//        chromium1.ExecuteJavaScript('returnUser();', 'about:blank');
//        Sleep(10000);
//
//      end;
//
//    end;
//
//  end;
//  {$ENDREGION}
//
//
//  Sleep(1500);
//
//
//  {$REGION '转发到小组'}
//  if AParams.A['groups_array'].Length > 0 then
//  begin
//
//    for I := 0 to AParams.A['groups_array'].Length - 1 do
//    begin
//
//          //检测页面是否加载结束
//      AStartTime := Now;
//      Self.FIsLoaded := False;
//      Self.Chromium1.LoadUrl(AParams.A['groups_array'].O[I].S['website']);
//      while (not Self.FIsLoaded) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not FAPI.FIsWillLogout do
//      begin
//        uBaseLog.HandleException(nil, '====================【API检测 群组页面 是否加载完成】====================');
//        Sleep(1000);
//      end;
//      if FAPI.FIsWillLogout then
//        Exit;
//
//      if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//      begin
//            //加载群组页面超时，跳过当前继续下一个
//        uBaseLog.HandleException(nil, '====================【加载 群组页面 超时，继续下一个】====================');
//        Continue;
//      end;
//
//          //加载facebookAPI脚本
//      Self.LoadFacebookAPI;
//      Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//          //循环商品发布
//      for J := 0 to AParams.A['goods_array'].length - 1 do
//      begin
//
//              //打开小组发帖
//        chromium1.ExecuteJavaScript('openGroupsPublish();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['setContent'] * 1000);
//              //判断发布弹窗是否加载完成
//        AStartTime := Now;
//        while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) do
//        begin
//          chromium1.ExecuteJavaScript('getPublishBoxState("getPublishBoxStateFinished");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getPublishBoxStateFinished', 5, True);
//          if ASuperObject.I['Code'] = SUCC then
//          begin
//            ADesc := '小组弹窗加载结束';
//            uBaseLog.HandleException(nil, '====================【小组发布弹窗加载 结束】====================');
//            Break;
//          end;
//
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(5000);
//        end;
//        if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//        begin
//                  //媒体加载超时
//          uBaseLog.HandleException(nil, '====================【小组布弹窗加载 超时】====================');
//          ADesc := '小组布弹窗加载 超时';
//        end;
//
//              //获取输入框位置
//        chromium1.ExecuteJavaScript('getInputPos("getInputPos");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getInputPos', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '获取小组输入框位置失败!';
//          uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.UploadGoods 发帖到小组获取输入框位置失败');
//        end
//        else
//        begin
//                  //发送鼠标点击
//          SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//          Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                  //设置文本
//          SetArticleText(nil, AParams.A['goods_array'].S[J]);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setContent'] * 1000);
//
//                  //检查商品是否加载完成
//          AStartTime := Now;
//          AGroupGoodsState := False;
//          while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and (AGroupGoodsState = False) do
//          begin
//            chromium1.ExecuteJavaScript('checkGoodsState("checkGoodsStateFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('checkGoodsStateFinished', 5, True);
//            if ASuperObject.I['Code'] = SUCC then
//            begin
//              ADesc := '商品加载完成';
//              uBaseLog.HandleException(nil, '====================【商品加载 完成】====================');
//              AGroupGoodsState := True;
//              Break;
//            end;
//
//            uBaseLog.HandleException(nil, '====================【检测商品加载状态中~~~】====================');
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(5000);
//          end;
//
//          if (DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage']) and (AGroupGoodsState = False) then
//          begin
//                      //商品加载超时
//            uBaseLog.HandleException(nil, '====================【商品加载 超时】====================');
//            ADesc := '商品加载超时';
//          end;
//
//                  //确认发布
//          chromium1.ExecuteJavaScript('confirmPublish();', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['confirmPublish'] * 1000);
//
//                  //检测小组商品发布是否结束
//          AStartTime := Now;
//          while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['checkPublish']) do
//          begin
//            chromium1.ExecuteJavaScript('ifPublishFinished("ifPublishFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifPublishFinished', 5, True);
//            if ASuperObject.I['Code'] = SUCC then
//            begin
//              ADesc := '小组商品发布 已结束';
//              uBaseLog.HandleException(nil, '====================【小组商品发布 已结束】====================');
//              Break;
//            end;
//
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(5000);
//          end;
//
//          if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['checkPublish'] then
//          begin
//                      //检测发布超时
//            uBaseLog.HandleException(nil, '====================【检测小组商品发布状态 超时】====================');
//            ADesc := '检测小组商品发布状态 超时';
//          end;
//
//                  //小组间发布间隔时间
//          if (I <> AParams.A['groups_array'].Length - 1) and (J <> AParams.A['goods_array'].length - 1) then
//          begin
//            uBaseLog.HandleException(nil, '====================【小组间发布休眠 ' + IntToStr(AParams.I['interval_time']) + ' 秒】====================');
//            Sleep(AParams.I['interval_time'] * 1000);
//          end;
//
//        end;
//
//      end;
//
//    end;
//
//  end;
//  {$ENDREGION}
//
//
//end;
//
////转发
//function TFrameBaseWebBrowser.TransferContent(AContent: ISuperObject; AParams: ISuperObject): ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  I: Integer;
//var
//  AStartTime: TDateTime;
////  ACEFMessageContent:TCEFMessageContent;
//  ASuperObject: ISuperObject;
////  AResultData:String;
//begin
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  try
//    ADataJson := TSuperObject.Create;
//
//
//      {$REGION '初始化转发'}
//    Self.FIsLoaded := False;
//    TThread.Synchronize(nil,
//      procedure
//      begin
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent LoadUrl ' + AContent.S['from_url']);
//        Self.Chromium1.LoadUrl(AContent.S['from_url']);
//      end);
//
//      //等待加载结束
//    AStartTime := Now;
//    while not FIsLoaded and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) do
//    begin
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(1000);
//    end;
//
//    if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//    begin
//        //页面加载超时
//      uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent LoadUrl 页面加载超时');
//      ADesc := '页面加载超时';
//      Exit;
//    end;
//
//      //加载JS脚本
//    Self.LoadFacebookAPI;
//    if FAPI.FIsWillLogout then
//      Exit;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//      //判断帖子的类型
//    chromium1.ExecuteJavaScript('getURLType();', 'about:blank');
//    if FAPI.FIsWillLogout then
//      Exit;
//    Sleep(3000);
//      {$ENDREGION}
//
//      {$REGION '是否需要点赞'}
//    if AParams.I['is_need_like_content'] = 1 then
//    begin
//      chromium1.ExecuteJavaScript('clickLike("clickLikeFinished");', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('clickLikeFinished', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '点赞失败!';
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 点赞失败');
//      end
//      else
//      begin
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(3000);
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 点赞成功');
//        ADataJson.I['like_count'] := 1;
//      end;
//    end;
//      {$ENDREGION}
//
//      {$REGION '是否需要评论'}
//    if AParams.I['is_need_comment_content'] = 1 then
//    begin
//
//      chromium1.ExecuteJavaScript('getCommentInputPos("getCommentInputPos");', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getCommentInputPos', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '获取评论输入框位置失败!';
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 获取评论输入框位置失败');
//      end
//      else
//      begin
//
//          //发送鼠标点击
//        SetMouseClick(nil, Ceil(ASuperObject.F['X']) + Ceil(30 / FScreenScaleRate), Ceil(ASuperObject.F['Y']) + Ceil(10 / FScreenScaleRate), 10, 10);
//        Sleep(FSleepConfig.I['setClick'] * 1000);
//
//          //设置文本
//        SetArticleText(nil, AContent.S['caption']);
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['setContent'] * 1000);
//
//          //按回车确认
//        SendKeyPressEnter;
//        Sleep(3000);
//
//      end;
//
//    end;
//      {$ENDREGION}
//
//      {$REGION '是否需要转发到我的主页'}
//    if AParams.I['is_upload_to_my_homepage'] = 1 then
//    begin
//        //点开分享菜单
//      chromium1.ExecuteJavaScript('openShare("openShare");', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('openShare', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '点开分享菜单失败!';
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 分享到主页 点开分享菜单失败');
//      end
//      else
//      begin
//
//        if FAPI.FIsWillLogout then
//          Exit;
//
//          //分享到个人主页
//        chromium1.ExecuteJavaScript('shareOptions("shareToHomePage", "主页");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('shareToHomePage', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '分享到个人主页失败!';
//          uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 分享到个人主页失败');
//        end
//        else
//        begin
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(3000);
//
//            //统计结果
//          ADataJson.I['share_to_my_homepage_count'] := 1;
//        end;
//
//      end;
//
//    end;
//      {$ENDREGION}
//
//      {$REGION '是否需要转发到我的动态'}
//    if AParams.I['is_upload_to_my_dynamic'] = 1 then
//    begin
//        //点开分享菜单
//      chromium1.ExecuteJavaScript('openShare("openShare");', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('openShare', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        ADesc := '点开分享菜单失败!';
//        uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 转发到个人动态 点开分享菜单失败');
//      end
//      else
//      begin
//
//        if FAPI.FIsWillLogout then
//          Exit;
//
//          //分享到动态
//        chromium1.ExecuteJavaScript('shareOptions("shareToDynamic", "动态");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('shareToDynamic', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '转发到个人动态失败!';
//          uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 转发到个人动态失败');
//        end
//        else
//        begin
//
//          if FAPI.FIsWillLogout then
//            Exit;
//            //等待5秒加载内容
//          Sleep(5000);
//
//          chromium1.ExecuteJavaScript('getInputPos("getInputPos");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getInputPos', 10, True);
//          if ASuperObject.I['Code'] <> SUCC then
//          begin
//            ADesc := '获取输入框位置失败!';
//            uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 获取输入框位置失败');
//          end
//          else
//          begin
//
//              //发送鼠标点击
//            SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//            Sleep(FSleepConfig.I['setClick'] * 1000);
//
//              //设置文本
//            SetArticleText(nil, AContent.S['content']);
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['setContent'] * 1000);
//
//              //确认
//            chromium1.ExecuteJavaScript('confirmPublish();', 'about:blank');
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['confirmPublish'] * 1000);
//
//              //检测转发到我的动态是否结束
//            AStartTime := Now;
//            while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['checkPublish']) do
//            begin
//              chromium1.ExecuteJavaScript('ifPublishFinished("ifPublishFinished");', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifPublishFinished', 5, True);
//              if ASuperObject.I['Code'] = SUCC then
//              begin
//                ADesc := '转发到我的动态 已结束';
//                uBaseLog.HandleException(nil, '====================【转发到我的动态 已结束】====================');
//                Break;
//              end;
//
//              if FAPI.FIsWillLogout then
//                Exit;
//              Sleep(5000);
//            end;
//
//            if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['checkPublish'] then
//            begin
//                  //检测发布超时
//              uBaseLog.HandleException(nil, '====================【检测转发到我的动态状态 超时】====================');
//              ADesc := '检测转发到我的动态状态 超时';
//            end;
//
//              //统计结果
//            ADataJson.I['share_to_my_dynamic_count'] := 1;
//
//          end;
//        end;
//      end;
//    end;
//      {$ENDREGION}
//
//      {$REGION '是否需要转发到小组'}
//    if AParams.A['groups_array'].Length > 0 then
//    begin
//
//      for I := 0 to AParams.A['groups_array'].Length - 1 do
//      begin
//
//              //点开分享菜单
//        chromium1.ExecuteJavaScript('openShare("openShare");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('openShare', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '点开分享菜单失败!';
//          uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 转发到小组 点开分享菜单失败');
//        end
//        else
//        begin
//
//          if FAPI.FIsWillLogout then
//            Exit;
//
//          chromium1.ExecuteJavaScript('shareOptions("shareToGroups", "小组");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('shareToGroups', 10, True);
//          if ASuperObject.I['Code'] <> SUCC then
//          begin
//            ADesc := '点开分享到小组菜单失败!';
//            uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 转发到小组 点开分享到小组菜单失败');
//          end
//          else
//          begin
//
//            if FAPI.FIsWillLogout then
//              Exit;
//                      //等待小组列表加载
//            Sleep(5000);
//
//                      //获取小组搜索框坐标
//            chromium1.ExecuteJavaScript('getSearchInputPos("getSearchInputPosFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getSearchInputPosFinished', 10, True);
//            if ASuperObject.I['Code'] <> SUCC then
//            begin
//              ADesc := '获取小组搜索框坐标失败!';
//              uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 转发到小组 获取小组搜索框坐标失败');
//            end
//            else
//            begin
//
//                          //发送鼠标点击
//              SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 20, 5);
//              Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                          //设置文本
//              SetArticleText(nil, AParams.A['groups_array'].O[I].S['groupname']);
//              if FAPI.FIsWillLogout then
//                Exit;
//              Sleep(FSleepConfig.I['setDownContent'] * 1000);
//
//                          //选择第一个群组
//              chromium1.ExecuteJavaScript('shareTargetSelect("shareTargetSelect");', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('shareTargetSelect', 10, True);
//              if ASuperObject.I['Code'] <> SUCC then
//              begin
//                ADesc := '选择第一个群组失败!';
//                uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 转发到小组 选择第一个群组失败');
//              end
//              else
//              begin
//
//                              //因为要加载原帖的内容，所以比较慢
//                if FAPI.FIsWillLogout then
//                  Exit;
//                Sleep(5000);
//
//                chromium1.ExecuteJavaScript('getInputPos("getInputPos");', 'about:blank');
//                ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getInputPos', 10, True);
//                if ASuperObject.I['Code'] <> SUCC then
//                begin
//                  ADesc := '获取输入框位置失败!';
//                  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 获取输入框位置失败');
//                end
//                else
//                begin
//
//                                  //发送鼠标点击
//                  SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 5);
//                  Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                                  //设置文本
//                  SetArticleText(nil, AContent.S['content']);
//                  if FAPI.FIsWillLogout then
//                    Exit;
//                  Sleep(FSleepConfig.I['setContent'] * 1000);
//
//                                  //确认
//                  chromium1.ExecuteJavaScript('confirmPublish();', 'about:blank');
//                  if FAPI.FIsWillLogout then
//                    Exit;
//                  Sleep(FSleepConfig.I['confirmPublish'] * 1000);
//
//                                  //检测转发到小组是否结束
//                  AStartTime := Now;
//                  while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['checkPublish']) do
//                  begin
//                    chromium1.ExecuteJavaScript('ifPublishFinished("ifPublishFinished");', 'about:blank');
//                    ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifPublishFinished', 5, True);
//                    if ASuperObject.I['Code'] = SUCC then
//                    begin
//                      ADesc := '转发到小组 已结束';
//                      uBaseLog.HandleException(nil, '====================【转发到小组 已结束】====================');
//                      Break;
//                    end;
//
//                    if FAPI.FIsWillLogout then
//                      Exit;
//                    Sleep(5000);
//                  end;
//
//                  if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['checkPublish'] then
//                  begin
//                                      //检测发布超时
//                    uBaseLog.HandleException(nil, '====================【检测转发到小组状态 超时】====================');
//                    ADesc := '检测转发到小组状态 超时';
//                  end;
//
//                                  //统计结果
//                  ADataJson.I['share_to_group_count'] := ADataJson.I['share_to_group_count'] + 1;
//
//                                  //小组间发布间隔时间
//                  if (I <> AParams.A['groups_array'].Length - 1) or (AParams.A['friends_array'].Length <> 0) then
//                  begin
//                    uBaseLog.HandleException(nil, '====================【小组间发布休眠 ' + IntToStr(AParams.I['interval_time']) + ' 秒】====================');
//                    Sleep(AParams.I['interval_time'] * 1000);
//                  end;
//
//                end;
//
//              end;
//
//            end;
//
//          end;
//
//        end;
//
//      end;
//
//    end;
//      {$ENDREGION}
//
//      {$REGION '是否需要转发到好友个人主页'}
//    if AParams.A['friends_array'].Length > 0 then
//    begin
//
//      for I := 0 to AParams.A['friends_array'].Length - 1 do
//      begin
//
//              //点开分享菜单
//        chromium1.ExecuteJavaScript('openShare("openShare");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('openShare', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          ADesc := '点开分享菜单失败!';
//          uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 转发到好友个人主页 点开分享菜单失败');
//        end
//        else
//        begin
//
//          if FAPI.FIsWillLogout then
//            Exit;
//
//          chromium1.ExecuteJavaScript('shareOptions("shareToFriendsHomePage", "好友的个人主页");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('shareToFriendsHomePage', 10, True);
//          if ASuperObject.I['Code'] <> SUCC then
//          begin
//            ADesc := '点开分享到好友个人主页菜单失败!';
//            uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 转发到好友个人主页 点开分享到好友个人主页菜单失败');
//          end
//          else
//          begin
//
//                      //一定要5秒，因为要打开两级菜单
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(5000);
//
//
//                      //获取好友搜索框坐标
//            chromium1.ExecuteJavaScript('getSearchInputPos("getSearchInputPosFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getSearchInputPosFinished', 10, True);
//            if ASuperObject.I['Code'] <> SUCC then
//            begin
//              ADesc := '获取好友搜索框坐标失败!';
//              uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 转发到小组 获取小组搜索框坐标失败');
//            end
//            else
//            begin
//
//                          //发送鼠标点击
//              SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 20, 5);
//              Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                          //设置文本
//              SetArticleText(nil, AParams.A['friends_array'].O[I].S['name']);
//              if FAPI.FIsWillLogout then
//                Exit;
//              Sleep(FSleepConfig.I['setDownContent'] * 1000);
//
//                          //选择第一个好友
//              chromium1.ExecuteJavaScript('shareTargetSelect("shareTargetSelect");', 'about:blank');
//              ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('shareTargetSelect', 10, True);
//              if ASuperObject.I['Code'] <> SUCC then
//              begin
//                ADesc := '选择第一个好友失败!';
//                uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 转发到好友个人主页 选择某一个好友失败');
//              end
//              else
//              begin
//
//                              //因为要加载原帖的内容，所以比较慢
//                if FAPI.FIsWillLogout then
//                  Exit;
//                Sleep(5000);
//
//                chromium1.ExecuteJavaScript('getInputPos("getInputPos");', 'about:blank');
//                ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getInputPos', 10, True);
//                if ASuperObject.I['Code'] <> SUCC then
//                begin
//                  ADesc := '获取输入框位置失败!';
//                  uBaseLog.HandleException(nil, 'TFrameFacebookWebSearchAPI.TransferContent 获取输入框位置失败');
//                end
//                else
//                begin
//
//                                  //发送鼠标点击
//                  SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//                  Sleep(FSleepConfig.I['setClick'] * 1000);
//
//                                  //设置文本
//                  SetArticleText(nil, AContent.S['content']);
//                  if FAPI.FIsWillLogout then
//                    Exit;
//                  Sleep(FSleepConfig.I['setContent'] * 1000);
//
//                                  //确认
//                  chromium1.ExecuteJavaScript('confirmPublish();', 'about:blank');
//                  if FAPI.FIsWillLogout then
//                    Exit;
//                  Sleep(FSleepConfig.I['confirmPublish'] * 1000);
//
//                                  //检测转发到好友个人主页是否结束
//                  AStartTime := Now;
//                  while (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['checkPublish']) do
//                  begin
//                    chromium1.ExecuteJavaScript('ifPublishFinished("ifPublishFinished");', 'about:blank');
//                    ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('ifPublishFinished', 5, True);
//                    if ASuperObject.I['Code'] = SUCC then
//                    begin
//                      ADesc := '转发到好友个人主页 已结束';
//                      uBaseLog.HandleException(nil, '====================【转发到好友个人主页 已结束】====================');
//                      Break;
//                    end;
//
//                    if FAPI.FIsWillLogout then
//                      Exit;
//                    Sleep(5000);
//                  end;
//
//                  if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['checkPublish'] then
//                  begin
//                                      //检测发布超时
//                    uBaseLog.HandleException(nil, '====================【检测转发到好友个人主页状态 超时】====================');
//                    ADesc := '检测转发到好友个人主页状态 超时';
//                  end;
//
//                                  //统计结果
//                  ADataJson.I['share_to_friend_count'] := ADataJson.I['share_to_friend_count'] + 1;
//
//                                  //好友间发布间隔时间
//                  if I <> AParams.A['friends_array'].Length - 1 then
//                  begin
//                    uBaseLog.HandleException(nil, '====================【好友间发布休眠 ' + IntToStr(AParams.I['interval_time']) + ' 秒】====================');
//                    Sleep(AParams.I['interval_time'] * 1000);
//                  end;
//
//                end;
//
//              end;
//
//            end;
//
//          end;
//
//        end;
//
//      end;
//
//    end;
//      {$ENDREGION}
//
////      //再回到主页
////      TThread.Synchronize(nil,procedure
////      begin
////        uBaseLog.HandleException(nil,'TFrameFacebookWebSearchAPI.TransferContent LoadUrl 加载首页');
////        Self.Chromium1.LoadUrl('www.facebook.com');
////      end);
//
//      //转发成功
//    ACode := SUCC;
//    ADesc := '转发成功';
//
//  finally
//
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//
//  end;
//
//end;

//打开搜索框测试
procedure TFrameBaseWebBrowser.btnOpenSearchClick(Sender: TObject);
begin
  chromium1.ExecuteJavaScript('openSearch();', 'about:blank');
end;

procedure TFrameBaseWebBrowser.TestSetSearchWord_ThreadProc;
begin

//  SetMouseClick(nil, 100, 30, 10, 10);
//  Sleep(FSleepConfig.I['setClick'] * 1000);
//
////  SetArticleText(nil, 'food');
//  Sleep(FSleepConfig.I['setContent'] * 1000);
//
//  chromium1.ExecuteJavaScript('doPagesSearch();', 'about:blank');

end;

//点击打开搜索框输入搜索词测试
procedure TFrameBaseWebBrowser.btnSetSearchWordClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(TestSetSearchWord_ThreadProc).Start;
end;

//过滤商店测试
procedure TFrameBaseWebBrowser.btnIsShopClick(Sender: TObject);
begin
  chromium1.ExecuteJavaScript('setIsShopOrPublicGroup();', 'about:blank');
end;

//过滤已认证测试
procedure TFrameBaseWebBrowser.btnCertifiedClick(Sender: TObject);
begin
  chromium1.ExecuteJavaScript('setIsCertifiedOrMyGroup();', 'about:blank');
end;

procedure TFrameBaseWebBrowser.btnCatrgoryClick(Sender: TObject);
var
  testIndex: Integer;
begin
  testIndex := 1;
  chromium1.ExecuteJavaScript('setCategory(' + IntToStr(testIndex) + ');', 'about:blank');
end;

procedure TFrameBaseWebBrowser.TestChoseCountry_ThreadProc;
begin

//  SetMouseClick(nil, 180, 630, 10, 10);
//  Sleep(FSleepConfig.I['setClick'] * 1000);
//
////  SetArticleText(nil, 'Hong Kong');
//  Sleep(FSleepConfig.I['setContent'] * 1000);
//
//  chromium1.ExecuteJavaScript('setCountry(1);', 'about:blank');

end;

//过滤城市测试
procedure TFrameBaseWebBrowser.btnChoseCountryClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(TestChoseCountry_ThreadProc).Start;
end;

////搜索用户公共主页
//function TFrameBaseWebBrowser.SearchUserPublicPage(ATaskItem: TTaskItem; ASearchType: string; AParams: ISuperObject; APageIndex: Integer): ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  ARecordList: ISuperArray;
//  ARecordDataJson: ISuperObject;
//  AStartTime: TDateTime;
//  ACityArray: ISuperArray; //关联城市个数
//
//  I: Integer;
//  ASuperObject: ISuperObject;
//  APageSuperObject: ISuperObject;
//  APageUserCount: Integer;
//begin
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  try
//    if GlobalSearchLog = nil then
//    begin
//      GlobalSearchLog := TBaseLog.Create('pageSearch.log');
//    end;
//
//    //加载facebookAPI脚本
//    Self.LoadFacebookAPI;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//    if APageIndex = 1 then
//    begin
//      FStartPageUserIndex := 0;
//      FGetFinishedCount := 0;
//
//      if AParams.S['SearchType'] = 'auto' then
//      begin
//        //加载首页
//        chromium1.ExecuteJavaScript('loadHome();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['loadHome'] * 1000);
//
//        //点击搜索框，设置搜索词
//        uBaseLog.HandleException(nil, '====================【公共主页当前搜索词：' + AParams.S['keyword'] + '】====================');
//
//        //获取主页搜索框坐标后开始搜索
//        chromium1.ExecuteJavaScript('getHomeInputPos("getHomeInputPosFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getHomeInputPosFinished', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          uBaseLog.HandleException(nil, '====================【获取主页搜索框坐标 失败：' + ASuperObject.AsJson() + '】====================');
//          ADesc := '获取主页搜索框坐标 失败';
//          Exit;
//        end
//        else
//        begin
//          uBaseLog.HandleException(nil, '====================【获取主页搜索框坐标 成功：' + ASuperObject.AsJson() + '】====================');
//
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(1000);
//
//          SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setClick'] * 1000);
//
//          //设置搜索文本
//          SetSearchText(nil, AParams.S['keyword']);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setDownContent'] * 1000);
//
//          //============================ 关联搜索 ==============================
//
//          //如果是从菜单发起的第一次搜索，获取当前搜索词的关联词
//          if AParams.B['is_fm_search'] = True then
//          begin
//            uBaseLog.HandleException(nil, '====================【首次搜索，开始获取关联词】====================');
//
//            chromium1.ExecuteJavaScript('getRelatedWords("getRelatedWordsFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getRelatedWordsFinished', 10, True);
//            if ASuperObject.I['Code'] <> SUCC then
//            begin
//              uBaseLog.HandleException(nil, '====================【获取首次搜索关联词 失败：' + ASuperObject.AsJson() + '】====================');
//              //Exit;
//            end
//            else
//            begin
//              uBaseLog.HandleException(nil, '====================【获取首次搜索关联词 成功：' + ASuperObject.AsJson() + '】====================');
//
//              FRelatedWordsArray := TSuperArray.Create(ASuperObject.A['relatedWordsArray'].AsJson());
//
//              uBaseLog.HandleException(nil, '====================【首次搜索关联词数组：' + FRelatedWordsArray.AsJson() + '】====================');
//            end;
//
//          end;
//
//          //====================================================================
//
//          //开始搜索
//          chromium1.ExecuteJavaScript('doPagesSearch();', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['doPagesSearch'] * 1000);
//
//        end;
//        if FAPI.FIsWillLogout then
//          Exit;
//
//
//        {$REGION '过滤结果城市位置'}
//        if AParams.S['country'] <> '' then
//        begin
//          uBaseLog.HandleException(nil, '====================【当前过滤城市：' + AParams.S['country'] + '】====================');
//
//          //获取城市过滤输入框高度
//          chromium1.ExecuteJavaScript('getCountryInputPos("getCountryInputPosFinished");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getCountryInputPosFinished', 10, True);
//          if ASuperObject.I['Code'] <> SUCC then
//          begin
//            uBaseLog.HandleException(nil, '====================【获取城市过滤输入框坐标 失败：' + ASuperObject.AsJson() + '】====================');
//            //Exit;
//          end
//          else
//          begin
//            uBaseLog.HandleException(nil, '====================【获取城市过滤输入框坐标 成功：' + ASuperObject.AsJson() + '】====================');
//
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(1000);
//
//            //点击城市输入框
//            SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['setClick'] * 1000);
//
//            //设置城市文本
//            SetArticleText(nil, AParams.S['country']);
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['setDownContent'] * 1000);
//
//            //=========================== 城市过滤 =============================
//
//            //把城市列表存下来，搜完当前城市后接着搜下一个
//            chromium1.ExecuteJavaScript('getCityArray("getCityArrayFinished");', 'about:blank');
//            ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getCityArrayFinished', 10, True);
//            if ASuperObject.I['Code'] <> SUCC then
//            begin
//              uBaseLog.HandleException(nil, '====================【获取关联城市数据 失败：' + ASuperObject.AsJson() + '】====================');
//              //Exit;
//            end
//            else
//            begin
//              uBaseLog.HandleException(nil, '====================【获取关联城市数据 成功：' + ASuperObject.AsJson() + '】====================');
//
//              ACityArray := TSuperArray.Create(ASuperObject.A['cityArray'].AsJson());
//
//              uBaseLog.HandleException(nil, '====================【首次过滤城市数组：' + ACityArray.AsJson() + '】====================');
//            end;
//
//            //==================================================================
//
//            //点击第一个城市
//            chromium1.ExecuteJavaScript('setCountry(1);', 'about:blank');
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['setClick'] * 1000);
//
//            FNowCityAreaIndex := 1;
//
//            if (ACityArray <> nil) and (ACityArray.Length > 0) then
//            begin
//              uBaseLog.HandleException(nil, '====================【当前城市区域：' + ACityArray.S[0] + '】====================');
//            end;
//
//          end;
//          if FAPI.FIsWillLogout then
//            Exit;
//
//        end;
//        {$ENDREGION}
//
//        //过滤结果是否为商店
//        if AParams.B['is_shop'] = True then
//        begin
//          chromium1.ExecuteJavaScript('setIsShopOrPublicGroup();', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['clickDownItem'] * 1000);
//        end;
//
//
//        //过滤结果是否已认证
//        if AParams.B['is_certified'] = True then
//        begin
//          chromium1.ExecuteJavaScript('setIsCertifiedOrMyGroup();', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['clickDownItem'] * 1000);
//        end;
//
//
//        //过滤结果类别
//        if (AParams.I['category'] <> -1) and (AParams.I['category'] <> 6) then
//        begin
//          chromium1.ExecuteJavaScript('setCategory(' + IntToStr(AParams.I['category'] + 1) + ');', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setDownContent'] * 1000);
//        end;
//
//        //如果是单独的关键词搜索，就加5秒延时
//        if (AParams.S['country'] = '') and (AParams.B['is_shop'] <> True) and (AParams.B['is_certified'] <> True) and ((AParams.I['category'] = -1) or (AParams.I['category'] = 6)) then
//        begin
//          uBaseLog.HandleException(nil, '====================【单独关键词搜索，延时+5s】====================');
//          Sleep(5000);
//        end;
//
//      end;
//
//    end
//    else
//    begin
//      //加载下一页 / 切换下一个区域继续搜索
//
//      if (AParams.S['country'] <> '') and (AParams.Contains('has_more_area')) and (AParams.B['has_more_area'] = True) then
//      begin
//        //重置当前页用户个数/开始位置
//        FStartPageUserIndex := 0;
//
//        //清除当前城市区域
//        chromium1.ExecuteJavaScript('deleteNowCityArea();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['clickDownItem'] * 1000);
//
//        //设置下一个城市区域
//        FNowCityAreaIndex := FNowCityAreaIndex + 1;
//        uBaseLog.HandleException(nil, '====================【当前城市区域：' + AParams.A['city_array'].S[FNowCityAreaIndex] + '】====================');
//
//        //获取城市过滤输入框高度
//        chromium1.ExecuteJavaScript('getCountryInputPos("getCountryInputPosFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getCountryInputPosFinished', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          uBaseLog.HandleException(nil, '====================【获取城市过滤输入框坐标 失败：' + ASuperObject.AsJson() + '】====================');
//          Exit;
//        end
//        else
//        begin
//          uBaseLog.HandleException(nil, '====================【获取城市过滤输入框坐标 成功：' + ASuperObject.AsJson() + '】====================');
//
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(1000);
//
//          //点击城市输入框
//          SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setClick'] * 1000);
//
//          //设置城市文本
//          SetArticleText(nil, AParams.S['country']);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setDownContent'] * 1000);
//
//          //点击下一个城市区域
//          chromium1.ExecuteJavaScript('setCountry(' + IntToStr(FNowCityAreaIndex + 1) + ');', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['clickDownItem'] * 1000);
//
//        end;
//        if FAPI.FIsWillLogout then
//          Exit;
//
//      end
//      else
//      begin
//        chromium1.ExecuteJavaScript('loadNextPage();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['loadNextPage'] * 1000);
//      end;
//
//    end;
//
//    ADataJson := TSuperObject.Create;
//    ADataJson.B['has_next_page'] := False;
//
//    //如果是首次搜的第一页，把搜索关联词和城市数组存进参数里
//    if APageIndex = 1 then
//    begin
//      if (FRelatedWordsArray <> nil) and (FRelatedWordsArray.length > 0) then
//      begin
//        ADataJson.A['related_words_array'] := FRelatedWordsArray;
//      end;
//
//      if (ACityArray <> nil) and (ACityArray.length > 0) then
//      begin
//        ADataJson.A['city_array'] := ACityArray;
//      end;
//    end;
//
//    ARecordList := TSuperArray.Create;
//
//    {$REGION '获取当前页用户链接数组和个数'}
//    chromium1.ExecuteJavaScript('getPublicUser("getPublicUserFinished");', 'about:blank');
//    APageSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getPublicUserFinished', 10, True);
//    if APageSuperObject.I['Code'] <> SUCC then
//    begin
//      uBaseLog.HandleException(nil, '====================【获取当前页用户个数 失败：' + APageSuperObject.S['err'] + '】====================');
//
//      Exit;
//    end
//    else
//    begin
//      uBaseLog.HandleException(nil, '====================【获取当前页用户个数 成功：' + IntToStr(APageSuperObject.I['publicUserCount'] - FStartPageUserIndex) + '】====================');
//
//      if APageSuperObject.I['hasNextPage'] = 1 then
//      begin
//
//        uBaseLog.HandleException(nil, '====================【有 下一页】====================');
//        ADataJson.B['has_next_page'] := True;
//
//        ADataJson.B['has_more_area'] := False;
//
//      end
//      else
//      begin
//
//        uBaseLog.HandleException(nil, '====================【当前页码：' + IntToStr(APageIndex) + ' | 当前区域下标：' + IntToStr(FNowCityAreaIndex) + '】====================');
//
//        if AParams.S['country'] <> '' then
//        begin
//
//          if APageIndex = 1 then
//          begin
//
//            if (ACityArray <> nil) and (ACityArray.length > 1) then
//            begin
//
//              uBaseLog.HandleException(nil, '====================【无 下一页，有 关联城市区域，切换区域继续搜索】====================');
//              ADataJson.B['has_next_page'] := True;
//              ADataJson.B['has_more_area'] := True;
//
//            end
//            else
//            begin
//              uBaseLog.HandleException(nil, '====================【无 下一页，无 关联城市区域】====================');
//            end;
//
//          end
//          else
//          begin
//
//            if (AParams.Contains('city_array')) and (AParams.A['city_array'].Length - 1 > FNowCityAreaIndex) then
//            begin
//              uBaseLog.HandleException(nil, '====================【无 下一页，有 关联城市区域，切换区域继续搜索】====================');
//              ADataJson.B['has_next_page'] := True;
//
//              ADataJson.B['has_more_area'] := True;
//            end
//            else
//            begin
//              uBaseLog.HandleException(nil, '====================【无 下一页，无 关联城市区域】====================');
//            end;
//
//          end;
//
//        end
//        else
//        begin
//          uBaseLog.HandleException(nil, '====================【无 下一页】====================');
//        end;
//
//      end;
//    end;
//    if FAPI.FIsWillLogout then
//      Exit;
//    {$ENDREGION}
//
//    {$REGION '如果主页用户个数大于0'}
//    if APageSuperObject.I['publicUserCount'] <> 0 then
//    begin
//
//      AStartTime := Now;
//      if FFacebookPageSearchAPIFrame = nil then
//      begin
//        TThread.Synchronize(nil,
//          procedure
//          begin
//            FFacebookPageSearchAPIFrame := TFrameFacebookWebSearchAPI.Create(nil);
//          //FFacebookPageSearchAPIFrame.Chromium1.DefaultWindowInfoExStyle := FFacebookPageSearchAPIFrame.Chromium1.DefaultWindowInfoExStyle;
//            FFacebookPageSearchAPIFrame.GetAPI(FAPI);
//
//            FFacebookPageSearchAPIFrame.Parent := Self;
//            FFacebookPageSearchAPIFrame.Align := alBottom;
//            FFacebookPageSearchAPIFrame.Height := ScreenScaleSizeInt(300);
//  //        FFacebookPageSearchAPIFrame.Visible:= False;
//          end);
//      end
//      else
//      begin
//        FFacebookPageSearchAPIFrame.Visible := True;
//      end;
//      Sleep(2000);
//
//      for I := FStartPageUserIndex to APageSuperObject.I['publicUserCount'] - 1 do
//      begin
//        //当前已执行获取用户信息位置个数
//        FGetFinishedCount := FGetFinishedCount + 1;
//
//        uBaseLog.HandleException(nil, '====================【加载第 ' + IntToStr(FGetFinishedCount) + ' 个链接：' + APageSuperObject.A['userLinkArray'].S[I] + '】====================');
//
//        //等待FFacebookWebSearchAPIFrame在OperationCenterFrame运营中心页创建完成
//        while (not FFacebookPageSearchAPIFrame.FIsInited) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < FAPI.FSearchAndJoinTimeoutInterval) and not FAPI.FIsWillLogout do
//        begin
//          uBaseLog.HandleException(nil, '====================【主页搜索获取用户信息 等待页面加载完成】====================' + FAPI.FAccount.S['nickname']);
//          Sleep(1000);
//        end;
//
//        //----------------------------------------------------------------------
//
//        //检测页面是否加载结束
//        AStartTime := Now;
//        FFacebookPageSearchAPIFrame.FIsLoaded := False;
//        //FFacebookPageSearchAPIFrame.Chromium1.Browser.MainFrame.LoadUrl();
//        FFacebookPageSearchAPIFrame.Chromium1.LoadUrl(APageSuperObject.A['userLinkArray'].S[I]);
//        while (not FFacebookPageSearchAPIFrame.FIsLoaded) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not FFacebookPageSearchAPIFrame.FAPI.FIsWillLogout do
//        begin
//          uBaseLog.HandleException(nil, '====================【检测待获取公共主页 是否加载完成】====================');
//          Sleep(1000);
//        end;
//        if FFacebookPageSearchAPIFrame.FAPI.FIsWillLogout then
//          Exit;
//        if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//        begin
//          uBaseLog.HandleException(nil, '====================【加载 待获取公共主页 超时，尝试开始获取信息】====================');
//        end;
//        //等待页面显示完全
//        Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//        //加载facebookAPI脚本
//        uBaseLog.HandleException(nil, '====================【公共主页加载完毕，开始加载脚本】====================');
//        FFacebookPageSearchAPIFrame.LoadFacebookAPI;
//        if FFacebookPageSearchAPIFrame.FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//        //----------------------------------------------------------------------
//
//        //开始获取联系方式
//        FFacebookPageSearchAPIFrame.chromium1.ExecuteJavaScript('getContact("getContactFinished");', 'about:blank');
//        ASuperObject := FFacebookPageSearchAPIFrame.FGetedMessageList.CheckMessageIsReceivedJson('getContactFinished', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          uBaseLog.HandleException(nil, '====================【获取当前第 ' + IntToStr(FGetFinishedCount) + ' 个公共主页联系方式 失败：' + ASuperObject.S['err'] + '】====================');
////          Exit;
//
//          //保存到本地日志
//          GlobalSearchLog.IsWriteLog := True;
//          if I = FStartPageUserIndex then
//          begin
//            if AParams.S['SearchType'] = 'auto' then
//            begin
//              GlobalSearchLog.WriteLog('====================【当前搜索词：' + AParams.S['keyword'] + '】====================');
//            end;
//
//            if AParams.S['SearchType'] = 'manaul' then
//            begin
//              GlobalSearchLog.WriteLog('====================【当前为手动搜索结果】====================');
//            end;
//          end;
//          GlobalSearchLog.WriteLog(UTFStrToUnicode(ASuperObject.O['contactObj'].AsJson()));
//        end
//        else
//        begin
//          uBaseLog.HandleException(nil, '====================【获取当前第 ' + IntToStr(FGetFinishedCount) + ' 个公共主页联系方式 成功：' + ASuperObject.O['contactObj'].AsJson() + '】====================');
//
//          FReceivedUserDataJson := ASuperObject.O['contactObj'];
//
//          //保存到本地日志
//          GlobalSearchLog.IsWriteLog := True;
//          if I = FStartPageUserIndex then
//          begin
//            if AParams.S['SearchType'] = 'auto' then
//            begin
//              GlobalSearchLog.WriteLog('====================【当前搜索词：' + AParams.S['keyword'] + '】====================');
//            end;
//
//            if AParams.S['SearchType'] = 'manaul' then
//            begin
//              GlobalSearchLog.WriteLog('====================【当前为手动搜索结果】====================');
//            end;
//          end;
//          GlobalSearchLog.WriteLog(UTFStrToUnicode(FReceivedUserDataJson.AsJson()));
//
//        end;
//        if FFacebookPageSearchAPIFrame.FAPI.FIsWillLogout then
//          Exit;
//
//        //如果当前查询对象联系方式不为空
//        if FReceivedUserDataJson <> nil then
//        begin
//          if (FReceivedUserDataJson.S['phone'] <> '') or (FReceivedUserDataJson.S['email'] <> '') or (FReceivedUserDataJson.S['twitter'] <> '') or (FReceivedUserDataJson.S['youtube'] <> '') or (FReceivedUserDataJson.S['instagram'] <> '') or (FReceivedUserDataJson.S['otherLinks'] <> '') then
//          begin
//
//              //用户信息记录字段规范
//            ARecordDataJson := TSuperObject.Create;
//            ARecordDataJson.S['name'] := FReceivedUserDataJson.S['name'];
//            ARecordDataJson.S['from_platform'] := 'facebook';
//
//            if AParams.S['SearchType'] = 'auto' then
//            begin
//
//              ARecordDataJson.S['key_word'] := AParams.S['keyword'];
//            ARecordDataJson.S['search_keyword'] := AParams.S['keyword'];
//              ARecordDataJson.I['is_fm_search'] := Ord(AParams.B['is_fm_search']);
//              ARecordDataJson.S['task_start_time'] := FormatDateTime('YYYY-MM-DD HH:MM:SS', ATaskItem.ParentTask.StartTime);
//              ARecordDataJson.S['country'] := AParams.S['country'];
//
//              if AParams.S['country'] <> '' then
//              begin
//
//                if ACityArray <> nil then
//                begin
//                  ARecordDataJson.S['area'] := ACityArray.S[0];
//                end
//                else
//                begin
//                  if AParams.Contains('city_array') then
//                  begin
//                    ARecordDataJson.S['area'] := AParams.A['city_array'].S[FNowCityAreaIndex];
//                  end;
//                end;
//
//              end;
//
//              ARecordDataJson.I['is_shop'] := Ord(AParams.B['is_shop']);
//              ARecordDataJson.I['is_certified'] := Ord(AParams.B['is_certified']);
//
//            end;
//
//            ARecordDataJson.I['likes_count'] := FReceivedUserDataJson.I['likesCount'];
//            ARecordDataJson.I['fans_count'] := FReceivedUserDataJson.I['fansCount'];
//            ARecordDataJson.S['phone'] := FReceivedUserDataJson.S['phone'];
//            ARecordDataJson.S['email'] := FReceivedUserDataJson.S['email'];
//            ARecordDataJson.S['website'] := FReceivedUserDataJson.S['website'];
//            ARecordDataJson.S['createtime'] := StdDatetimeToStr(Now);
//            ARecordDataJson.S['twitter_url'] := FReceivedUserDataJson.S['twitter'];
//            ARecordDataJson.S['youtube_url'] := FReceivedUserDataJson.S['youtube'];
//            ARecordDataJson.S['instagram_url'] := FReceivedUserDataJson.S['instagram'];
//            ARecordDataJson.S['other_url'] := FReceivedUserDataJson.S['otherLinks'];
//
//              //================================================================
//
//              //获取用户信息成功
//            ATaskItem.DataIntfResult.Succ := True;
//            ATaskItem.DataIntfResult.DataType := ldtJson;
//            ATaskItem.DataIntfResult.DataJson := TSuperObject.Create();
//            ATaskItem.DataIntfResult.DataJson.A['RecordList'].O[0] := ARecordDataJson;
//
//            if Assigned(ATaskItem.OnWorkThreadProgress) then
//            begin
//              ATaskItem.OnWorkThreadProgress(Self, nil, ATaskItem, ATaskItem.DataIntfResult);
//            end;
//
//            ARecordList.O[ARecordList.Length] := ARecordDataJson;
//
//            uBaseLog.HandleException(nil, '====================【清空当前页用户信息】====================');
//              //清空收到的用户信息
//            FReceivedUserDataJson := nil;
//          end;
//
//        end;
//
//        Sleep(1000);
//
//      end;
//
//      //当前页搜索完后，执行清空自动创建的右下角对话列表
//      FFacebookPageSearchAPIFrame.chromium1.ExecuteJavaScript('clearContact();', 'about:blank');
//      if FFacebookPageSearchAPIFrame.FAPI.FIsWillLogout then
//        Exit;
//      Sleep(2000);
//
//      //保存当前页结果数，作为下一次开始坐标
//      FStartPageUserIndex := APageSuperObject.I['publicUserCount'];
//
//      ADataJson.A['RecordList'] := ARecordList;
//      ADataJson.B['IsProgressCalled'] := True;
//
//    end;
//    {$ENDREGION}
//
//    //搜索当前页成功
//    ACode := SUCC;
//    ADesc := '搜索成功';
//
//  finally
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//  end;
//
//end;
//
////群组搜索
//function TFrameBaseWebBrowser.SearchPublicGroup(ATaskItem: TTaskItem; ASearchType: string; AParams: ISuperObject; APageIndex: Integer): ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  ARecordList: ISuperArray;
//  ARecordDataJson: ISuperObject;
//  I: Integer;
//  ASuperObject: ISuperObject;
//  AGroupSuperObject: ISuperObject;
//  AGroupItemSuperObject: ISuperObject;
//  APageUserCount: Integer;
//begin
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  try
//
//    //加载facebookAPI脚本
//    Self.LoadFacebookAPI;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//    if APageIndex = 1 then
//    begin
//      FStartGroupIndex := 0;
//      FGetGroupFinishedCount := 0;
//
//      if AParams.S['SearchType'] = 'auto' then
//      begin
//
//        //加载首页
//        chromium1.ExecuteJavaScript('loadHome();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['loadHome'] * 1000);
//
//        //点击搜索框，设置搜索词
//        uBaseLog.HandleException(nil, '====================【群组搜索当前搜索词：' + AParams.S['keyword'] + '】====================');
//
//
//        //获取主页搜索框坐标后开始搜索
//        chromium1.ExecuteJavaScript('getHomeInputPos("getHomeInputPosFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getHomeInputPosFinished', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          uBaseLog.HandleException(nil, '====================【获取主页搜索框坐标 失败：' + ASuperObject.AsJson() + '】====================');
//          Exit;
//        end
//        else
//        begin
//          uBaseLog.HandleException(nil, '====================【获取主页搜索框坐标 成功：' + ASuperObject.AsJson() + '】====================');
//
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(1000);
//
//          SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setClick'] * 1000);
//
//          SetSearchText(nil, AParams.S['keyword']);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(5000);
//
//          //开始搜索
//          chromium1.ExecuteJavaScript('doGroupSearch();', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(5000);
//
//        end;
//        if FAPI.FIsWillLogout then
//          Exit;
//
//        {$REGION '过滤结果城市位置'}
//        if AParams.S['country'] <> '' then
//        begin
//          uBaseLog.HandleException(nil, '====================【当前过滤城市：' + AParams.S['country'] + '】====================');
//
//          //获取城市过滤输入框高度
//          chromium1.ExecuteJavaScript('getCountryInputPos("getCountryInputPosFinished");', 'about:blank');
//          ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getCountryInputPosFinished', 10, True);
//          if ASuperObject.I['Code'] <> SUCC then
//          begin
//            uBaseLog.HandleException(nil, '====================【获取城市过滤输入框坐标 失败：' + ASuperObject.AsJson() + '】====================');
//            Exit;
//          end
//          else
//          begin
//            uBaseLog.HandleException(nil, '====================【获取城市过滤输入框坐标 成功：' + ASuperObject.AsJson() + '】====================');
//
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(1000);
//
//            SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['setClick'] * 1000);
//
//            SetArticleText(nil, AParams.S['country']);
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(FSleepConfig.I['setDownContent'] * 1000);
//
//            chromium1.ExecuteJavaScript('setCountry(1);', 'about:blank');
//            if FAPI.FIsWillLogout then
//              Exit;
//            Sleep(3000);
//          end;
//          if FAPI.FIsWillLogout then
//            Exit;
//        end;
//        {$ENDREGION}
//
//        //过滤结果是否为公开小组
//        if AParams.B['is_public_group'] = True then
//        begin
//          chromium1.ExecuteJavaScript('setIsShopOrPublicGroup();', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(3000);
//        end;
//
//        //过滤结果是否为我的小组
//        if AParams.B['is_my_group'] = True then
//        begin
//          chromium1.ExecuteJavaScript('setIsCertifiedOrMyGroup();', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(4000);
//        end;
//
//        //等待结果页面加载完毕
//        Sleep(3000);
//        if FAPI.FIsWillLogout then
//          Exit;
//
//      end;
//
//    end
//    else
//    begin
//      //加载下一页
//      chromium1.ExecuteJavaScript('loadNextPage();', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(5000);
//    end;
//
//    ADataJson := TSuperObject.Create;
//    ADataJson.B['has_next_page'] := False;
//
//    ARecordList := TSuperArray.Create;
//
//    //获取当前页群组数据
//    chromium1.ExecuteJavaScript('getGroupInfo("getGroupInfoFinished");', 'about:blank');
//    AGroupSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getGroupInfoFinished', 10, True);
//    if AGroupSuperObject.I['Code'] <> SUCC then
//    begin
//      uBaseLog.HandleException(nil, '====================【获取当前页群组数据 失败：' + AGroupSuperObject.AsJson() + '】====================');
//      Exit;
//    end
//    else
//    begin
//      uBaseLog.HandleException(nil, '====================【获取当前页群组数据 成功，群组个数：' + IntToStr(AGroupSuperObject.I['groupsCount'] - FStartGroupIndex) + '】====================');
//
//      if AGroupSuperObject.I['hasNextPage'] = 1 then
//      begin
//        uBaseLog.HandleException(nil, '====================【有 下一页】====================');
//        ADataJson.B['has_next_page'] := True;
//      end
//      else
//      begin
//        uBaseLog.HandleException(nil, '====================【无 下一页】====================');
//      end;
//
//    end;
//    if FAPI.FIsWillLogout then
//      Exit;
//
//    //如果当前页群组个数不为0
//    if AGroupSuperObject.I['groupsCount'] <> 0 then
//    begin
//
//      for I := FStartGroupIndex to AGroupSuperObject.I['groupsCount'] - 1 do
//      begin
//        //当前已获取群组个数
//        FGetGroupFinishedCount := FGetGroupFinishedCount + 1;
//
//        AGroupItemSuperObject := TSuperObject.Create(AGroupSuperObject.A['groupArray'].O[I].AsJson());
//
//        uBaseLog.HandleException(nil, '====================【加载第 ' + IntToStr(FGetGroupFinishedCount) + ' 个群组数据：' + AGroupItemSuperObject.AsJson() + '】====================');
//
//        if (AGroupItemSuperObject.S['url'] <> '') then
//        begin
//
//            //用户信息记录字段规范
//          ARecordDataJson := TSuperObject.Create;
//          ARecordDataJson.S['type'] := 'searchGroup';
//          ARecordDataJson.S['from_platform'] := 'facebook';
//          ARecordDataJson.S['key_word'] := AParams.S['keyword'];
//            ARecordDataJson.S['search_keyword'] := AParams.S['keyword'];
//          ARecordDataJson.S['groupname'] := AGroupItemSuperObject.S['groupName'];
//          ARecordDataJson.I['is_joined'] := AGroupItemSuperObject.I['isJoined'];
//          ARecordDataJson.S['head_pic_path'] := AGroupItemSuperObject.S['head_pic_path'];
//
//          if AParams.S['SearchType'] = 'auto' then
//          begin
//            ARecordDataJson.S['country'] := AParams.S['country'];
//            ARecordDataJson.I['is_my_group'] := Ord(AParams.B['is_my_group']);
//            ARecordDataJson.I['is_public_group'] := Ord(AParams.B['is_public_group']);
//          end;
//
//          ARecordDataJson.S['group_member_count'] := AGroupItemSuperObject.S['userCount'];
//          ARecordDataJson.S['website'] := AGroupItemSuperObject.S['url'];
//          ARecordDataJson.S['createtime'] := StdDatetimeToStr(Now);
//          ARecordDataJson.S['introduction'] := AGroupItemSuperObject.S['introduction'];
//
//          ARecordList.O[ARecordList.Length] := ARecordDataJson;
//
//        end;
//
//      end;
//
//      FStartGroupIndex := AGroupSuperObject.I['groupsCount'];
//
//      ADataJson.A['RecordList'] := ARecordList;
//
//    end;
//
//    //搜索当前页成功
//    ACode := SUCC;
//    ADesc := '搜索成功';
//
//  finally
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//  end;
//
//end;
//
////添加群组
//function TFrameBaseWebBrowser.JoinGroup(AGroupJson: ISuperObject): ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  ASuperObject: ISuperObject;
//  AStartTime: TDateTime;
//  ASleepTime: Integer;
//  I: Integer;
//begin
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  try
//
//    //加载facebookAPI脚本
//    Self.LoadFacebookAPI;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//    AStartTime := Now;
//    if FFacebookPageSearchAPIFrame = nil then
//    begin
//      TThread.Synchronize(nil,
//        procedure
//        begin
//          FFacebookPageSearchAPIFrame := TFrameFacebookWebSearchAPI.Create(nil);
//          FFacebookPageSearchAPIFrame.GetAPI(FAPI);
//
//          FFacebookPageSearchAPIFrame.Parent := Self;
//          FFacebookPageSearchAPIFrame.Align := alBottom;
//          FFacebookPageSearchAPIFrame.Height := ScreenScaleSizeInt(300);
////        FFacebookPageSearchAPIFrame.Visible:= False;
//        end);
//    end
//    else
//    begin
//      FFacebookPageSearchAPIFrame.Visible := True;
//    end;
//
//    uBaseLog.HandleException(nil, '====================【添加小组链接：' + AGroupJson.S['groupLink'] + '】====================');
//
//    //等待FFacebookWebSearchAPIFrame在OperationCenterFrame运营中心页创建完成
//    while (not FFacebookPageSearchAPIFrame.FIsInited) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < FAPI.FSearchAndJoinTimeoutInterval) and not FAPI.FIsWillLogout do
//    begin
//      uBaseLog.HandleException(nil, '====================【API 添加 小组前检测浏览器是否初始完成】====================' + FAPI.FAccount.S['nickname']);
//      Sleep(1000);
//    end;
//
//    FFacebookPageSearchAPIFrame.Chromium1.LoadUrl(AGroupJson.S['groupLink']);
//    if FFacebookPageSearchAPIFrame.FAPI.FIsWillLogout then
//      Exit;
//    Sleep(3000);
//
//    FFacebookPageSearchAPIFrame.LoadFacebookAPI;
//    if FFacebookPageSearchAPIFrame.FAPI.FIsWillLogout then
//      Exit;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//    //开始加组
//    FFacebookPageSearchAPIFrame.chromium1.ExecuteJavaScript('ifJoinedGroup("ifJoinedGroupFinished");', 'about:blank');
//    ASuperObject := FFacebookPageSearchAPIFrame.FGetedMessageList.CheckMessageIsReceivedJson('ifJoinedGroupFinished', 10, True);
//    if ASuperObject.I['Code'] <> SUCC then
//    begin
//      uBaseLog.HandleException(nil, '====================【添加当前小组链接 失败：' + ASuperObject.S['err'] + '】====================');
////          Exit;
//    end
//    else
//    begin
//      uBaseLog.HandleException(nil, '====================【添加当前小组链接 成功：' + ASuperObject.AsJson() + '】====================');
//    end;
//    if FFacebookPageSearchAPIFrame.FAPI.FIsWillLogout then
//      Exit;
//
//    uBaseLog.HandleException(nil, '====================【最小时间间隔：' + IntToStr(AGroupJson.I['min_interval']) + ' 秒。最大时间间隔：' + IntToStr(AGroupJson.I['max_interval']) + ' 秒】====================');
//    ASleepTime := Random(AGroupJson.I['max_interval'] - AGroupJson.I['min_interval']) + AGroupJson.I['min_interval'];
//    uBaseLog.HandleException(nil, '====================【本次休眠：' + IntToStr(ASleepTime) + ' 秒】====================');
//
//    Sleep(ASleepTime * 1000);
//
//    //添加当前小组成功
//    ACode := SUCC;
//    ADesc := '添加当前小组成功';
//
//  finally
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//  end;
//
//end;
//
////删除群组（2022.8.19 先不用管这个，之后载更新脚本）
//function TFrameBaseWebBrowser.DeleteGroup: ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  ASuperObject: ISuperObject;
//  AGroupLinkArray: ISuperArray;
//  I: Integer;
//
//  //当前登录获取到的小组数
//  AGroupCount: Integer;
//  AStartTime: TDateTime;
//  ADeletedCount, ADeleteErrCount: Integer;
//  AUpdateDataJson: ISuperObject;
//  ADataInterface: TDataInterface;
//  ASaveDataSetting: TSaveDataSetting;
//  ADataIntfResult: TDataIntfResult;
//begin
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  try
//      //加载facebookAPI脚本
//    Self.LoadFacebookAPI;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//    chromium1.ExecuteJavaScript('getAllSelfGroupLinkArray("getAllSelfGroupLinkArrayFinished");', 'about:blank');
//    ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getAllSelfGroupLinkArrayFinished', 60, True);
//    if ASuperObject.I['Code'] <> SUCC then
//    begin
//      uBaseLog.HandleException(nil, '====================【获取当前账号全部小组链接 失败：' + ASuperObject.AsJson() + '】====================');
//      Exit;
//    end
//    else
//    begin
//      uBaseLog.HandleException(nil, '====================【获取当前账号全部小组链接 成功：' + ASuperObject.AsJson() + '】====================');
//
//      try
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(1000);
//
//              //创建或显示删组专用Frame
//        AStartTime := Now;
//        if FFacebookPageSearchAPIFrame = nil then
//        begin
//          TThread.Synchronize(nil,
//            procedure
//            begin
//              FFacebookPageSearchAPIFrame := TFrameFacebookWebSearchAPI.Create(nil);
//              FFacebookPageSearchAPIFrame.GetAPI(FAPI);
//
//              FFacebookPageSearchAPIFrame.Parent := Self;
//              FFacebookPageSearchAPIFrame.Align := alBottom;
//              FFacebookPageSearchAPIFrame.Height := ScreenScaleSizeInt(300);
//                      //FFacebookPageSearchAPIFrame.Visible:= False;
//            end);
//        end
//        else
//        begin
//          FFacebookPageSearchAPIFrame.Visible := True;
//        end;
//
//              //等待FFacebookWebSearchAPIFrame在OperationCenterFrame运营中心页创建完成
//        while (not FFacebookPageSearchAPIFrame.FIsInited) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < FAPI.FSearchAndJoinTimeoutInterval) and not FAPI.FIsWillLogout do
//        begin
//          uBaseLog.HandleException(nil, '====================【API 删除 小组前检测浏览器是否初始完成】====================' + FAPI.FAccount.S['nickname']);
//          Sleep(1000);
//        end;
//
//        if (not FFacebookPageSearchAPIFrame.FIsInited) or (DateUtils.SecondsBetween(Now, AStartTime) > FAPI.FSearchAndJoinTimeoutInterval) or FAPI.FIsWillLogout then
//        begin
//          ADesc := '创建删除全部小组页面 超时';
//
//                  //加载超时，隐藏专用Frame
//          uBaseLog.HandleException(nil, '====================【创建删除全部小组页面 超时】====================');
//          TThread.Synchronize(nil,
//            procedure
//            begin
//              ShowMessage('创建删除全部小组页面 超时');
//            end);
//
//          Exit;
//        end;
//
//              //小组链接数组赋值
//        AGroupLinkArray := TSuperArray.Create;
//        AGroupLinkArray := ASuperObject.A['group_link_array'];
//
//        AGroupCount := AGroupLinkArray.Length;
//
//        ADeletedCount := 0;
//        ADeleteErrCount := 0;
//
//        for I := 0 to AGroupLinkArray.Length - 1 do //正式用
//              //for I := 0 to 2-1 do  //测试用
//        begin
//          FFacebookPageSearchAPIFrame.Chromium1.LoadUrl(AGroupLinkArray.S[I]);
//          if FFacebookPageSearchAPIFrame.FAPI.FIsWillLogout then
//            Exit;
//          Sleep(3000);
//
//          FFacebookPageSearchAPIFrame.LoadFacebookAPI;
//          if FFacebookPageSearchAPIFrame.FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//                  //执行当前页删组
//          FFacebookPageSearchAPIFrame.chromium1.ExecuteJavaScript('DeleteGroup("DeleteGroupFinished");', 'about:blank');
//          ASuperObject := FFacebookPageSearchAPIFrame.FGetedMessageList.CheckMessageIsReceivedJson('DeleteGroupFinished', 30, True);
//          if ASuperObject.I['Code'] <> SUCC then
//          begin
//            uBaseLog.HandleException(nil, '====================【删除当前页小组 失败：' + ASuperObject.AsJson() + '】====================');
//            ADeleteErrCount := ADeleteErrCount + 1;
//                      //Exit;
//          end
//          else
//          begin
//            uBaseLog.HandleException(nil, '====================【删除当前页小组 成功：' + ASuperObject.AsJson() + '】====================');
//            ADeletedCount := ADeletedCount + 1;
//          end;
//        end;
//
//      finally
//              //删除小组结束后同步释放搜索专用Frame
//        uBaseLog.HandleException(nil, '====================【删除小组结束，隐藏 删除专用Frame】====================');
//        TThread.Synchronize(nil,
//          procedure
//          begin
//            FFacebookPageSearchAPIFrame.Visible := False;
//
//            if AGroupLinkArray.Length <> 0 then
//            begin
//
//              if ADeletedCount <> 0 then
//              begin
//                          //如果删除了小组就返回数据用来更新
//                ADataJson := TSuperObject.Create;
//                ADataJson.I['group_count'] := AGroupCount - ADeletedCount;
//
//                          //如果删除了小组则重载刷新网页
//                Self.Chromium1.LoadUrl('https://www.facebook.com/');
//                Sleep(3000);
//
//              end;
//
//              if ADeleteErrCount = 0 then
//              begin
//                ShowMessage('删除小组结束');
//              end
//              else
//              begin
//                ShowMessage('删除全部小组异常，错误个数：' + IntToStr(ADeleteErrCount));
//              end;
//            end
//            else
//            begin
//              Showmessage('当前账号无小组需要删除。');
//            end;
//          end);
//      end;
//    end;
//    if FAPI.FIsWillLogout then
//      Exit;
//
//      //删除全部小组成功
//    ACode := SUCC;
//    ADesc := '删除全部小组成功';
//
//  finally
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//  end;
//
//end;
//
////群组评论
//function TFrameBaseWebBrowser.GroupComment(AContent: string; AParams: ISuperObject): ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  ASuperObject: ISuperObject;
//  I, J: Integer;
//  AGroupCount: Integer;
//  ASleepTime: Integer;
//  AStartTime: TDateTime;
//  AGroupUrls: ISuperArray;
//  //预设随机字符数组
//const
//  randomStrArr: array[0..76] of string = ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '!', '@', '#', '$', '%', '^', '&', '*', '+', '-', '*', '/', '`', '。', '《', '》', '/', '？', '·', '~', '<', '>', '.', ',', '，');
//begin
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  try
//
////    //加载facebookAPI脚本
////    Self.LoadFacebookAPI;
////    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
////    chromium1.ExecuteJavaScript('getAllGroups();', 'about:blank');
////    ASuperObject:=Self.FGetedMessageList.CheckMessageIsReceivedJson('getAllGroups', 60, True);
////    if ASuperObject.I['Code']<>SUCC then
////    begin
////        uBaseLog.HandleException(nil,'====================【获取群个数JS执行完毕：执行失败】====================');
////        Exit;
////    end
////    else
////    begin
////        uBaseLog.HandleException(nil,'====================【获取群个数JS执行完毕：'+ASuperObject.AsJson+'】====================');
////        AGroupCount:= ASuperObject.I['groupsCount'];
////        AGroupUrls:=ASuperObject.A['groupUrls'];
////    end;
////    if FAPI.FIsWillLogout then Exit;
//
//
//    if AParams.A['groups_array'].Length > 0 then
//    begin
//
//      for I := 0 to AParams.A['groups_array'].Length - 1 do
//      begin
//
//            //检测页面是否加载结束
//        AStartTime := Now;
//        Self.FIsLoaded := False;
//        Self.Chromium1.LoadUrl(AParams.A['groups_array'].O[I].S['website']);
//        while (not Self.FIsLoaded) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not FAPI.FIsWillLogout do
//        begin
//          uBaseLog.HandleException(nil, '====================【API检测 群组页面 是否加载完成】====================');
//          Sleep(1000);
//        end;
//        if FAPI.FIsWillLogout then
//          Exit;
//
//        if DateUtils.SecondsBetween(Now, AStartTime) > FSleepConfig.I['loadPage'] then
//        begin
//              //加载群组页面超时，跳过当前继续下一个
//          uBaseLog.HandleException(nil, '====================【加载 群组页面 超时，继续下一个】====================');
//          Continue;
//        end;
//
//            //加载facebookAPI脚本
//        Self.LoadFacebookAPI;
//        Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//        chromium1.ExecuteJavaScript('getGroupInputPos("getGroupInputPosFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getGroupInputPosFinished', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          uBaseLog.HandleException(nil, '====================【获取小组第一条帖子输入框坐标 失败】====================');
//          Continue;
//        end
//        else
//        begin
//
//          uBaseLog.HandleException(nil, '====================【获取小组第一条帖子输入框坐标 成功】====================');
//
//                //设置鼠标点击输入框
//          SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 5);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setClick'] * 1000);
//
//          Randomize; //随机
//          J := Random(77);
//
//                //设置评论文本
//          SetArticleText(nil, AParams.S['content'] + ' ' + randomStrArr[J]);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setContent'] * 1000);
//
//          SendKeyPressEnter;
//          Sleep(3000);
//
//        end;
//        if FAPI.FIsWillLogout then
//          Exit;
//
//        if I <> AParams.A['groups_array'].Length - 1 then
//        begin
//
//          uBaseLog.HandleException(nil, '====================【最小时间间隔：' + IntToStr(AParams.I['min_interval']) + ' 秒。最大时间间隔：' + IntToStr(AParams.I['max_interval']) + ' 秒】====================');
//          ASleepTime := Random(AParams.I['max_interval'] - AParams.I['min_interval']) + AParams.I['min_interval'];
//          uBaseLog.HandleException(nil, '====================【本次休眠：' + IntToStr(ASleepTime) + ' 秒】====================');
//
//          Sleep(ASleepTime * 1000);
//
//        end;
//
//      end;
//
//    end;
//
//    //群组评论成功
//    ACode := SUCC;
//    ADesc := '群组评论成功';
//  finally
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//  end;
//
//end;
//
////批量私聊
//function TFrameBaseWebBrowser.BatchChat(AContentJson: ISuperObject; AParams: ISuperObject): ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  AUserPosSuperObject: ISuperObject;
//  AMessagePosSuperObject: ISuperObject;
//  I, J: Integer;
//  AGroupCount: Integer;
//  ASleepTime: Integer;
//  AStartTime: TDateTime;
//  AGroupUrls: ISuperArray;
//  //预设随机字符数组
//const
//  randomStrArr: array[0..76] of string = ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '!', '@', '#', '$', '%', '^', '&', '*', '+', '-', '*', '/', '`', '。', '《', '》', '/', '？', '·', '~', '<', '>', '.', ',', '，');
//begin
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  try
//
//    //加载facebookAPI脚本
//    Self.LoadFacebookAPI;
//    Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//    //关闭现存对话
//    chromium1.ExecuteJavaScript('clearContact();', 'about:blank');
//    if FAPI.FIsWillLogout then
//      Exit;
//    Sleep(2000);
//
//    //点击打开私聊窗口
//    chromium1.ExecuteJavaScript('openMessageBox();', 'about:blank');
//    if FAPI.FIsWillLogout then
//      Exit;
//    Sleep(3000);
//
//    //获取私聊对象用户名输入框坐标
//    chromium1.ExecuteJavaScript('getMessageUserPos("getMessageUserPosFinished");', 'about:blank');
//    AUserPosSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getMessageUserPosFinished', 10, True);
//    if AUserPosSuperObject.I['Code'] <> SUCC then
//    begin
//
//      uBaseLog.HandleException(nil, '====================【获取私聊对象用户名输入框坐标 失败】====================');
//
//      //关闭当前对话
//      chromium1.ExecuteJavaScript('clearContact();', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(2000);
//
//    end
//    else
//    begin
//
//      uBaseLog.HandleException(nil, '====================【获取私聊对象用户名输入框坐标 成功】====================');
//
//        //设置鼠标点击输入框
//      SetMouseClick(nil, Ceil(AUserPosSuperObject.F['X']), Ceil(AUserPosSuperObject.F['Y']), 10, 5);
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(FSleepConfig.I['setClick'] * 1000);
//
//        //输入用户名
//      SetArticleText(nil, AParams.S['friendName']);
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(FSleepConfig.I['setDownContent'] * 1000);
//
//        //选择候选框第一个
//      chromium1.ExecuteJavaScript('choseUser();', 'about:blank');
//      if FAPI.FIsWillLogout then
//        Exit;
//      Sleep(FSleepConfig.I['clickDownItem'] * 1000);
//
//        //如果有照片就添加照片
//      if FContentFiles.Count > 0 then
//      begin
//
//            //此方法报错：File chooser dialog can only be shown with a user activation.
////          chromium1.ExecuteJavaScript('addMessageMedia();', 'about:blank');
////          if FAPI.FIsWillLogout then Exit;
////          Sleep(3000);
//
//        chromium1.ExecuteJavaScript('getMessageMediaPos("getMessageMediaPosFinished");', 'about:blank');
//        AMessagePosSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getMessageMediaPosFinished', 10, True);
//        if AMessagePosSuperObject.I['Code'] <> SUCC then
//        begin
//
//          uBaseLog.HandleException(nil, '====================【获取私聊媒体输入框坐标 失败】====================');
//
//        end
//        else
//        begin
//
//          uBaseLog.HandleException(nil, '====================【获取私聊媒体输入框坐标 成功】====================');
//
//                //设置鼠标点击输入框
//          SetMouseClick(nil, Ceil(AMessagePosSuperObject.F['X']), Ceil(AMessagePosSuperObject.F['Y']), 15, 15);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['clickDownItem'] * 1000);
//
//        end;
//
//      end;
//
//        //获取消息输入框坐标
//      chromium1.ExecuteJavaScript('getMessagePos("getMessagePosFinished");', 'about:blank');
//      AMessagePosSuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getMessagePosFinished', 10, True);
//      if AMessagePosSuperObject.I['Code'] <> SUCC then
//      begin
//
//        uBaseLog.HandleException(nil, '====================【获取消息输入框坐标 失败】====================');
//
//            //关闭当前对话
//        chromium1.ExecuteJavaScript('clearContact();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(2000);
//
//      end
//      else
//      begin
//
//        uBaseLog.HandleException(nil, '====================【获取消息输入框坐标 成功】====================');
//
//            //设置鼠标点击输入框
//        SetMouseClick(nil, Ceil(AMessagePosSuperObject.F['X']), Ceil(AMessagePosSuperObject.F['Y']), 10, 3);
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['setClick'] * 1000);
//
//        Randomize; //随机
//        J := Random(77);
//
//            //输入私聊内容
//        SetArticleText(nil, AContentJson.S['content'] + ' ' + randomStrArr[J]);
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(FSleepConfig.I['setContent'] * 1000);
//
//        SendKeyPressEnter;
//        Sleep(3000);
//
//            //关闭当前对话
//        chromium1.ExecuteJavaScript('clearContact();', 'about:blank');
//        if FAPI.FIsWillLogout then
//          Exit;
//        Sleep(3000);
//
//      end;
//
//    end;
//    if FAPI.FIsWillLogout then
//      Exit;
//
//    //群组评论成功
//    ACode := SUCC;
//    ADesc := '批量私聊成功';
//  finally
//    FContentFiles.Clear;
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//  end;
//
//end;
//
////添加新账号
//procedure TFrameBaseWebBrowser.AddNewPlatformAccount(AAPI: TWebSearchAPI);
//var
//  AStartTime: TDateTime;
//begin
//
//  TThread.CreateAnonymousThread(
//    procedure
//    begin
//      AStartTime := Now;
//    //等待FFacebookWebSearchAPIFrame创建完成
//      while (not Self.FIsInited) and (DateUtils.SecondsBetween(Now, AStartTime) < FSleepConfig.I['loadPage']) and not AAPI.FIsWillLogout do
//      begin
//        uBaseLog.HandleException(nil, '====================【新增账号 检测浏览器是否初始完成】====================' + AAPI.FAccount.S['account_guid']);
//        Sleep(1000);
//      end;
//      Self.Chromium1.LoadUrl('https://www.facebook.com/');
//      FIsAddAccount := True;
//    end).Start;
//
//end;
//
//function TFrameBaseWebBrowser.SearchNextPageContents(ASearchType: string; AParams: ISuperObject; APageIndex: Integer): ISuperObject;
//var
//  ACode: Integer;
//  ADesc: string;
//  ADataJson: ISuperObject;
//  AStartTime: TDateTime;
////var
////  AContent:TCEFMessageContent;
////  AMessageData:String;
//  ASuperObject: ISuperObject;
//  I: Integer;
//  ARecordList: ISuperArray;
//  AContentRecordList: ISuperArray;
//  AUserRecordList: ISuperArray;
//begin
//  //等待浏览器初始完成
//
//  ACode := FAIL;
//  ADesc := '';
//  ADataJson := nil;
//
//  try
//    AStartTime := Now;
//    ADataJson := TSuperObject.Create;
//    AContentRecordList := TSuperArray.Create;
//    AUserRecordList := TSuperArray.Create;
//
//    if APageIndex = 1 then
//    begin
//          //等待FFacebookWebSearchAPIFrame在OperationCenterFrame运营中心页创建完成
//      while (not Self.FIsInited) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < FAPI.FSearchTimeoutInterval) and not FAPI.FIsWillLogout do
//      begin
//        uBaseLog.HandleException(nil, '====================【API登录前检测浏览器是否初始完成】====================' + FAPI.FAccount.S['nickname']);
//        Sleep(1000);
//      end;
//      if FAPI.FIsWillLogout then
//        Exit;
//
//
//
//           //检测是否已经登录成功
//      Self.FIsLoaded := False;
//      Self.Chromium1.LoadUrl('https://www.facebook.com/');
//      while (not Self.FIsLoaded) and (DateUtils.MilliSecondsBetween(Now, AStartTime) < FAPI.FLoginTimeoutInterval) and not FAPI.FIsWillLogout do
//      begin
//        uBaseLog.HandleException(nil, '====================【API登录前检测页面是否加载完成】====================' + FAPI.FAccount.S['nickname']);
//        Sleep(1000);
//      end;
//      if FAPI.FIsWillLogout then
//        Exit;
//
//          //加载JSAPI脚本
//      Self.LoadFacebookAPI;
//      Sleep(FSleepConfig.I['loadApi'] * 1000);
//
//      FStartGroupIndex := 0;
//      FGetGroupFinishedCount := 0;
//
//      if AParams.A['keyword'].S[0] <> '' then
//      begin
////            //加载首页
////            chromium1.ExecuteJavaScript('loadHome();', 'about:blank');
////            if FAPI.FIsWillLogout then Exit;
////            Sleep(FSleepConfig.I['loadHome'] * 1000);
////
////            //点击搜索框，设置搜索词
////            uBaseLog.HandleException(nil,'====================【群组搜索当前搜索词：' + AParams.S['keyword'] + '】====================');
//
//            //获取主页搜索框坐标后开始搜索
//        chromium1.ExecuteJavaScript('getHomeInputPos("getHomeInputPosFinished");', 'about:blank');
//        ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getHomeInputPosFinished', 10, True);
//        if ASuperObject.I['Code'] <> SUCC then
//        begin
//          uBaseLog.HandleException(nil, '====================【获取主页搜索框坐标 失败：' + ASuperObject.AsJson() + '】====================');
//          Exit;
//        end
//        else
//        begin
//          uBaseLog.HandleException(nil, '====================【获取主页搜索框坐标 成功：' + ASuperObject.AsJson() + '】====================');
//
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(1000);
//
//          SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']), 10, 10);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setClick'] * 1000);
//
//          SetSearchText(nil, AParams.A['keyword'].S[0]);
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(FSleepConfig.I['setContent'] * 1000);
//
//              //开始搜索
//          chromium1.ExecuteJavaScript('doContentSearch();', 'about:blank');
//          if FAPI.FIsWillLogout then
//            Exit;
//          Sleep(5000);
//
//        end;
//        if FAPI.FIsWillLogout then
//          Exit;
//
////            //过滤结果城市位置
////            if AParams.S['country'] <> '' then
////            begin
////              uBaseLog.HandleException(nil,'====================【当前过滤城市：' + AParams.S['country'] + '】====================');
////
////              //获取城市过滤输入框高度
////              chromium1.ExecuteJavaScript('getCountryInputPos("getCountryInputPosFinished");', 'about:blank');
////              ASuperObject:=Self.FGetedMessageList.CheckMessageIsReceivedJson('getCountryInputPosFinished', 7, True);
////              if ASuperObject.I['Code']<>SUCC then
////              begin
////                uBaseLog.HandleException(nil,'====================【获取城市过滤输入框坐标 失败：' + ASuperObject.AsJson() + '】====================');
////                Exit;
////              end
////              else
////              begin
////                uBaseLog.HandleException(nil,'====================【获取城市过滤输入框坐标 成功：' + ASuperObject.AsJson() + '】====================');
////
////                if FAPI.FIsWillLogout then Exit;
////                Sleep(1000);
////
////                SetMouseClick(nil, Ceil(ASuperObject.F['X']), Ceil(ASuperObject.F['Y']));
////                if FAPI.FIsWillLogout then Exit;
////                Sleep(FSleepConfig.I['setClick'] * 1000);
////
////                SetArticleText(nil, AParams.S['country']);
////                if FAPI.FIsWillLogout then Exit;
////                Sleep(FSleepConfig.I['setDownContent'] * 1000);
////
////                chromium1.ExecuteJavaScript('setCountry();', 'about:blank');
////                if FAPI.FIsWillLogout then Exit;
////                Sleep(2000);
////              end;
////              if FAPI.FIsWillLogout then Exit;
////            end;
////
////            //过滤结果是否为公开小组
////            if AParams.B['is_public_group'] = True then
////            begin
////              chromium1.ExecuteJavaScript('setIsShopOrPublicGroup();', 'about:blank');
////              if FAPI.FIsWillLogout then Exit;
////              Sleep(3000);
////            end;
////
////            //过滤结果是否为我的小组
////            if AParams.B['is_my_group'] = True then
////            begin
////              chromium1.ExecuteJavaScript('setIsCertifiedOrMyGroup();', 'about:blank');
////              if FAPI.FIsWillLogout then Exit;
////              Sleep(4000);
////            end;
//
//      end;
//
//    end
//    else
//    begin
//
//          //判断有没有下一页的数据
//
//          //滚动搜索结果,加载下一页
//      chromium1.ExecuteJavaScript('loadNextPage();', 'about:blank');
//      Sleep(5000);
//
//      chromium1.ExecuteJavaScript('loadNextPage();', 'about:blank');
//      Sleep(5000);
//
//
//
//          //滚动搜索结果,加载下一页
//      chromium1.ExecuteJavaScript('loadNextSearchResultPage("loadNextSearchResultPage", 1000);', 'about:blank');
//      ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('loadNextSearchResultPage', 10, True);
//      if ASuperObject.I['Code'] <> SUCC then
//      begin
//        uBaseLog.HandleException(nil, '====================【滚动搜索结果,加载下一页失败】====================' + FAPI.FAccount.S['nickname']);
//        Exit;
//      end;
//      if FAPI.FIsWillLogout then
//        Exit;
//
//    end;
//
//
//    //获取搜索结果列表
//    //获取下一页的搜索结果
//    chromium1.ExecuteJavaScript('getNextPageSearchResultRecordList("getHomePageContentRecordList");', 'about:blank');
//    ASuperObject := Self.FGetedMessageList.CheckMessageIsReceivedJson('getHomePageContentRecordList', 10, True);
//    if ASuperObject.I['Code'] <> SUCC then
//    begin
//      uBaseLog.HandleException(nil, '====================【获取下一页的搜索结果失败】====================' + FAPI.FAccount.S['nickname']);
//      Exit;
//    end;
//    if FAPI.FIsWillLogout then
//      Exit;
//
//    ARecordList := ASuperObject.O['Data'].A['RecordList'];
//    for I := 0 to ARecordList.Length - 1 do
//    begin
//      if ARecordList.O[I].B['HasContent'] then
//      begin
//        AContentRecordList.O[AContentRecordList.Length] := ARecordList.O[I].O['Content'];
//      end;
//      if ARecordList.O[I].B['HasUser'] then
//      begin
//        AUserRecordList.O[AUserRecordList.Length] := ARecordList.O[I].O['User'];
//      end;
//
//    end;
//    ADataJson.A['RecordList'] := AContentRecordList;
//    ADataJson.A['UserList'] := AUserRecordList;
//
//    if AContentRecordList.Length > 0 then
//    begin
//      ADataJson.B['has_next_page'] := True;
////      ADataJson.B['has_next_page']:=ASuperObject.B['HasNextPage'];
//    end;
//
//    ACode := Succ;
//    ADesc := '加载成功';
//
//  finally
//    Result := ReturnJson(ACode, ADesc, ADataJson);
//  end;
//
//end;

initialization
  GlobalWebBrowserFrameList:=TBaseList.Create(ooReference);
finalization
  FreeAndNil(GlobalWebBrowserFrameList);

end.

