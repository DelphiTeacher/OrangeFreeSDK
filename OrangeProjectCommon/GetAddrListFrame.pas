//主要作用是选择附近的地址
unit GetAddrListFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uSkinFireMonkeyButton, uSkinFireMonkeyPanel, uSkinFireMonkeyControl,
//  MainForm,

  uSkinMaterial,
  uSkinFireMonkeyRadioButton, uSkinFireMonkeyLabel,
  uSkinFireMonkeyItemDesignerPanel, uSkinFireMonkeyScrollControl,
  uSkinFireMonkeyCustomList, uSkinFireMonkeyVirtualList, uSkinFireMonkeyListView,
  uSkinItems,
  uSkinRadioButtonType, uSkinLabelType, uSkinItemDesignerPanelType,
  uSkinScrollControlType, uSkinCustomListType, uSkinVirtualListType,
  uSkinListViewType, uSkinButtonType, uSkinPanelType,XSuperObject,uTimerTask,
  uGPSLocation,uBaseHttpControl,

  uUIFunction,
  uAppCommon,
  uMapCommon,
  uOpenClientCommon,

  uComponentType,

  uGPSUtils,
  uDrawCanvas,

  HintFrame,
  SelectAreaFrame,

  uDataSetToJson,
//  ClientModuleUnit1,
  FMX.ListView,MessageBoxFrame,WaitingFrame,
  uSkinFireMonkeyListBox, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  FMX.Controls.Presentation, FMX.Edit,
  uSkinFireMonkeyEdit,
  uSkinFireMonkeyCheckBox,
  uBaseSkinControl, uSkinListBoxType;



type
  TReturnNotice=Procedure(Sender:TObject) of Object;

  TFrameGetAddrList = class(TFrame)
    pnlToolBar: TSkinFMXPanel;
    pnlGetPosition: TSkinFMXPanel;
    lvPosition: TSkinFMXListView;
    pnlSitItem1: TSkinFMXItemDesignerPanel;
    lblName: TSkinFMXLabel;
    pnlSitDefault: TSkinFMXItemDesignerPanel;
    lblPositionName: TSkinFMXLabel;
    lblPositionDetil: TSkinFMXLabel;
    chkColor5: TSkinFMXRadioButton;
    chkColor6: TSkinFMXRadioButton;
    btnReturn: TSkinFMXButton;
    btnSearch: TSkinFMXButton;
    edtSearch: TSkinFMXEdit;
    pnlProvince: TSkinFMXPanel;
    btnSelectProvince: TSkinFMXButton;
    procedure btnReturnClick(Sender: TObject);
    procedure lvPositionClickItem(AItem: TSkinItem);
    procedure lvPositionPullUpLoadMore(Sender: TObject);
    procedure edtSearchChangeTracking(Sender: TObject);
    procedure lvPositionPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinFMXItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSelectProvinceClick(Sender: TObject);
  private
    //搜索附近地址(返回GCJ02格式的经纬度)
    procedure DoSelectedAddrExecute(ATimerTask:TObject);
    procedure DoSelectedAddrExecuteEnd(ATimerTask:TObject);

    //加载更多附近地址(返回GCJ02格式的经纬度)
    procedure DoGetSelectedAddrMoreExecute(ATimerTask:TObject);
    procedure DoGetSelectedAddrMoreExecuteEnd(ATimerTask:TObject);
//  private
//    FFilterKey:String;
  private
    FClickedListBoxItem:TSkinItem;

    //根据地址区域获取经纬度
    procedure DoGetPositionLatLngExecute(ATimerTask:TObject);
    procedure DoGetPositionLatLngExecuteEnd(ATimerTask:TObject);

    //获取详细地址
    procedure DoGetPositionDetailExecute(ATimerTask:TObject);
    procedure DoGetPositionDetailExecuteEnd(ATimerTask:TObject);
    { Private declarations }
  private
    //自动补全地址所搜索的区域
    FAutoCompleteSearchCity:String;
    //自动补全地址(返回GCJ02格式的经纬度)
    procedure DoAutoCompleteExecute(ATimerTask:TObject);
    procedure DoAutoCompleteExecuteEnd(ATimerTask:TObject);

    //选择省市返回
    procedure OnReturnFrameFromSelectArea(Frame:TFrame);
  public

    //位置坐标
    FLocation:TLocation;

    FSelectedAddr:String;
    FSelectedAddrDetail:String;


    //自动匹配模式(搜索地址)
    FIsAutoComplete:Boolean;


    //省
    FProvince:String;
    //市
    FCity:String;
    //区
    FArea:String;
    //自动补全的地址
    FAutoAddr:String;
    //邮政编码
    FPostCode:String;
    //
    FAddr:String;





    //经纬度(GCJ02格式的)
    FSelectedLat:Double;
    FSelectedLng:Double;
    //初始经纬度(GCJ02格式的)
    FInitLat:Double;
    FInitLng:Double;
    //清空
    procedure Clear;

    procedure Load(ALastSelectedAddr:String;
                   ALastSelectedAddrDetail:String;


                   AProvince:String;
                   ACity:String;
                   AArea:String;
                   APostCode:String;
                   ALat:Double;
                   ALng:Double;


                   //是否显示确定按钮
                   IsShowOKButton:Boolean;
                   //是否需要无地址选项
                   AIsShowNoPosition:Boolean;
                   //是否是自动地址区域模式
                   AIsAutoComplete:Boolean);


    //设置高度
    procedure AutoSize;

    //初始化
    procedure Syc;

//  public
//    OnReturnNotice:TReturnNotice;
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;



var
  GlobalGetAddrListFrame:TFrameGetAddrList;

function GetCityStr(province,city:String): String;
function GetAreaStr(province,city,area:String): String;
function GetLongAddrStr(country,province,city,area,addr:String): String;



implementation



{$R *.fmx}

uses
  MainForm;

//uses
//  SetGPSPointFrame;
//  uManager;



function GetCityStr(province,city:String): String;
begin
  {$IFDEF USE_GOOGLE_ROUTE_PLAN}
  Result:=city+','+province;
  {$ELSE}
  Result:=province+' '+city+' ';
  {$ENDIF}
end;

function GetAreaStr(province,city,area:String): String;
begin
  {$IFDEF USE_GOOGLE_ROUTE_PLAN}
  Result:=area+','+city+','+province;
  {$ELSE}
  Result:=province+' '+city+' '+area+'';
  {$ENDIF}
end;

function GetLongAddrStr(country,province,city,area,addr:String): String;
begin
  {$IFDEF USE_GOOGLE_ROUTE_PLAN}
  Result:=addr+area+city+province+country;
  {$ELSE}
  Result:=country+province+city+area+addr;
  {$ENDIF}
end;


procedure TFrameGetAddrList.AutoSize;
var
  AHeight:Double;
  I: Integer;
begin
  AHeight:=0;

  for I := 0 to Self.lvPosition.Prop.Items.Count-1 do
  begin
    AHeight:=AHeight+Self.lvPosition.Prop.Items[I].Height;
  end;

  Self.Height:=AHeight;
end;

procedure TFrameGetAddrList.btnReturnClick(Sender: TObject);
begin
  //什么也不做
  //清空返回事件,也就是返回的时候不调用它
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  HideFrame;//();
  ReturnFrame();
end;

procedure TFrameGetAddrList.btnSearchClick(Sender: TObject);
begin

  if Self.edtSearch.Text<>Self.FSelectedAddr then
  begin

    {$IFDEF NZ}
    Self.FAutoAddr:=Self.FPostCode+','+Self.edtSearch.Text+','+Self.FArea+','+Self.FCity+','+Self.FProvince;
    {$ELSE}
    Self.FAutoAddr:=Self.FProvince+','+Self.FCity+','+Self.FArea+','+Self.edtSearch.Text;
    {$ENDIF}

    ShowWaitingFrame(Self,'获取中...');
    //获取经纬度和省市区
    uTimerTask.GetGlobalTimerThread.RunTempTask(
             DoGetPositionLatLngExecute,
             DoGetPositionLatLngExecuteEnd,
             'GetPositionLatLng');

  end
  else
  begin
    if (Self.FSelectedLat=0) and (Self.FSelectedLng=0) then
    begin
      {$IFDEF NZ}
      Self.FAutoAddr:=Self.FPostCode+','+Self.edtSearch.Text+','+Self.FArea+','+Self.FCity+','+Self.FProvince;
      {$ELSE}
      Self.FAutoAddr:=Self.FProvince+','+Self.FCity+','+Self.FArea+','+Self.edtSearch.Text;
      {$ENDIF}

      ShowWaitingFrame(Self,'获取中...');
      //获取经纬度和省市区
      uTimerTask.GetGlobalTimerThread.RunTempTask(
               DoGetPositionLatLngExecute,
               DoGetPositionLatLngExecuteEnd,
               'GetPositionLatLng');
    end
    else
    begin
      Self.FSelectedAddr:=Self.edtSearch.Text;
      //返回
      HideFrame;//();
      ReturnFrame();
    end;

  end;
end;

procedure TFrameGetAddrList.btnSelectProvinceClick(Sender: TObject);
begin
//  FMX.Types.Log.d('OrangeUI Country'+GlobalCountryString);
  {$IFDEF NZ}
//  if GlobalCountryString='NZ' then
//  begin
    //选择所在地区
    HideFrame;//(Self,hfcttBeforeShowFrame);

    ShowFrame(TFrame(GlobalSelectAreaFrame),TFrameSelectArea,frmMain,nil,nil,OnReturnFrameFromSelectArea,Application);
//    GlobalSelectAreaFrame.FrameHistroy:=CurrentFrameHistroy;
    GlobalSelectAreaFrame.LoadDataFromWeb(BasicDataManageInterfaceUrl,'New Zealand');
    //不需要区域
    GlobalSelectAreaFrame.Init(FProvince,FCity,FArea,False,True,False);

//  end
//  else
//  begin
  {$ELSE}
      //选择所在地区
      HideFrame;//(Self,hfcttBeforeShowFrame);

      ShowFrame(TFrame(GlobalSelectAreaFrame),TFrameSelectArea,frmMain,nil,nil,OnReturnFrameFromSelectArea,Application);
//      GlobalSelectAreaFrame.FrameHistroy:=CurrentFrameHistroy;
      GlobalSelectAreaFrame.LoadData;
      //不需要区域
      GlobalSelectAreaFrame.Init(FProvince,FCity,FArea,False,False,False);

      if GlobalGPSLocation<>nil then
      begin
        GlobalSelectAreaFrame.SetGPSLocation(GlobalGPSLocation.Province,
                                             GlobalGPSLocation.City,
                                             GlobalGPSLocation.District
                                             );
        GlobalSelectAreaFrame.FIsClickGPSAddrThenOK:=False;
      end;
//  end;
  {$ENDIF}


end;

procedure TFrameGetAddrList.Clear;
begin
  lvPosition.Prop.Items.BeginUpdate;
  try
    Self.lvPosition.Prop.Items.Clear(True);
  finally
    lvPosition.Prop.Items.EndUpdate;
  end;

  FIsAutoComplete:=False;

  Self.edtSearch.Text:='';

  FAutoAddr:='';

//  Self.FFilterKey:='';

  //省
  FProvince:='';
  //市
  FCity:='';
  //区
  FArea:='';
  //邮政编码
  FPostCode:='';

  FInitLat:=0;
  FInitLng:=0;

end;

constructor TFrameGetAddrList.Create(AOwner: TComponent);
begin
  inherited;

  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);

  Self.pnlToolBar.SelfOwnMaterialToDefault.BackColor.FillColor.Color:=SkinThemeColor;
end;

destructor TFrameGetAddrList.Destroy;
begin

  inherited;
end;

procedure TFrameGetAddrList.DoAutoCompleteExecute(ATimerTask: TObject);
var
  AResponseStream:TStringStream;
  AHttpControl:THttpControl;
  AIsSuccProcess:Boolean;
  ASuperObject:ISuperObject;
  I:Integer;
  AListBoxItem:TSkinListBoxItem;
begin
  if Self.edtSearch.Text<>'' then
  begin
    //出错
    TTimerTask(ATimerTask).TaskTag:=1;

    try

      AIsSuccProcess:=False;
      try

          AHttpControl:=TSystemHttpControl.Create;
          AResponseStream:=TStringStream.Create('',TEncoding.Utf8);


            {$IFDEF USE_GOOGLE_ROUTE_PLAN}
            //国外
            //调谷歌接口
            AIsSuccProcess:=//AHttpControl.Get(
                GetWebUrl_From_OrangeUIServer(AHttpControl,
                  'https://maps.googleapis.com/maps/api/place/autocomplete/json?'
                              +'input='+Self.edtSearch.Text //输入地址
                              {$IFDEF NZ}
                              +'&components=country:nz'
                              +'&language=en'
                              {$ELSE}
                              +'&components=country:cn'
                              +'&language=zh-CN'
                              {$ENDIF}
                              +'&key='+GoogleAPIKey,
                              AResponseStream
                      );
            {$ELSE}

            //国内
            //调用百度接口
            AIsSuccProcess:=AHttpControl.Get(
//                GetWebUrl_From_OrangeUIServer(AHttpControl,
                      'http://api.map.baidu.com'
                        +'/place/v2/suggestion?'
                        +'query='+Self.edtSearch.Text//固定地址
                        +'&region='+FAutoCompleteSearchCity//Self.FCity
                        +'&city_limit=true'
                        +'&output=json'
                        //返回GCJ02格式的经纬度
                        //返回GCJ02格式的经纬度
                        +'&ret_coordtype=gcj02ll'
                        +'&ak='+BaiduAPIKey
                        ,
                        AResponseStream
                        );
            {$ENDIF}

              if AIsSuccProcess=True then
              begin
                FMX.Types.Log.d('OrangeUI DoAddRecvAddrExecute Success');

                TTimerTask(ATimerTask).TaskTag:=0;

                //'{'#$A'    "status":2,'#$A'    "message":"Parameter Invalid",'#$A'    "result":['#$A'        '#$A'    ]'#$A'}'
                TTimerTask(ATimerTask).TaskDesc:=AResponseStream.DataString;

              end
              else
              begin
                FMX.Types.Log.d('OrangeUI DoAddRecvAddrExecute Fail');
                TTimerTask(ATimerTask).TaskTag:=2;
                //经纬度获取失败
                ShowMessageBoxFrame(Self,'地址获取失败!','',TMsgDlgType.mtInformation,['确定'],nil);
                Exit;
              end;

  //        end;
  //        else
  //        begin
  //          {$IFDEF USE_GOOGLE_ROUTE_PLAN}
  //          //国外
  //          //调谷歌接口
  //          AIsSuccProcess:=AHttpControl.Get(
  //                uBaseHttpControl.FixSupportIPV6URL('https://maps.googleapis.com')
  //                            +'/maps/api/place/nearbysearch/json?'
  //                            +'location='+FloatToStr(GlobalGPSLocation.Latitude)
  //                                    +','+FloatToStr(GlobalGPSLocation.Longitude)//固定地址
  //                            +'&radius=500'
  //                            +'&sensor=true'
  //                            +'&key='+uGPSLocation.GoogleAPIKey,
  //                            AResponseStream
  //                    );
  //  //        AIsSuccProcess:=AHttpControl.Get(
  //  //              uBaseHttpControl.FixSupportIPV6URL('https://maps.googleapis.com')
  //  //                          +'/maps/api/geocode/json?'
  //  //                          +'latlng='+FloatToStr(GlobalGPSLocation.Latitude)
  //  //                                  +','+FloatToStr(GlobalGPSLocation.Longitude)//固定地址
  //  //                          +'&key='+uGPSLocation.GoogleAPIKey,
  //  //                          AResponseStream
  //  //                  );
  //
  //          {$ELSE}
  //          //国内
  //          //调用百度接口
  //          //把返回的数据放入AResponseStream
  //          AIsSuccProcess:=AHttpControl.Get(
  //
  //                    uBaseHttpControl.FixSupportIPV6URL('http://api.map.baidu.com')
  //                    +'/geocoder/v2/?'
  //                    +'LatLng='+FloatToStr(GlobalGPSLocation.Latitude)
  //                            +','+FloatToStr(GlobalGPSLocation.Longitude)//固定地址
  //                    +'&output=json'
  //                    +'&pois=1'
  //                    +'&radius=1000'
  //                    +'&coordtype=gcj02ll'
  //                    +'&ak='+uGPSLocation.BaiduAPIKey
  //                    ,
  //                    AResponseStream
  //                    );
  //
  //          {$ENDIF}
  //        end;



      finally
        AResponseStream.Free;
        FreeAndNil(AHttpControl);
      end;



    except
      on E:Exception do
      begin
        //异常
        TTimerTask(ATimerTask).TaskDesc:=E.Message;
      end;
    end;
  end;

end;

procedure TFrameGetAddrList.DoAutoCompleteExecuteEnd(ATimerTask: TObject);
var
  ASuperObject:ISuperObject;
  AListBoxItem:TSkinListBoxItem;
  AListViewItem:TSkinListViewItem;
  I:Integer;
  ADetailHeight:Double;
  ACaptionHeight:Double;
  Addr:String;
  AShortAddr:String;
  AJson:String;
  AHeight:Double;
begin

  ADetailHeight:=0;
  ACaptionHeight:=0;

  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);

      {$IFDEF USE_GOOGLE_ROUTE_PLAN}
      if ASuperObject.S['status']='OK' then
      {$ELSE}
      if ASuperObject.I['status']=0 then
      {$ENDIF}
      begin
          //加载成功
          Self.lvPosition.Prop.Items.BeginUpdate;
          Self.lvPosition.Prop.Items.Clear(True);
          try
            if Self.edtSearch.Text<>'' then
            begin
              {$IFDEF USE_GOOGLE_ROUTE_PLAN}
              for I := 0 to ASuperObject.A['predictions'].Length-1 do
              begin

                AListViewItem:=Self.lvPosition.Prop.Items.Add;
                AListViewItem.Caption:=ASuperObject.A['predictions'].O[I].O['structured_formatting'].S['main_text'];
                AListViewItem.Detail:=ASuperObject.A['predictions'].O[I].S['description'];
                AListViewItem.Detail6:=ASuperObject.A['predictions'].O[I].AsJSON;
                ADetailHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                                ASuperObject.A['predictions'].O[I].S['description'],
                                                12,
                                                Self.lvPosition.Prop.ItemHeight/2
                                                    );

                ACaptionHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                                ASuperObject.A['predictions'].O[I].O['structured_formatting'].S['main_text'],
                                                14,
                                                Self.lvPosition.Prop.ItemHeight/2
                                                    );
                AListViewItem.Height:=ACaptionHeight+ADetailHeight+10;


              end;
              {$ELSE}
              for I := 0 to ASuperObject.A['result'].Length-1 do
              begin

                AListViewItem:=Self.lvPosition.Prop.Items.Add;
                AListViewItem.Caption:=ASuperObject.A['result'].O[I].S['name'];
                AListViewItem.Detail:=ASuperObject.A['result'].O[I].S['province']+','+ASuperObject.A['result'].O[I].S['city']+','+ASuperObject.A['result'].O[I].S['district']+','+ASuperObject.A['result'].O[I].S['name'];
                AListViewItem.Detail6:=ASuperObject.A['result'].O[I].AsJSON;
                ADetailHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                               AListViewItem.Detail,
                                                12,
                                                Self.lvPosition.Prop.ItemHeight/2
                                                    );

                ACaptionHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                                ASuperObject.A['result'].O[I].S['name'],
                                                14,
                                                Self.lvPosition.Prop.ItemHeight/2
                                                    );
                AListViewItem.Height:=ACaptionHeight+ADetailHeight+10;


              end;

              {$ENDIF}
            end;

          finally
            Self.lvPosition.Prop.Items.EndUpdate();
          end;


      end
      else
      begin
          lvPosition.Prop.Items.BeginUpdate;
          try
            Self.lvPosition.Prop.Items.Clear(True);
          finally
            lvPosition.Prop.Items.EndUpdate;
          end;
          //调用失败
          ShowHintFrame(nil,'没有找到有关地址');

      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      ShowHintFrame(nil,'网络异常,请检查您的网络连接!');//,TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
    HideWaitingFrame;
  end;
end;

procedure TFrameGetAddrList.DoGetPositionDetailExecute(ATimerTask: TObject);
var
  AResponseStream:TStringStream;
  AHttpControl:THttpControl;
  AIsSuccProcess:Boolean;
begin

  AIsSuccProcess:=False;
  //出错
  TTimerTask(ATimerTask).TaskTag:=1;

  try
      AHttpControl:=TSystemHttpControl.Create;
      AResponseStream:=TStringStream.Create('',TEncoding.Utf8);
      try
          {$IFDEF USE_GOOGLE_ROUTE_PLAN}
          //国外
          //调谷歌接口
          AIsSuccProcess:=//AHttpControl.Get(
            GetWebUrl_From_OrangeUIServer(AHttpControl,
                'https://maps.googleapis.com'
                            +'/maps/api/place/details/json?'
                            +'placeid='+FAutoAddr //输入地址
                            +'&key='+GoogleAPIKey,
                            AResponseStream
                    );

          {$ELSE}

          //调用其他


          {$ENDIF}

          if AIsSuccProcess=True then
          begin
            FMX.Types.Log.d('OrangeUI DoAddRecvAddrExecute Success');
            //获取成功

            TTimerTask(ATimerTask).TaskTag:=0;

            TTimerTask(ATimerTask).TaskDesc:=AResponseStream.DataString;
          end
          else
          begin
            FMX.Types.Log.d('OrangeUI DoAddRecvAddrExecute Fail');

            TTimerTask(ATimerTask).TaskTag:=2;
            //经纬度获取失败
            ShowMessageBoxFrame(Self,'地址获取失败!','',TMsgDlgType.mtInformation,['确定'],nil);
            Exit;
          end;

      finally
        AResponseStream.Free;
        FreeAndNil(AHttpControl);
      end;
  except
    on E:Exception do
    begin
      //异常
      TTimerTask(ATimerTask).TaskDesc:=E.Message;
    end;
  end;

end;

procedure TFrameGetAddrList.DoGetPositionDetailExecuteEnd(ATimerTask: TObject);
var
  ASuperObject:ISuperObject;
  AAddressComponentJson:ISuperArray;
  I:Integer;
begin

  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
      if ASuperObject.S['status']='OK' then
      begin

        //加载成功
        {$IFDEF USE_GOOGLE_ROUTE_PLAN}
        //获取成功
        AAddressComponentJson:=nil;

        if ASuperObject.O['result'].Count>0 then
        begin

          AAddressComponentJson:=ASuperObject.O['result'].A['address_components'];

          for I := 0 to AAddressComponentJson.Length-1 do
          begin

            //{
            //"long_name": "Park Road",
            //"short_name": "Park Rd",
            //"types": ["route"]
            //},
            //"types": ["street_number"]
            //"types": ["route"]
            //"types": ["political", "sublocality", "sublocality_level_1"]
            //"types": ["locality", "political"]
            //"types": ["administrative_area_level_1", "political"]
            //"types": ["country", "political"]
            //"types": ["postal_code"]
            if AAddressComponentJson.O[I].A['types'].S[0]='postal_code' then
            begin
              Self.FPostCode:=AAddressComponentJson.O[I].S['long_name'];
            end;


            if AAddressComponentJson.O[I].A['types'].S[0]='administrative_area_level_1' then
            begin
              Self.FProvince:=AAddressComponentJson.O[I].S['long_name'];
            end;

            if AAddressComponentJson.O[I].A['types'].S[0]='locality' then
            begin
              Self.FCity:=AAddressComponentJson.O[I].S['long_name'];
            end;

            if AAddressComponentJson.O[I].A['types'].S[0]='sublocality_level_1' then
            begin
              Self.FArea:=AAddressComponentJson.O[I].S['long_name'];
            end;

          end;

        end;

        Self.FSelectedLat:=GetJsonDoubleValue(ASuperObject.O['result'].O['geometry'].O['location'],'lat');
        Self.FSelectedLng:=GetJsonDoubleValue(ASuperObject.O['result'].O['geometry'].O['location'],'lng');
        {$ELSE}

        {$ENDIF}


        FClickedListBoxItem.Selected:=True;

        //返回
        HideFrame;//();
        ReturnFrame();


      end
      else
      begin
        FClickedListBoxItem.Selected:=False;
        //调用失败
        ShowHintFrame(nil,'获取地址信息失败');
      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
    HideWaitingFrame;
  end;
end;

procedure TFrameGetAddrList.DoGetPositionLatLngExecute(ATimerTask: TObject);
var
  AResponseStream:TStringStream;
  AHttpControl:THttpControl;
  AIsSuccProcess:Boolean;
begin

  AIsSuccProcess:=False;
  //出错
  TTimerTask(ATimerTask).TaskTag:=1;

  try
      AHttpControl:=TSystemHttpControl.Create;
      AResponseStream:=TStringStream.Create('',TEncoding.Utf8);
      try
          {$IFDEF USE_GOOGLE_ROUTE_PLAN}
          //国外
          //调谷歌接口
          AIsSuccProcess:=//AHttpControl.Get(
            GetWebUrl_From_OrangeUIServer(AHttpControl,
                        'https://maps.googleapis.com'
                            +'/maps/api/geocode/json?'
                            +'address='+FAutoAddr //输入地址
                            +'&key='+GoogleAPIKey,
                            AResponseStream
                    );

          {$ELSE}

          //调用百度
          AIsSuccProcess:=AHttpControl.Get(
//                  GetWebUrl_From_OrangeUIServer(AHttpControl,
                            'http://api.map.baidu.com'
                            +'/geocoder/v2/?'
                            +'address='+Self.FAutoAddr //输入地址
                            +'&output=json'
                            //返回GCJ02格式的经纬度
                            +'&ret_coordtype=gcj02ll'
                            +'&ak='+BaiduAPIKey,
                            AResponseStream
                    );
          {$ENDIF}

          if AIsSuccProcess=True then
          begin
            FMX.Types.Log.d('OrangeUI DoAddRecvAddrExecute Success');
            //获取成功

            TTimerTask(ATimerTask).TaskTag:=0;

            TTimerTask(ATimerTask).TaskDesc:=AResponseStream.DataString;
          end;

      finally
        AResponseStream.Free;
        FreeAndNil(AHttpControl);
      end;
  except
    on E:Exception do
    begin
      //异常
      TTimerTask(ATimerTask).TaskDesc:=E.Message;
    end;
  end;

end;

procedure TFrameGetAddrList.DoGetPositionLatLngExecuteEnd(ATimerTask: TObject);
var
  ASuperObject:ISuperObject;
  ALocation:TLocation;
  AProvince:String;
  ACity:String;
  ADistrict:String;
  ACountry:String;
  ARount:String;
  AShortAddr:String;
  AAddr:String;
  ALatitude:Double;
  ALongitude:Double;
begin

  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);


      //加载成功
      {$IFDEF USE_GOOGLE_ROUTE_PLAN}
      if ASuperObject.S['status']='OK' then
      begin
        Self.FSelectedLat:=GetJsonDoubleValue(ASuperObject.A['results'].O[0].O['geometry'].O['location'],'lat');
        Self.FSelectedLng:=GetJsonDoubleValue(ASuperObject.A['results'].O[0].O['geometry'].O['location'],'lng');
      end
      else
      begin
        FClickedListBoxItem.Selected:=False;
        //调用失败
        ShowHintFrame(nil,'获取经纬度失败');
      end;
      {$ELSE}
      if ASuperObject.I['status']=0 then
      begin
        Self.FSelectedLat:=GetJsonDoubleValue(ASuperObject.O['result'].O['location'],'lat');
        Self.FSelectedLng:=GetJsonDoubleValue(ASuperObject.O['result'].O['location'],'lng');



        Gcj02_bd09ll(FSelectedLat,FSelectedLng,ALatitude,ALongitude);
      end
      else
      begin

        FMX.Types.Log.d('OrangeUI DoAddRecvAddrExecute Fail');
        //经纬度获取失败
        ShowHintFrame(nil,'获取经纬度失败');
        Exit;
      end;
      {$ENDIF}

//        ALocation:=TLocation.Create(FSelectedLat,FSelectedLng,gtGCJ02);
//        if GetGeocoder(ALocation,
//                                    AAddr,
//                                    ACountry,
//                                    Self.FProvince,
//                                    Self.FCity,
//                                    Self.FArea,
//                                    ARount,
//                                    AShortAddr,
//                                    FPostCode) then
//        begin
//          if Self.pnlToolBar.Visible=True then
//          begin
//            FClickedListBoxItem.Selected:=True;
//            //返回
          HideFrame;//();
          ReturnFrame();

          Self.FSelectedAddr:=Self.edtSearch.Text;
//          end
//          else
//          begin
//            HideFrame;//(Self,hfcttBeforeReturnFrame);
//          end;
//        end
//        else
//        begin
//          FClickedListBoxItem.Selected:=False;
//          //出错
//          ShowMessageBoxFrame(Self,'省份城市获取失败!','',TMsgDlgType.mtInformation,['确定'],nil);
//          Exit;
//        end;



    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
    HideWaitingFrame;
  end;
end;



procedure TFrameGetAddrList.DoGetSelectedAddrMoreExecute(ATimerTask: TObject);
var
  AResponseStream:TStringStream;
  AHttpControl:THttpControl;
  AIsSuccProcess:Boolean;
begin
  try
    AIsSuccProcess:=False;
    //出错
    TTimerTask(ATimerTask).TaskTag:=1;

    AHttpControl:=TSystemHttpControl.Create;
    AResponseStream:=TStringStream.Create('',TEncoding.Utf8);
    try
        {$IFDEF USE_GOOGLE_ROUTE_PLAN}
        //国外
        //调谷歌接口
        AIsSuccProcess:=//AHttpControl.Get(
            GetWebUrl_From_OrangeUIServer(AHttpControl,
                  'https://maps.googleapis.com'
                          +'/maps/api/place/nearbysearch/json?'
                          +'location='+FloatToStr(GlobalGPSLocation.Latitude)
                                  +','+FloatToStr(GlobalGPSLocation.Longitude)//固定地址
                          +'&radius=1000'
                          +'&sensor=true'
                          +'&key='+GoogleAPIKey,
                          AResponseStream
                  );

        {$ELSE}
        //国内
        //调用百度接口
        //把返回的数据放入AResponseStream
        AIsSuccProcess:=AHttpControl.Get(
//            GetWebUrl_From_OrangeUIServer(AHttpControl,
                  'http://api.map.baidu.com'
                    +'/geocoder/v2/?'
                    +'location='+FloatToStr(GlobalGPSLocation.Latitude)
                            +','+FloatToStr(GlobalGPSLocation.Longitude)//固定地址
                    +'&output=json'
                    +'&pois=1'
                    +'&radius=1000'
                    +'&coordtype=gcj02ll'
                    //返回GCJ02格式的经纬度
                    //返回GCJ02格式的经纬度
                    +'&ret_coordtype=gcj02ll'
                    +'&ak='+BaiduAPIKey
                    ,
                    AResponseStream
                    );

        {$ENDIF}



        TTimerTask(ATimerTask).TaskDesc:=AResponseStream.DataString;

        if AIsSuccProcess=True then
        begin
          TTimerTask(ATimerTask).TaskTag:=0;
        end
        else
        begin
          TTimerTask(ATimerTask).TaskTag:=1;
        end;

    finally
      AResponseStream.Free;
      FreeAndNil(AHttpControl);
    end;
  except
    on E:Exception do
    begin
      //异常
      TTimerTask(ATimerTask).TaskDesc:=E.Message;
    end;
  end;
end;

procedure TFrameGetAddrList.DoGetSelectedAddrMoreExecuteEnd(ATimerTask: TObject);
var
  ASuperObject:ISuperObject;
  I: Integer;
  AListViewItem:TSkinListViewItem;
  J: Integer;
  ACaptionHeight:Double;
  ADetailHeight:Double;
begin
  ACaptionHeight:=0;
  ADetailHeight:=0;
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);

      Self.lvPosition.Prop.Items.BeginUpdate;
      try
          {$IFDEF USE_GOOGLE_ROUTE_PLAN}
          for I := 0 to ASuperObject.A['results'].Length-1 do
          begin
            if (FSelectedAddr<>ASuperObject.A['results'].O[I].S['name'])
            and (Self.lvPosition.Prop.Items.FindItemByCaption(ASuperObject.A['results'].O[I].S['name'])=nil) then
            begin
              AListViewItem:=Self.lvPosition.Prop.Items.Add;
              AListViewItem.Caption:=ASuperObject.A['results'].O[I].S['name'];
              AListViewItem.Detail6:=ASuperObject.A['results'].O[I].AsJSON;
              AListViewItem.Detail:=ASuperObject.A['results'].O[I].S['vicinity'];

              ADetailHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                              ASuperObject.A['results'].O[I].S['vicinity'],
                                              12,
                                              Self.lvPosition.Prop.ItemHeight/2
                                                  );

              ACaptionHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                             ASuperObject.A['results'].O[I].S['name'],
                                              14,
                                              Self.lvPosition.Prop.ItemHeight/2
                                                  );
              AListViewItem.Height:=ACaptionHeight+ADetailHeight;
            end;
          end;
          {$ELSE}
          for I := 0 to ASuperObject.O['result'].A['pois'].Length-1 do
          begin

            if (FSelectedAddr<>ASuperObject.O['result'].A['pois'].O[I].S['name'])
              and (Self.lvPosition.Prop.Items.FindItemByCaption(ASuperObject.O['result'].A['pois'].O[I].S['name'])=nil) then
            begin

              AListViewItem:=Self.lvPosition.Prop.Items.Add;
              AListViewItem.Caption:=ASuperObject.O['result'].A['pois'].O[I].S['name'];
              AListViewItem.Detail:=ASuperObject.O['result'].A['pois'].O[I].S['addr'];
              AListViewItem.Detail6:=ASuperObject.O['result'].A['pois'].O[I].AsJSON;


              ADetailHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                              ASuperObject.O['result'].A['pois'].O[I].S['addr'],
                                              12,
                                              Self.lvPosition.Prop.ItemHeight/2
                                                  );

              ACaptionHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                             ASuperObject.O['result'].A['pois'].O[I].S['name'],
                                              14,
                                              Self.lvPosition.Prop.ItemHeight/2
                                                  );
              AListViewItem.Height:=ACaptionHeight+ADetailHeight;
            end;

          end;
         {$ENDIF}




      finally
        Self.lvPosition.Prop.Items.EndUpdate;
      end;
    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
    Self.lvPosition.Prop.StopPullUpLoadMore();
  end;
end;

procedure TFrameGetAddrList.DoSelectedAddrExecute(ATimerTask: TObject);
var
  AResponseStream:TStringStream;
  AHttpControl:THttpControl;
  AIsSuccProcess:Boolean;
begin
  try
    AIsSuccProcess:=False;
    //出错
    TTimerTask(ATimerTask).TaskTag:=1;

    AHttpControl:=TSystemHttpControl.Create;
    TSystemHttpControl(AHttpControl).FNetHTTPClient.ConnectionTimeout:=10*1000;  //连接超时-五秒
    TSystemHttpControl(AHttpControl).FNetHTTPClient.ResponseTimeout:=10*1000;    //响应超时-五秒

    AResponseStream:=TStringStream.Create('',TEncoding.Utf8);
    try
        {$IFDEF USE_GOOGLE_ROUTE_PLAN}
        //国外
        //调谷歌接口
        AIsSuccProcess:=AHttpControl.Get(
//            GetWebUrl_From_OrangeUIServer(AHttpControl,
                  'https://maps.googleapis.com'
                          +'/maps/api/place/nearbysearch/json?'
                          +'location='+FloatToStr(GlobalGPSLocation.Latitude)
                                  +','+FloatToStr(GlobalGPSLocation.Longitude)//固定地址
                          +'&radius=500'//半径
                          +'&sensor=true'
                          +'&key='+GoogleAPIKey,
                          AResponseStream
                  );
//        AIsSuccProcess:=AHttpControl.Get(
//              uBaseHttpControl.FixSupportIPV6URL('https://maps.googleapis.com')
//                          +'/maps/api/geocode/json?'
//                          +'latlng='+FloatToStr(GlobalGPSLocation.Latitude)
//                                  +','+FloatToStr(GlobalGPSLocation.Longitude)//固定地址
//                          +'&key='+uGPSLocation.GoogleAPIKey,
//                          AResponseStream
//                  );

        {$ELSE}
        //国内
        //调用百度接口
        //把返回的数据放入AResponseStream
        AIsSuccProcess:=AHttpControl.Get(
//            GetWebUrl_From_OrangeUIServer(AHttpControl,
                  'http://api.map.baidu.com'
                    +'/geocoder/v2/?'
                    +'location='+FloatToStr(GlobalGPSLocation.Latitude)
                            +','+FloatToStr(GlobalGPSLocation.Longitude)//固定地址
                    +'&output=json'
                    +'&pois=1'
                    +'&radius=500'//搜索半径范围500米
                    +'&coordtype=gcj02ll'
                    //返回GCJ02格式的经纬度
                    //返回GCJ02格式的经纬度
                    +'&ret_coordtype=gcj02ll'
                    +'&ak='+BaiduAPIKey
                    ,
                    AResponseStream
                    );

        {$ENDIF}



        TTimerTask(ATimerTask).TaskDesc:=AResponseStream.DataString;

        if AIsSuccProcess=True then
        begin
          TTimerTask(ATimerTask).TaskTag:=0;
        end
        else
        begin
          TTimerTask(ATimerTask).TaskTag:=1;
        end;

    finally
      AResponseStream.Free;
      FreeAndNil(AHttpControl);
    end;
  except
    on E:Exception do
    begin
      //异常
      TTimerTask(ATimerTask).TaskDesc:=E.Message;
    end;
  end;
end;

procedure TFrameGetAddrList.DoSelectedAddrExecuteEnd(ATimerTask: TObject);
var
  ASuperObject:ISuperObject;
  I: Integer;
  AListViewItem:TSkinListViewItem;
  ADetailHeight:Double;
  ACaptionHeight:Double;
begin
  ADetailHeight:=0;
  ACaptionHeight:=0;
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);

      Self.lvPosition.Prop.Items.BeginUpdate;
      try
          {$IFDEF USE_GOOGLE_ROUTE_PLAN}
          for I := 0 to ASuperObject.A['results'].Length-1 do
          begin
            if (FSelectedAddr<>ASuperObject.A['results'].O[I].S['name'])
            and (Self.lvPosition.Prop.Items.FindItemByCaption(ASuperObject.A['results'].O[I].S['name'])=nil) then
            begin
              AListViewItem:=Self.lvPosition.Prop.Items.Add;
              AListViewItem.Caption:=ASuperObject.A['results'].O[I].S['name'];
              AListViewItem.Detail6:=ASuperObject.A['results'].O[I].AsJSON;
              AListViewItem.Detail:=ASuperObject.A['results'].O[I].S['vicinity'];

              ADetailHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                              ASuperObject.A['results'].O[I].S['vicinity'],
                                              12,
                                              Self.lvPosition.Prop.ItemHeight/2
                                                  );

              ACaptionHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                             ASuperObject.A['results'].O[I].S['name'],
                                              14,
                                              Self.lvPosition.Prop.ItemHeight/2
                                                  );
              AListViewItem.Height:=ACaptionHeight+ADetailHeight;
            end;
          end;

          {$ELSE}
          for I := 0 to ASuperObject.O['result'].A['pois'].Length-1 do
          begin

            if (FSelectedAddr<>ASuperObject.O['result'].A['pois'].O[I].S['name'])
              and (Self.lvPosition.Prop.Items.FindItemByCaption(ASuperObject.O['result'].A['pois'].O[I].S['name'])=nil) then
            begin

              AListViewItem:=Self.lvPosition.Prop.Items.Add;
              AListViewItem.Caption:=ASuperObject.O['result'].A['pois'].O[I].S['name'];
              AListViewItem.Detail:=ASuperObject.O['result'].A['pois'].O[I].S['addr'];
              AListViewItem.Detail6:=ASuperObject.O['result'].A['pois'].O[I].AsJSON;

              ADetailHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                              ASuperObject.O['result'].A['pois'].O[I].S['addr'],
                                              12,
                                              Self.lvPosition.Prop.ItemHeight/2
                                                  );

              ACaptionHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                             ASuperObject.O['result'].A['pois'].O[I].S['name'],
                                              14,
                                              Self.lvPosition.Prop.ItemHeight/2
                                                  );
              AListViewItem.Height:=ACaptionHeight+ADetailHeight;
            end;

          end;
         {$ENDIF}

      finally
        Self.lvPosition.Prop.Items.EndUpdate;
      end;
    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;

  finally
    HideWaitingFrame;
  end;
end;

procedure TFrameGetAddrList.edtSearchChangeTracking(Sender: TObject);
var
  AResponseStream:TStringStream;
  AHttpControl:THttpControl;
  AIsSuccProcess:Boolean;
  ASuperObject:ISuperObject;
  i: Integer;
  AListBoxItem:TSkinListBoxItem;

  //是否有空格
  FIsEnpty:Boolean;
  //是否调用
  FIsAoto:Boolean;
begin

  FIsAoto:=False;
  FIsEnpty:=False;
  {$IFDEF USE_GOOGLE_ROUTE_PLAN}
  for i := 0 to Length(Self.edtSearch.Text)-1 do
  begin

    if ((Self.edtSearch.Text.Chars[0]<>' ') and (Self.edtSearch.Text.Chars[0]<>','))
    and ((Self.edtSearch.Text.Chars[i]=' ') or (Self.edtSearch.Text.Chars[i]=',')) then
    begin
      FIsEnpty:=True;
    end;


    if FIsEnpty=True then
    begin
      if (Self.edtSearch.Text.Chars[i]<>' ') and (Self.edtSearch.Text.Chars[i]<>',') then
      begin
        FIsAoto:=True;
      end;
    end;
  end;
  {$ELSE}

  FIsAoto:=True;

  {$ENDIF}

  if Self.edtSearch.Text<>'' then
  begin

      if FIsAoto=True then
      begin
  //      ShowHintFrame(nil,'我调用了');
        uTimerTask.GetGlobalTimerThread.RunTempTask(
                      DoAutoCompleteExecute,
                      DoAutoCompleteExecuteEnd,
                      'AutoComplete');
      end;

  end
  else
  begin
      lvPosition.Prop.Items.BeginUpdate;
      try
        Self.lvPosition.Prop.Items.Clear(True);
      finally
        lvPosition.Prop.Items.EndUpdate;
      end;
  end;
end;


procedure TFrameGetAddrList.lvPositionClickItem(AItem: TSkinItem);
var
  ASuperObject:ISuperObject;
  AAddressComponentJson:ISuperArray;
  I:Integer;
begin

  FClickedListBoxItem:=AItem;

  FClickedListBoxItem.Selected:=False;

  if AItem.Caption='不显示位置' then
  begin
      FSelectedAddr:='';
      FSelectedAddrDetail:='';

      FSelectedLat:=0;
      FSelectedLng:=0;

      FClickedListBoxItem.Selected:=True;

      HideFrame;//();
      ReturnFrame();
  end
  else
  begin

      if AItem.Detail6<>'' then
      begin
        ASuperObject:=TSuperObject.Create(AItem.Detail6);

        FSelectedAddr:=AItem.Caption;
        FSelectedAddrDetail:=AItem.Detail;

        {$IFDEF USE_GOOGLE_ROUTE_PLAN}

        if ASuperObject.O['geometry'].Count>0 then
        begin
          FAutoAddr:=AItem.Detail;

          FSelectedLat:=GetJsonDoubleValue(ASuperObject.O['geometry'].O['location'],'lat');
          FSelectedLng:=GetJsonDoubleValue(ASuperObject.O['geometry'].O['location'],'lng');

          ShowWaitingFrame(Self,'获取中...');
          //获取经纬度
          uTimerTask.GetGlobalTimerThread.RunTempTask(
                   DoGetPositionLatLngExecute,
                   DoGetPositionLatLngExecuteEnd,
                   'GetPositionLatLng');
        end
        else
        begin
          FAutoAddr:=ASuperObject.S['place_id'];
          ShowWaitingFrame(Self,'获取中...');
          //获取经纬度
          uTimerTask.GetGlobalTimerThread.RunTempTask(
                   DoGetPositionDetailExecute,
                   DoGetPositionDetailExecuteEnd,
                   'GetPositionDetail');
        end;

        {$ELSE}
        //GCJ02格式
        FSelectedLat:=GetJsonDoubleValue(ASuperObject.O['location'],'lat');
        FSelectedLng:=GetJsonDoubleValue(ASuperObject.O['location'],'lng');

        Self.FProvince:=ASuperObject.S['province'];
        Self.FCity:=ASuperObject.S['city'];
        Self.FArea:=ASuperObject.S['district'];


        HideFrame;//();
        ReturnFrame();


        Self.edtSearch.Text:=AItem.Caption;

        {$ENDIF}
      end
      else
      begin
        HideFrame;//();
        ReturnFrame();
      end;


  end;

end;

procedure TFrameGetAddrList.lvPositionPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinFMXItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
begin
  if AItem.Detail<>'' then
  begin
    Self.lblPositionName.Height:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                             AItem.Caption,
                                              14,
                                              Self.lvPosition.Prop.ItemHeight/2
                                                  );

    Self.lblPositionDetil.Height:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                             AItem.Detail,
                                              12,
                                              Self.lvPosition.Prop.ItemHeight/2
                                                  );
  end;
end;

procedure TFrameGetAddrList.lvPositionPullUpLoadMore(Sender: TObject);
begin
  if FIsAutoComplete=False then
  begin
    //加载更多地址
    uTimerTask.GetGlobalTimerThread.RunTempTask(
      DoGetSelectedAddrMoreExecute,
      DoGetSelectedAddrMoreExecuteEnd,
      'SelectedAddrAdd'
      );
  end;
end;

procedure TFrameGetAddrList.OnReturnFrameFromSelectArea(Frame: TFrame);
var
  country,province,city,area,addr:String;
begin
  country:='';
  province:='';
  city:='';
  area:='';
  //选择省市返回
  if GlobalSelectAreaFrame.lbProvience.Prop.SelectedItem<>nil then
  begin
    province:=GlobalSelectAreaFrame.lbProvience.Prop.SelectedItem.Caption;
  end;
  if GlobalSelectAreaFrame.lbCity.Prop.SelectedItem<>nil then
  begin
    city:=GlobalSelectAreaFrame.lbCity.Prop.SelectedItem.Caption;
  end;
  if GlobalSelectAreaFrame.lbCounty.Prop.SelectedItem<>nil then
  begin
    area:=GlobalSelectAreaFrame.lbCounty.Prop.SelectedItem.Caption;
  end;



  FAutoCompleteSearchCity:=city;
  Self.btnSelectProvince.Caption:=FAutoCompleteSearchCity;

end;

procedure TFrameGetAddrList.Syc;
begin
  Self.edtSearch.Visible:=False;
  Self.btnSearch.Visible:=False;

  lvPosition.Prop.Items.BeginUpdate;
  try
    Self.lvPosition.Prop.Items.Clear(True);
  finally
    lvPosition.Prop.Items.EndUpdate;
  end;

  ShowWaitingFrame(Self,'正在获取位置...');

  uTimerTask.GetGlobalTimerThread.RunTempTask(
      DoSelectedAddrExecute,
      DoSelectedAddrExecuteEnd,
      'SelectedAddr',
      True
      );
end;

procedure TFrameGetAddrList.Load(ALastSelectedAddr:String;
                                 ALastSelectedAddrDetail:String;
                                 AProvince:String;
                                 ACity:String;
                                 AArea:String;
                                 APostCode:String;
                                 ALat:Double;
                                 ALng:Double;
                                 IsShowOKButton:Boolean;
                                 AIsShowNoPosition:Boolean;
                                 AIsAutoComplete:Boolean);
var
  AListViewItem:TSkinListViewItem;
  ACaptionHeight:Double;
  ADetailHeight:Double;
begin

  Clear;

  FIsAutoComplete:=AIsAutoComplete;

  Self.pnlToolBar.Visible:=True;

  Self.btnSearch.Visible:=IsShowOKButton;

  Self.chkColor5.Visible:=True;
  Self.chkColor6.Visible:=True;

  ACaptionHeight:=0;
  ADetailHeight:=0;




  Self.lvPosition.Prop.EnableAutoPullUpLoadMorePanel:=Not AIsAutoComplete;
  //自动搜索所属的城市
  FAutoCompleteSearchCity:=ACity;
  Self.btnSelectProvince.Caption:=FAutoCompleteSearchCity;
  Self.pnlProvince.Visible:=AIsAutoComplete;





  FSelectedAddr:=ALastSelectedAddr;
  FSelectedAddrDetail:=ALastSelectedAddrDetail;

  Self.FProvince:=AProvince;
  Self.FCity:=ACity;
  Self.FArea:=AArea;
  Self.FPostCode:=APostCode;


  FSelectedLat:=ALat;
  FSelectedLng:=ALng;

  FInitLat:=ALat;
  FInitLng:=ALng;


  if AIsShowNoPosition=True then
  begin
      Self.lvPosition.Prop.Items.ClearItemsByTypeNot(sitItem1);
  end
  else
  begin
      lvPosition.Prop.Items.BeginUpdate;
      try
        Self.lvPosition.Prop.Items.Clear(True);
      finally
        lvPosition.Prop.Items.EndUpdate;
      end;
  end;

  if AIsAutoComplete=False then
  begin

    Self.edtSearch.Visible:=False;
    Self.btnSearch.Visible:=False;


    if FSelectedAddr<>'' then
    begin
      AListViewItem:=Self.lvPosition.Prop.Items.Add;
      AListViewItem.Caption:=FSelectedAddr;
      AListViewItem.Detail:=FSelectedAddrDetail;
      Self.lvPosition.Prop.Items.FindItemByCaption(FSelectedAddr).Selected:=True;


      ADetailHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                      FSelectedAddrDetail,
                                      12,
                                      Self.lvPosition.Prop.ItemHeight/2
                                          );

      ACaptionHeight:=GetSuitContentHeight(Self.lblPositionDetil.Width,
                                      FSelectedAddr,
                                      14,
                                      Self.lvPosition.Prop.ItemHeight/2
                                          );
      AListViewItem.Height:=ADetailHeight+ACaptionHeight+10;

    end;


    ShowWaitingFrame(Self,'正在获取位置...');

    uTimerTask.GetGlobalTimerThread.RunTempTask(
        DoSelectedAddrExecute,
        DoSelectedAddrExecuteEnd,
        'SelectedAddr'
        );
  end
  else
  begin
    Self.edtSearch.Visible:=True;
    Self.btnSearch.Visible:=True;
    Self.edtSearch.Text:=ALastSelectedAddr;
  end;

end;

end.

