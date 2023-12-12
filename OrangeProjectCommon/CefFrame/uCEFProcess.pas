unit uCEFProcess;


///
///  Visitor DOM
///

interface



uses
  uCEFTypes, uCEFInterfaces, uCEFRenderProcessHandler, uCEFDomVisitor,
  SysUtils, Generics.Collections,
  DateUtils,
  Dialogs,
  Forms,

  SyncObjs,

  uBaseLog,
  uBaseList,

  uCEFChromium,
  uCEFApplication,

  XSuperObject,

//  JsonDataObjects, ugmDataObjs,
//  uNodeChecks,
  Classes;

//type
//  TDomPathItem = record
//    Tag: string;
//    Name: string;
//    Value: string;
//  end;
//
//  TCustomSearchDOMNodeData = class(TCefDomVisitorOwn)
//  protected
//    function Find(const AParent: ICefDomNode; const TagName, AttName, AttVal:
//        string): ICefDomNode;
//  end;
//
//  TSearchDOMNode = class(TCefDomVisitorOwn)
//  private
//    FMsgID: string;
//    FBrowser: ICefBrowser;
//    FFrame: ICefFrame;
//    FParamData: string;
//    FVisitDataType: string;
//    FContextData: string;
//  protected
//    function  DebugPrintNodeInfo(const ANode: ICefDomNode): string;
//    procedure SendProcMsg(const AName, AData: string);
//    function  ExtractContent(const ANode: ICefDomNode; const ADataType: string): string;
//    function  findOfSelector(const AParent: ICefDomNode; const ASelector: THtmlSelector; var ANode:ICefDomNode; ACurLevel: Integer = 0): Boolean;
//    function  Find(const AParentNode: ICefDomNode; const APath: string): ICefDomNode;
//
//    procedure visit(const document: ICefDomDocument); override;
//  public
//    constructor Create(const browser: ICefBrowser; const AFrame: ICefFrame;
//                        const AParams: string); reintroduce; virtual;
//    destructor Destroy; override;
//
//    procedure  LoadPath(const AParams: string); virtual;
//    property MsgID: string read FMsgID write FMsgID;
//    property VisitDataType: string read FVisitDataType write FVisitDataType;
//    property ContextData: string read FContextData write FContextData;
//  end;
//
//  /// 内容搜索检查器
//  TSearchDOMNodeList = class(TSearchDOMNode)
//  private
//    FDatas:TNodeCheckData;
//  protected
//    procedure visit(const document: ICefDomDocument); override;
//  public
//    procedure LoadPath(const AParams: string); override;
//    destructor Destroy; override;
//  end;
//
//  /// 内容数据抓取器
//  TFatchDOMNodeDatas = class(TSearchDOMNode)
//  private
//    FFatchDatas: TNodeFatchDatas;
//    {$ifdef DebugCef}
//    procedure DebugPrintAllNodes(const AParentNode: ICefDomNode; ALevel: integer);
//    {$endif}
//    procedure FatchDataOfNode(const ADataNode: ICefDomNode);
//    function ExtractDatas(const AParentNode: ICefDomNode; var AData: string): Boolean;
//    function FatchChildrenNode(const AParent: ICefDomNode;
//                ANodeFilter, AEofFilter: THtmlSelector; var ADataCount: integer): Boolean;
//    function FatchAllChildrenNodes(const AParent: ICefDomNode;
//                ANodeFilter, AEofFilter: THtmlSelector; var ADataCount: integer): boolean;
//  protected
//    procedure  visit(const document: ICefDomDocument); override;
//
//  public
//    procedure  LoadPath(const AParams: string); override;
//    destructor Destroy; override;
//  end;
type
//  TChromiumFrame=class
//    Chromium:TChromium;
//    Frame:TFrame;
//  end;
//  TChromiumFrameList=class(TBaseList)
//  private
//    function GetItem(Index: Integer): TChromiumFrame;
//  public
//    function Add(AChromium:TChromium;AFrame:TFrame):TChromiumFrame;
//    property Items[Index:Integer]:TChromiumFrame read GetItem;default;
//  end;


  TCEFMessageContent=class
    ID:String;
    Data:String;
    WebBrowserFrame:TObject;
  end;
  TCEFMessageContentList=class(TBaseList)
  private
    function GetItem(Index: Integer): TCEFMessageContent;
  protected
    FLock: TCriticalSection;
  public
    function Find(AMessageID:String):TCEFMessageContent;
    function CheckMessageIsReceived(AMessageID:String;ATimeoutSeconds:Integer;AIsInThread:Boolean=False): TCEFMessageContent;
    function CheckMessageIsReceivedData(AMessageID:String;ATimeoutSeconds:Integer;AIsInThread:Boolean=False):String;
    function CheckMessageIsReceivedJson(AMessageID:String;ATimeoutSeconds:Integer;AIsInThread:Boolean=False):ISuperObject;
    property Items[Index:Integer]:TCEFMessageContent read GetItem;default;

    constructor Create(
                        const AObjectOwnership:TObjectOwnership=ooOwned;
                        const AIsCreateObjectChangeManager:Boolean=True
                        );override;
    destructor Destroy;override;
    procedure Lock;
    procedure UnLock;
  end;




  TOrangeUIExtension = class
    class procedure notify(const id, data: string);
    class procedure command(const name, param: string);
    class procedure loadScript(const name: string);
  end;



procedure GlobalCEFApp_OnWebKitInitialized;
procedure GlobalCEFApp_OnProcessMessageReceived(const browser: ICefBrowser;
    const frame: ICefFrame; sourceProcess: TCefProcessId;
    const message: ICefProcessMessage; var aHandled : boolean);



procedure CreateGlobalCEFApp;

//var
//  //用于安全释放Chromium
//  GlobalChromiumFrameList:TChromiumFrameList;

implementation

uses
//  uMXMSGConsts,
  uCEFProcessMessage, uCEFMiscFunctions, //untCommFuns,
  uCEFConstants, //dSynCrossPlatformJSON,
//  uLogWriter,
  Variants,
  uCEFv8Handler, uCEFBrowserProcessHandler, uCEFv8Context;



procedure CreateGlobalCEFApp;
var
  CEFDIR:String;
var
  sRootPath: string;
begin
  if assigned(GlobalCEFApp) then
    Exit;

  CEFDIR:= '\cef93';
  {$IFDEF CPUX64}
  CEFDIR:= '\cef93_win64';
  {$ENDIF}
  sRootPath := ExtractFileDir(ParamStr(0));

  GlobalCEFApp                     := TCefApplication.Create;
  GlobalCEFApp.FrameworkDirPath    := sRootPath + CEFDIR;
  GlobalCEFApp.ResourcesDirPath    := sRootPath + CEFDIR;
  GlobalCEFApp.LocalesDirPath      := sRootPath + CEFDIR + '\locales';
  GlobalCEFApp.UserDataPath        := sRootPath + '\UserData';
  GlobalCEFApp.RootCache           := sRootPath + '\browser';
  GlobalCEFApp.cache               := GlobalCEFApp.RootCache + '\cache';

  GlobalCEFApp.OnWebKitInitialized := GlobalCEFApp_OnWebKitInitialized;
  GlobalCEFApp.OnProcessMessageReceived := GlobalCEFApp_OnProcessMessageReceived;

  GlobalCEFApp.LogFile             := 'debug.log';
  GlobalCEFApp.LogSeverity         := LOGSEVERITY_ERROR;
//  GlobalCEFApp.EnablePrintPreview  := True;
  //GlobalCEFApp.EnablePrintPreview := False;
//  GlobalCEFApp.BrowserSubprocessPath := 'MXFatcher.exe';

  //GlobalCEFApp.BrowserSubprocessPath := 'MXFatcher.exe';
  // This demo uses a different EXE for the subprocesses.
  // With this configuration it's not necessary to have the
  // GlobalCEFApp.StartMainProcess call in a if..then clause.

  //GlobalCEFApp.StartMainProcess;
end;





{ TOrangeUIExtension }

class procedure TOrangeUIExtension.command(const name, param: string);
var
  TempMessage : ICefProcessMessage;
  TempFrame   : ICefFrame;
begin
  try
    TempMessage := TCefProcessMessageRef.New('_CallCommand');
    TempMessage.ArgumentList.SetString(0, name);
    TempMessage.ArgumentList.SetString(1, param);
    TempFrame := TCefv8ContextRef.Current.Browser.MainFrame;
    if (TempFrame <> nil) and TempFrame.IsValid then
      TempFrame.SendProcessMessage(PID_BROWSER, TempMessage);
  finally
    TempMessage := nil;
  end;
end;

class procedure TOrangeUIExtension.loadScript(const name: string);
var
  fn: string;
  cFile: TStringStream;
  TempFrame   : ICefFrame;
begin
  fn := name;
  if not FileExists(fn) then
    Exit;

  cFile := TStringStream.Create('', TEncoding.UTF8);
  try
    cFile.LoadFromFile(fn);
    TempFrame := TCefv8ContextRef.Current.Browser.MainFrame;
    if (TempFrame <> nil) and TempFrame.IsValid then
      TempFrame.ExecuteJavaScript(cFile.DataString, 'about:blank', 0);
  finally
    cFile.free;
  end;
end;

class procedure TOrangeUIExtension.notify(const id, data: string);
var
  TempMessage : ICefProcessMessage;
  TempFrame   : ICefFrame;
begin
  uBaseLog.HandleException(nil,'TOrangeUIExtension.notify Begin');

  try
    TempMessage := TCefProcessMessageRef.New(id);
    TempMessage.ArgumentList.SetString(0, data);
    TempFrame := TCefv8ContextRef.Current.Browser.MainFrame;
    if (TempFrame <> nil) and TempFrame.IsValid then
      TempFrame.SendProcessMessage(PID_BROWSER, TempMessage);
  finally
    TempMessage := nil;
  end;
  uBaseLog.HandleException(nil,'TOrangeUIExtension.notify End');
end;



//function DOMVisitor_SearchChildren(const AParent: ICefDomNode; const TagName, AttName, AttVal: string): ICefDomNode;
//var
//  cNode: ICefDomNode;
//  sNodeAttVal: string;
//begin
//  Result := nil;
//  if not assigned(AParent) then
//    Exit;
//  // div role="search"
//  cNode := AParent.FirstChild;
//  while not assigned(Result) and assigned(cNode) do
//  begin
//    //CefLog('DomVisitor', 1, CEF_LOG_SEVERITY_ERROR, 'Head child element : ' + cNode.Name);
//    if cNode.NodeType = DOM_NODE_TYPE_ELEMENT then
//    begin
//      if SameText(cNode.Name, TagName) then
//      begin
//        sNodeAttVal := cNode.GetElementAttribute(AttName);
//        if SameText(sNodeAttVal, AttVal) then
//        begin
//          Result := cNode;
//          Break;
//        end;
//      end;
//
//      if cNode.HasChildren then
//        Result := DOMVisitor_SearchChildren(cNode, TagName, AttName, AttVal);
//    end;
//    cNode := cNode.NextSibling;
//  end;
//end;
//
//
//procedure SendBrowserMsg(const browser: ICefBrowser;
//    const frame: ICefFrame;
//    const AMsgID: string; const AData: string);
//var
//  pMsg: ICefProcessMessage;
//  pListVal: ICefListValue;
//begin
//  pMsg := TCefProcessMessageRef.New(DOMVISITOR_MSGNAME_FacebookLoginID);
//  if AData <> '' then
//  begin
//    pListVal := pMsg.ArgumentList;
//    pListVal.SetString(0, AData);
//  end;
//  frame.SendProcessMessage(PID_BROWSER, pMsg);
//end;
//
//procedure DOMVisitor_OnDocAvailable(const browser : ICefBrowser;
//    const frame: ICefFrame;
//    const document: ICefDomDocument);
//var
//  pData: ICefDomNode;
//  sLoginID: string;
//begin
//  pData := document.GetElementById('loginbutton');
//  sLoginID := MSGDATA_EMPTY;
//  if assigned(pData) then
//    sLoginID := pData.GetElementAttribute('for');
//
//  SendBrowserMsg(browser, frame, DOMVISITOR_MSGNAME_FacebookLoginID, sLoginID);
//end;
//
//
//procedure DOMVisitor_OnDocSearchID(const browser: ICefBrowser;
//    const frame: ICefFrame;
//    const document: ICefDomDocument);
//var
//  pSearchFormNode: ICefDomNode;
//  sLoginID: string;
//begin
//  pSearchFormNode := DOMVisitor_SearchChildren(
//    document.GetElementById('bluebarRoot'),
//    'div', 'role', 'search');
//
//  sLoginID := MSGDATA_EMPTY;
//  if assigned(pSearchFormNode) then
//    sLoginID := pSearchFormNode.GetElementAttribute('id');
//
//  SendBrowserMsg(browser, frame, DOMVISITOR_MSGNAME_SearchID, sLoginID);
//end;
//
//procedure DOMVisitor_OnDocSearchPageID(const browser: ICefBrowser;
//    const frame: ICefFrame;
//    const document: ICefDomDocument);
//var
//  msg: ICefProcessMessage;
//  pFatchTabbarNode: ICefDomNode;
//  pListValue: ICefListValue;
//  pSearchFormNode: ICefDomNode;
//  sFatchTabbarID: string;
//  sLoginID: string;
//begin
//  // document.getElementById('u_fetchstream_2_1').getElementsByClassName('_3m1v _468f').length);
//  ///
//  ///  获取主界面搜索后内容也欠Tabs的实际位置
//  ///
//  //  // id="content"
//  //  // div data-testid="search_navigation_tabs"
//  //
//  pFatchTabbarNode := DOMVisitor_SearchChildren(
//    document.GetElementById('content'),
//    'div', 'data-testid', 'search_navigation_tabs');
//  sFatchTabbarID := MSGDATA_EMPTY;
//  if assigned(pFatchTabbarNode) then
//  begin
//    sFatchTabbarID := pFatchTabbarNode.GetElementAttribute('id');
//    // 搜索页签
//    // role="tab"
//    pSearchFormNode := DOMVisitor_SearchChildren(pFatchTabbarNode, 'a', 'role', 'tab');
//  end;
//
//  sLoginID := MSGDATA_EMPTY;
//  if assigned(pSearchFormNode) then
//    sLoginID := pSearchFormNode.GetElementAttribute('class');
//
//  msg := TCefProcessMessageRef.New(DOMVISITOR_MSGNAME_SearchPageID);
//  pListValue := msg.ArgumentList;
//  pListValue.SetString(0, sFatchTabbarID);
//  pListValue.SetString(1, sLoginID);
//
//  frame.SendProcessMessage(PID_BROWSER, msg);
//end;
//
//procedure DOMVisitor_OnDocMyHomeID(const browser: ICefBrowser;
//    const frame: ICefFrame;
//  const document: ICefDomDocument);
//var
//  pHomeTabNode: ICefDomNode;
//  sNodeID: string;
//begin
//  /// 主页上面的个人主页页签
//  ///  data-click="home_icon"
//  pHomeTabNode := DOMVisitor_SearchChildren(
//    document.GetElementById('bluebarRoot'),
//    'div', 'data-click', 'home_icon');
//
//  sNodeID := MSGDATA_EMPTY;
//  if assigned(pHomeTabNode) then
//    sNodeID := pHomeTabNode.GetElementAttribute('id');
//
//  SendBrowserMsg(browser, frame, DOMVISITOR_MSGNAME_BarHomeTabID, sNodeID);
////  msg := TCefProcessMessageRef.New(DOMVISITOR_MSGNAME_BarHomeTabID);
////  msg.ArgumentList.SetString(0, sNodeID);
////  browser.SendProcessMessage(PID_BROWSER, msg);
//end;
//
//
//procedure DOMVisitor_OnDocSubmitMyPost(const browser: ICefBrowser;
//    const frame: ICefFrame;
//  const document: ICefDomDocument);
//var
//  pHomeTabNode: ICefDomNode;
//  sNodeID: string;
//begin
//  /// 主页上面的个人主页页签
//  ///  data-click="home_icon"
//  pHomeTabNode := DOMVisitor_SearchChildren(
//    document.GetElementById('bluebarRoot'),
//    'div', 'data-click', 'home_icon');
//
//  sNodeID := MSGDATA_EMPTY;
//  if assigned(pHomeTabNode) then
//    sNodeID := pHomeTabNode.GetElementAttribute('id');
//
//  SendBrowserMsg(browser, frame, DOMVISITOR_MSGNAME_SubmitMyPost, sNodeID);
//end;

procedure GlobalCEFApp_OnWebKitInitialized;
begin
  uBaseLog.HandleException(nil,'GlobalCEFApp_OnWebKitInitialized Begin');
  TCefRTTIExtension.Register('orangeuiextension', TOrangeUIExtension);
  uBaseLog.HandleException(nil,'GlobalCEFApp_OnWebKitInitialized End');
end;


procedure GlobalCEFApp_OnProcessMessageReceived(const browser: ICefBrowser;
    const frame: ICefFrame; sourceProcess: TCefProcessId;
    const message: ICefProcessMessage; var aHandled : boolean);
var
//  cSearchDOMNode: TSearchDOMNode;
  TempVisitor: TCefFastDomVisitor2;
  pVisitDom: ICefDomVisitor;
  sDataType: string;
  sParams: string;
begin
  uBaseLog.HandleException(nil,'GlobalCEFApp_OnProcessMessageReceived Begin');

  if not assigned(browser) or not assigned(frame) then Exit;


  if (message.Name='getContentStr') then
  begin
//    ShowMessage(message.ArgumentList.GetString(1));
    aHandled := True;
  end;


//  {$ifdef debug}
//  CefLog('Main', 1, CEF_LOG_SEVERITY_INFO, 'Global Received: ' + message.name);
//  {$endif}
//
//  if (message.name = RETRIEVEDOM_MSGNAME_FacebookLoginID) then
//  begin
//    TempVisitor := TCefFastDomVisitor2.Create(browser, frame, DOMVisitor_OnDocAvailable);
//    frame.VisitDom(TempVisitor);
//    aHandled := True;
//  end
//  else if message.Name = RETRIEVEDOM_MSGNAME_SearchID then
//  begin
//    TempVisitor := TCefFastDomVisitor2.Create(browser,frame, DOMVisitor_OnDocSearchID);
//    frame.VisitDom(TempVisitor);
//    aHandled := True;
//  end
//  else if message.Name = RETRIEVEDOM_MSGNAME_SearchPageID then
//  begin
//    TempVisitor := TCefFastDomVisitor2.Create(browser, frame, DOMVisitor_OnDocSearchPageID);
//    frame.VisitDom(TempVisitor);
//    aHandled := True;
//  end
//  else if message.Name = RETRIEVEDOM_MSGNAME_BarHomeTabID then
//  begin
//    TempVisitor := TCefFastDomVisitor2.Create(browser, frame, DOMVisitor_OnDocMyHomeID);
//    frame.VisitDom(TempVisitor);
//    aHandled := True;
//  end
//  else if message.Name = RETRIEVEDOM_MSGNAME_SubmitMyPost then
//  begin
//    TempVisitor := TCefFastDomVisitor2.Create(browser, frame, DOMVisitor_OnDocSubmitMyPost);
//    frame.VisitDom(TempVisitor);
//    aHandled := True;
//  end
//  else if message.Name = RETRIEVEDOM_MSGNAME_ExistsNode then
//  begin
//    pVisitDom:= TSearchDOMNode.Create(browser, frame, message.ArgumentList.GetString(0));
//    frame.VisitDom(pVisitDom);
//    aHandled := True;
//  end
//  else if message.Name = RETRIEVEDOM_MSGNAME_SearchNode then
//  begin
//    pVisitDom:= TSearchDOMNode.Create(browser, frame, message.ArgumentList.GetString(0));
//    frame.VisitDom(pVisitDom);
//    aHandled := True;
//  end
//  else if message.Name = RETRIEVEDOM_MSGNAME_SearchNodeList then
//  begin
//    CefLog('Main', 1, CEF_LOG_SEVERITY_INFO, 'Global Received: create TSearchDOMNodeList');
//    cSearchDOMNode := TSearchDOMNodeList.Create(browser, frame, message.ArgumentList.GetString(0));
//    cSearchDOMNode.MsgID := DOMVISITOR_MSGNAME_SearchNodeList;
//    pVisitDom := cSearchDOMNode;
//    frame.VisitDom(pVisitDom);
//    aHandled := True;
//  end
//  else if message.Name = RETRIEVEDOM_MSGNAME_ElementData then
//  begin
//    sDataType := message.ArgumentList.GetString(1);
//    cSearchDOMNode := TSearchDOMNode.Create(browser, frame, message.ArgumentList.GetString(0));
//    cSearchDOMNode.MsgID := DOMVISITOR_MSGNAME_ElementData;
//    cSearchDOMNode.VisitDataType := sDataType; //'ElementBounds';
//    pVisitDom := cSearchDOMNode;
//    frame.VisitDom(pVisitDom);
//    aHandled := True;
//  end
//  else if message.Name = RETRIEVEDOM_MSGNAME_FatchDatas then
//  begin
//    sParams := message.ArgumentList.GetString(0);
//    cSearchDOMNode := TFatchDOMNodeDatas.Create(browser, frame, sParams);
//    cSearchDOMNode.VisitDataType := message.ArgumentList.GetString(1);
//    cSearchDOMNode.ContextData := message.ArgumentList.GetString(2);
//
//    cSearchDOMNode.MsgID := DOMVISITOR_MSGNAME_FatchDatas;
//    pVisitDom := cSearchDOMNode;
//    frame.VisitDom(pVisitDom);
//    aHandled := True;
//  end

  uBaseLog.HandleException(nil,'GlobalCEFApp_OnProcessMessageReceived End');

end;


//function TCustomSearchDOMNodeData.Find(const AParent: ICefDomNode; const
//    TagName, AttName, AttVal: string): ICefDomNode;
//var
//  cNode: ICefDomNode;
//  sNodeAttVal: string;
//begin
//  Result := nil;
//  if not assigned(AParent) then
//    Exit;
//
//  cNode := AParent.FirstChild;
//  while not assigned(Result) and assigned(cNode) do
//  begin
//    if cNode.NodeType = DOM_NODE_TYPE_ELEMENT then
//    begin
//      if SameText(cNode.Name, TagName) then
//      begin
//        sNodeAttVal := cNode.GetElementAttribute(AttName);
//        if SameText(sNodeAttVal, AttVal) then
//        begin
//          Result := cNode;
//          Break;
//        end;
//      end;
//    end;
//    cNode := cNode.NextSibling;
//  end;
//
//  if assigned(Result) then
//    Exit;
//
//  cNode := AParent.FirstChild;
//  while not assigned(Result) and assigned(cNode) do
//  begin
//    if cNode.HasChildren and (cNode.NodeType = DOM_NODE_TYPE_ELEMENT)  then
//    begin
//      Result := Find(cNode, TagName, AttName, AttVal);
//      if assigned(Result) then
//        Break;
//    end;
//    cNode := cNode.NextSibling;
//  end;
//end;
//
//{ TSearchDOMNode }
//
//constructor TSearchDOMNode.Create(const browser: ICefBrowser; const AFrame:
//    ICefFrame; const AParams: string);
//begin
//  inherited Create;
//  FMsgID := DOMVISITOR_MSGNAME_SearchNode;
//  Pointer(FBrowser) := Pointer(browser);
//  Pointer(FFrame)   := Pointer(AFrame);
//  FParamData := AParams;
//  FVisitDataType := '';
//  LoadPath(AParams);
//
//end;
//
//function TSearchDOMNode.DebugPrintNodeInfo(const ANode: ICefDomNode): string;
//var
//  cStr: TStringBuilder;
//begin
//  if not Assigned(ANode) then
//    Exit('Null');
//
//  cStr := TStringBuilder.Create;
//  try
//    cStr.Append(ANode.Name);
//    cStr.Append('  class=');
//    cStr.Append(ANode.GetElementAttribute('class'));
////    cStr.Append('  ElementInnerText=');
////    cStr.Append(ANode.ElementInnerText);
//
//    Result := cStr.ToString;
//  finally
//    cStr.Free;
//  end;
//
//end;
//
//destructor TSearchDOMNode.Destroy;
//begin
//  Pointer(FBrowser) := nil;
//  Pointer(FFrame)   := nil;
//  inherited;
//end;
//
//function TSearchDOMNode.ExtractContent(const ANode: ICefDomNode;
//  const ADataType: string): string;
//var
//  sData: string;
//begin
//  /// 数据提取
//  ///
//  try
//  sData := MSGDATA_EMPTY;
//  if assigned(ANode) then
//  begin
//    if ADataType = '' then
//      sData := ANode.Name
//    else if SameText(ADataType,'ElementBounds') then
//    begin
//      // r.Left, r.Top, r.Right, r.Bottom
//      with ANode.ElementBounds do
//        sData := Format('%d,%d,%d,%d', [x, y, x + width, y + height]);
//    end
//
//    else if (ADataType[1] = '#') and (Pos('#const', LowerCase(ADataType)) > 0 ) then
//    begin
//      sData := Trim(Copy(ADataType, Length('#Const') + 1, MaxInt));
//    end
//    else if SameText(ADataType, '#URL') then
//    begin
//
//      sData := ANode.Document.BaseUrl;// FDocURL;  //https://www.yelp.com/search?find_desc=gems&find_loc=Willow+Glen%2C+San+Jose%2C+CA&ns=1
////      CefLog(ClassName, 973, CEF_LOG_SEVERITY_ERROR, '[Extract] = '+ADataType +' [Data] =' + sData);
//    end
//    else if SameText(ADataType, '#Text') or SameText('ElementInnerText', ADataType) then
//    begin
//      // 元素内所有文本
//      sData := ANode.ElementInnerText;
//    end
//    else
//    begin
//      if ANode.HasElementAttribute(ADataType) then
//        sData := ANode.GetElementAttribute(ADataType)
//      else
//        sData := MSGDATA_EMPTYAttrib;
//    end;
//  end;
//
//  //CefLog(ClassName, 973, CEF_LOG_SEVERITY_ERROR, '[Extract] = '+ADataType +' [Data] =' + sData);
//  Result := sData;
//  except
//    Result := MSGDATA_EMPTY;
//
//  end;
//end;
//
//procedure TSearchDOMNode.LoadPath(const AParams: string);
//begin
//end;
//
//procedure TSearchDOMNode.SendProcMsg(const AName, AData: string);
//var
//  pVals: ICefListValue;
//  cMsg: ICefProcessMessage;
//begin
//  cMsg := TCefProcessMessageRef.New(AName);
//  pVals := cMsg.ArgumentList;
//  pVals.SetString(0, AData);
//  FFrame.SendProcessMessage(PID_BROWSER, cMsg);
//end;
//
//function TSearchDOMNode.FindOfSelector(const AParent: ICefDomNode;
//    const ASelector: THtmlSelector; var ANode:ICefDomNode;
//    ACurLevel: Integer = 0): Boolean;
//var
//  pNode: ICefDomNode;
//  bValid: Boolean;
//begin
//  bValid := False;
//  {$ifdef DebugCef}
//  CefLog('find', 651, CEF_LOG_SEVERITY_ERROR,
//        'FindOfSelector ' +
//                  '  level = ' + inttostr(ACurLevel) +
////                  '  Node = ' + DebugPrintNodeInfo(ANode) +
//                  '  Path = ' + ASelector.Expression +
//                  '  Parent=' + DebugPrintNodeInfo(ANode));
//  {$endif}
//  ASelector.Reset;
//  if ASelector.Dir = sdFirst then
//  begin
//    pNode := AParent.FirstChild;
//    while assigned(pNode) do
//    begin
//      bValid := ASelector.Same(pNode);
//      if bValid then
//      begin
//        ANode := ASelector.GetNode(pNode);
//        Break;
//      end;
//      pNode := pNode.NextSibling;
//    end;
//  end
//  else if ASelector.Dir = sdLast then
//  begin
//    pNode := AParent.LastChild;
//    while assigned(pNode) do
//    begin
//      bValid := ASelector.Same(pNode);
//      if bValid then
//      begin
//        ANode := ASelector.GetNode(pNode);
//        Break;
//      end;
//      pNode := pNode.PreviousSibling;
//    end;
//  end;
//
//  if not bValid and (ACurLevel < ASelector.Level) then
//  begin
//    pNode := AParent.FirstChild;
//    while assigned(pNode) do
//    begin
//      if pNode.HasChildren then
//      begin
//        bValid := findOfSelector(pNode, ASelector, ANode, ACurLevel + 1);
//        if bValid then Break;
//      end;
//      pNode := pNode.NextSibling;
//    end;
//  end;
//
//
//
//  Result := bValid;
//end;
//
//
//function TSearchDOMNode.Find(const AParentNode: ICefDomNode; const APath: string): ICefDomNode;
//var
//  cSelecter: THtmlSelector;
//  pData: PChar;
//  sPath: string;
//  pDataNode, pPathNode: ICefDomNode;
//begin
//  Result := nil;
//  //CefLog('uMXCEFProcess', 1, CEF_LOG_SEVERITY_ERROR, ClassName + '.Find Params APath = (' + APath + ')' +
//  //          '  node =' + DebugPrintNodeInfo(AParentNode));
//
//  if (APath = '') or not assigned(AParentNode) then
//    Exit;
//
//  cSelecter := nil;
//  pDataNode := AParentNode;
//  try
//    pData := PChar(APath);
//    while TryReadNextValue(pData, sPath, ' ') do
//    begin
//      if sPath = '' then Continue;
//      //CefLog('uMXCEFProcess', 677, CEF_LOG_SEVERITY_ERROR, ' path = ' + sPath);
//
//      if sPath[1] = '#' then
//      begin
//        // ID 是唯一的，直接用默认方式找到
//        pDataNode := AParentNode.Document.GetElementById(Copy(sPath, 2, 120));
//      end
//      else
//      begin
//        if not Assigned(cSelecter) then cSelecter := THtmlSelector.Create;
//        cSelecter.Init(sPath);
////CefLog('uMXCEFProcess', 693, CEF_LOG_SEVERITY_ERROR, 'Find ' +
////                '  [path] = '+ sPath +
////                '  [node] = ' + IntToStr(cSelecter.Level)); // .(pDataNode));
//
//        pPathNode := nil;
//        FindOfSelector(pDataNode, cSelecter, pPathNode);
//        pDataNode := pPathNode;
//      end;
//
//      //CefLog('uMXCEFProcess', 693, CEF_LOG_SEVERITY_ERROR, 'Find ' +
//      //          '  [path] = '+ sPath +
//      //          '  [node] = ' + DebugPrintNodeInfo(pDataNode));
//
//      if not assigned(pDataNode) then
//        Break;
//
//
//    end;
//  finally
//    if assigned(cSelecter) then cSelecter.Free;
//  end;
//
//  Result := pDataNode;
//end;
//
//procedure TSearchDOMNode.visit(const document: ICefDomDocument);
//var
//  pDataNode: ICefDomNode;
//  sData: string;
//begin
//  CefLog('uMXCEFProcess', 705, CEF_LOG_SEVERITY_ERROR, 'TSearchDOMNode.visit ' + FParamData);
//
//  sData := '';
//  if assigned(document) then
//  begin
//    try
//      pDataNode := Find(document.Body, FParamData);
//      sData := ExtractContent(pDataNode, FVisitDataType);
//    except on e:exception do
//      CefLog('uMXCEFProcess', 714, CEF_LOG_SEVERITY_ERROR, '  error ' + e.message);
//    end;
//  end;
//
//  if FMsgID <> '' then
//    SendProcMsg(FMsgID, sData);
//end;
//
//{ TSearchDOMNodeList }
//
//destructor TSearchDOMNodeList.Destroy;
//begin
//  if assigned(FDatas) then
//    FreeAndNil(FDatas);
//  inherited;
//end;
//
//procedure TSearchDOMNodeList.LoadPath(const AParams: string);
//begin
//  //inherited;
//  if Assigned(FDatas) then
//    FDatas.free;
//  FDatas := TNodeCheckData.Create(Self, AParams);
//end;
//
//procedure TSearchDOMNodeList.visit(const document: ICefDomDocument);
//var
//  I: Integer;
//  pDataNode: ICefDomNode;
//  sData: string;
//
//  rResDatas: array of TOptParam;
//begin
//  {$ifdef DebugCef}
//  CefLog('uMXCEFProcess', 756, CEF_LOG_SEVERITY_ERROR, 'visit : ' + FParamData);
//  {$endif}
//  SetLength(rResDatas, FDatas.Count);
//
//  for I := 0 to FDatas.Count - 1 do
//  begin
//    rResDatas[i].Opt := FDatas.Items[i].Name;
//    pDataNode := Find(document.Body, FDatas.Items[i].Path);
//    rResDatas[i].Param := ExtractContent(pDataNode, FDatas.Items[i].Fatch);
//
//    {$ifdef DebugCef}
//    CefLog('uMXCEFProcess', 1357, CEF_LOG_SEVERITY_ERROR,
//          '  [index] ' + IntToStr(i) +
//          '  [path] ' + FDatas.Items[i].Path +
//          '  [' + rResDatas[i].Opt + '] = ' + rResDatas[i].Param);
//    {$endif}
//  end;
//
//  if FMsgID <> '' then
//  begin
//    sData := OptParamListToJsonStr(rResDatas, FDatas.Count);
//    SendProcMsg(FMsgID, sData);
//  end;
//   {$ifdef DebugCef}
//  CefLog('uMXCEFProcess', 1369, CEF_LOG_SEVERITY_ERROR, 'return ' + FMsgID + ' [val] = ' + sData);
//  {$endif}
//end;
//
//
//{ TFatchDOMNodeDatas }
//
//destructor TFatchDOMNodeDatas.Destroy;
//begin
//  FFatchDatas.Free;
//  inherited;
//end;
//
//
//{$ifdef DebugCef}
//procedure TFatchDOMNodeDatas.DebugPrintAllNodes(const AParentNode: ICefDomNode;
//    ALevel: integer);
//var
//  pCurr: ICefDomNode;
//  cStr: TStringBuilder;
//begin
//  pCurr := AParentNode.FirstChild;
//  while assigned(pCurr) do
//  begin
//    if pCurr.IsElement then
//    begin
//      cStr := TStringBuilder.Create;
//      cStr.Append(' ', ALevel * 2);
//      cStr.Append(pCurr.Name);
//      cStr.Append('  ');
//      cStr.Append(pCurr.GetElementAttribute('class'));
//      CefLog('DebugPrintAllNodes ', CEF_LOG_SEVERITY_ERROR, 724, cStr.ToString);
//      cStr.Free;
//
//      if pCurr.HasChildren then
//        DebugPrintAllNodes(pCurr, ALevel + 1);
//    end;
//
//    pCurr := pCurr.NextSibling;
//  end;
//end;
//{$endif}
//
//
//procedure TFatchDOMNodeDatas.FatchDataOfNode(const ADataNode: ICefDomNode);
//var I: Integer; pContentNode: ICefDomNode; sContentData: string; bAllow: Boolean;
//begin
//  for I := 0 to FFatchDatas.DataCount - 1 do
//  begin
//    if FFatchDatas.DataItems[i].Path = '' then pContentNode := ADataNode
//    else pContentNode := Find(ADataNode, FFatchDatas.DataItems[i].Path);
//
//  {$ifdef DebugCef}
//  CefLog('FatchDataOfNode', 700, CEF_LOG_SEVERITY_ERROR,
//            '  Fatch [Path] = ' + FFatchDatas.DataItems[i].Path +
//            '  [node] = ' +  DebugPrintNodeInfo(pContentNode));
//  {$endif}
//    sContentData := '';
//    if assigned(pContentNode) then
//    begin
//      sContentData := ExtractContent(pContentNode, FFatchDatas.DataItems[i].Fatch);
//      bAllow := True;
//      if FFatchDatas.DataItems[i].ignorenull then
//        if (sContentData = '') or SameStr(sContentData, MSGDATA_EMPTY) or SameStr(sContentData, MSGDATA_EMPTYAttrib) then
//          bAllow := False;
//
//      if bAllow then
//      begin
//        if FFatchDatas.DataItems[i].Name  <> '' then
//          FFatchDatas.AddData(fctData, i, sContentData);
//
//        if FFatchDatas.DataItems[i].Parser <> '' then
//          FFatchDatas.ParserData(FFatchDatas.DataItems[i].Parser, sContentData);
//      end;
//    end
//    else if not FFatchDatas.DataItems[i].ignorenull then
//      FFatchDatas.AddData(fctEmptyNode, i);
//
////    CefLog('uMXCEFPorcess', 707, CEF_LOG_SEVERITY_ERROR, '  fatch data node' +
////                 '  [content] = ' +  sContentData +
////                 '  [Index  ] = ' + inttostr(i+1) + '/' + inttostr(FFatchDatas.DataCount) +
////                 '  [node   ] = ' + DebugPrintNodeInfo(pContentNode)
////
////                 );
//  end;
//end;
//
//
//function TFatchDOMNodeDatas.FatchChildrenNode(const AParent: ICefDomNode;
//    ANodeFilter, AEofFilter: THtmlSelector; var ADataCount: integer): Boolean;
//var
//  pCurrNode, pDataNode: ICefDomNode;
//  bContinue: Boolean;
//begin
//  if FFatchDatas.FatchDir = fdAsc then pCurrNode := AParent.FirstChild
//  else pCurrNode := AParent.LastChild;
//
//  bContinue := True;
//  while assigned(pCurrNode) and (ADataCount < FFatchDatas.FatchCount) do
//  begin
//    //CefLog('TFatchDOMNodeDatas.ExtractDatas', 759, CEF_LOG_SEVERITY_ERROR, 'FatchDir= '+ DirNames[FFatchDatas.FatchDir] +  DebugPrintNodeInfo(pCurrNode));
//    if not assigned(ANodeFilter) or (ANodeFilter.Same(pCurrNode)) then
//    begin
//      if assigned(ANodeFilter) then pDataNode := ANodeFilter.GetNode(pCurrNode)
//      else pDataNode := pCurrNode;
//
//      FatchDataOfNode(pDataNode);
//      FFatchDatas.AddData(fctGroup, -1);
//      inc(ADataCount);
//      // CefLog('TFatchDOMNodeDatas.ExtractDatas', 760, CEF_LOG_SEVERITY_ERROR, ' ----->> fatch');
//    end;
//    if assigned(AEofFilter) and (AEofFilter.Same(pCurrNode)) then
//    Begin
//      bContinue := False;
//      Break;
//    End;
//
//    if FFatchDatas.FatchDir = fdAsc then pCurrNode := pCurrNode.NextSibling
//    else pCurrNode := pCurrNode.PreviousSibling;
//  end;
//
//  // 是否允许继续
//  if ADataCount >= FFatchDatas.FatchCount then
//    bContinue := False;
//
//  Result := bContinue;
//end;
//
//function TFatchDOMNodeDatas.FatchAllChildrenNodes(const AParent: ICefDomNode;
//    ANodeFilter, AEofFilter: THtmlSelector; var ADataCount: integer): Boolean;
//{$ifdef DebugCef}
//const
//  DirNames: array [TFacthDirection] of string  = ('Asc', 'Desc');
//{$endif}
//var
//  pCurrNode, pDataNode: ICefDomNode;
//  bContinue: Boolean;
//  bIsDataNode: Boolean;
//begin
//  if FFatchDatas.FatchDir = fdAsc then pCurrNode := AParent.FirstChild
//  else pCurrNode := AParent.LastChild;
//
//  bContinue := True;
//  while assigned(pCurrNode) and (ADataCount < FFatchDatas.FatchCount) do
//  begin
//    {$ifdef DebugCef}
//    CefLog('TFatchDOMNodeDatas.FatchAllChildrenNodes', 805, CEF_LOG_SEVERITY_ERROR, 'FatchDir= '+ DirNames[FFatchDatas.FatchDir] +  DebugPrintNodeInfo(pCurrNode));
//    {$endif}
//    bIsDataNode := False;
//    if not assigned(ANodeFilter) or (ANodeFilter.Same(pCurrNode)) then
//    begin
//      if assigned(ANodeFilter) then pDataNode := ANodeFilter.GetNode(pCurrNode)
//      else pDataNode := pCurrNode;
//
//      {$ifdef DebugCef}
//      //CefLog('TFatchDOMNodeDatas.FatchAllChildrenNodes', 815, CEF_LOG_SEVERITY_ERROR, 'FatchDir= '+ DebugPrintNodeInfo(pDataNode));
//      {$endif}
//
//      FatchDataOfNode(pDataNode);
//      FFatchDatas.AddData(fctGroup, -1);
//      inc(ADataCount);
//      bIsDataNode := True;
//    end;
//
//    if (ADataCount >= FFatchDatas.FatchCount) or (assigned(AEofFilter) and (AEofFilter.Same(pCurrNode))) then
//    Begin
//      bContinue := False;
//      Break;
//    End;
//
//    if (not bIsDataNode) and pCurrNode.HasChildren then
//      bContinue := FatchAllChildrenNodes(pCurrNode, ANodeFilter, AEofFilter, ADataCount);
//
//    if not bContinue then
//      Break;
//
//    if FFatchDatas.FatchDir = fdAsc then pCurrNode := pCurrNode.NextSibling
//    else pCurrNode := pCurrNode.PreviousSibling;
//  end;
//
//  // 是否允许继续
//  if ADataCount >= FFatchDatas.FatchCount then
//    bContinue := False;
//
//  Result := bContinue;
//end;
//
//
//function TFatchDOMNodeDatas.ExtractDatas(const AParentNode: ICefDomNode; var AData: string): Boolean;
//var
//  iCount: Integer;
//  function InitSelector(const s: string):THtmlSelector;
//  begin
//    Result := nil;
//    if s <> '' then
//    begin
//      Result := THtmlSelector.Create;
//      Result.Init(s);
//    end;
//  end;
//var
//  cNodeFilter, cEofFilter: THtmlSelector;
//begin
//  Result := False;
//  if not assigned(AParentNode) then
//    Exit;
//
//  iCount := 0;
//  if FFatchDatas.FatchLevel = flCurrent then
//  begin
//    FatchDataOfNode(AParentNode);
//  end
//  else if FFatchDatas.FatchLevel = flChildren then
//  begin
//    // 子节点搜索模式
//    //   1. 节点过滤
//    //   2. 结束标签
//    //
//    cNodeFilter := InitSelector(FFatchDatas.Filter);
//    cEofFilter := InitSelector(FFatchDatas.FatchEof);
//    FatchChildrenNode(AParentNode, cNodeFilter, cEofFilter, iCount);
//
//  end
//  else
//  begin
//    //DebugPrintAllNodes(AParentNode, 0);
//
//    cNodeFilter := InitSelector(FFatchDatas.Filter);
//    cEofFilter := InitSelector(FFatchDatas.FatchEof);
//    FatchAllChildrenNodes(AParentNode, cNodeFilter, cEofFilter, iCount);
//  end;
//
//  AData := FFatchDatas.ContentDatas(FContextData);
//  {$ifdef DebugCef}
//  CefLog('uMXCEFProcess', 1604, CEF_LOG_SEVERITY_ERROR,
//            '  Fatch [Items] = ' + intTostr(FFatchDatas.DataCount) +
//            '  [count] = ' + intTostr(FFatchDatas.DataCount) +
//            '  [content] = ' + AData);
//  {$endif}
//
//  Result := AData <> '';
//end;
//
//procedure TFatchDOMNodeDatas.LoadPath(const AParams: string);
//begin
//  if not assigned(FFatchDatas) then
//    FFatchDatas.Free;
//  FFatchDatas := TNodeFatchDatas.Create(Self, AParams);
//end;
//
//procedure TFatchDOMNodeDatas.visit(const document: ICefDomDocument);
//var
//  pParentNode: ICefDomNode;
//  sData: string;
//  vData: Variant;
//  cMsg: ICefProcessMessage;
//  sMsgKey: string;
//begin
//  try
//    pParentNode := Find(document.Body, FFatchDatas.RootPath);
//
//    //CefLog('TFatchDOMNodeDatas.visit', 960, CEF_LOG_SEVERITY_ERROR, document.BaseUrl);
//
//
//    {$ifdef DebugCef}
//    CefLog(ClassName, 890, CEF_LOG_SEVERITY_ERROR, 'visit Find ' +
//                    '  [Level] = ' + intToStr(ord(FFatchDatas.FatchLevel)) +
//                    '  [path] = '+ FFatchDatas.RootPath +
//                    '  [node] = ' + DebugPrintNodeInfo(pParentNode));
//    CefLog(ClassName, 890, CEF_LOG_SEVERITY_ERROR, FParamData);
//    {$endif}
//
//    if not ExtractDatas(pParentNode, sData) then
//      sData := '{"code":1}'; // 没有数据
//
//    //CefLog(ClassName, 1, CEF_LOG_SEVERITY_ERROR, 'visit ExtractDatas  [Datas] = ' + sData);
//  except
//    on e: exception do
//    begin
//      vData := JSONToValue('{"code":1001}');
//      vData.message := e.Message;
//      sData := vData; // 错误
//      CefLog('uMXCEFProcess', 1056, CEF_LOG_SEVERITY_ERROR, 'TFatchDOMNodeDatas.visit ' + e.Message);
//    end;
//  end;
//
//  sMsgKey := FFatchDatas.DataType;
//  if sMsgKey = '' then
//    sMsgKey := FMsgID;
//
//  cMsg := TCefProcessMessageRef.New(sMsgKey);
//  cMsg.ArgumentList.SetString(0, sData);
//  cMsg.ArgumentList.SetString(1, FFatchDatas.CommandName);
//  cMsg.ArgumentList.SetString(2, FFatchDatas.DataType);
//  FFrame.SendProcessMessage(PID_BROWSER, cMsg);
//end;


{ TCEFMessageContentList }

function TCEFMessageContentList.CheckMessageIsReceivedData(AMessageID: String;
  ATimeoutSeconds: Integer; AIsInThread: Boolean): String;
var
  ACEFMessageContent:TCEFMessageContent;
begin
  Result:='';
  ACEFMessageContent:=Self.CheckMessageIsReceived(AMessageID,ATimeoutSeconds,AIsInThread);
  if ACEFMessageContent<>nil then
  begin
    Result:=ACEFMessageContent.Data;
    FreeAndNil(ACEFMessageContent);
  end
  else
  begin
    uBaseLog.HandleException(nil,'TCEFMessageContentList.CheckMessageIsReceivedData 接收消息超时'+AMessageID);
  end;
end;

function TCEFMessageContentList.CheckMessageIsReceivedJson(AMessageID: String;
  ATimeoutSeconds: Integer; AIsInThread: Boolean): ISuperObject;
var
  AData:String;
begin
  AData:=Self.CheckMessageIsReceivedData(AMessageID,ATimeoutSeconds,AIsInThread);
  Result:=TSuperObject.Create(AData);
end;

constructor TCEFMessageContentList.Create(
  const AObjectOwnership: TObjectOwnership;
  const AIsCreateObjectChangeManager: Boolean);
begin
  inherited;
  FLock:=TCriticalSection.Create;
end;

destructor TCEFMessageContentList.Destroy;
begin
  FreeAndNil(FLock);
  inherited;
end;

function TCEFMessageContentList.Find(AMessageID: String): TCEFMessageContent;
var
  I: Integer;
begin
  Result:=nil;

  Self.Lock;
  try
    for I := 0 to Count-1 do
    begin
      if Items[I].ID=AMessageID then
      begin
        Result:=Items[I];
        Break;
      end;
    end;
  finally
    Self.UnLock;
  end;

end;

function TCEFMessageContentList.GetItem(Index: Integer): TCEFMessageContent;
begin
  Result:=TCEFMessageContent(Inherited Items[Index]);
end;

procedure TCEFMessageContentList.Lock;
begin
  FLock.Enter;
end;

procedure TCEFMessageContentList.UnLock;
begin
  FLock.Leave;
end;

function TCEFMessageContentList.CheckMessageIsReceived(AMessageID:String;ATimeoutSeconds:Integer;AIsInThread:Boolean=False): TCEFMessageContent;
var
  AStartTime:TDateTime;
begin
  Result:=nil;
//  if not Result then
//  begin
//    ShowMessage('未初始');
//  end;

  AStartTime:=Now();

  while Result=nil do
  begin
    Result:=Self.Find(AMessageID);
    if DateUtils.SecondsBetween(AStartTime,Now)>ATimeoutSeconds then
    begin
      //ShowMessage('HTML编辑器初始超时');
      Break;
    end;
    if Result<>nil then
    begin
      Self.Lock;
      try
        Self.Remove(Result,False);
      finally
        Self.UnLock;
      end;
      Break;
    end;
    if AIsInThread then
    begin
      Sleep(1000);
    end
    else
    begin
      Application.ProcessMessages;
    end;
  end;

end;



//{ TChromiumFrameList }
//
//function TChromiumFrameList.Add(AChromium: TChromium;
//  AFrame: TFrame): TChromiumFrame;
//begin
//  Result:=TChromiumFrame.Create;
//  Result.Chromium:=AChromium;
//  Result.Frame:=AFrame;
//  Inherited Add(Result);
//end;
//
//function TChromiumFrameList.GetItem(Index: Integer): TChromiumFrame;
//begin
//  Result:=TChromiumFrame(Inherited Items[Index]);
//end;
//
//initialization
//  GlobalChromiumFrameList:=TChromiumFrameList.Create(ooReference);
//
//finalization
//  FreeAndNil(GlobalChromiumFrameList);

end.

