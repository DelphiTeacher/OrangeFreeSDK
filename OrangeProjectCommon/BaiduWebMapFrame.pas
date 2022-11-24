unit BaiduWebMapFrame;

interface

//默认使用百度路线规划

//{$IFDEF MSWINDOWS}
//  //Windows下使用谷歌路线规划
//  {$DEFINE USE_GOOGLE_ROUTE_PLAN}
//{$ENDIF}

//{$IFDEF ANDROID}
//  //Android下使用谷歌路线规划
//  {$DEFINE USE_GOOGLE_ROUTE_PLAN}
//{$ENDIF}


uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,


//  SG.ScriptGate,
  StrUtils,
  uComponentType,
  uBaseHttpControl,
  uTimerTask,
  uUIFunction,
  uFuncCommon,
  uFileCommon,
  uBaseLog,
  uGPSUtils,
  XSuperObject,

  WaitingFrame,
  MessageBoxFrame,


  uMapCommon,
//  uGPSLocation,



  FMX.WebBrowser,
  {$IFDEF ANDROID}
  //修复,避免透明任务栏造成WebBrowser下移
  FMX.WebBrowser.Android,
  {$ENDIF}

  uBaseList, uTimerTaskEvent, uSkinButtonType, uSkinFireMonkeyButton,
  uSkinFireMonkeyControl, uSkinPanelType, uSkinFireMonkeyPanel, uSkinImageType,
  uSkinFireMonkeyImage, uProcessNativeControlModalShowPanel;




type
  TFrameBaiduWebMap = class(TFrame)
    tteGetRoutePlan: TTimerTaskEvent;
    pnlToolBar: TSkinFMXPanel;
    btnReturn: TSkinFMXButton;
    ProcessNativeControlModalShowPanel1: TProcessNativeControlModalShowPanel;
    btnNavi: TSkinFMXButton;
    tteGetPointAddr: TTimerTaskEvent;
    tmrNavigate: TTimer;
    procedure tteGetRoutePlanExecute(ATimerTask: TTimerTask);
    procedure tteGetRoutePlanBegin(ATimerTask: TTimerTask);
    procedure tteGetRoutePlanExecuteEnd(ATimerTask: TTimerTask);
    procedure btnReturnClick(Sender: TObject);
    procedure ProcessNativeControlModalShowPanel1Click(Sender: TObject);
    procedure ProcessNativeControlModalShowPanel1Resize(Sender: TObject);
    procedure tteGetPointAddrExecute(ATimerTask: TTimerTask);
    procedure tteGetPointAddrExecuteEnd(ATimerTask: TTimerTask);
    procedure tmrNavigateTimer(Sender: TObject);
  private
//    FScriptGate:TScriptGate;

    FWebBrowser: TWebBrowser;

  public
//    procedure HelloDelphi(const iStr: String);
    procedure SetPointFromJavaScript(const ALongitude:Double;const ALatitude:Double);
//    procedure ProcessNativeControlModalShowPanel1GetNativeControlBitmap(
//      Sender: TObject; ANativeControl: TControl; var ABitmap: TBitmap);
  private
    procedure DoShow;
    procedure DoHide;
    { Private declarations }
  private
    //更新计数
    FUpdateCount:Integer;

    FTempFileIndex:Integer;
  private
    //创建标注的JavaScript
    function CreateMarker(AMapAnnotation:TMapAnnotation;AMarkId:String):String;
    //创建线条的JavaScript
    function CreatePolyline(ABeginMapAnnotation:TMapAnnotation;
                            AEndMapAnnotation:TMapAnnotation;
                            APolylineId:String):String;
    { Private declarations }
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    BaiduAK:String;
    GoogleAPIKey:String;
  public
    //是否需要地图类型控件、鱼骨控件
    IsNeedMapControl:Boolean;

    //地图模式
    ViewMode:TMapFrameViewMode;
    //设置位置的标记
    SetPointAnnotation:TMapAnnotation;

    //设置中心点
    Center:TLocation;
    //放大等级,默认是14
    ZoomLevel:Integer;
    //标注列表,用于刷新
    FMapAnnotationList:TMapAnnotationList;
    //线段列表
    FMapPolylineList:TMapAnnotationList;


    HtmlLocalFileCodePath:String;


    //获取路线规划
    procedure GetRoutePlan(ARoutePlanStartAnnotation:TMapAnnotation;
                            ARoutePlanEndAnnotation:TMapAnnotation;
                            AStartRegion:String;
                            AEndRegion:String);

    procedure Clear;

    procedure Sync;

//    procedure TestJS;

  public
    //点击了地图的截屏的事件
    OnClickMapScreenshot:TNotifyEvent;
    //返回按钮点击事件
    OnReturnButtonClick:TNotifyEvent;
    //设置点的事件
    OnSetPoint:TMapFrameSetPointEvent;
    { Public declarations }
  end;



var
  GlobalMapFrame:TFrameBaiduWebMap;


implementation

{$R *.fmx}


//测试Delphi与JavaScript互调的HTML代码
const
  SampleHTML =
    '<html>' +
    '<header>' +
      '<script type="text/JavaScript">' +
        'function helloJS(msg, msg2) { alert(msg + msg2); return "Hello Delphi ! I am JavaScript !"; }' + // Call from Delphi
      '</script>' +
    '</head>' +
    '<body>' +
      '<br><br>' + // Call Delphi Method
      '<a href="delphi:HelloDelphi(''call by JS'')">Call Delphi noparam procedure</a>' +
      '<br><br>' +
    '<body>' +
    '</html>';



{ TFrameLocationHistroy }


procedure TFrameBaiduWebMap.DoHide;
begin

end;

procedure TFrameBaiduWebMap.DoShow;
begin
  if FWebBrowser=nil then
  begin
    uBaseLog.OutputDebugString('TFrameBaiduWebMap.DoShow Begin');

//    {$IFDEF ANDROID}
//    //修复Android任务栏透明的情况下,会下移
//    FMX.WebBrowser.Android.WebBrowserSystemStatusBarHeight:=
//          uComponentType.SystemStatusBarHeight;
//    {$ENDIF}


    uBaseLog.OutputDebugString('TFrameBaiduWebMap.DoShow 1');

    FWebBrowser:=TWebBrowser.Create(Self);
    FWebBrowser.Parent:=Self;//ProcessNativeControlModalShowPanel1;


    uBaseLog.OutputDebugString('TFrameBaiduWebMap.DoShow 2');


    FWebBrowser.Align:=TAlignLayout.Client;
    FWebBrowser.Visible:=True;


    uBaseLog.OutputDebugString('TFrameBaiduWebMap.DoShow 3');


    //FScriptGate := TScriptGate.Create(Self, FWebBrowser, 'delphi');


//    ProcessNativeControlModalShowPanel1.UpdateModalShow;



    uBaseLog.OutputDebugString('TFrameBaiduWebMap.DoShow End');
  end;

end;

procedure TFrameBaiduWebMap.btnReturnClick(Sender: TObject);
begin
  if Assigned(OnReturnButtonClick) then
  begin
      //自定义返回事件
      OnReturnButtonClick(Self);
  end
  else
  begin
      //默认
      //返回
      HideFrame();
      ReturnFrame();
  end;
end;

procedure TFrameBaiduWebMap.Clear;
begin
  SetPointAnnotation.Location.Clear;

  FMapAnnotationList.Clear(True);
  FMapPolylineList.Clear(True);

  Sync;
end;

constructor TFrameBaiduWebMap.Create(AOwner: TComponent);
begin
  inherited;

  //是否需要鱼骨控件、地图类型控件
  IsNeedMapControl:=True;


  //百度的AK
  BaiduAK:='8dlnIKumxm6hAhkxs7OyCrg3';
  //谷歌的AK
  GoogleAPIKey:='AIzaSyBAkDSJ00aWcoJ1MIFmK_uqEb_sNRM7ePI';

  //默认的缩放等级
  ZoomLevel:=14;


//  {$IFDEF ANDROID}
//  //修复Android任务栏透明的情况下,会下移
//  FMX.WebBrowser.Android.WebBrowserSystemStatusBarHeight:=
//        uComponentType.SystemStatusBarHeight;
//  {$ENDIF}


  FMapAnnotationList:=TMapAnnotationList.Create;
  FMapPolylineList:=TMapAnnotationList.Create;


  SetPointAnnotation:=TMapAnnotation.Create;


  //默认是关闭的
  //使用图片来显示原生控件
//  Self.ProcessNativeControlModalShowPanel1.IsEnableModalShow:=False;

  Self.pnlToolBar.SelfOwnMaterialToDefault.BackColor.FillColor.Color:=SkinThemeColor;


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

function TFrameBaiduWebMap.CreateMarker(AMapAnnotation: TMapAnnotation;AMarkId:String): String;
var
  ACustomIcon:String;
  AIconWidth:Integer;
  AIconHeight:Integer;
begin

  Result:='';
  if (AMapAnnotation.IconFilePath<>'') then
  begin
      //自定义图标
      AIconWidth:=26;
      AIconHeight:=33;
      Result:=''+#13#10
        +'var myIcon'+AMarkId+' = new BMap.Icon("'+AMapAnnotation.IconUrl+'", '
                                    +'new BMap.Size('+IntToStr(AIconWidth)+', '+IntToStr(AIconHeight)+'), {'
                                        +'anchor: new BMap.Size('+IntToStr(AIconWidth div 2)+', '+IntToStr(AIconHeight)+'), '
                                        +'imageOffset: new BMap.Size(0, 0)'
                                    +'}'
                                +');'
        +'var '+AMarkId
        +'=new BMap.Marker('
            +'new BMap.Point('+FloatToStr(AMapAnnotation.Location.ConvertToBD09.longitude)+','
                              +FloatToStr(AMapAnnotation.Location.ConvertToBD09.latitude)+')'
            +', {icon: myIcon'+AMarkId+'});';

  end
  else
  begin
      //默认图标
      Result:=''+#13#10+'var '+AMarkId
        +'=new BMap.Marker('
          +'new BMap.Point('+FloatToStr(AMapAnnotation.Location.ConvertToBD09.longitude)+','
                            +FloatToStr(AMapAnnotation.Location.ConvertToBD09.latitude)+')'
          +');';

  end;


  //添加标注
  Result:=Result
      +#13#10+'map.addOverlay('+AMarkId+');';



  //添加点击弹出窗体
  Result:=Result+#13#10+'var content'+AMarkId+'="<b>'+AMapAnnotation.Addr+'</b><br>"'
//                +#13#10+'+"<span><strong>GPS：</strong>'+FloatToStr(AGPS.longitude)+','+FloatToStr(AGPS.latitude)+'</span><br>"'
//                +#13#10+'+"<span><strong>时间：</strong>'+AMapAnnotationList[I].CreateTime+'</span><br>"'
          +#13#10+';'
      +#13#10+'var opts'+AMarkId+' = { width: 150  };'

      +#13#10+'var infoWindow'+AMarkId
          +' = new BMap.InfoWindow(content'+AMarkId+', opts'+AMarkId+');';

  //添加鼠标点击事件
  Result:=Result+#13#10+AMarkId+'.addEventListener(''click'',function(){'
          +#13#10+AMarkId+'.openInfoWindow(infoWindow'+AMarkId+');'
          +#13#10+'});'
      +#13#10
      ;
end;

function TFrameBaiduWebMap.CreatePolyline(ABeginMapAnnotation,
                            AEndMapAnnotation: TMapAnnotation;
                            APolylineId:String): String;

  function ByteToHex(Const Value: Byte): string;
  const
     HexChars: array[0..15] of Char = '0123456789ABCDEF';
  var
     iTemp: Integer;
     i: Integer;
  begin
     Result := '';
     i := 0;
     while i<1 do
     begin
       case i of
         0: iTemp := Value and $FF;
       end;
       Result := Result + HexChars[iTemp div 16];
       Result := Result + HexChars[iTemp mod 16];
       Inc(i);
     end;
  end;
  function ConvertAlphaColorToStr(AColor:TAlphaColor):String;
  var
    AColorRec:TAlphaColorRec;
  begin
    AColorRec:=TAlphaColorRec.Create(AColor);
    Result:='#'
              +ByteToHex(AColorRec.R)
              +ByteToHex(AColorRec.G)
              +ByteToHex(AColorRec.B);
  end;
begin

  Result:=''
    +#13#10+'var polyline'+APolylineId+'=new BMap.Polyline(['
              +'new BMap.Point('
                  +FloatToStr(ABeginMapAnnotation.Location.ConvertToBD09.longitude)+','
                  +FloatToStr(ABeginMapAnnotation.Location.ConvertToBD09.latitude)
                  +'),'
              +'new BMap.Point('
                  +FloatToStr(AEndMapAnnotation.Location.ConvertToBD09.longitude)+','
                    +FloatToStr(AEndMapAnnotation.Location.ConvertToBD09.latitude)
                  +')'
              +'],'
              //#7AAB75
              +'{strokeColor:"'+ConvertAlphaColorToStr(ABeginMapAnnotation.StrokeColor)+'", '
                +'strokeWeight:'+IntToStr(ABeginMapAnnotation.StrokeWeight)+', '
                +'strokeOpacity:'+FloatToStr(ABeginMapAnnotation.StrokeOpacity)+'}'
              +');'
    +#13#10+'map.addOverlay(polyline'+APolylineId+');'
    +#13#10;

end;

destructor TFrameBaiduWebMap.Destroy;
begin
//  FreeAndNil(FScriptGate);

  FreeAndNil(SetPointAnnotation);
  FreeAndNil(FMapAnnotationList);
  FreeAndNil(FMapPolylineList);

  inherited;
end;

procedure TFrameBaiduWebMap.GetRoutePlan(ARoutePlanStartAnnotation,
                            ARoutePlanEndAnnotation: TMapAnnotation;
                            AStartRegion:String;
                            AEndRegion:String);
var
  ATimerTask:TTimerTask;
begin
  if ARoutePlanStartAnnotation.Location.HasData
    and ARoutePlanEndAnnotation.Location.HasData then
  begin

      Inc(FUpdateCount);


      ATimerTask:=Self.tteGetRoutePlan.Run;

      ATimerTask.TaskObject:=TMapAnnotation.Create;
      TMapAnnotation(ATimerTask.TaskObject).Assign(ARoutePlanStartAnnotation);

      ATimerTask.TaskObject1:=TMapAnnotation.Create;
      TMapAnnotation(ATimerTask.TaskObject1).Assign(ARoutePlanEndAnnotation);

      ATimerTask.TaskOtherInfo.Add(AStartRegion);
      ATimerTask.TaskOtherInfo.Add(AEndRegion);
  end;
end;

//procedure TFrameBaiduWebMap.HelloDelphi(const iStr: String);
//begin
//  //测试在JS中调用Delphi的方法
//  ShowMessage('Hello ! ' + iStr);
//end;

procedure TFrameBaiduWebMap.ProcessNativeControlModalShowPanel1Click(
  Sender: TObject);
begin
  if Assigned(OnClickMapScreenshot) then
  begin
    OnClickMapScreenshot(Self);
  end;
end;

//procedure TFrameBaiduWebMap.ProcessNativeControlModalShowPanel1GetNativeControlBitmap(
//  Sender: TObject; ANativeControl: TControl; var ABitmap: TBitmap);
//begin
//  try
//    if FWebBrowser<>nil then
//    begin
//      ABitmap:=FWebBrowser.CaptureBitmap;
//    end;
//  except
//    on E:Exception do
//    begin
//      uBaseLog.HandleException(E,'TFrameBaiduWebMap.ProcessNativeControlModalShowPanel1GetNativeControlBitmap');
//    end;
//  end;
//end;

procedure TFrameBaiduWebMap.ProcessNativeControlModalShowPanel1Resize(
  Sender: TObject);
begin
//  if ProcessNativeControlModalShowPanel1<>nil then
//  begin
//    Self.ProcessNativeControlModalShowPanel1.UpdateModalShow;
//  end;
end;

procedure TFrameBaiduWebMap.SetPointFromJavaScript(const ALongitude, ALatitude: Double);
begin
  //获取到用户点击地图设置的坐标
  //用的是百度坐标系
  SetPointAnnotation.Location.GPSType:=gtBD09LL;

  Self.SetPointAnnotation.Location:=TLocation.Create(ALatitude,ALongitude,gtBD09LL);
  Self.SetPointAnnotation.Location:=Self.SetPointAnnotation.Location.ConvertToGCJ02;
//  ShowMessage('SetPointFromJavaScript');

  Self.tteGetPointAddr.Run;
end;

procedure TFrameBaiduWebMap.Sync;
var
  I: Integer;
  AddOverlayFunc:String;
  HtmlSourceBegin:String;
  HtmlSourceEnd:String;
  EntRegionList:String;
var
  HtmlSources:TStringList;
begin
  //正在更新
  if FUpdateCount<>0 then Exit;


  uBaseLog.OutputDebugString('TFrameBaiduWebMap.Sync Begin');



  DoShow;


  HtmlSourceBegin:=''
      +#13#10+'<html>  '
      +#13#10+'<head>  '
      +#13#10+'<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   '
      +#13#10+'<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />'
      +#13#10+'<script type="text/javascript" '
                +'src="http://api.map.baidu.com/api?v=2.0&ak='+BaiduAK+'"></script>   '

      +#13#10+'<style type="text/css"> '
      +#13#10+'html,body{  '
      +#13#10+'    width:100%;'
      +#13#10+'    height:100%;   '
      +#13#10+'    margin:0;   '
      +#13#10+'    overflow:hidden;'
      +#13#10+'    }   '
      +#13#10+'</style>'
      +#13#10+'</head> '
      +#13#10+'<body>  '
      +#13#10+'    <div style="width:100%;height:100%" id="container"</div>' //;border:1px solid gray
      //设置JavaScript调用Delphi的函数
//      +#13#10+'    <a href="delphi:HelloDelphi(''Hello'')">Call Delphi procedure</a>'
      +#13#10+'</body> '
      +#13#10+'</html> '
      ;


  HtmlSourceBegin:=HtmlSourceBegin
          +#13#10+'<script type="text/javascript"> '
          +#13#10+'    var map = new BMap.Map("container");';


  if IsNeedMapControl then
  begin
    HtmlSourceBegin:=HtmlSourceBegin
          +#13#10+'    map.addControl(new BMap.NavigationControl());  '//添加鱼骨控件
          +#13#10+'    map.addControl(new BMap.MapTypeControl());     '//添加地图类型控件
          +#13#10;
  end;




  //标记
  for I := 0 to FMapAnnotationList.Count-1 do
  begin
    if FMapAnnotationList[I].Location.HasData then
    begin
      AddOverlayFunc:=AddOverlayFunc
                      //添加标注
                      +CreateMarker(FMapAnnotationList[I],
                                    'Marker_'+IntToStr(I));
    end;
  end;



  //设置点
  if Self.SetPointAnnotation.Location.HasData then
  begin
    AddOverlayFunc:=AddOverlayFunc
                    //添加标注
                    +CreateMarker(SetPointAnnotation,
                                  'Marker_SetPointAnnotation')+#13#10
                    //存在设置点标记
                    +'var Has_Marker_SetPointAnnotation = true;'+#13#10;
  end
  else
  begin
    AddOverlayFunc:=AddOverlayFunc
                    //不存在设置点标记
                    //也要加这两个JavaScript的变量
                    +'var Marker_SetPointAnnotation;'+#13#10   // = new BMap.Marker(new BMap.Point(0,0))
                    +'var Has_Marker_SetPointAnnotation = false;'+#13#10;

  end;



  //添加线条
  for I := 1 to FMapPolylineList.Count-1 do
  begin
    if FMapPolylineList[I-1].Location.HasData
      and FMapPolylineList[I].Location.HasData then
    begin
      AddOverlayFunc:=AddOverlayFunc
                      //添加线条
                      +CreatePolyline(
                          FMapPolylineList[I-1],
                          FMapPolylineList[I],
                          IntToStr(I));
    end;
  end;



  //有中心点
  if Center.HasData then
  begin
    EntRegionList:=''
      //地图中心点
      //定位到此点
      +#13#10
      +'    map.centerAndZoom(new BMap.Point('
              +FloatToStr(Center.ConvertToBD09.longitude)+','
              +FloatToStr(Center.ConvertToBD09.latitude)
              //放大级别
              +'), '
              +IntToStr(ZoomLevel)+');';
  end;


  if Self.ViewMode=mfvmSetPoint then
  begin
    EntRegionList:=EntRegionList
        //点击添加标注的事件
        +#13#10
        +#13#10+'  map.addEventListener("click", function (e) {             '
        //先删除原来的标记
        +#13#10+'      if (Has_Marker_SetPointAnnotation==true)             '
        +#13#10+'      { map.removeOverlay(Marker_SetPointAnnotation);}     '
        //再添加新的标记
        +#13#10+'      point = new BMap.Point(e.point.lng, e.point.lat);    '
        +#13#10+'      Marker_SetPointAnnotation = new BMap.Marker(point);  '
        +#13#10+'      map.addOverlay(Marker_SetPointAnnotation);           '
        //存在设置点标记
        +#13#10+'      Has_Marker_SetPointAnnotation = true;                '


        //将点击的坐标通知给Delphi
        +#13#10+'      window.location.href = "delphi:SetPointFromJavaScript("+ e.point.lng +","+ e.point.lat +")"; '



        +#13#10+'  });                                                      '
        ;
  end;


  EntRegionList:=EntRegionList
    +#13#10+'    map.enableScrollWheelZoom();'
    //轨迹
    +#13#10+AddOverlayFunc
    +#13#10
    ;



  HtmlSourceEnd:=''
      +#13#10+'</script>';





  HtmlSources:=TStringList.Create;

  //保存HTML文件
  HtmlLocalFileCodePath:=GetApplicationPath+'BaiduWebMapPage'+PathDelim;
  ForceDirectories(HtmlLocalFileCodePath);
  HtmlLocalFileCodePath:=HtmlLocalFileCodePath+'MapAnnotationList'+IntToStr(FTempFileIndex)+'.html';
  Inc(FTempFileIndex);

  HtmlSources.Add(HtmlSourceBegin);
  HtmlSources.Add(EntRegionList);
  HtmlSources.Add(HtmlSourceEnd);

  HtmlSources.SaveToFile(HtmlLocalFileCodePath,TEncoding.UTF8);

  //加载HTML文件
//  Self.FWebBrowser.LoadFromStrings(SampleHTML,'/');
//  Self.FWebBrowser.Navigate('file://'+HtmlLocalFileCodePath);
  tmrNavigate.Enabled:=True;


  FreeAndNil(HtmlSources);



  //使用LoadFromStrings,会导致在Android上显示不出来
//  Self.FWebBrowser.LoadFromStrings(HtmlSourceBegin+EntRegionList+HtmlSourceEnd,'/');


  uBaseLog.OutputDebugString('TFrameBaiduWebMap.Sync End');

end;

//procedure TFrameBaiduWebMap.TestJS;
//begin
//  //加载HTML文件
//  FWebBrowser:=TWebBrowser.Create(Form1);
//  FWebBrowser.Parent:=Form1;//Self.ProcessNativeControlModalShowPanel1;
//  FWebBrowser.Align:=TAlignLayout.Client;
//
//  Self.FWebBrowser.LoadFromStrings(SampleHTML,'/');
////  Navigate('file://'+HtmlLocalFileCodePath);
//
//  FScriptGate := TScriptGate.Create(Form1, FWebBrowser, 'delphi');
//end;

procedure TFrameBaiduWebMap.tmrNavigateTimer(Sender: TObject);
begin
  Self.tmrNavigate.Enabled:=False;

  Self.FWebBrowser.Navigate('file://'+HtmlLocalFileCodePath);

end;

procedure TFrameBaiduWebMap.tteGetPointAddrExecute(ATimerTask: TTimerTask);
//var
//  AAddr:String;
//  ACountry:String;
//  AProvince:String;
//  ACity:String;
//  ADistrict:String;
//  ATown:String;
//  AShortAddr:String;
begin
  if BaiduMapGeocoder(
          Self.SetPointAnnotation.Location,
          SetPointAnnotation.Addr,
          SetPointAnnotation.Country,
          SetPointAnnotation.Province,
          SetPointAnnotation.City,
          SetPointAnnotation.Area,
          SetPointAnnotation.Town,
          SetPointAnnotation.RegionName
          ) then
  begin
//    SetPointAnnotation.Addr:=AAddr;

  end
  else
  begin
    //失败
    SetPointAnnotation.Clear;//.Addr:='';

  end;
end;

procedure TFrameBaiduWebMap.tteGetPointAddrExecuteEnd(ATimerTask: TTimerTask);
begin

  if Assigned(OnSetPoint) then
  begin
    OnSetPoint(Self,
                Self.SetPointAnnotation.Location,
                Self.SetPointAnnotation.Addr,
                SetPointAnnotation);
  end;

end;

procedure TFrameBaiduWebMap.tteGetRoutePlanBegin(ATimerTask: TTimerTask);
begin
  //获取路线规则
//  ShowWaitingFrame(Application.MainForm,'获取路线规则中...');
end;

procedure TFrameBaiduWebMap.tteGetRoutePlanExecute(ATimerTask: TTimerTask);
var
  I: Integer;
  ARoutePlanStartAnnotation:TMapAnnotation;
  ARoutePlanEndAnnotation:TMapAnnotation;
var
  AError:String;
  AMapPolylineList:TMapAnnotationList;
begin

  ARoutePlanStartAnnotation:=TMapAnnotation(ATimerTask.TaskObject);
  ARoutePlanEndAnnotation:=TMapAnnotation(ATimerTask.TaskObject1);

  // 出错
  TTimerTask(ATimerTask).TaskTag := 1;

  {$IFDEF USE_GOOGLE_ROUTE_PLAN}
  //谷歌路径规划
  AMapPolylineList:=GetGoogleRoutePlan(
        ARoutePlanStartAnnotation,
        ARoutePlanEndAnnotation,
        GoogleAPIKey,
        AError
        );
  {$ELSE}
  //百度路径规划
  AMapPolylineList:=GetBaiduRoutePlan(
        ARoutePlanStartAnnotation.Location,
        ARoutePlanEndAnnotation.Location,
        ATimerTask.TaskOtherInfo[0],
        ATimerTask.TaskOtherInfo[1],
        BaiduAK,
        AError
        );
  {$ENDIF}



  try
      if AMapPolylineList=nil then
      begin
          //出错
          //异常
          TTimerTask(ATimerTask).TaskDesc := AError;
      end
      else
      begin
        //成功
        TTimerTask(ATimerTask).TaskTag := 0;

        for I := 0 to AMapPolylineList.Count-1 do
        begin
          Self.FMapPolylineList.Add(AMapPolylineList[I]);


          AMapPolylineList[I].StrokeColor:=ARoutePlanStartAnnotation.StrokeColor;
          AMapPolylineList[I].StrokeWeight:=ARoutePlanStartAnnotation.StrokeWeight;
          AMapPolylineList[I].StrokeOpacity:=ARoutePlanStartAnnotation.StrokeOpacity;
        end;

        AMapPolylineList.Clear(False);

      end;
  finally
    FreeAndNil(AMapPolylineList);
  end;

end;

procedure TFrameBaiduWebMap.tteGetRoutePlanExecuteEnd(ATimerTask: TTimerTask);
begin
  Dec(FUpdateCount);

  //获取路径规划结束
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin


          //更新地图
          Sync;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      ShowMessageBoxFrame(Application.MainForm,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
//    HideWaitingFrame;
  end;
end;


end.
