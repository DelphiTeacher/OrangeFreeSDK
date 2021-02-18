//convert pas to utf8 by ¥

unit WebBrowserFrame;

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
//  uConst,
//  uManager,
//  uComponentType,
//  uUIFunction,
  EasyServiceCommonMaterialDataMoudle,
//  uInterfaceClass,

  FMX.WebBrowser, uSkinFireMonkeyButton, uSkinFireMonkeyControl,
  uSkinFireMonkeyPanel, uSkinButtonType, uSkinPanelType, uDrawCanvas,
  uSkinItems, uSkinScrollControlType, uSkinCustomListType, uSkinVirtualListType,
  uSkinListBoxType, uSkinFireMonkeyListBox, uSkinFireMonkeyPopup,
  System.Actions, FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions,
  FMX.Controls.Presentation;

type
  TFrameWebBrowser = class(TFrame,IFrameVirtualKeyboardEvent,IFrameHistroyCanReturnEvent)
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
    procedure btnReturnClick(Sender: TObject);
    procedure btnSyncClick(Sender: TObject);
    procedure FrameContext1ShowEx(Sender: TObject; AIsReturnShow: Boolean);
    procedure btnEmptyClick(Sender: TObject);
    procedure FrameContext1CanReturn(Sender: TObject;
      var AIsCanReturn: Boolean);
    procedure btnPopClick(Sender: TObject);
    procedure lbFunctionClickItem(AItem: TSkinItem);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure btnCookieClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FrameContext1Hide(Sender: TObject);
    procedure tmrNewURLTimer(Sender: TObject);
  private
    FWebBrowser: TWebBrowser;
    procedure DoWebBrowserDidFinishLoad(Sender:TObject);
    procedure WebBrowserShouldStartLoadWithRequest(ASender: TObject; const URL: string);
  private
    FNewURL:String;

    //创建WebBrowser
    procedure DoShow;
//    //停止并隐藏WebBrowser
//    procedure DoHide;

  public
    //是否可以返回上一个Frame
    function CanReturn:Integer;
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
    FUrl:String;
    procedure DoLoadUrl(AUrl:String);
    procedure LoadUrl(AUrl:String;ACaption:String='网页';AIsFirstLoad:Boolean=True);
    procedure LoadBodyHtml(ABodyHtml:String;ATempFileName:String;AIsFirstLoad:Boolean=True);
    { Public declarations }
  end;




var
  GlobalWebBrowserFrame:TFrameWebBrowser;
  GlobalWebBrowserFrame2:TFrameWebBrowser;

implementation

{$R *.fmx}

{ TFrameNewsDetail }

procedure TFrameWebBrowser.btnClearClick(Sender: TObject);
begin
  //
  FreeAndNil(FWebBrowser);

end;

procedure TFrameWebBrowser.btnCookieClick(Sender: TObject);
begin
//  DoLoadUrl(Const_OpenWebRoot+'/setcookie.php?user_fid=551');
//  FWebBrowser.Navigate('http://www.orangeui.cn/open'+'/setcookie.php?user_fid=551');


  HideFrame;
  ShowFrame(TFrame(GlobalWebBrowserFrame2),TFrameWebBrowser);//,Application.MainForm,nil,nil,nil,Application,True,True,ufsefNone);
  GlobalWebBrowserFrame2.LoadUrl('http://www.orangeui.cn/open'+'/setcookie.php?user_fid=551');

end;

procedure TFrameWebBrowser.btnEmptyClick(Sender: TObject);
begin
//  Self.LoadBodyHtml('','blank.html',False);
  Self.FWebBrowser.LoadFromStrings('','');
end;

procedure TFrameWebBrowser.btnPopClick(Sender: TObject);
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

procedure TFrameWebBrowser.btnPrintClick(Sender: TObject);
begin
//  DoLoadUrl(Const_OpenWebRoot+'/printcookie.php');

end;

procedure TFrameWebBrowser.btnReturnClick(Sender: TObject);
begin
  SetVirtualKeyboardToolBarEnabled(True);


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

procedure TFrameWebBrowser.btnSyncClick(Sender: TObject);
begin
  //刷新
//  LoadUrl(FUrl);
  Self.FWebBrowser.Reload;
end;

function TFrameWebBrowser.CanReturn: Integer;
begin
  //显示键盘工具栏
  SetVirtualKeyboardToolBarEnabled(True);

end;

constructor TFrameWebBrowser.Create(AOwner: TComponent);
begin
  inherited;
  FWebBrowser:=nil;

//  Self.pnlToolBar.Material.BackColor.FillColor.Color:=SkinThemeColor;



  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

destructor TFrameWebBrowser.Destroy;
begin
  FMX.Types.Log.d('TFrameWebBrowser.Destroy');

  {$IF DEFINED(IOS) OR DEFINED(ANDROID)}
  FWebBrowser.DisposeOf;
  {$ELSE}
  FreeAndNil(FWebBrowser);
  {$ENDIF}

  inherited;
end;

//procedure TFrameWebBrowser.DoHide;
//begin
//  FWebBrowser.Stop;
//  FWebBrowser.Visible:=False;
//
//end;

procedure TFrameWebBrowser.DoShow;
begin
  //创建WebBrowser
  if FWebBrowser=nil then
  begin
    FWebBrowser:=TWebBrowser.Create(Self);
    FWebBrowser.Align:=TAlignLayout.alClient;
    FWebBrowser.Parent:=Self.pnlClient;
    FWebBrowser.EnableCaching:=False;

    FWebBrowser.OnDidFinishLoad:=DoWebBrowserDidFinishLoad;
    FWebBrowser.OnShouldStartLoadWithRequest:=WebBrowserShouldStartLoadWithRequest;

//    {$IFDEF ANDROID}
//      //Android下用了透明任务栏的模式
//      //顶部任务栏用Panel增高的方式
//      if uComponentType.IsAndroidIntelCPU then
//      begin
////        Self.pnlToolBar.Margins.Bottom:=uComponentType.SystemStatusBarHeight;
//        pnlClient.Align:=TAlignLayout.None;
//        pnlClient.Anchors:=[TAnchorKind.akLeft, TAnchorKind.akTop, TAnchorKind.akRight, TAnchorKind.akBottom];
//        pnlClient.Height:=Height
//                            -pnlToolBar.Height;
////                            +uComponentType.SystemStatusBarHeight;
//        pnlClient.SetBounds(0,
//                            Self.pnlToolBar.Height+uComponentType.SystemStatusBarHeight,
//                            Width,
//                            pnlClient.Height
//                            );
//
//        //        FWebBrowser.Margins.Top:=uComponentType.SystemStatusBarHeight;
//      end;
//
////    {$IFDEF VER310}//10.2已经修复这个问题了
////    //修复Android任务栏透明的情况下,会下移
////    FMX.WebBrowser.Android.WebBrowserSystemStatusBarHeight:=
////          uComponentType.SystemStatusBarHeight;
////    {$ENDIF}
//    {$ENDIF}
  end;

  FWebBrowser.Visible:=True;

end;

procedure TFrameWebBrowser.DoVirtualKeyboardHide(KeyboardVisible: Boolean;
  const Bounds: TRect);
begin
  Self.pnlBottom.Height:=0;
end;

procedure TFrameWebBrowser.DoVirtualKeyboardShow(KeyboardVisible: Boolean;
  const Bounds: TRect);
begin
  Self.pnlBottom.Height:= RectHeight(Bounds);
end;

procedure TFrameWebBrowser.LoadBodyHtml(ABodyHtml:String;ATempFileName:String;AIsFirstLoad:Boolean);
var
  AHtmlSource:TStringList;
  AHtmlLocalFileCodePath:String;
begin
  FUrl:='';

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

procedure TFrameWebBrowser.LoadUrl(AUrl:String;ACaption:String;AIsFirstLoad:Boolean);
begin
  FMX.Types.Log.d('OrangeUI LoadUrl Begin');


  //隐藏键盘工具栏,WebBrowser弹出的键盘自带
  SetVirtualKeyboardToolBarEnabled(False);


  FUrl:=AUrl;
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

procedure TFrameWebBrowser.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  //下载链接
  ShowShareSheetAction1.TextMessage:=FUrl;

end;

procedure TFrameWebBrowser.tmrNewURLTimer(Sender: TObject);
var
  ANewURL:String;
//  GlobalWebBrowserFrame2:TFrameWebBrowser;
begin
  //tmrNewURL.Enabled:=False;

  if FNewURL<>'' then
  begin
    ANewURL:=FNewURL;
    FNewURL:='';


    HideFrame;
    ShowFrame(TFrame(GlobalWebBrowserFrame2),TFrameWebBrowser);//,Application.MainForm,nil,nil,nil,Application,True,True,ufsefNone);
    GlobalWebBrowserFrame2.LoadUrl(ANewURL,'');

  end;

end;

procedure TFrameWebBrowser.WebBrowserShouldStartLoadWithRequest(
  ASender: TObject; const URL: string);
begin
  FMX.Types.Log.d('OrangeUI WebBrowserShouldStartLoadWithRequest Begin '+URL);

  if URL<>FUrl then
  begin
    FNewURL:=URL;

    TThread.Synchronize(nil,procedure
    begin
      Self.tmrNewURL.Enabled:=True;
      Self.FWebBrowser.Stop;
    end);

//    TThread.ForceQueue(nil,
//      procedure
//      begin
//        Self.tmrNewURL.Enabled:=True;
//      end);

  end;

  FMX.Types.Log.d('OrangeUI WebBrowserShouldStartLoadWithRequest End ');
end;

procedure TFrameWebBrowser.DoLoadUrl(AUrl:String);
begin
  FMX.Types.Log.d('OrangeUI DoLoadUrl Begin');

  FUrl:=AUrl;

  //创建WebBrowser
  DoShow;

  //浏览网页
  Self.FWebBrowser.Navigate(FUrl);




//  DoWebBrowserRealign;


//  if uComponentType.IsAndroidIntelCPU and (Self.FWebBrowser.Align=TAlignLayout.Client) then
//  begin
//    Self.FWebBrowser.Align:=TAlignLayout.None;
//    Self.FWebBrowser.Position.Y:=-uComponentType.SystemStatusBarHeight;
//  end;


  FMX.Types.Log.d('OrangeUI DoLoadUrl End');
end;

procedure TFrameWebBrowser.DoWebBrowserDidFinishLoad(Sender: TObject);
begin
  //网页加载结束,隐藏滚动框



end;

procedure TFrameWebBrowser.FrameContext1CanReturn(Sender: TObject;
  var AIsCanReturn: Boolean);
begin

  //返回的时候清空WebBrowser,避免释放不干净,继续播放的问题
  if FWebBrowser<>nil then
  begin
    Self.FWebBrowser.LoadFromStrings('','');
  end;

//  DoHide;

end;

procedure TFrameWebBrowser.FrameContext1Hide(Sender: TObject);
begin
  //
  if popScan.IsOpen then
  begin
    popScan.IsOpen := False;
  end;

end;

procedure TFrameWebBrowser.FrameContext1ShowEx(Sender: TObject;
  AIsReturnShow: Boolean);
begin
//  if not AIsReturnShow then
//  begin
//    //第一次加载显示
//    if (FWebBrowser=nil) and (FUrl<>'') or (FWebBrowser<>nil) and (FWebBrowser.URL<>FUrl) then
//    begin
//      DoLoadUrl(FUrl);
//    end;
//  end;
end;

procedure TFrameWebBrowser.lbFunctionClickItem(AItem: TSkinItem);
begin
  Self.popScan.IsOpen:=False;

  if AItem.Name='copy_url' then
  begin
    //拷贝URL
    MySetClipboard(Self.FUrl);
    ShowHintFrame(nil,'已复制到剪切板');
  end;

  if AItem.Name='open_in_system_browser' then
  begin
    //在浏览器中打开
    OpenWebBrowserAndNavigateURL(FUrl);
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

end.

