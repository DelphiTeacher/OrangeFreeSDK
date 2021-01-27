unit BaiduWebMapFrame;

interface

//Ĭ��ʹ�ðٶ�·�߹滮

//{$IFDEF MSWINDOWS}
//  //Windows��ʹ�ùȸ�·�߹滮
//  {$DEFINE USE_GOOGLE_ROUTE_PLAN}
//{$ENDIF}

//{$IFDEF ANDROID}
//  //Android��ʹ�ùȸ�·�߹滮
//  {$DEFINE USE_GOOGLE_ROUTE_PLAN}
//{$ENDIF}


uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,


  SG.ScriptGate,
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
  //�޸�,����͸�����������WebBrowser����
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
    FScriptGate:TScriptGate;

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
    //���¼���
    FUpdateCount:Integer;

    FTempFileIndex:Integer;
  private
    //������ע��JavaScript
    function CreateMarker(AMapAnnotation:TMapAnnotation;AMarkId:String):String;
    //����������JavaScript
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
    //�Ƿ���Ҫ��ͼ���Ϳؼ�����ǿؼ�
    IsNeedMapControl:Boolean;

    //��ͼģʽ
    ViewMode:TMapFrameViewMode;
    //����λ�õı��
    SetPointAnnotation:TMapAnnotation;

    //�������ĵ�
    Center:TLocation;
    //�Ŵ�ȼ�,Ĭ����14
    ZoomLevel:Integer;
    //��ע�б�,����ˢ��
    FMapAnnotationList:TMapAnnotationList;
    //�߶��б�
    FMapPolylineList:TMapAnnotationList;


    HtmlLocalFileCodePath:String;


    //��ȡ·�߹滮
    procedure GetRoutePlan(ARoutePlanStartAnnotation:TMapAnnotation;
                            ARoutePlanEndAnnotation:TMapAnnotation;
                            AStartRegion:String;
                            AEndRegion:String);

    procedure Clear;

    procedure Sync;

//    procedure TestJS;

  public
    //����˵�ͼ�Ľ������¼�
    OnClickMapScreenshot:TNotifyEvent;
    //���ذ�ť����¼�
    OnReturnButtonClick:TNotifyEvent;
    //���õ���¼�
    OnSetPoint:TMapFrameSetPointEvent;
    { Public declarations }
  end;



var
  GlobalMapFrame:TFrameBaiduWebMap;


implementation

{$R *.fmx}


//����Delphi��JavaScript������HTML����
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
//    //�޸�Android������͸���������,������
//    FMX.WebBrowser.Android.WebBrowserSystemStatusBarHeight:=
//          uComponentType.SystemStatusBarHeight;
//    {$ENDIF}
    FWebBrowser:=TWebBrowser.Create(Self);
    FWebBrowser.Parent:=ProcessNativeControlModalShowPanel1;


    FWebBrowser.Align:=TAlignLayout.alClient;
    FWebBrowser.Visible:=True;


    FScriptGate := TScriptGate.Create(Self, FWebBrowser, 'delphi');


    ProcessNativeControlModalShowPanel1.UpdateModalShow;



    uBaseLog.OutputDebugString('TFrameBaiduWebMap.DoShow End');
  end;

end;

procedure TFrameBaiduWebMap.btnReturnClick(Sender: TObject);
begin
  if Assigned(OnReturnButtonClick) then
  begin
      //�Զ��巵���¼�
      OnReturnButtonClick(Self);
  end
  else
  begin
      //Ĭ��
      //����
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

  //�Ƿ���Ҫ��ǿؼ�����ͼ���Ϳؼ�
  IsNeedMapControl:=True;


  //�ٶȵ�AK
  BaiduAK:='8dlnIKumxm6hAhkxs7OyCrg3';
  //�ȸ��AK
  GoogleAPIKey:='AIzaSyBAkDSJ00aWcoJ1MIFmK_uqEb_sNRM7ePI';

  //Ĭ�ϵ����ŵȼ�
  ZoomLevel:=14;


//  {$IFDEF ANDROID}
//  //�޸�Android������͸���������,������
//  FMX.WebBrowser.Android.WebBrowserSystemStatusBarHeight:=
//        uComponentType.SystemStatusBarHeight;
//  {$ENDIF}


  FMapAnnotationList:=TMapAnnotationList.Create;
  FMapPolylineList:=TMapAnnotationList.Create;


  SetPointAnnotation:=TMapAnnotation.Create;


  //Ĭ���ǹرյ�
  //ʹ��ͼƬ����ʾԭ���ؼ�
  Self.ProcessNativeControlModalShowPanel1.IsEnableModalShow:=False;

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
      //�Զ���ͼ��
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
      //Ĭ��ͼ��
      Result:=''+#13#10+'var '+AMarkId
        +'=new BMap.Marker('
          +'new BMap.Point('+FloatToStr(AMapAnnotation.Location.ConvertToBD09.longitude)+','
                            +FloatToStr(AMapAnnotation.Location.ConvertToBD09.latitude)+')'
          +');';

  end;


  //��ӱ�ע
  Result:=Result
      +#13#10+'map.addOverlay('+AMarkId+');';



  //��ӵ����������
  Result:=Result+#13#10+'var content'+AMarkId+'="<b>'+AMapAnnotation.Addr+'</b><br>"'
//                +#13#10+'+"<span><strong>GPS��</strong>'+FloatToStr(AGPS.longitude)+','+FloatToStr(AGPS.latitude)+'</span><br>"'
//                +#13#10+'+"<span><strong>ʱ�䣺</strong>'+AMapAnnotationList[I].CreateTime+'</span><br>"'
          +#13#10+';'
      +#13#10+'var opts'+AMarkId+' = { width: 150  };'

      +#13#10+'var infoWindow'+AMarkId
          +' = new BMap.InfoWindow(content'+AMarkId+', opts'+AMarkId+');';

  //���������¼�
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
  FreeAndNil(FScriptGate);

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
//  //������JS�е���Delphi�ķ���
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
  if ProcessNativeControlModalShowPanel1<>nil then
  begin
    Self.ProcessNativeControlModalShowPanel1.UpdateModalShow;
  end;
end;

procedure TFrameBaiduWebMap.SetPointFromJavaScript(const ALongitude, ALatitude: Double);
begin
  //��ȡ���û������ͼ���õ�����
  //�õ��ǰٶ�����ϵ
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
  //���ڸ���
  if FUpdateCount<>0 then Exit;



  DoShow;

  uBaseLog.OutputDebugString('TFrameBaiduWebMap.Sync Begin');

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
      //����JavaScript����Delphi�ĺ���
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
          +#13#10+'    map.addControl(new BMap.NavigationControl());  '//�����ǿؼ�
          +#13#10+'    map.addControl(new BMap.MapTypeControl());     '//��ӵ�ͼ���Ϳؼ�
          +#13#10;
  end;




  //���
  for I := 0 to FMapAnnotationList.Count-1 do
  begin
    if FMapAnnotationList[I].Location.HasData then
    begin
      AddOverlayFunc:=AddOverlayFunc
                      //��ӱ�ע
                      +CreateMarker(FMapAnnotationList[I],
                                    'Marker_'+IntToStr(I));
    end;
  end;



  //���õ�
  if Self.SetPointAnnotation.Location.HasData then
  begin
    AddOverlayFunc:=AddOverlayFunc
                    //��ӱ�ע
                    +CreateMarker(SetPointAnnotation,
                                  'Marker_SetPointAnnotation')+#13#10
                    //�������õ���
                    +'var Has_Marker_SetPointAnnotation = true;'+#13#10;
  end
  else
  begin
    AddOverlayFunc:=AddOverlayFunc
                    //���������õ���
                    //ҲҪ��������JavaScript�ı���
                    +'var Marker_SetPointAnnotation;'+#13#10   // = new BMap.Marker(new BMap.Point(0,0))
                    +'var Has_Marker_SetPointAnnotation = false;'+#13#10;

  end;



  //�������
  for I := 1 to FMapPolylineList.Count-1 do
  begin
    if FMapPolylineList[I-1].Location.HasData
      and FMapPolylineList[I].Location.HasData then
    begin
      AddOverlayFunc:=AddOverlayFunc
                      //�������
                      +CreatePolyline(
                          FMapPolylineList[I-1],
                          FMapPolylineList[I],
                          IntToStr(I));
    end;
  end;



  //�����ĵ�
  if Center.HasData then
  begin
    EntRegionList:=''
      //��ͼ���ĵ�
      //��λ���˵�
      +#13#10
      +'    map.centerAndZoom(new BMap.Point('
              +FloatToStr(Center.ConvertToBD09.longitude)+','
              +FloatToStr(Center.ConvertToBD09.latitude)
              //�Ŵ󼶱�
              +'), '
              +IntToStr(ZoomLevel)+');';
  end;


  if Self.ViewMode=mfvmSetPoint then
  begin
    EntRegionList:=EntRegionList
        //�����ӱ�ע���¼�
        +#13#10
        +#13#10+'  map.addEventListener("click", function (e) {             '
        //��ɾ��ԭ���ı��
        +#13#10+'      if (Has_Marker_SetPointAnnotation==true)             '
        +#13#10+'      { map.removeOverlay(Marker_SetPointAnnotation);}     '
        //������µı��
        +#13#10+'      point = new BMap.Point(e.point.lng, e.point.lat);    '
        +#13#10+'      Marker_SetPointAnnotation = new BMap.Marker(point);  '
        +#13#10+'      map.addOverlay(Marker_SetPointAnnotation);           '
        //�������õ���
        +#13#10+'      Has_Marker_SetPointAnnotation = true;                '
        //�����������֪ͨ��Delphi
        +#13#10+'      window.location.href = "delphi:SetPointFromJavaScript("+ e.point.lng +","+ e.point.lat +")"; '

        +#13#10+'  });                                                      '
        ;
  end;


  EntRegionList:=EntRegionList
    +#13#10+'    map.enableScrollWheelZoom();'
    //�켣
    +#13#10+AddOverlayFunc
    +#13#10
    ;



  HtmlSourceEnd:=''
      +#13#10+'</script>';





  HtmlSources:=TStringList.Create;

  //����HTML�ļ�
  HtmlLocalFileCodePath:=GetApplicationPath+'BaiduWebMapPage'+PathDelim;
  ForceDirectories(HtmlLocalFileCodePath);
  HtmlLocalFileCodePath:=HtmlLocalFileCodePath+'MapAnnotationList'+IntToStr(FTempFileIndex)+'.html';
  Inc(FTempFileIndex);

  HtmlSources.Add(HtmlSourceBegin);
  HtmlSources.Add(EntRegionList);
  HtmlSources.Add(HtmlSourceEnd);

  HtmlSources.SaveToFile(HtmlLocalFileCodePath,TEncoding.UTF8);

  //����HTML�ļ�
//  Self.FWebBrowser.LoadFromStrings(SampleHTML,'/');
//  Self.FWebBrowser.Navigate('file://'+HtmlLocalFileCodePath);
  tmrNavigate.Enabled:=True;


  FreeAndNil(HtmlSources);



  //ʹ��LoadFromStrings,�ᵼ����Android����ʾ������
//  Self.FWebBrowser.LoadFromStrings(HtmlSourceBegin+EntRegionList+HtmlSourceEnd,'/');


  uBaseLog.OutputDebugString('TFrameBaiduWebMap.Sync End');

end;

//procedure TFrameBaiduWebMap.TestJS;
//begin
//  //����HTML�ļ�
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
    //ʧ��
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
  //��ȡ·�߹���
//  ShowWaitingFrame(Application.MainForm,'��ȡ·�߹�����...');
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

  // ����
  TTimerTask(ATimerTask).TaskTag := 1;

  {$IFDEF USE_GOOGLE_ROUTE_PLAN}
  //�ȸ�·���滮
  AMapPolylineList:=GetGoogleRoutePlan(
        ARoutePlanStartAnnotation,
        ARoutePlanEndAnnotation,
        GoogleAPIKey,
        AError
        );
  {$ELSE}
  //�ٶ�·���滮
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
          //����
          //�쳣
          TTimerTask(ATimerTask).TaskDesc := AError;
      end
      else
      begin
        //�ɹ�
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

  //��ȡ·���滮����
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin


          //���µ�ͼ
          Sync;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //�����쳣
      ShowMessageBoxFrame(Application.MainForm,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
    end;
  finally
//    HideWaitingFrame;
  end;
end;


end.
