unit GoogleWebMapFrame;

interface

//Ĭ��ʹ�ðٶ�·�߹滮

//{$IFDEF MSWINDOWS}
//  //ʹ�ùȸ�·�߹滮
//  {$DEFINE USE_GOOGLE_ROUTE_PLAN}
//{$ENDIF}
//
//
//
//{$IFDEF ANDROID}
//  //ʹ�ùȸ�·�߹滮
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

  HintFrame,



  FMX.WebBrowser,
  {$IFDEF ANDROID}
  //�޸�,����͸�����������WebBrowser����
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
    //���¼���
    FUpdateCount:Integer;

    FTempFileIndex:Integer;
    {$IFDEF MSWINDOWS}
    function GetIEVersionStr:String;
    {$ENDIF}
  private
    //������ע��JavaScript
    function CreateMarker(AMapAnnotation:TMapAnnotation;AMarkId:String):String;
    //����������JavaScript
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
    //�Ƿ���Ҫ��ͼ���Ϳؼ�����ǿؼ�
    IsNeedMapControl:Boolean;

    //
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

    //���ݾ�γ�Ȼ�ȡ·�߹滮
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
  GlobalMapFrame:TFrameGoogleWebMap;


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


procedure TFrameGoogleWebMap.DoHide;
begin

end;

procedure TFrameGoogleWebMap.DoShow;
begin
  if FWebBrowser=nil then
  begin
    uBaseLog.OutputDebugString('TFrameGoogleWebMap.DoShow Begin');

    {$IFDEF ANDROID}
    //�޸�Android������͸���������,������
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
      //�Զ��巵���¼�
      OnReturnButtonClick(Self);
  end
  else
  begin
      //Ĭ��
      //����
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

  //�Ƿ���Ҫ��ǿؼ�����ͼ���Ϳؼ�
  IsNeedMapControl:=True;


  //�ٶȵ�AK
  BaiduAK:='8dlnIKumxm6hAhkxs7OyCrg3';
  //�ȸ��AK
  GoogleAPIKey:='AIzaSyBAkDSJ00aWcoJ1MIFmK_uqEb_sNRM7ePI';

  //Ĭ�ϵ����ŵȼ�
  ZoomLevel:=14;


  {$IFDEF ANDROID}
  //�޸�Android������͸���������,������
  FMX.WebBrowser.Android.WebBrowserSystemStatusBarHeight:=
        uComponentType.SystemStatusBarHeight;
  {$ENDIF}


  FMapAnnotationList:=TMapAnnotationList.Create;
  FMapPolylineList:=TMapAnnotationList.Create;


  SetPointAnnotation:=TMapAnnotation.Create;

  //ʹ��ͼƬ����ʾԭ���ؼ�
//  Self.ProcessNativeControlModalShowPanel1.IsEnableModalShow:=True;


  {$IFDEF MSWINDOWS}
  //����ע���
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
    //����°汾IE��ȡֵλ�ò�ͬ����Ҫ�ж� <br> if Reg.ValueExists('svcVersion') then
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
//  //������JS�е���Delphi�ķ���
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
  //��ȡ���û������ͼ���õ�����
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
  //���ڸ���
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
      //���
      for h := 0 to FMapAnnotationList.Count-1 do
      begin
        if FMapAnnotationList[h].Location.HasData then
        begin
          HtmlSourceBegin:=HtmlSourceBegin
          //���
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

      //����
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
            //·��
            +#13#10+'     var polyOptions_'+IntToStr(I)+'='
            //#7AAB75
            +#13#10+'     {  strokeColor: "'+ConvertAlphaColorToStr(FMapPolylineList[I-1].StrokeColor)+'", '//������ɫ
            +#13#10+'        strokeOpacity: '+FloatToStr(FMapPolylineList[I-1].StrokeOpacity)+ ', '// ����͸����
            +#13#10+'        strokeWeight: '+FloatToStr(FMapPolylineList[I-1].strokeWeight)+ ' ,'// ������ϸ
            +#13#10+'        path:flightPlanCoordinates_'+IntToStr(I)+' }'

            +#13#10+' var  poly_'+IntToStr(I)+' = new google.maps.Polyline(polyOptions_'+IntToStr(I)+'); '
            +#13#10+' poly_'+IntToStr(I)+'.setMap(map);  '

        end;
      end;
//
      //���õ�
      if Self.SetPointAnnotation.Location.HasData then
      begin
          HtmlSourceBegin:=HtmlSourceBegin
          //���
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
      //��ӱ��
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

  //����HTML�ļ�
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
    ShowMessageBoxFrame(Application.MainForm,'��ͼ�ļ�������!');
  end;

//  //����HTML�ļ�
//  Self.FWebBrowser.LoadFromStrings(SampleHTML,'/');
  Self.FWebBrowser.Navigate('file://'+HtmlLocalFileCodePath);



  FreeAndNil(HtmlSources);



  //ʹ��LoadFromStrings,�ᵼ����Android����ʾ������
//  Self.FWebBrowser.LoadFromStrings(HtmlSourceBegin+EntRegionList+HtmlSourceEnd,'/');


  uBaseLog.OutputDebugString('TFrameGoogleWebMap.Sync End');

end;

//procedure TFrameGoogleWebMap.TestJS;
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
    //ʧ��
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

  // ����
  TTimerTask(ATimerTask).TaskTag := 1;


  //�ȸ�·���滮
  AMapPolylineList:=GetGoogleRoutePlan(
        ARoutePlanStartAnnotation,
        ARoutePlanEndAnnotation,
        GoogleAPIKey,
        AError
        );

  try
      if AMapPolylineList=nil then
      begin
          //����
          //�쳣
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

procedure TFrameGoogleWebMap.tteGetRoutePlanExecuteEnd(ATimerTask: TTimerTask);
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
//      ShowMessageBoxFrame(Application.MainForm,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
      ShowHintFrame(Application.MainForm,'�����쳣,����������������!');//,TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
    end
    else if TTimerTask(ATimerTask).TaskTag=2 then
    begin
      ShowHintFrame(Application.MainForm,'�����ĳһ����ַ������');
    end;
  finally
  end;
end;


end.
