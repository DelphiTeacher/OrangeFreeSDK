unit BaseWebBrowserForm;

interface

uses
  {$IFDEF MSWINDOWS}
  Winapi.Messages, Winapi.Windows,
  {$ENDIF}
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  System.Notification, uTimerTaskEvent,


  uBaseWebBrowserFrameManager,
  BaseWebBrowserFrame,

  uCEFInterfaces, uCEFConstants, uCEFTypes, uCEFChromiumCore,
  uCEFFMXWindowParent;


const
//  MINIBROWSER_CONTEXTMENU_SHOWDEVTOOLS    = MENU_ID_USER_FIRST + 1;
  CEF_SHOWBROWSER   = WM_APP + $101;


type
  TfrmBaseWebBrowser = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure tmrWaitCloseAllChromiumTimer(Sender: TObject);
  private
    { Private declarations }

  private
    // Variables to control when can we destroy the form safely
    FCanClose : boolean;  // Set to True in TFMXChromium.OnBeforeClose
    FClosing  : boolean;  // Set to True in the CloseQuery event.
  private
//    {$IFDEF MSWINDOWS}
//    // This is a workaround for the issue #253
//    // https://github.com/salvadordf/CEF4Delphi/issues/253
//    FCustomWindowState      : TWindowState;
//    FOldWndPrc              : TFNWndProc;
//    FFormStub               : Pointer;
//    {$ENDIF}
//    {$IFDEF MSWINDOWS}
//    function  GetCurrentWindowState : TWindowState;
//    procedure UpdateCustomWindowState;
//    procedure CreateHandle; override;
//    procedure DestroyHandle; override;
//    procedure CustomWndProc(var aMessage: TMessage);
//    {$ENDIF}
//    function  PostCustomMessage(aMsg : cardinal; aWParam : WPARAM = 0; aLParam : LPARAM = 0) : boolean;
  public
//    procedure NotifyMoveOrResizeStarted;
//    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;
//    procedure DoCustomChromiumClose(AAPIFrame:TObject);
    { Private declarations }
  public
    FBaseWebBrowserFrame:TFrameBaseWebBrowser;
    procedure PrepareFreeWebBrowser;virtual;
    procedure DoBaseWebBrowserFrameCanFree(Sender:TObject);
    { Public declarations }
  end;

var
  frmBaseWebBrowser: TfrmBaseWebBrowser;

implementation

{$R *.dfm}

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
uses
  FMX.Platform, FMX.Platform.Win,
  uCEFMiscFunctions, uCEFApplication;

procedure TfrmBaseWebBrowser.FormCreate(Sender: TObject);
begin

  FCanClose          := False;
  FClosing           := False;
//  {$IFDEF MSWINDOWS}
//  FCustomWindowState := WindowState;
//  {$ENDIF}

//  //测试CEF是否能正确释放
//  FBaseWebBrowserFrame:=TFrameBaseWebBrowser.Create(Self);
//  FBaseWebBrowserFrame.FOnCanFree:=DoBaseWebBrowserFrameCanFree;
//  FBaseWebBrowserFrame.Parent:=Self;
//  FBaseWebBrowserFrame.Align:=alClient;
//  FBaseWebBrowserFrame.DefaultURL:='https://www.facebook.com/';


end;

procedure TfrmBaseWebBrowser.PrepareFreeWebBrowser;
begin

end;

//function TfrmBaseWebBrowser.PostCustomMessage(aMsg : cardinal; aWParam : WPARAM; aLParam : LPARAM) : boolean;
//{$IFDEF MSWINDOWS}
//var
//  TempHWND : HWND;
//{$ENDIF}
//begin
//  {$IFDEF MSWINDOWS}
//  TempHWND := FmxHandleToHWND(Handle);
//  Result   := (TempHWND <> 0) and WinApi.Windows.PostMessage(TempHWND, aMsg, aWParam, aLParam);
//  {$ELSE}
//  Result   := False;
//  {$ENDIF}
//end;

procedure TfrmBaseWebBrowser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmBaseWebBrowser.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  I: Integer;
begin

  if FBaseWebBrowserFrame<>nil then
  begin

      CanClose := FCanClose;

      if not(FClosing) then
        begin
          FClosing := True;
    //      Visible  := False;
          //FWebBrowser.CloseBrowser(True);
          PrepareFreeWebBrowser;

          FBaseWebBrowserFrame.PrepareFree;
    //      for I := 0 to GlobalWebBrowserFrameList.Count-1 do
    //      begin
    ////        TFrameBaseWebSearchAPI(GlobalWebSearchAPIFrameList[I]).OnCustomChromiumClose:=DoCustomChromiumClose;
    //        TFrameBaseWebBrowser(GlobalWebBrowserFrameList[I]).PrepareFree;
    //      end;
    //      tmrWaitCloseAllChromium.Enabled:=True;
        end;

  end;
end;

//{$IFDEF MSWINDOWS}
//procedure TfrmBaseWebBrowser.CreateHandle;
//begin
//  inherited CreateHandle;
//  FFormStub  := MakeObjectInstance(CustomWndProc);
//  FOldWndPrc := TFNWndProc(SetWindowLongPtr(FmxHandleToHWND(Handle), GWLP_WNDPROC, NativeInt(FFormStub)));
//end;
//
//procedure TfrmBaseWebBrowser.DestroyHandle;
//begin
//  SetWindowLongPtr(FmxHandleToHWND(Handle), GWLP_WNDPROC, NativeInt(FOldWndPrc));
//  FreeObjectInstance(FFormStub);
//  inherited DestroyHandle;
//end;

procedure TfrmBaseWebBrowser.DoBaseWebBrowserFrameCanFree(Sender: TObject);
begin
  FCanClose := True;
  PostMessage(Handle,WM_CLOSE,0,0);
end;

////procedure TfrmBaseWebBrowser.DoCustomChromiumClose(AAPIFrame: TObject);
////begin
////
////end;
//
//procedure TfrmBaseWebBrowser.CustomWndProc(var aMessage: TMessage);
//const
//  SWP_STATECHANGED = $8000;  // Undocumented
//var
//  I:Integer;
//  TempWindowPos : PWindowPos;
//  ABaseWebBrowserFrame:TFrameBaseWebBrowser;
//begin
//  try
//    case aMessage.Msg of
//      WM_ENTERMENULOOP :
//        if (aMessage.wParam = 0) and
//           (GlobalCEFApp <> nil) then
//          GlobalCEFApp.OsmodalLoop := True;
//      WM_EXITMENULOOP :
//        if (aMessage.wParam = 0) and
//           (GlobalCEFApp <> nil) then
//          GlobalCEFApp.OsmodalLoop := False;
//      WM_MOVE,
//      WM_MOVING : NotifyMoveOrResizeStarted;
//      WM_SIZE :
//        if (aMessage.wParam = SIZE_RESTORED) then
//          UpdateCustomWindowState;
//      WM_WINDOWPOSCHANGING :
//        begin
//          TempWindowPos := TWMWindowPosChanging(aMessage).WindowPos;
//          if ((TempWindowPos.Flags and SWP_STATECHANGED) <> 0) then
//            UpdateCustomWindowState;
//        end;
////      WM_SHOWWINDOW :
////        if (aMessage.wParam <> 0) and (aMessage.lParam = SW_PARENTOPENING) then
////          PostCustomMessage(CEF_SHOWBROWSER);
////      CEF_AFTERCREATED :
////        begin
//////          Caption            := 'Simple FMX Browser';
//////          AddressPnl.Enabled := True;
////        end;
////
//      CEF_DESTROY :
//        begin
////          if aMessage.WParam>0 then
////          begin
////            ABaseWebBrowserFrame:=TFrameBaseWebBrowser(Pointer(aMessage.WParam));
//            if (FBaseWebBrowserFrame<>nil) and (FBaseWebBrowserFrame.CEFWindowParent1 <> nil) then
//            begin
//              FreeAndNil(FBaseWebBrowserFrame.CEFWindowParent1);
//            end;
////          end;
//
//        end;
//      CEF_SHOWBROWSER :
//        begin
////        if (FMXWindowParent <> nil) then
////          begin
////            FMXWindowParent.WindowState := TWindowState.wsNormal;
////            FMXWindowParent.Show;
////            FMXWindowParent.SetBounds(GetFMXWindowParentRect);
////          end
//          if FBaseWebBrowserFrame<>nil then
//          begin
//            FBaseWebBrowserFrame.RestoreBrowser;
//          end;
//        end;
//    end;
//    aMessage.Result := CallWindowProc(FOldWndPrc, FmxHandleToHWND(Handle), aMessage.Msg, aMessage.wParam, aMessage.lParam);
//  except
//    on e : exception do
//      if CustomExceptionHandler('TfrmBaseWebBrowser.CustomWndProc', e) then raise;
//  end;
//end;
//procedure TfrmBaseWebBrowser.UpdateCustomWindowState;
//var
//  TempNewState : TWindowState;
//begin
//  TempNewState := GetCurrentWindowState;
//  if (FCustomWindowState <> TempNewState) then
//    begin
//      // This is a workaround for the issue #253
//      // https://github.com/salvadordf/CEF4Delphi/issues/253
//      if (FCustomWindowState = TWindowState.wsMinimized) then
//        PostCustomMessage(CEF_SHOWBROWSER);
//      FCustomWindowState := TempNewState;
//    end;
//end;
//function TfrmBaseWebBrowser.GetCurrentWindowState : TWindowState;
//var
//  TempPlacement : TWindowPlacement;
//  TempHWND      : HWND;
//begin
//  // TForm.WindowState is not updated correctly in FMX forms.
//  // We have to call the GetWindowPlacement function in order to read the window state correctly.
//  Result   := TWindowState.wsNormal;
//  TempHWND := FmxHandleToHWND(Handle);
//  ZeroMemory(@TempPlacement, SizeOf(TWindowPlacement));
//  TempPlacement.Length := SizeOf(TWindowPlacement);
//  if GetWindowPlacement(TempHWND, @TempPlacement) then
//    case TempPlacement.showCmd of
//      SW_SHOWMAXIMIZED : Result := TWindowState.wsMaximized;
//      SW_SHOWMINIMIZED : Result := TWindowState.wsMinimized;
//    end;
//  if IsIconic(TempHWND) then Result := TWindowState.wsMinimized;
//end;
//{$ENDIF}
//
//
//procedure TfrmBaseWebBrowser.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
//var
//  PositionChanged: Boolean;
//begin
//  PositionChanged := (ALeft <> Left) or (ATop <> Top);
//  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
//  if PositionChanged then
//    NotifyMoveOrResizeStarted;
//end;
//
////procedure TfrmBaseWebBrowser.tmrWaitCloseAllChromiumTimer(Sender: TObject);
////begin
////  inherited;
////
////  if (GlobalWebBrowserFrameList<>nil) and (GlobalWebBrowserFrameList.Count=0) then
////  begin
////    tmrWaitCloseAllChromium.Enabled:=False;
////    FCanClose := True;
////    PostCustomMessage(WM_CLOSE);
////  end;
////
////end;
//
//procedure TfrmBaseWebBrowser.NotifyMoveOrResizeStarted;
//var
//  I: Integer;
//begin
////  if (FWebBrowser <> nil) then FWebBrowser.NotifyMoveOrResizeStarted;
//  if FBaseWebBrowserFrame<>nil then
//  begin
////    for I := 0 to GlobalWebBrowserFrameList.Count-1 do
////    begin
//      FBaseWebBrowserFrame.NotifyMoveOrResizeStarted;
////    end;
//  end;
//
//end;



end.
