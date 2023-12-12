//convert pas to utf8 by ¥

unit CEFWebBrowserFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

  {$IFDEF ANDROID}
  FMX.WebBrowser.Android,
  {$ENDIF}


  HintFrame,
  uMobileUtils,
  uSkinMaterial,
  uFileCommon,
  uUIFunction,
  uComponentType,
  uFrameContext,
  uBaseList,
//  uConst,
//  uManager,
//  uComponentType,
//  uUIFunction,
  EasyServiceCommonMaterialDataMoudle,
//  uInterfaceClass,
  WebbrowserControlUtils,

  FMX.WebBrowser, uSkinFireMonkeyButton, uSkinFireMonkeyControl,
  uSkinFireMonkeyPanel, uSkinButtonType, uSkinPanelType, uDrawCanvas,
  uSkinItems, uSkinScrollControlType, uSkinCustomListType, uSkinVirtualListType,
  uSkinListBoxType, uSkinFireMonkeyListBox, uSkinFireMonkeyPopup,
  System.Actions, FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions,
  FMX.Controls.Presentation, uCEFChromiumCore, uCEFFMXChromium;

type
  TFrameCEFWebBrowser = class(TFrame,IFrameVirtualKeyboardEvent,IFrameHistroyCanReturnEvent)
    pnlToolBar: TSkinFMXPanel;
    pnlClient: TSkinFMXPanel;
    btnSync: TSkinFMXButton;
    btnReturn: TSkinFMXButton;
    FrameContext1: TFrameContext;
    btnEmpty: TSkinFMXButton;
    btnPop: TSkinFMXButton;
    popScan: TSkinFMXPopup;
    lbFunction: TSkinFMXListBox;
    ActionListShare: TActionList;
    ShowShareSheetAction1: TShowShareSheetAction;
    pnlBottom: TSkinFMXPanel;
    btnCookie: TSkinFMXButton;
    btnPrint: TSkinFMXButton;
    btnClear: TSkinFMXButton;
    tmrNewURL: TTimer;
    btnReturn_Material: TSkinButtonDefaultMaterial;
    FWebBrowser: TFMXChromium;
    procedure btnReturnClick(Sender: TObject);
    procedure btnSyncClick(Sender: TObject);
    procedure btnEmptyClick(Sender: TObject);
    procedure FrameContext1CanReturn(Sender: TObject;
      var AIsCanReturn: TFrameReturnActionType);
    procedure btnPopClick(Sender: TObject);
    procedure lbFunctionClickItem(AItem: TSkinItem);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure btnCookieClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FrameContext1Hide(Sender: TObject);
    procedure tmrNewURLTimer(Sender: TObject);
  private
    procedure DoWebBrowserDidStartLoad(Sender:TObject);
    procedure DoWebBrowserDidFinishLoad(Sender:TObject);
    procedure DoWebBrowserShouldStartLoadWithRequest(ASender: TObject; const URL: string);
  private
    FNewURL:String;
//    FHistoryURLList:TStringList;

    //创建WebBrowser
    procedure DoShow;
//    //停止并隐藏WebBrowser
//    procedure DoHide;

  public
    //是否可以返回上一个Frame
    function CanReturn:TFrameReturnActionType;
  public
    //显示虚拟键盘
    procedure DoVirtualKeyboardShow(KeyboardVisible: Boolean; const Bounds: TRect);
    //隐藏虚拟键盘
    procedure DoVirtualKeyboardHide(KeyboardVisible: Boolean; const Bounds: TRect);
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    Destructor Destroy;override;
  public
//    procedure LoadNewsUrl(news_fid:Integer);
  public
    FFirstUrl:String;
    FOnWebBrowserDidStartLoad:TWebBrowserDidStartLoad;
    FOnWebBrowserShouldStartLoadWithRequest:TWebBrowsershouldStartLoadWithRequest;
    procedure DoLoadUrl(AUrl:String);
    procedure LoadUrl(AUrl:String;ACaption:String='网页';AIsFirstLoad:Boolean=True);
    procedure LoadBodyHtml(ABodyHtml:String;ATempFileName:String;AIsFirstLoad:Boolean=True);
    { Public declarations }
  end;




var
  GlobalWebBrowserFrame:TFrameCEFWebBrowser;
  GlobalWebBrowserFrameList:TBaseList;

implementation

{$R *.fmx}

{ TFrameNewsDetail }

procedure TFrameCEFWebBrowser.btnClearClick(Sender: TObject);
begin
  //
  FreeAndNil(FWebBrowser);

end;

procedure TFrameCEFWebBrowser.btnCookieClick(Sender: TObject);
//var
//  AWebBrowserFrame:TFrameWebBrowser;
begin
//  DoLoadUrl(Const_OpenWebRoot+'/setcookie.php?user_fid=551');
//  FWebBrowser.Navigate('http://www.orangeui.cn/open'+'/setcookie.php?user_fid=551');


//  HideFrame;
//  ShowFrame(TFrame(AWebBrowserFrame),TFrameWebBrowser);//,Application.MainForm,nil,nil,nil,Application,True,True,ufsefNone);
//  AWebBrowserFrame.LoadUrl('http://www.orangeui.cn/open'+'/setcookie.php?user_fid=551');
//  GlobalWebBrowserFrameList.Add(AWebBrowserFrame);

end;

procedure TFrameCEFWebBrowser.btnEmptyClick(Sender: TObject);
begin
//  Self.LoadBodyHtml('','blank.html',False);
//  Self.FWebBrowser.LoadFromStrings('','');
end;

procedure TFrameCEFWebBrowser.btnPopClick(Sender: TObject);
begin

  Self.popScan.Height:=Self.lbFunction.Prop.GetContentHeight+Self.popScan.Padding.Top+Self.popScan.Padding.Bottom;
  //弹出菜单
  if not popScan.IsOpen then
  begin
    //绝对位置
    popScan.PlacementRectangle.Left:=Self.LocalToScreen(
          PointF(Self.btnPop.Position.X+Self.btnPop.Width,
                Self.btnPop.Position.Y)
                ).X
                -Self.popScan.Width
                -5;
    popScan.PlacementRectangle.Top:=Self.LocalToScreen(PointF(0,Self.pnlToolBar.Height+10)).Y-25;
    popScan.IsOpen := True;
  end
  else
  begin
    popScan.IsOpen := False;
  end;

end;

procedure TFrameCEFWebBrowser.btnPrintClick(Sender: TObject);
begin
//  DoLoadUrl(Const_OpenWebRoot+'/printcookie.php');

end;

procedure TFrameCEFWebBrowser.btnReturnClick(Sender: TObject);
begin
  SetVirtualKeyboardToolBarEnabled(True);


  //是否能返回上一页
  if (FWebBrowser<>nil) and (Self.FWebBrowser.CanGoBack) then
  begin
//    FMX.Types.Log.d('OrangeUI TFrameWebBrowser.btnReturnClick FWebBrowser.URL:'+Self.FWebBrowser.URL);
    FMX.Types.Log.d('OrangeUI TFrameWebBrowser.btnReturnClick GoBack');
    Self.FWebBrowser.GoBack;
    Exit;
  end;


  //清空
//  Self.FWebBrowser.Navigate('about:blank');
//  Self.LoadBodyHtml('','blank.html');
//
//  //隐藏,不然切换会卡
//  DoHide;


  //返回
  HideFrame;//();
  ReturnFrame();
  //不释放
  //nil,1,True);//();
end;

procedure TFrameCEFWebBrowser.btnSyncClick(Sender: TObject);
begin
  //刷新
//  LoadUrl(FFirstUrl);
  Self.FWebBrowser.Reload;
end;

function TFrameCEFWebBrowser.CanReturn: TFrameReturnActionType;
begin
  //显示键盘工具栏
  SetVirtualKeyboardToolBarEnabled(True);

end;

constructor TFrameCEFWebBrowser.Create(AOwner: TComponent);
begin
  inherited;
  FWebBrowser:=nil;

//  Self.pnlToolBar.Material.BackColor.FillColor.Color:=SkinThemeColor;

//  FHistoryURLList:=TStringList.Create;


  {$IFDEF MSWINDOWS}
  WebbrowserControlUtils.SetIEFeatureModeCorrespond;
  {$ENDIF}

  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

destructor TFrameCEFWebBrowser.Destroy;
begin
  FMX.Types.Log.d('OrangeUI TFrameWebBrowser.Destroy');

  {$IF DEFINED(IOS) OR DEFINED(ANDROID)}
  FWebBrowser.DisposeOf;
  {$ELSE}
  FreeAndNil(FWebBrowser);
  {$ENDIF}

//  FreeAndNil(FHistoryURLList);

  inherited;
end;

//procedure TFrameWebBrowser.DoHide;
//begin
//  FWebBrowser.Stop;
//  FWebBrowser.Visible:=False;
//
//end;

procedure TFrameCEFWebBrowser.DoShow;
begin
//  //创建WebBrowser
//  if FWebBrowser=nil then
//  begin
//    FWebBrowser:=TWebBrowser.Create(Self);
//    FWebBrowser.Align:=TAlignLayout.{$IF CompilerVersion >= 34.0}{$ELSE}al{$ENDIF}Client;
//    FWebBrowser.Parent:=Self.pnlClient;
//    FWebBrowser.EnableCaching:=False;
//
//    FWebBrowser.OnDidStartLoad:=DoWebBrowserDidStartLoad;
//    FWebBrowser.OnDidFinishLoad:=DoWebBrowserDidFinishLoad;
//    FWebBrowser.OnShouldStartLoadWithRequest:=DoWebBrowserShouldStartLoadWithRequest;
//
////    {$IFDEF ANDROID}
////      //Android下用了透明任务栏的模式
////      //顶部任务栏用Panel增高的方式
////      if uComponentType.IsAndroidIntelCPU then
////      begin
//////        Self.pnlToolBar.Margins.Bottom:=uComponentType.SystemStatusBarHeight;
////        pnlClient.Align:=TAlignLayout.None;
////        pnlClient.Anchors:=[TAnchorKind.akLeft, TAnchorKind.akTop, TAnchorKind.akRight, TAnchorKind.akBottom];
////        pnlClient.Height:=Height
////                            -pnlToolBar.Height;
//////                            +uComponentType.SystemStatusBarHeight;
////        pnlClient.SetBounds(0,
////                            Self.pnlToolBar.Height+uComponentType.SystemStatusBarHeight,
////                            Width,
////                            pnlClient.Height
////                            );
////
////        //        FWebBrowser.Margins.Top:=uComponentType.SystemStatusBarHeight;
////      end;
////
//////    {$IFDEF VER310}//10.2已经修复这个问题了
//////    //修复Android任务栏透明的情况下,会下移
//////    FMX.WebBrowser.Android.WebBrowserSystemStatusBarHeight:=
//////          uComponentType.SystemStatusBarHeight;
//////    {$ENDIF}
////    {$ENDIF}
//  end;
//
//  FWebBrowser.Visible:=True;

end;

procedure TFrameCEFWebBrowser.DoVirtualKeyboardHide(KeyboardVisible: Boolean;
  const Bounds: TRect);
begin
  Self.pnlBottom.Height:=0;
end;

procedure TFrameCEFWebBrowser.DoVirtualKeyboardShow(KeyboardVisible: Boolean;
  const Bounds: TRect);
begin
  Self.pnlBottom.Height:= RectHeight(Bounds);
end;

procedure TFrameCEFWebBrowser.LoadBodyHtml(ABodyHtml:String;ATempFileName:String;AIsFirstLoad:Boolean);
var
  AHtmlSource:TStringList;
  AHtmlLocalFileCodePath:String;
begin
  FFirstUrl:='';

  //把保存成html,然后用WebBrowser加载

  AHtmlSource:=TStringList.Create;
  try

    AHtmlSource.Add(''
      +#13#10+'<html>  '
      +#13#10+'<head>  '
      +#13#10+'<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   '
      +#13#10+'<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />'
      +#13#10+'</head> '
      +#13#10+'<body>  '

      +ABodyHtml

      +#13#10+'</body> '
      +#13#10+'</html> ');


    //保存HTML文件
    AHtmlLocalFileCodePath:=uFileCommon.GetApplicationPath+ATempFileName;

    AHtmlSource.SaveToFile(AHtmlLocalFileCodePath,TEncoding.UTF8);

    //加载HTML文件
    LoadUrl('file://'+AHtmlLocalFileCodePath,Self.pnlToolBar.Caption,AIsFirstLoad);

  finally
    uFuncCommon.FreeAndNil(AHtmlSource);
  end;

end;

//procedure TFrameWebBrowser.LoadNewsUrl(news_fid: Integer);
//begin
//
//  //拼接新闻链接
//  DoLoadUrl(Const_News_Url+IntToStr(news_fid));
//end;

procedure TFrameCEFWebBrowser.LoadUrl(AUrl:String;ACaption:String;AIsFirstLoad:Boolean);
begin
  FMX.Types.Log.d('OrangeUI LoadUrl Begin');

  //先释放,点击返回按钮的时候要返回上一页，不释放的话，会一直返回到之前打开过的页面，因为这是一个公共页面
  FreeAndNil(Self.FWebBrowser);

  //隐藏键盘工具栏,WebBrowser弹出的键盘自带
  SetVirtualKeyboardToolBarEnabled(False);


  FFirstUrl:=AUrl;
  Self.pnlToolBar.Caption:=ACaption;


//  if AIsFirstLoad then
//  begin
//    //第一次加载是在FrameContext.Show事件中
//  end
//  else
//  begin

    DoLoadUrl(AUrl);


//  end;


  FMX.Types.Log.d('OrangeUI LoadUrl End');

end;

procedure TFrameCEFWebBrowser.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  //下载链接
  ShowShareSheetAction1.TextMessage:=FFirstUrl;

end;

procedure TFrameCEFWebBrowser.tmrNewURLTimer(Sender: TObject);
//var
//  ANewURL:String;
//  AWebBrowserFrame:TFrameWebBrowser;
begin
  FMX.Types.Log.d('OrangeUI TFrameWebBrowser.tmrNewURLTimer Begin');
//  tmrNewURL.Enabled:=False;
//
//  if FNewURL<>'' then
//  begin
//    ANewURL:=FNewURL;
//    FNewURL:='';
//
//
//    HideFrame;
//    ShowFrame(TFrame(AWebBrowserFrame),TFrameWebBrowser);//,Application.MainForm,nil,nil,nil,Application,True,True,ufsefNone);
//    AWebBrowserFrame.LoadUrl(ANewURL,'');
//    GlobalWebBrowserFrameList.Add(AWebBrowserFrame);
//
//  end;

  FMX.Types.Log.d('OrangeUI TFrameWebBrowser.tmrNewURLTimer End');
end;

procedure TFrameCEFWebBrowser.DoWebBrowserShouldStartLoadWithRequest(
  ASender: TObject; const URL: string);
begin
  FMX.Types.Log.d('OrangeUI DoWebBrowserShouldStartLoadWithRequest Begin OldUrl:'+FFirstUrl);
  FMX.Types.Log.d('OrangeUI DoWebBrowserShouldStartLoadWithRequest Begin NewURL:'+URL);

  if Assigned(FOnWebBrowserShouldStartLoadWithRequest) then
  begin
    FOnWebBrowserShouldStartLoadWithRequest(ASender,URL);
  end;

//  //需要跳转到一个新的页面去了
//  if not SameText(URL,FFirstUrl) and not SameText(URL,'about:blank') then
//  begin
//
//    FNewURL:=URL;
//
//    TThread.Synchronize(nil,procedure
//    begin
//      Self.tmrNewURL.Enabled:=True;
//      Self.FWebBrowser.Stop;
//    end);
//
////    TThread.ForceQueue(nil,
////      procedure
////      begin
////        Self.tmrNewURL.Enabled:=True;
////      end);
//
//  end;


  FMX.Types.Log.d('OrangeUI DoWebBrowserShouldStartLoadWithRequest End ');
end;

procedure TFrameCEFWebBrowser.DoLoadUrl(AUrl:String);
begin
  FMX.Types.Log.d('OrangeUI DoLoadUrl Begin');

  FFirstUrl:=AUrl;

  //创建WebBrowser
  DoShow;

  //浏览网页
//  Self.FWebBrowser.Navigate(FFirstUrl);
  Self.FWebBrowser.LoadURL(FFirstUrl);



//  DoWebBrowserRealign;


//  if uComponentType.IsAndroidIntelCPU and (Self.FWebBrowser.Align=TAlignLayout.Client) then
//  begin
//    Self.FWebBrowser.Align:=TAlignLayout.None;
//    Self.FWebBrowser.Position.Y:=-uComponentType.SystemStatusBarHeight;
//  end;


  FMX.Types.Log.d('OrangeUI DoLoadUrl End');
end;

procedure TFrameCEFWebBrowser.DoWebBrowserDidFinishLoad(Sender: TObject);
begin
  //网页加载结束,隐藏滚动框



end;

procedure TFrameCEFWebBrowser.DoWebBrowserDidStartLoad(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TFrameWebBrowser.DoWebBrowserDidStartLoad Begin');

  if Assigned(FOnWebBrowserDidStartLoad) then
  begin
    FOnWebBrowserDidStartLoad(Self);
  end;

end;

procedure TFrameCEFWebBrowser.FrameContext1CanReturn(Sender: TObject;
  var AIsCanReturn: TFrameReturnActionType);
begin
  FMX.Types.Log.d('OrangeUI TFrameWebBrowser.FrameContext1CanReturn Begin');

//  //返回的时候清空WebBrowser,避免释放不干净,继续播放的问题
//  if FWebBrowser<>nil then
//  begin
//    Self.FWebBrowser.LoadFromStrings('','');
//  end;

//  DoHide;

  FMX.Types.Log.d('OrangeUI TFrameWebBrowser.FrameContext1CanReturn End');
end;

procedure TFrameCEFWebBrowser.FrameContext1Hide(Sender: TObject);
begin
  //
  if popScan.IsOpen then
  begin
    popScan.IsOpen := False;
  end;

end;

procedure TFrameCEFWebBrowser.lbFunctionClickItem(AItem: TSkinItem);
begin
  Self.popScan.IsOpen:=False;

  if AItem.Name='copy_url' then
  begin
    //拷贝URL
    MySetClipboard(Self.FFirstUrl);
    ShowHintFrame(nil,'已复制到剪切板');
  end;

  if AItem.Name='open_in_system_browser' then
  begin
    //在浏览器中打开
    OpenWebBrowserAndNavigateURL(FFirstUrl);
  end;

  if AItem.Name='share' then
  begin
    //分享
    ShowShareSheetAction1.ExecuteTarget(Self);
  end;

  if AItem.Name='refresh' then
  begin
    //刷新
    Self.btnSyncClick(nil);
  end;


end;

initialization
  GlobalWebBrowserFrameList:=TBaseList.Create(ooReference);

finalization
  FreeAndNil(GlobalWebBrowserFrameList);

end.

