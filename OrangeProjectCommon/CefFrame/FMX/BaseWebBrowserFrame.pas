unit BaseWebBrowserFrame;

interface

//{$I ..\Client_VCL\SearchClient.inc}

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  UITypes,
  System.Types,
  System.Classes, Math, uBaseLog, uFileCommon, uFuncCommon, StrUtils, DateUtils,


  uBaseList,
  uComponentType,
  uWebMessageProcesser,


  uCEFProcess, uConst, XSuperObject, uDatasetToJson,
//  Clipbrd,
  Clipboard,
//  WebbrowserControlUtils,
  uManager, IniFiles, uTaskManager,
//  System.NetEncoding,
  uDataInterface, uOpenClientCommon, uRestInterfaceCall, uGraphicCommon,
//  BaseWebSearchAPIFrame,
  uCEFFMXWindowParent,
  uCEFChromium, uCEFWindowParent, uCEFInterfaces,
  uCEFApplication, uCEFTypes, uCEFConstants, uCEFWinControl, uCEFSentinel,
  uCEFChromiumCore,
  FMX.Forms,
  FMX.Dialogs,
//  Graphics, Controls, Forms, Dialogs,
//  OleCtrls,
//  SHDocVw, ExtCtrls, StdCtrls,
//  ComCtrls,
  FMX.Types, FMX.ListBox,
  FMX.Edit, FMX.Controls.Presentation,

  FMX.StdCtrls, FMX.Controls, uCEFFMXChromium;

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
//  MOUSEOVER_MESSAGE_NAME  = 'mouseover';
//  CUSTOMNAME_MESSAGE_NAME = 'customname';
//

//  USER_NAME = 'email';

//  PASSWORD = 'pass';
//  LoginName = 'login';



type
//  TNotifyAddAccountSuccEvent = procedure(Sender: TObject; AWebsearchAPI: TWebSearchAPI) of object;
  TFrameBaseWebBrowser=class;
  TFrameBaseWebBrowserClass=class of TFrameBaseWebBrowser;
//  TBaseWebBrowserFrameList=class(TBaseList)
//  private
//    function GetItem(Index: Integer): TFrameBaseWebBrowser;
//  public
//    procedure HideWithout(AFrameTagObject:TObject);
//    property Items[Index:Integer]:TFrameBaseWebBrowser read GetItem;default;
//  end;



  TFrameBaseWebBrowser = class(TFrame)
    tmrInit: TTimer;
    Chromium1: TFMXChromium;
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
    tmrFreeWindowParent: TTimer;
    tmrResizeChild: TTimer;
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
    procedure tmrFreeWindowParentTimer(Sender: TObject);virtual;
    procedure FrameResize(Sender: TObject);virtual;
    procedure Chromium1ResourceResponse(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const request: ICefRequest; const response: ICefResponse;
      out Result: Boolean);virtual;
    procedure Chromium1GetResourceResponseFilter(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const request: ICefRequest; const response: ICefResponse;
      out Result: ICefResponseFilter);virtual;

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
    FCookieText: string;
    FCookieArray: ISuperArray;
    FContext: ICefRequestContext;

    FIsDestorying: Boolean;
    procedure WebBrowserInited; virtual;
    function CheckInited: Boolean;
//    function DefaultURL:String;virtual;

//    //释放消息
//    procedure DO_WM_FRAME_FREE(var AMessage: TMessage); message WM_FRAME_FREE;
//    procedure DO_WM_SUBFRAME_FREE(var AMessage: TMessage); message WM_SUBFRAME_FREE;
//    //CEF关闭消息
//    procedure DO_CEF_DESTROY(var AMessage: TMessage); message CEF_DESTROY;
//    procedure DO_SUBFRAME_CEF_DESTROY(var AMessage: TMessage); message SUBFRAME_CEF_DESTROY;
  public
    //FMX下的特殊处理
    CEFWindowParent1         : TFMXWindowParent;
//    OnCustomChromiumClose:TNotifyEvent;

    procedure ResizeChild;
    function  GetFMXWindowParentRect : System.Types.TRect;
    procedure CreateFMXWindowParent;
    //准备释放
    procedure PrepareFree;
    procedure NotifyMoveOrResizeStarted;
    procedure ShowBrowser;
    procedure HideBrowser;
    procedure RestoreBrowser;
  public
//    GlobalLoginLog: TBaseLog;
//
//    //搜索结果日志
//    GlobalSearchLog: TBaseLog;

    FIsInited: Boolean;
//    FSetedValue:String;
//    FIsReadOnly: Boolean;
//    FIsLoaded: Boolean;

    DefaultURL:String;

    //屏幕缩放比例
    FScreenScaleRate: Double;

    //登录结果日志

    FIsWebBrowserVisible:Boolean;


    //接收到的HTML内容
    FContentStr: string;
    //接收到的消息列表
    FGetedMessageList: TCEFMessageContentList;

    FOnCanFree:TNotifyEvent;

    function GetName:String;virtual;

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
    //发送键盘输入文本事件
    procedure SendKeyPressEnter;

    property HTMLContent: string read GetHTMLContent write SetHTMLContent;

    procedure ShowStatusText(const aText: string);

    //鼠标左键点击(x,y轴坐标值，x,y轴计算值)
    procedure SetMouseClick(Sender: TObject; SiteX: Integer; SiteY: Integer; CalcX: Integer; CalcY: Integer);

    //发消息给网页
    procedure NotityMsgToWeb(AMessageID:String;AMessageJson:ISuperObject;AType:String);
    { Public declarations }
  end;


implementation

uses
  FMX.Platform, FMX.Platform.Win,
  uBaseWebBrowserFrameManager,
  uCEFRequestContext, uCEFMiscFunctions;


// This is a demo with the simplest web browser you can build using CEF4Delphi
// with FMX components and it doesn't show any sign of progress like other web browsers do.
// Remember that it may take a few seconds to load if Windows update, your antivirus or
// any other windows service is using your hard drive.
// Depending on your internet connection it may take longer than expected.
// Please check that your firewall or antivirus are not blocking this application
// or the domain "google.com". If you don't live in the US, you'll be redirected to
// another domain which will take a little time too.
// This demo uses a TFMXChromium and a TFMXWindowParent. It replaces the original WndProc with a
// custom CustomWndProc procedure to handle Windows messages.
// All FMX applications using CEF4Delphi should add the $(FrameworkType) conditional define
// in the project options to avoid duplicated resources.
// This demo has that define in the menu option :
// Project -> Options -> Building -> Delphi compiler -> Conditional defines (All configurations)
// Destruction steps
// =================
// 1. FormCloseQuery sets CanClose to FALSE calls TFMXChromium.CloseBrowser which triggers the TFMXChromium.OnClose event.
// 2. TFMXChromium.OnClose sends a CEFBROWSER_DESTROY message to destroy CEFWindowParent1 in the main thread, which triggers the TFMXChromium.OnBeforeClose event.
// 3. TFMXChromium.OnBeforeClose sets FCanClose := True and sends WM_CLOSE to the form.
//uses
//  FMX.Platform, FMX.Platform.Win,
//  uCEFMiscFunctions, uCEFApplication,MainForm;

{$R *.fmx}

{ TFrameBaseWebSearchAPI }

procedure TFrameBaseWebBrowser.CreateFMXWindowParent;
begin
  if (CEFWindowParent1 = nil) then
    begin
      CEFWindowParent1 := TFMXWindowParent.CreateNew(nil);
      CEFWindowParent1.Reparent(GetParentForm(Self).Handle);
      ResizeChild;
      CEFWindowParent1.Show;
    end;
end;


procedure TFrameBaseWebBrowser.CustomInitContext;
begin

end;

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

procedure TFrameBaseWebBrowser.LoginTest_ThreadProc;
var
  ASuperObject: ISuperObject;
begin
//  ASuperObject := Self.Login(FAPI);
  uBaseLog.HandleException(nil, '====================【登录结果：' + ASuperObject.AsJson + '】====================');
end;

procedure TFrameBaseWebBrowser.NotifyMoveOrResizeStarted;
begin
  Chromium1.NotifyMoveOrResizeStarted;
end;

procedure TFrameBaseWebBrowser.NotityMsgToWeb(AMessageID: String;
  AMessageJson: ISuperObject;AType:String);
begin
  AMessageJson.S['Type']:=AType;
  Self.Chromium1.ExecuteJavaScript('vue.global_executeOperate('+QuotedStr(AMessageID)+', '+AMessageJson.AsJson+')', 'about:blank');
end;

procedure TFrameBaseWebBrowser.PrepareFree;
begin
  Chromium1.CloseBrowser(True);
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
    uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.TransferContent 获取输入框位置失败');
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
  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.Chromium1BeforeClose');

  //Free;
//  FCanClose := True;
//  PostCustomMessage(WM_CLOSE);

  //可以关闭窗体了
  GlobalWebBrowserFrameList.Remove(Self);

  if Assigned(FOnCanFree) then
  begin
    FOnCanFree(Self);
  end;
end;

procedure TFrameBaseWebBrowser.Chromium1BeforeContextMenu(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const params: ICefContextMenuParams; const model: ICefMenuModel);
begin
  // Adding some custom context menu entries
  model.AddSeparator;
//  model.AddItem(MINIBROWSER_CONTEXTMENU_SETJSEVENT,   'Set mouseover event');
//  model.AddItem(MINIBROWSER_CONTEXTMENU_JSVISITDOM,   'Visit DOM in JavaScript');
  model.AddItem(MINIBROWSER_CONTEXTMENU_COPYURL, 'Copy Url');
  model.AddItem(MINIBROWSER_CONTEXTMENU_SHOWDEVTOOLS, 'Show DevTools');
//  model.AddCheckItem(MINIBROWSER_CONTEXTMENU_OFFLINE, 'Offline');
//  model.SetChecked(MINIBROWSER_CONTEXTMENU_OFFLINE,   FOffline);
  model.AddItem(MINIBROWSER_CONTEXTMENU_SYNC, 'Sync');
end;

procedure TFrameBaseWebBrowser.Chromium1Close(Sender: TObject; const browser: ICefBrowser; var aAction: TCefCloseBrowserAction);
begin
  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.Chromium1Close Begin');

//  if not FIsDestorying then
//  begin
//    Exit;
//  end;

  //要发个消息,在主线程中释放FMXWindowParent

  //Self.tmrFreeWindowParent.Enabled:=True;
  //frmMain.PostCustomMessage(CEF_DESTROY);
//  if Assigned(OnCustomChromiumClose) then
//  begin
//    OnCustomChromiumClose(Self);
//  end;
  PostMessage(FmxHandleToHWND(GetParentForm(Self).Handle),CEF_DESTROY,Integer(Self),0);


  //默认是关闭Chromium所在的窗体,如果为Delay表示不关闭窗体
  aAction := cbaDelay;

  { TODO : 被我注释了 }
//  if Parent is TFrameBaseWebSearchAPI then
//  begin
//    uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.Chromium1Close 子Frame');
//    //是子Frame
//    PostMessage(Handle, SUBFRAME_CEF_DESTROY, 0, 0);
//  end
//  else
//  begin
//    uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.Chromium1Close 父Frame');
//    //发消息释放Frame
//    PostMessage(Handle, CEF_DESTROY, 0, 0);
//  end;


//  aAction := cbaDelay;
//  FIsChromiumClosed:=True;

  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.Chromium1Close End');

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
        Chromium1.ShowDevTools(TempPoint);
      end;
    MINIBROWSER_CONTEXTMENU_COPYURL:
      begin
        //复制链接到剪贴板
        { TODO : 被我注释了 }
//        Clipboard.SetTextBuf(PChar(Self.Chromium1.Browser.MainFrame.Url));
      end;
    MINIBROWSER_CONTEXTMENU_SYNC:
      begin
        //刷新
        Chromium1.Reload;
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

//  if GlobalLoginLog = nil then
//  begin
//    GlobalLoginLog := TBaseLog.Create('addOrReLogin.log');
//  end;
//  //写入本次登录日志
//  GlobalLoginLog.IsWriteLog := True;
//  GlobalLoginLog.WriteLog(FCookieText + #13#10);
//  GlobalLoginLog.WriteLog(FCookieArray.AsJSON + #13#10);
//  FreeAndNil(GlobalLoginLog);

//  //登陆成功
////  if (Pos('c_user', FCookieText) > 0) and (Pos('presence', FCookieText) > 0) then
//  if Pos('c_user', FCookieText) > 0 then
//  begin
//    //如果是添加账号登录成功
//    if FIsAddAccount = True then
//    begin
//      FIsAddAccount := False;
//
//      TThread.Synchronize(nil,
//        procedure
//        begin
//          tmrAddAccountSucc.Enabled := True;
//        end);
//
//    end;
//
//    //如果是失效账号重新登录
//    if FIsReLogin = True then
//    begin
//      FIsReLogin := False;
//    end;
//  end;

end;

procedure TFrameBaseWebBrowser.tmrFreeWindowParentTimer(Sender: TObject);
begin
  uBaseLog.HandleException('TFrameBaseWebSearchAPI.tmrFreeWindowParentTimer');
  Self.tmrFreeWindowParent.Enabled:=False;
  FreeAndNil(CEFWindowParent1);

  //可以关闭窗体了
  //GlobalWebBrowserFrameList.Remove(Self,False);

end;

//选择图片、视频
procedure TFrameBaseWebBrowser.Chromium1FileDialog(Sender: TObject; const browser: ICefBrowser; mode: Cardinal; const title, defaultFilePath: ustring; const acceptFilters: TStrings; selectedAcceptFilter: Integer; const callback: ICefFileDialogCallback; out Result: Boolean);
//var
//  AFiles:TStringList;
begin
  uBaseLog.HandleException('TFrameBaseWebSearchAPI.Chromium1FileDialog Begin');
//  //title:
//  //defaultFilePath:
//  //acceptFilters:image/*
//  //image/heif
//  //image/heic
//  //video/*
//  //video/mp4
//  //video/x-m4v
//  //video/x-matroska
//  //.mkv
//  // selectedAcceptFilter:0
//  if FContentFiles.Count > 0 then
//  begin
//    uBaseLog.HandleException('TFrameBaseWebSearchAPI.Chromium1FileDialog ' + ' title:' + title + ' defaultFilePath:' + defaultFilePath + ' acceptFilters:' + acceptFilters.Text + ' selectedAcceptFilter:' + IntToStr(selectedAcceptFilter));
//
//  //  AFiles:=TStringList.Create;
//    try
//  //    AFiles.Add('C:\Users\Administrator\Desktop\你很弱.jpg');
//  //    AFiles.Add('C:\Users\Administrator\Desktop\傲途演示视频.mp4');
//  //    AFiles.Add('C:\Users\Administrator\Desktop\不要.jpg');
//      callback.Cont(selectedAcceptFilter, FContentFiles);
//    finally
//  //    FContentFiles.Clear;
//  //    FreeAndNil(FContentFiles);
//    end;
//  end;

end;

procedure TFrameBaseWebBrowser.Chromium1FullScreenModeChange(Sender: TObject; const browser: ICefBrowser; fullscreen: Boolean);
begin
  if not (Chromium1.IsSameBrowser(browser)) then
  begin
    uBaseLog.HandleException(nil, '====================【框架不匹配，退出】====================');
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

procedure TFrameBaseWebBrowser.Chromium1GetResourceResponseFilter(
  Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; const response: ICefResponse;
  out Result: ICefResponseFilter);
begin
  //
  uBaseLog.HandleException(nil, 'TFrameBaseWebBrowser.Chromium1GetResourceResponseFilter '+request.Url);
  //

end;

procedure TFrameBaseWebBrowser.Chromium1DialogClosed(Sender: TObject; const browser: ICefBrowser);
begin
  //
end;

procedure TFrameBaseWebBrowser.Chromium1DownloadUpdated(Sender: TObject; const browser: ICefBrowser; const downloadItem: ICefDownloadItem; const callback: ICefDownloadItemCallback);
var
  TempString: string;
begin
  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.Chromium1DownloadUpdated Begin');
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
  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.Chromium1DownloadUpdated Begin');
end;

procedure TFrameBaseWebBrowser.Chromium1ProcessMessageReceived(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; sourceProcess: TCefProcessId; const message: ICefProcessMessage; out Result: Boolean);
var
//  bIsInnerMsg: Boolean;
  sName, sData: string;
  ACEFMessageContent: TCEFMessageContent;
begin
  if Self.Chromium1.IsSameBrowser(browser) then
  begin
    sName := message.Name;
    sData := message.ArgumentList.GetString(0);
    uBaseLog.HandleException(nil, '====================【JS收到回复：' + sName + ' ' + sData + ' 】====================');


    ACEFMessageContent := TCEFMessageContent.Create;
    ACEFMessageContent.ID := sName;
    ACEFMessageContent.Data := sData;
    ACEFMessageContent.WebBrowserFrame:=Self;
    Self.FGetedMessageList.Add(ACEFMessageContent);


    //消息处理
    ACEFMessageContent := TCEFMessageContent.Create;
    ACEFMessageContent.ID := sName;
    ACEFMessageContent.Data := sData;
    ACEFMessageContent.WebBrowserFrame:=Self;
    GetGlobalWebMessageProcesser.FGetedMessageList.Add(ACEFMessageContent);
  end;
end;

procedure TFrameBaseWebBrowser.Chromium1RenderCompMsg(Sender: TObject; var aMessage: TMessage; var aHandled: Boolean);
begin
  { TODO : 被我注释了 }
//  if aMessage.Msg = WM_MOUSEMOVE then
//  begin
//    StatusBar1.Panels[2].Text := 'x : ' + inttostr(aMessage.lParam and $FFFF);
//    StatusBar1.Panels[3].Text := 'y : ' + inttostr((aMessage.lParam and $FFFF0000) shr 16);
//  end;
end;

procedure TFrameBaseWebBrowser.Chromium1ResourceResponse(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; const response: ICefResponse;
  out Result: Boolean);
begin
  //
  uBaseLog.HandleException(nil, 'TFrameBaseWebBrowser.Chromium1ResourceResponse '+request.Url);


end;

constructor TFrameBaseWebBrowser.Create(AOwner: TComponent);
begin

  inherited;

  GlobalWebBrowserFrameList.Add(GetName,Self);

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


  Self.tmrInit.Enabled := True;


//  GlobalChromiumFrameList.Add(Chromium1,Self);

//  {$IFDEF DEV_MODE}
//
//  {$ELSE}
  //发布模式不显示日志页面
  Self.pnlTest.Visible := False;
//  {$ENDIF}

//  //FMX下处理
//  FFormStub  := MakeObjectInstance(CustomWndProc);
//  FOldWndPrc := TFNWndProc(SetWindowLongPtr(FmxHandleToHWND(Handle), GWLP_WNDPROC, NativeInt(FFormStub)));

  FCookieText := '';
  FCookieArray := SA();

  FIsWebBrowserVisible:=True;
end;

procedure TFrameBaseWebBrowser.AddCookieInfo(const aCookie: TCookie);
begin
  // This should be protected by a mutex.
  FCookieText := FCookieText + aCookie.name + ' : ' + aCookie.value + ' (' + aCookie.domain + ')' + #13 + #10;
end;

procedure TFrameBaseWebBrowser.Chromium1AfterCreated(Sender: TObject; const browser: ICefBrowser);
begin
  uBaseLog.HandleException(nil, 'TFrameBaseWebBrowser.Chromium1AfterCreated');
  FIsInited := True;
  WebBrowserInited;
end;

procedure TFrameBaseWebBrowser.WebBrowserInited;
//var
//  AUrl:String;
begin
  uBaseLog.HandleException(nil, 'TFrameBaseWebBrowser.WebBrowserInited');
  //file:///C:/MyFiles/OrangeUIProduct/%E5%86%85%E5%AE%B9%E7%88%AC%E8%99%AB/python_project/client/html_editor/index.html
//  AUrl:='file:///'+GetApplicationPath+'html_editor'+PathDelim+'index.html';

//  AUrl:='http://www.facebook.com';
//
//  AUrl:=ReplaceStr(AUrl,'\','/');
//  Self.Chromium1.LoadURL(AUrl);


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
  uBaseLog.HandleException(nil, 'TFrameBaseWebBrowser.Chromium1LoadEnd');

  if (frame = nil) or not (frame.IsValid) or (browser = nil) then
  begin
    uBaseLog.HandleException(nil, '====================【框架为空/框架不可用/浏览器为空，退出】====================');
    Exit;
  end;

  if Chromium1.IsSameBrowser(browser) then
  begin
    { TODO : 被我注释了 }
//    if frame.IsMain then
//      StatusBar1.Panels[1].Text := '主框架已加载 : ' + quotedstr(frame.name)
//    else
//      StatusBar1.Panels[1].Text := '框架已加载 : ' + quotedstr(frame.name);
  end
  else
  begin
    // 这是CEF处理的弹出窗口中焦点问题的解决方法
    { TODO : 被我注释了 }
//    TempHandle := WinApi.Windows.GetWindow(browser.Host.WindowHandle, GW_OWNER);
//    if (TempHandle <> Handle) then
//      WinApi.Windows.SetFocus(TempHandle);
  end;

  //----------------------------------------------------------------------------
  { TODO : 被我注释了 }
//  if Self.Chromium1.Browser.MainFrame.Url <> 'about:blank' then
//  begin
//    FIsLoaded := True;
//    uBaseLog.HandleException(nil, '====================【浏览器加载完成：' + Self.Chromium1.Browser.MainFrame.Url + '】====================');
//  end;

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
  { TODO : 被我注释了 }
//  StatusBar1.Panels[0].Text := 'Loading... ' + FloatToStrF(progress * 100, ffFixed, 3, 0) + '%';
end;

procedure TFrameBaseWebBrowser.Chromium1LoadingStateChange(Sender: TObject; const browser: ICefBrowser; isLoading, canGoBack, canGoForward: Boolean);
begin
  Chromium1.DefaultWindowInfoExStyle := Chromium1.DefaultWindowInfoExStyle;

  //----------------------------------------------------------------------------

  if not (Chromium1.IsSameBrowser(browser)) then
  begin
    uBaseLog.HandleException(nil, '====================【框架不匹配，退出】====================');
    Exit;
  end;

  { TODO : 被我注释了 }
//  if isLoading then
//  begin
//    StatusBar1.Panels[0].Text := 'Loading...';
//  end
//  else
//  begin
//    StatusBar1.Panels[0].Text := 'Finished';
//  end;

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

//function TFrameBaseWebBrowser.DefaultURL: String;
//begin
//  Result:='';
//end;

destructor TFrameBaseWebBrowser.Destroy;
begin
  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.Destroy Begin');

  //可以关闭窗体了
  GlobalWebBrowserFrameList.Remove(Self);

  FreeAndNil(FGetedMessageList);
//  FreeAndNil(GlobalSearchLog);
  inherited;

  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.Destroy End');
end;

procedure TFrameBaseWebBrowser.FrameResize(Sender: TObject);
begin
  Self.ResizeChild;
end;

//procedure TFrameBaseWebSearchAPI.DO_CEF_DESTROY(var AMessage: TMessage);
//begin
//  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_CEF_DESTROY 父Frame Begin');
//
//  { TODO : 被我注释了 }
////  CEFWindowParent1.Free;
//
//
//  Free;
//
//  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_CEF_DESTROY 父Frame End');
//end;
//
//procedure TFrameBaseWebSearchAPI.DO_SUBFRAME_CEF_DESTROY(var AMessage: TMessage);
//begin
//  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_SUBFRAME_CEF_DESTROY 子Frame Begin');
//
//  //给父Frame发消息,表示我释放完了,通知父Frame自己可以释放了
//  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_SUBFRAME_CEF_DESTROY 子Frame 通知父Frame可以释放了');
//  TFrameBaseWebSearchAPI(Parent).FFacebookPageSearchAPIFrame := nil;
//  { TODO : 被我注释了 }
////  PostMessage(TFrameBaseWebSearchAPI(Parent).Handle, WM_FRAME_FREE, 0, 0);
//
//  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_SUBFRAME_CEF_DESTROY 子Frame 释放了');
//
//  Free;
//
//  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_SUBFRAME_CEF_DESTROY 子Frame End');
//
//end;
//
//procedure TFrameBaseWebSearchAPI.DO_WM_FRAME_FREE(var AMessage: TMessage);
//begin
//  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_WM_FRAME_FREE 父Frame Begin');
//  FIsDestorying := True;
//
//  //如果存在子Frame,则应该先关闭子Frame
//  if Self.FFacebookPageSearchAPIFrame <> nil then
//  begin
//    uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_WM_FRAME_FREE 父Frame 通知子Frame准备释放');
//    { TODO : 被我注释了 }
////    PostMessage(FFacebookPageSearchAPIFrame.Handle, WM_SUBFRAME_FREE, 0, 0);
//    Exit;
//  end
//  else
//  begin
//    uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_WM_FRAME_FREE 父Frame 无子Frame需要释放或已释放');
//  end;
//
//
//  //在消息中,先关闭Chromium，然后Chromium会触发它的OnClose事件，在OnClose事件中发送CEF_DESTROY给自己，表示可以释放了
//  if Chromium1.Initialized then
//  begin
//    uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_WM_FRAME_FREE 父Frame Chromium1.CloseBrowser(True) Begin');
//    Chromium1.CloseBrowser(True);
//    uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_WM_FRAME_FREE 父Frame Chromium1.CloseBrowser(True) End');
//  end
//  else
//  begin
//    //没有初始,直接释放
//    { TODO : 被我注释了 }
////    PostMessage(Handle, CEF_DESTROY, 0, 0);
//  end;
//
//end;
//
//procedure TFrameBaseWebSearchAPI.DO_WM_SUBFRAME_FREE(var AMessage: TMessage);
//begin
//  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_WM_SUBFRAME_FREE 子Frame Begin');
//  FIsDestorying := True;
//
//
//  //在消息中,先关闭Chromium，然后Chromium会触发它的OnClose事件，在OnClose事件中发送CEF_DESTROY给自己，表示可以释放了
//  if Chromium1.Initialized then
//  begin
//    uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_WM_SUBFRAME_FREE 子Frame Chromium1.CloseBrowser(True) Begin');
//    Chromium1.CloseBrowser(True);
//    uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_WM_SUBFRAME_FREE 子Frame Chromium1.CloseBrowser(True) End');
//  end
//  else
//  begin
//    //没有初始,直接释放
//    { TODO : 被我注释了 }
////    PostMessage(Handle, SUBFRAME_CEF_DESTROY, 0, 0);
//  end;
//
//  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.DO_WM_SUBFRAME_FREE 子Frame END');
//end;

//procedure TFrameBaseWebSearchAPI.ExecuteAutomaticScript(
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

//function TFrameBaseWebSearchAPI.GetHTML: String;
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

//procedure TFrameBaseWebSearchAPI.GetAPI(AAPI: TWebSearchAPI);
//begin
//  FAPI := AAPI;
//end;

function TFrameBaseWebBrowser.GetFMXWindowParentRect: System.Types.TRect;
var
  TempScale : single;
  APointF:TPointF;
begin
  APointF:=PointF(0,0);
  APointF:=Self.LocalToAbsolute(APointF);
  TempScale     := Chromium1.ScreenScale;
  Result.Left   := round(APointF.X);
  Result.Top    := round(APointF.Y);//round(AddressPnl.Height * TempScale);
  Result.Right  := Result.Left+round(Width  * TempScale) - 1;
  Result.Bottom := Result.Top+round(Height * TempScale) - 1;
end;

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

procedure TFrameBaseWebBrowser.HideBrowser;
begin
  if (CEFWindowParent1 <> nil) then
    begin
      CEFWindowParent1.Hide;
    end;
  FIsWebBrowserVisible:=False;
end;

procedure TFrameBaseWebBrowser.ResizeChild;
begin
  if (CEFWindowParent1 <> nil) then
    CEFWindowParent1.SetBounds(GetFMXWindowParentRect);
end;

procedure TFrameBaseWebBrowser.RestoreBrowser;
begin
  if FIsWebBrowserVisible then
  begin
    ShowBrowser;
  end
  else
  begin
    HideBrowser;
  end;
end;

//发送鼠标左键点击事件
procedure TFrameBaseWebBrowser.SetMouseClick(Sender: TObject; SiteX: Integer; SiteY: Integer; CalcX: Integer; CalcY: Integer);
var
  TempEvent: TCefMouseEvent;
begin
  { TODO : 被我注释了 }
//  if Self.CEFWindowParent1.CanFocus then
//  begin
//    Self.CEFWindowParent1.SetFocus;
//  end;

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

  { TODO : 被我注释了 }
//  if Self.CEFWindowParent1.CanFocus then
//  begin
//
//    Self.CEFWindowParent1.SetFocus;

//    //发送鼠标点击
//    SetMouseClick(nil, StrToInt(edtX.Text), StrToInt(edtY.Text), 10, 10);
//    //设置文本
//    SetArticleText(nil, 'Its very nice');

//  end;

end;


procedure TFrameBaseWebBrowser.ShowBrowser;
begin
  if (CEFWindowParent1 <> nil) then
    begin
      CEFWindowParent1.WindowState := TWindowState.wsNormal;
      CEFWindowParent1.Show;
      CEFWindowParent1.SetBounds(GetFMXWindowParentRect);
    end;
  FIsWebBrowserVisible:=True;
end;

procedure TFrameBaseWebBrowser.ShowStatusText(const aText: string);
begin
  { TODO : 被我注释了 }
//  StatusBar1.Panels[1].Text := aText;
end;

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
var
  TempHandle : HWND;
  TempRect   : System.Types.TRect;
  TempClientRect : TRectF;
var
  sCachePath: string;
begin
  uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.tmrInitTimer');

  if GetParentForm(Self)=nil then
  begin
    uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.tmrInitTimer GetParentForm(Self)=nil');
    Exit;
  end;

  tmrInit.Enabled := False;

  // TFMXWindowParent has to be created at runtime
  CreateFMXWindowParent;

  { TODO : 被我注释掉了 }
  CustomInitContext();


  // You *MUST* call CreateBrowser to create and initialize the browser.
  // This will trigger the AfterCreated event when the browser is fully
  // initialized and ready to receive commands.
  // GlobalCEFApp.GlobalContextInitialized has to be TRUE before creating any browser
  // If it's not initialized yet, we use a simple timer to create the browser later.
  if not(Chromium1.Initialized) then
    begin
      TempHandle      := FmxHandleToHWND(CEFWindowParent1.Handle);
      TempClientRect  := CEFWindowParent1.ClientRect;
      TempRect.Left   := round(TempClientRect.Left);
      TempRect.Top    := round(TempClientRect.Top);
      TempRect.Right  := round(TempClientRect.Right);
      TempRect.Bottom := round(TempClientRect.Bottom);

//      Chromium1.DefaultUrl := DefaultURL;

      if not(Chromium1.CreateBrowser(TempHandle, TempRect,'',FContext)) then
      begin
        uBaseLog.HandleException(nil, 'TFrameBaseWebSearchAPI.tmrInitTimer Need ReInit');
        tmrInit.Enabled := True;
      end;
    end;


    { TODO : 被我注释了 }
//  if not (Chromium1.CreateBrowser(CEFWindowParent1, '', FContext)) and not (Chromium1.Initialized) then
//  begin
//    tmrInit.Enabled := True;
//    Exit;
//  end;

//  tmrInited.Enabled:=False;
//  SetHTMLContent(FSetedValue);
//  SetIsReadOnly(FIsReadOnly);
end;

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
//  SetArticleText(nil, 'food');
//  Sleep(FSleepConfig.I['setContent'] * 1000);

  chromium1.ExecuteJavaScript('doPagesSearch();', 'about:blank');

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

//  SetArticleText(nil, 'Hong Kong');
//  Sleep(FSleepConfig.I['setContent'] * 1000);

  chromium1.ExecuteJavaScript('setCountry(1);', 'about:blank');

end;

//过滤城市测试
procedure TFrameBaseWebBrowser.btnChoseCountryClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(TestChoseCountry_ThreadProc).Start;
end;



end.

