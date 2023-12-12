unit uAndroidViewController;

interface



uses
  Classes,
  FMX.Forms,
  Types,
  FMX.Controls,
  FMX.Types,

  uBaseViewController,

  System.Messaging,


  {$IFDEF ANDROID}
  Androidapi.Helpers,
  FMX.Platform.Android,
  FMX.Helpers.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
//  Androidapi.JNI.BaiduLBS_Android_3,
  Androidapi.JNI.App,
  Androidapi.JNI.Widget,
  Androidapi.NativeActivity,
  Androidapi.JNI.Os,

  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.GraphicsContentViewText,


//  Androidapi.JNI.Widget,
//  Androidapi.Helpers,
  Androidapi.JNI.Webkit,
//  Androidapi.JNI.JavaTypes,
  Androidapi.JNI,
//  Androidapi.JNI.App,
//  Androidapi.JNIBridge,
//  Androidapi.JNI.Embarcadero,
//  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Util,
  Androidapi.Log,
//  FMX.Helpers.Android,
//  FMX.Platform.Android,
//  Androidapi.JNI.Os,


//  FMX.ZOrder.Android,
  {$ENDIF ANDROID}


  FMX.Platform;





  {$IFDEF ANDROID}
type
  TBaseAndroidViewController=class(TBaseViewController)
  private
    FScale: Single;

    FNeedUpdateBounds: Boolean;
    FBounds: TRect;
    FWindowBounds: TRect;


    procedure CalcRealBorder;
    procedure InitUIThread;virtual;
  public
    [Weak] FJView:JView;
    [Weak] FControl: TControl;
  public
    constructor Create(AControl:TControl;AJView:JView);overload;
    constructor Create;overload;
    destructor Destroy; override;
  public
    procedure Init(AControl: TControl;AJView:JView);
    procedure UnInit;virtual;
    //显示
    procedure Show;virtual;
    //显示
    procedure Hide;virtual;
    //
    procedure UpdateContentFromControl;
  end;



  TAndroidViewController=class(TBaseAndroidViewController)
  private
    FJNativeLayout: JNativeLayout;//会键盘弹不起来
    procedure InitUIThread;override;
  public
    destructor Destroy; override;
  public
    procedure UnInit;override;
    //显示
    procedure Show;override;
    //显示
    procedure Hide;override;
  end;



  TAndroidViewController_JViewStack=class(TBaseAndroidViewController)
  private
    FJNativeControlHost: JNativeControlHost;//会键盘弹不起来
    FJNativeLayout:JViewGroup;
    procedure InitUIThread;override;
  public
    destructor Destroy; override;
  public
    procedure UnInit;override;
    //显示
    procedure Show;override;
    //显示
    procedure Hide;override;
  end;
  {$ENDIF}



var
  WebBrowserSystemStatusBarHeight:Integer;


implementation


  {$IFDEF ANDROID}
{ TBaseAndroidViewController }

procedure TBaseAndroidViewController.CalcRealBorder;
var
  NativeWin: JWindow;
  ContentRect: JRect;
begin
  NativeWin := TAndroidHelper.Activity.getWindow;
  if NativeWin <> nil then
  begin
    ContentRect := TJRect.Create;
    NativeWin.getDecorView.getDrawingRect(ContentRect);
    FWindowBounds := Rect(ContentRect.left, ContentRect.top, ContentRect.right, ContentRect.bottom);
  end
  else
    FWindowBounds := TRect.Empty;
end;

constructor TBaseAndroidViewController.Create(AControl:TControl;AJView:JView);
begin
  Create;

  Init(AControl,AJView);
end;

constructor TBaseAndroidViewController.Create;
var
  ScreenSrv: IFMXScreenService;
begin
  FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.Create');

  CalcRealBorder;
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenSrv) then
    FScale := ScreenSrv.GetScreenScale
  else
    FScale := 1;
end;

destructor TBaseAndroidViewController.Destroy;
begin
  FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.Destroy begin');


  Hide;


  inherited;

  FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.Destroy end');
end;

procedure TBaseAndroidViewController.Hide;
begin
  FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.Hide');

end;

procedure TBaseAndroidViewController.Init(AControl: TControl;AJView:JView);
begin
  FControl:=AControl;
  FJView:=AJView;


  InitUIThread;
//  CallInUIThreadAndWaitFinishing(InitUIThread);
end;

procedure TBaseAndroidViewController.InitUIThread;
begin
  FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.InitUIThread');

end;

procedure TBaseAndroidViewController.Show;
begin
  FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.Show');
end;

procedure TBaseAndroidViewController.UnInit;
begin
  FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.UnInit');
end;

procedure TBaseAndroidViewController.UpdateContentFromControl;
var
  APos: TPointF;
begin
  FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.UpdateContentFromControl');

//  while FJNativeLayout = nil do
//    Application.ProcessMessages;

      if (FControl <> nil) and not (csDesigning in FControl.ComponentState) and (FControl.Root <> nil) and
        (FControl.Root.GetObject is TCommonCustomForm) then
      begin
        FNeedUpdateBounds := True;
        APos := FControl.LocalToAbsolute(TPointF.Zero) * FScale;
        FBounds := Rect(
            Round(APos.X),
            Round(APos.Y)
              //wn
              //修复Android任务栏透明的情况下,会下移
              -Round(WebBrowserSystemStatusBarHeight*FScale)
              ,
            Round(FControl.Width * FScale),
            Round(FControl.Height *FScale)
            );


        if FControl.Visible and FControl.ParentedVisible and
          (TCommonCustomForm(FControl.Root.GetObject)).Visible and
          (TCommonCustomForm(FControl.Root.GetObject)).Active then
        begin
          FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.UpdateContentFromControl Show');
          Show;
        end
        else
        begin
          FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.UpdateContentFromControl Hide1');
          Hide;
        end;
      end
      else
      begin
        FMX.Types.Log.d('OrangeUI TBaseAndroidViewController.UpdateContentFromControl Hide2');
        Hide;
      end;

end;



{ TAndroidViewController }


destructor TAndroidViewController.Destroy;
begin
  Hide;
  UnInit;
  FJNativeLayout:=nil;

  inherited;
end;

procedure TAndroidViewController.Hide;
begin
  FMX.Types.Log.d('OrangeUI TAndroidViewController.Hide');

  if FJView<>nil then
  begin
//      CallInUIThread(
//        procedure
//        begin
            FMX.Types.Log.d('OrangeUI TSkinNativeControl.Hide CallInUIThread begin');
            if FJView.getVisibility <> TJView.JavaClass.INVISIBLE then
            begin
              FJView.setVisibility(TJView.JavaClass.INVISIBLE);
              //设置原生控件的位置
              FJNativeLayout.setPosition(FWindowBounds.Right * 2 ,FWindowBounds.Height * 2);
            end;

            FMX.Types.Log.d('OrangeUI TSkinNativeControl.Hide CallInUIThread end');
//        end);
  end;
end;

procedure TAndroidViewController.InitUIThread;
begin
  FMX.Types.Log.d('OrangeUI TAndroidViewController.InitUIThread begin');


  FJNativeLayout := TJNativeLayout.JavaClass.init(TAndroidHelper.Activity,MainActivity.getWindow.getDecorView.getWindowToken);
  if FJView<>nil then
  begin
      FJNativeLayout.setControl(FJView);
  end;

  FBounds:=Rect(0,0,300,300);
  //设置原生控件的位置
  FJNativeLayout.setPosition(0,0);
  FJNativeLayout.setSize(300,300);


  FMX.Types.Log.d('OrangeUI TAndroidViewController.InitUIThread end');
end;

procedure TAndroidViewController.Show;
begin
  FMX.Types.Log.d('OrangeUI TAndroidViewController.Show');
//  TUIThreadCaller.Call<TRect>(
//    procedure (R: TRect)
//    begin
//      FJNativeLayout.setPosition(R.Left, R.Top);
//      FJNativeLayout.setSize(R.Right, R.Bottom);
//    end, FBounds);


  if FJView<>nil then
  begin
      //设置原生控件的位置
      FJNativeLayout.setPosition(FBounds.Left, FBounds.Top);
      FJNativeLayout.setSize(FBounds.Right, FBounds.Bottom);


//      CallInUIThread(
//        procedure
//        begin
          if FJView.getVisibility <> TJView.JavaClass.VISIBLE then
          begin
            FJView.setVisibility(TJView.JavaClass.VISIBLE);
          end;
//        end);
  end;
end;

procedure TAndroidViewController.UnInit;
begin
  FMX.Types.Log.d('OrangeUI TAndroidViewController.UnInit');
  if FJNativeLayout<>nil then
  begin
    FJNativeLayout.setControl(nil);
  end;
end;



{ TAndroidViewController_JViewStack }


destructor TAndroidViewController_JViewStack.Destroy;
begin
  Hide;
  UnInit;
  FJNativeControlHost:=nil;
  FJNativeLayout:=nil;

  inherited;
end;

procedure TAndroidViewController_JViewStack.Hide;
begin
  FMX.Types.Log.d('OrangeUI TAndroidViewController_JViewStack.Hide');

  if FJView<>nil then
  begin
//      CallInUIThread(
//        procedure
//        begin
            FMX.Types.Log.d('OrangeUI TSkinNativeControl.Hide CallInUIThread begin');
            if FJView.getVisibility <> TJView.JavaClass.INVISIBLE then
            begin
              FJView.setVisibility(TJView.JavaClass.INVISIBLE);
              MainActivity.getViewStack.setPosition(FJNativeLayout,FWindowBounds.Right * 2 ,FWindowBounds.Height * 2);
            end;


            FMX.Types.Log.d('OrangeUI TSkinNativeControl.Hide CallInUIThread end');
//        end);
  end;
end;

procedure TAndroidViewController_JViewStack.InitUIThread;
begin
  FMX.Types.Log.d('OrangeUI TAndroidViewController_JViewStack.InitUIThread begin');



  FJNativeControlHost := TJNativeControlHost.JavaClass.init(TAndroidHelper.Activity);
  FJNativeLayout:=JViewGroup(FJNativeControlHost.getView);
  //getView是LinearLayout
  MainActivity.getViewStack.addView(FJNativeLayout);


//  FJNativeControlHost.getView.setBackgroundColor(-16777216);
  FJNativeControlHost.getView.setVisibility(TJView.JavaClass.VISIBLE);
  if FJView<>nil then
  begin
      FJNativeControlHost.setControl(FJView);
  end;




  FBounds:=Rect(0,0,300,300);
  MainActivity.getViewStack.setPosition(FJNativeLayout,0,0);
  MainActivity.getViewStack.setSize(FJNativeLayout,300,300);
//  FJNativeControlHost.setPosition(300,300);
//  FJNativeControlHost.setSize(300,300);

  FMX.Types.Log.d('OrangeUI TAndroidViewController_JViewStack.InitUIThread end');
end;

procedure TAndroidViewController_JViewStack.Show;
begin
  FMX.Types.Log.d('OrangeUI TAndroidViewController_JViewStack.Show');
//  TUIThreadCaller.Call<TRect>(
//    procedure (R: TRect)
//    begin
//      FJNativeControlHost.setPosition(R.Left, R.Top);
//      FJNativeControlHost.setSize(R.Right, R.Bottom);
//    end, FBounds);


  if FJView<>nil then
  begin
      FMX.Types.Log.d('OrangeUI TAndroidViewController_JViewStack.Show 1');

      MainActivity.getViewStack.setPosition(FJNativeLayout,FBounds.Left, FBounds.Top);
      MainActivity.getViewStack.setSize(FJNativeLayout,FBounds.Right, FBounds.Bottom);
      FJNativeControlHost.setSize(FBounds.Right, FBounds.Bottom);


      CallInUIThread(
        procedure
        begin
          if FJView.getVisibility <> TJView.JavaClass.VISIBLE then
          begin
            FJView.setVisibility(TJView.JavaClass.VISIBLE);
          end;
        end);
  end;
end;

procedure TAndroidViewController_JViewStack.UnInit;
begin
  FMX.Types.Log.d('OrangeUI TAndroidViewController_JViewStack.UnInit');
  if FJNativeControlHost<>nil then
  begin
    FJNativeControlHost.setControl(nil);
  end;
  MainActivity.getViewStack.removeView(FJNativeLayout);
end;



{$ENDIF}






end.
