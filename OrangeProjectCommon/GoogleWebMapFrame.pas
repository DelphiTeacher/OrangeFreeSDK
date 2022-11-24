unit GoogleWebMapFrame;

interface

//默认使用百度路线规划

//{$IFDEF MSWINDOWS}
//  //使用谷歌路线规划
//  {$DEFINE USE_GOOGLE_ROUTE_PLAN}
//{$ENDIF}
//
//
//
//{$IFDEF ANDROID}
//  //使用谷歌路线规划
//  {$DEFINE USE_GOOGLE_ROUTE_PLAN}
//{$ENDIF}


uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  {$IFDEF MSWINDOWS}
  System.Win.Registry,
  {$ENDIF}
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uTimerTaskEvent, uProcessNativeControlModalShowPanel, uSkinButtonType,
  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinPanelType,
  uSkinFireMonkeyPanel,

  Math,
  {$IFDEF MSWINDOWS}
  Winapi.Windows,
  {$ENDIF}
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

  HintFrame,



  FMX.WebBrowser,
  {$IFDEF ANDROID}
  //修复,避免透明任务栏造成WebBrowser下移
  FMX.WebBrowser.Android,
  {$ENDIF}

  uBaseList,
  uSkinImageType;




type

  TFrameGoogleWebMap = class(TFrame)
    tteGetRoutePlan: TTimerTaskEvent;
    pnlToolBar: TSkinFMXPanel;
    btnReturn: TSkinFMXButton;
    ProcessNativeControlModalShowPanel1: TProcessNativeControlModalShowPanel;
    btnNavi: TSkinFMXButton;
    tteGetPointAddr: TTimerTaskEvent;
    procedure tteGetRoutePlanExecute(ATimerTask: TTimerTask);
    procedure tteGetRoutePlanExecuteEnd(ATimerTask: TTimerTask);
    procedure btnReturnClick(Sender: TObject);
    procedure ProcessNativeControlModalShowPanel1Click(Sender: TObject);
    procedure ProcessNativeControlModalShowPanel1Resize(Sender: TObject);
    procedure tteGetPointAddrExecute(ATimerTask: TTimerTask);
    procedure tteGetPointAddrExecuteEnd(ATimerTask: TTimerTask);
  private
    FScriptGate:TScriptGate;

    FWebBrowser: TWebBrowser;
  public
//    procedure HelloDelphi(const iStr: String);
    procedure SetPointFromJavaScript(const ALongitude:Double;const ALatitude:Double);
  private
    procedure DoShow;
    procedure DoHide;
    { Private declarations }
  private
    //更新计数
    FUpdateCount:Integer;

    FTempFileIndex:Integer;
    {$IFDEF MSWINDOWS}
    function GetIEVersionStr:String;
    {$ENDIF}
  private
    //创建标注的JavaScript
    function CreateMarker(AMapAnnotation:TMapAnnotation;AMarkId:String):String;
    //创建线条的JavaScript
    function CreatePolyline(ABeginMapAnnotation,
                            AEndMapAnnotation: TMapAnnotation;
                            APolylineId:String): String;
    { Private declarations }
  public
    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    BaiduAK:String;
    GoogleAPIKey:String;
  public
    //是否需要地图类型控件、鱼骨控件
    IsNeedMapControl:Boolean;

    //
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

    //根据经纬度获取路线规划
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
  GlobalMapFrame:TFrameGoogleWebMap;


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


procedure TFrameGoogleWebMap.DoHide;
begin

end;

procedure TFrameGoogleWebMap.DoShow;
begin
  if FWebBrowser=nil then
  begin
    uBaseLog.OutputDebugString('TFrameGoogleWebMap.DoShow Begin');

    {$IFDEF ANDROID}
    //修复Android任务栏透明的情况下,会下移
    FMX.WebBrowser.Android.WebBrowserSystemStatusBarHeight:=
          uComponentType.SystemStatusBarHeight;
    {$ENDIF}
    FWebBrowser:=TWebBrowser.Create(Self);
    FWebBrowser.Parent:=ProcessNativeControlModalShowPanel1;


    FWebBrowser.Align:=TAlignLayout.alClient;
    FWebBrowser.Visible:=True;


    FScriptGate := TScriptGate.Create(Self, FWebBrowser, 'delphi');


    ProcessNativeControlModalShowPanel1.UpdateModalShow;



    uBaseLog.OutputDebugString('TFrameGoogleWebMap.DoShow End');
  end;

end;

procedure TFrameGoogleWebMap.btnReturnClick(Sender: TObject);
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
      HideFrame(Self,hfcttBeforeReturnFrame);
      ReturnFrame(Self.FrameHistroy);
  end;
end;

procedure TFrameGoogleWebMap.Clear;
begin
  SetPointAnnotation.Location.Clear;

  FMapAnnotationList.Clear(True);
  FMapPolylineList.Clear(True);

  Sync;
end;

constructor TFrameGoogleWebMap.Create(AOwner: TComponent);
var
  I: Integer;
 {$IFDEF MSWINDOWS}
  sPath32:String;
  sPath64:String;
  sAppName:String;
  AReg:TRegistry;
  Sver:string;
  lenver:Integer;
 {$ENDIF}
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


  {$IFDEF ANDROID}
  //修复Android任务栏透明的情况下,会下移
  FMX.WebBrowser.Android.WebBrowserSystemStatusBarHeight:=
        uComponentType.SystemStatusBarHeight;
  {$ENDIF}


  FMapAnnotationList:=TMapAnnotationList.Create;
  FMapPolylineList:=TMapAnnotationList.Create;


  SetPointAnnotation:=TMapAnnotation.Create;

  //使用图片来显示原生控件
//  Self.ProcessNativeControlModalShowPanel1.IsEnableModalShow:=True;


  {$IFDEF MSWINDOWS}
  //设置注册表
  AReg:=TRegistry.Create;
  try
      AReg.RootKey:=HKEY_LOCAL_MACHINE;

      sPath32:='SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION';

      sPath64:='SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION';

      if AReg.OpenKey(sPath32,True) then
      begin
        sAppName:=ExtractFileName(GetModuleName(HInstance));

        Sver:=GetIEVersionStr;
        lenver:=StrToInt(leftstr(Sver, Pos('.',Sver)-1));

        if lenver<=7 then
        begin
          AReg.WriteInteger(sAppName,7000)
        end
        else
        if lenver=8 then
        begin
          AReg.WriteInteger(sAppName,8000)
        end
        else
        if lenver=9 then
        begin
          AReg.WriteInteger(sAppName,11000)
        end
        else
        if lenver=10 then
        begin
          AReg.WriteInteger(sAppName,11001)
        end
        else
        if lenver=11 then
        begin
          AReg.WriteInteger(sAppName,11001)
        end;

      end
      else
      begin
        showmessage('fail!');
      end;
      AReg.CloseKey;

       if AReg.OpenKey(sPath64,True) then
      begin
        sAppName:=ExtractFileName(GetModuleName(HInstance));

        Sver:=GetIEVersionStr;
        lenver:=StrToInt(leftstr(Sver, Pos('.',Sver)-1));

        if lenver<=7 then
        begin
          AReg.WriteInteger(sAppName,7000)
        end
        else
        if lenver=8 then
        begin
          AReg.WriteInteger(sAppName,8000)
        end
        else
        if lenver=9 then
        begin
          AReg.WriteInteger(sAppName,11000)
        end
        else
        if lenver=10 then
        begin
          AReg.WriteInteger(sAppName,11001)
        end
        else
        if lenver=11 then
        begin
          AReg.WriteInteger(sAppName,11001)
        end;
      end
      else
      begin
        showmessage('fail!');
      end;
      AReg.CloseKey;
  finally
    FreeAndNil(AReg);
  end;
  {$ENDIF}
end;

function TFrameGoogleWebMap.CreateMarker(AMapAnnotation: TMapAnnotation;AMarkId:String): String;
begin
  Result:='';
end;

function TFrameGoogleWebMap.CreatePolyline(ABeginMapAnnotation,
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

//  Result:=''
//
//     +#13#10+' var flightPlanCoordinates = [  '
//     +#13#10+' new google.maps.LatLng('
//                  +FloatToStr(ABeginMapAnnotation.Location.ConvertToBD09.longitude)+','
//                  +FloatToStr(ABeginMapAnnotation.Location.ConvertToBD09.latitude)
//                  +'),'
//     +#13#10+' new google.maps.LatLng('
//                  +FloatToStr(AEndMapAnnotation.Location.ConvertToBD09.longitude)+','
//                    +FloatToStr(AEndMapAnnotation.Location.ConvertToBD09.latitude)
//                  +')'
//     +#13#10+' ]; '
//
//     +#13#10+'var polyOptions'+APolylineId+'='
//              //#7AAB75
//              +'{strokeColor:"'+ConvertAlphaColorToStr(ABeginMapAnnotation.StrokeColor)+'", '
//                +'strokeWeight:'+IntToStr(ABeginMapAnnotation.StrokeWeight)+', '
//                +'strokeOpacity:'+FloatToStr(ABeginMapAnnotation.StrokeOpacity)+ ','
//                 +'path:flightPlanCoordinates }'
//
//    +#13#10+' var  poly'+APolylineId+' = new google.maps.Polyline(polyOptions'+APolylineId+'); '
//    +#13#10+' poly'+APolylineId+'.setMap(map);  '
//    +#13#10;

end;

destructor TFrameGoogleWebMap.Destroy;
begin
  FreeAndNil(FScriptGate);

  FreeAndNil(SetPointAnnotation);
  FreeAndNil(FMapAnnotationList);
  FreeAndNil(FMapPolylineList);

  inherited;
end;

{$IFDEF MSWINDOWS}
function TFrameGoogleWebMap.GetIEVersionStr: String;
var
 Reg: TRegistry; // registry access object
begin
 Result := '';
 Reg := TRegistry.Create;
 try
    Reg.RootKey :=HKEY_LOCAL_MACHINE;
   if Reg.OpenKey('Software\Microsoft\Internet Explorer',false) then
   begin
    //这儿新版本IE的取值位置不同所以要判断 <br> if Reg.ValueExists('svcVersion') then
    Result := Reg.ReadString('W2kVersion')
   end
   else
   if Reg.ValueExists('Version') then
   begin
    Result := Reg.ReadString('Version');
   end;
 finally
   Reg.Free;
 end;
end;

{$ENDIF}

procedure TFrameGoogleWebMap.GetRoutePlan(ARoutePlanStartAnnotation,
                            ARoutePlanEndAnnotation: TMapAnnotation;
                            AStartRegion:String;
                            AEndRegion:String);
var
  ATimerTask:TTimerTask;
begin
  if ARoutePlanStartAnnotation.Location.HasData
    and ARoutePlanEndAnnotation.Location.HasData then
  begin

      FMX.Types.Log.d('OrangeUI GetRountPlan');
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

procedure TFrameGoogleWebMap.ProcessNativeControlModalShowPanel1Click(
  Sender: TObject);
begin
  if Assigned(OnClickMapScreenshot) then
  begin
    OnClickMapScreenshot(Self);
  end;
end;

procedure TFrameGoogleWebMap.ProcessNativeControlModalShowPanel1Resize(
  Sender: TObject);
begin
  if ProcessNativeControlModalShowPanel1<>nil then
  begin
    Self.ProcessNativeControlModalShowPanel1.UpdateModalShow;
  end;
end;

procedure TFrameGoogleWebMap.SetPointFromJavaScript(const ALongitude, ALatitude: Double);
begin
  //获取到用户点击地图设置的坐标
  Self.SetPointAnnotation.Location:=TLocation.Create(ALatitude,ALongitude,gtBD09LL);
//  ShowMessage('SetPointFromJavaScript');

  Self.tteGetPointAddr.Run;
end;

procedure TFrameGoogleWebMap.Sync;
var
  I: Integer;
  J: Integer;
  AddOverlayFunc:String;
  HtmlSourceBegin:String;
  HtmlSourceEnd:String;
  EntRegionList:String;
  h: Integer;
  k: Integer;
  g:Integer;
var
  HtmlSources:TStringList;
  HtmlLocalFileCodePath:String;

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
  //正在更新
  if FUpdateCount<>0 then Exit;


  DoShow;

  uBaseLog.OutputDebugString('TFrameGoogleWebMap.Sync Begin');

  FMX.Types.Log.d('OrangeUI Latitude'+FloatToStr(Center.ConvertToGCJ02.Latitude));
  FMX.Types.Log.d('OrangeUI Longitude'+FloatToStr(Center.ConvertToGCJ02.Longitude));

  HtmlSourceBegin:=''
      +#13#10+'<html>  '
      +#13#10+'<head>  '
      +#13#10+'<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBAkDSJ00aWcoJ1MIFmK_uqEb_sNRM7ePI&sensor=true">'
      +#13#10+'</script> '
      +#13#10+'<script>'
      +#13#10+' var map; '
      +#13#10+' var marker;'
      +#13#10+' var myCenter=new google.maps.LatLng('+FloatToStr(Center.ConvertToGCJ02.Latitude)+','
                                                     +FloatToStr(Center.ConvertToGCJ02.Longitude)+'); '
      +#13#10+' var markersArray = [];'
      +#13#10+'function initialize()'
      +#13#10+'{'
      +#13#10+'  var MinZoomLevel='+IntToStr(Self.ZoomLevel)+';'
      +#13#10+'  var mapProp = { '
      +#13#10+'       center:myCenter,'
      +#13#10+'       zoom:MinZoomLevel,'
      +#13#10+'       gestureHandling: '''+'greedy'+''' , '
      +#13#10+'       mapTypeId:google.maps.MapTypeId.ROADMAP'
      +#13#10+'  }; '
      +#13#10+'  map=new google.maps.Map(document.getElementById("googleMap"), mapProp);';
      //标记
      for h := 0 to FMapAnnotationList.Count-1 do
      begin
        if FMapAnnotationList[h].Location.HasData then
        begin
          HtmlSourceBegin:=HtmlSourceBegin
          //标记
          +#13#10+'  marker = new google.maps.Marker({  '
          +#13#10+'          position:new google.maps.LatLng('
                             +FloatToStr(FMapAnnotationList[h].Location.ConvertToGCJ02.Latitude)+','
                             +FloatToStr(FMapAnnotationList[h].Location.ConvertToGCJ02.Longitude)+'),'
          +#13#10+'          map: map,  '
          +#13#10+'          icon:""'
          +#13#10+'        }); '
          +#13#10+' markersArray[0]=marker;'
        end;
      end;

      //画线
      if Self.ViewMode=mfvmView then
      begin
        for I:=1 to FMapPolylineList.Count-1 do
        begin
          HtmlSourceBegin:=HtmlSourceBegin
           +#13#10+' var flightPlanCoordinates_'+IntToStr(I)+' = ['
           +#13#10+'      new google.maps.LatLng('
                           +FloatToStr(FMapPolylineList[I-1].Location.ConvertToGCJ02.Latitude)+','
                           +FloatToStr(FMapPolylineList[I-1].Location.ConvertToGCJ02.Longitude)+'),'
           +#13#10+'      new google.maps.LatLng('
                           +FloatToStr(FMapPolylineList[I].Location.ConvertToGCJ02.Latitude)+','
                           +FloatToStr(FMapPolylineList[I].Location.ConvertToGCJ02.Longitude)+'),'
            +#13#10+'   ]    '
            //路线
            +#13#10+'     var polyOptions_'+IntToStr(I)+'='
            //#7AAB75
            +#13#10+'     {  strokeColor: "'+ConvertAlphaColorToStr(FMapPolylineList[I-1].StrokeColor)+'", '//线条颜色
            +#13#10+'        strokeOpacity: '+FloatToStr(FMapPolylineList[I-1].StrokeOpacity)+ ', '// 线条透明度
            +#13#10+'        strokeWeight: '+FloatToStr(FMapPolylineList[I-1].strokeWeight)+ ' ,'// 线条粗细
            +#13#10+'        path:flightPlanCoordinates_'+IntToStr(I)+' }'

            +#13#10+' var  poly_'+IntToStr(I)+' = new google.maps.Polyline(polyOptions_'+IntToStr(I)+'); '
            +#13#10+' poly_'+IntToStr(I)+'.setMap(map);  '

        end;
      end;
//
      //设置点
      if Self.SetPointAnnotation.Location.HasData then
      begin
          HtmlSourceBegin:=HtmlSourceBegin
          //标记
          +#13#10+'  marker = new google.maps.Marker({  '
          +#13#10+'          position:new google.maps.LatLng('
                             +FloatToStr(Self.SetPointAnnotation.Location.Latitude)+','
                             +FloatToStr(Self.SetPointAnnotation.Location.Longitude)+'),'
          +#13#10+'          map: map,  '
          +#13#10+'          icon:""'
          +#13#10+'        }); '
          +#13#10+' markersArray[0]=marker;'

      end;
//
//
      //添加标记
      if Self.ViewMode=mfvmSetPoint then
      begin
        HtmlSourceBegin:=HtmlSourceBegin
        +#13#10+'  google.maps.event.addListener(map,'''+ 'click'+''', function(event) { '
        +#13#10+'         placeMarker(event.latLng,map);    '
        +#13#10+'         window.location.href = "delphi:SetPointFromJavaScript("+ event.latLng.lng()+","+ event.latLng.lat() +")"; '
        +#13#10+'             });   '
        +#13#10+'          }  '

        +#13#10+' function placeMarker(location,map) {    '
        +#13#10+'    if(markersArray.length>0){ '
        +#13#10+'       for (i in markersArray){       '
        +#13#10+'        markersArray[i].setMap(null); '
        +#13#10+'          }; '
        +#13#10+'          }; '
        +#13#10+'   markersArray.shift(marker) '
        +#13#10+'   marker = new google.maps.Marker({  '
        +#13#10+'          position:location,'
        +#13#10+'          map: map,  '
        +#13#10+'        }); '
        +#13#10+'   markersArray.push(marker) '
        +#13#10+'   var infowindow = new google.maps.InfoWindow({  '
        +#13#10+'       content: '+'"Latitude: " +location.lat() +"<br>Longitude:" + location.lng()  '
        +#13#10+'      });  '
        +#13#10+'  infowindow.open(map,marker); ' ;
//
      end;




  HtmlSourceBegin:=HtmlSourceBegin
      +#13#10+'  } '
      +#13#10+'  google.maps.event.addDomListener(window,'''+'load'+''',initialize);  '
      +#13#10+'  </script> '
      +#13#10+'</head> '
      +#13#10+'<body>  '
      +#13#10+'<div id="googleMap" style="width:100%;height:100%;"></div>'
      +#13#10+'</body>'
      +#13#10+'</html>'
      ;


  FMX.Types.Log.d('OrangeUI HtmlSourceBegin'+HtmlSourceBegin);


  HtmlSources:=TStringList.Create;

  //保存HTML文件
  HtmlLocalFileCodePath:=GetApplicationPath+'GoogleWebMapPage'+PathDelim;
  ForceDirectories(HtmlLocalFileCodePath);
  HtmlLocalFileCodePath:=HtmlLocalFileCodePath+'MapAnnotationList'+IntToStr(FTempFileIndex)+'.html';
  Inc(FTempFileIndex);

  HtmlSources.Add(HtmlSourceBegin);
  HtmlSources.Add(EntRegionList);
  HtmlSources.Add(HtmlSourceEnd);

  HtmlSources.SaveToFile(HtmlLocalFileCodePath,TEncoding.UTF8);


  if not FileExists(HtmlLocalFileCodePath) then
  begin
    ShowMessageBoxFrame(Application.MainForm,'地图文件不存在!');
  end;

//  //加载HTML文件
//  Self.FWebBrowser.LoadFromStrings(SampleHTML,'/');
  Self.FWebBrowser.Navigate('file://'+HtmlLocalFileCodePath);



  FreeAndNil(HtmlSources);



  //使用LoadFromStrings,会导致在Android上显示不出来
//  Self.FWebBrowser.LoadFromStrings(HtmlSourceBegin+EntRegionList+HtmlSourceEnd,'/');


  uBaseLog.OutputDebugString('TFrameGoogleWebMap.Sync End');

end;

//procedure TFrameGoogleWebMap.TestJS;
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

procedure TFrameGoogleWebMap.tteGetPointAddrExecute(ATimerTask: TTimerTask);
//var
//  AAddr:String;
//  ACountry:String;
//  AProvince:String;
//  ACity:String;
//  ADistrict:String;
//  ATown:String;
//  AShortAddr:String;
//  APostCode:String;
begin
  if GoogleMapGeocoder(
          Self.SetPointAnnotation.Location,
          SetPointAnnotation.Addr,
          SetPointAnnotation.Country,
          SetPointAnnotation.Province,
          SetPointAnnotation.City,
          SetPointAnnotation.Area,
          SetPointAnnotation.Town,
          SetPointAnnotation.RegionName,
          SetPointAnnotation.PostCode
          ) then
  begin
//    SetPointAnnotation.Addr:=AAddr;
//    SetPointAnnotation.Province:=AProvince;
//    SetPointAnnotation.City:=ACity;
//    SetPointAnnotation.Area:=ADistrict;
  end
  else
  begin
    //失败
    SetPointAnnotation.Clear;
//    .Addr:='';
//    SetPointAnnotation.Province:='';
//    SetPointAnnotation.City:='';
//    SetPointAnnotation.Area:='';
  end;
end;

procedure TFrameGoogleWebMap.tteGetPointAddrExecuteEnd(ATimerTask: TTimerTask);
begin

  if Assigned(OnSetPoint) then
  begin
    OnSetPoint(Self,
              Self.SetPointAnnotation.Location,
              Self.SetPointAnnotation.Addr,
              SetPointAnnotation);
  end;

end;

procedure TFrameGoogleWebMap.tteGetRoutePlanExecute(ATimerTask: TTimerTask);
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


  //谷歌路径规划
  AMapPolylineList:=GetGoogleRoutePlan(
        ARoutePlanStartAnnotation,
        ARoutePlanEndAnnotation,
        GoogleAPIKey,
        AError
        );

  try
      if AMapPolylineList=nil then
      begin
          //出错
          //异常
          if AError='NOT_FOUND' then
          begin
            TTimerTask(ATimerTask).TaskTag := 2;
          end
          else
          begin
            TTimerTask(ATimerTask).TaskTag := 1;
            TTimerTask(ATimerTask).TaskDesc := AError;
          end;
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

procedure TFrameGoogleWebMap.tteGetRoutePlanExecuteEnd(ATimerTask: TTimerTask);
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
//      ShowMessageBoxFrame(Application.MainForm,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
      ShowHintFrame(Application.MainForm,'网络异常,请检查您的网络连接!');//,TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end
    else if TTimerTask(ATimerTask).TaskTag=2 then
    begin
      ShowHintFrame(Application.MainForm,'传入的某一个地址不存在');
    end;
  finally
  end;
end;


end.
