object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 
    'OCHeader2Pas V1.0(Author:DelphiTeacher,QQ:452330643,Email:ggggce' +
    'xx@163.com)'
  ClientHeight = 644
  ClientWidth = 964
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object memOCCodeLines: TMemo
    Left = 0
    Top = 308
    Width = 473
    Height = 336
    Align = alLeft
    Lines.Strings = (
      '/*'
      ' *  BMKRouteSearchType.h'
      ' *'#9'BMapKit'
      ' *'
      ' *  Copyright 2011 Baidu Inc. All rights reserved.'
      ' *'
      ' */'
      ''
      '#import <CoreLocation/CoreLocation.h>'
      '#import <Foundation/Foundation.h>'
      '#import "BMKPoiSearchType.h"'
      '#import "BMKTypes.h"'
      '///'#36335#27573#31867#22411#26522#20030
      'typedef enum'
      '{'
      '    BMK_BUSLINE                 = 0,///'#20844#20132
      #9'BMK_SUBWAY                  = 1,///'#22320#38081
      ' '#9'BMK_WAKLING                 = 2,///'#27493#34892
      '}BMKTransitStepType;'
      ''
      'typedef enum'
      '{'
      #9'BMK_TRANSIT_TIME_FIRST = 3,'#9#9'//'#36739#24555#25463'('#20844#20132')'
      #9'BMK_TRANSIT_TRANSFER_FIRST = 4,'#9'//'#23569#25442#20056'('#20844#20132')'
      #9'BMK_TRANSIT_WALK_FIRST = 5,'#9#9'//'#23569#27493#34892'('#20844#20132')'
      #9'BMK_TRANSIT_NO_SUBWAY = 6,'#9#9'//'#19981#22352#22320#38081
      '}BMKTransitPolicy;'
      ''
      'typedef enum'
      '{'
      '    BMK_DRIVING_BLK_FIRST = -1, //'#36530#36991#25317#22581'('#33258#39550')'
      #9'BMK_DRIVING_TIME_FIRST = 0,'#9'//'#26368#30701#26102#38388'('#33258#39550')'
      #9'BMK_DRIVING_DIS_FIRST = 1,'#9'//'#26368#30701#36335#31243'('#33258#39550')'
      #9'BMK_DRIVING_FEE_FIRST,'#9#9'//'#23569#36208#39640#36895'('#33258#39550')'
      ''
      '}BMKDrivingPolicy;'
      ''
      'typedef enum'
      '{'
      
        '    BMK_DRIVING_REQUEST_TRAFFICE_TYPE_NONE = 0,                 ' +
        '//'#19981#24102#36335#20917
      
        '    BMK_DRIVING_REQUEST_TRAFFICE_TYPE_PATH_AND_TRAFFICE = 1,    ' +
        '//'#36947#36335#21644#36335#20917
      '}BMKDrivingRequestTrafficType;'
      ''
      '///'#25171#36710#20449#24687#31867
      '@interface BMKTaxiInfo : NSObject{'
      '    NSString* _desc;'
      '    int       _distance;'
      '    int       _duration;'
      '    float     _perKMPrice;'
      '    int       _totalPrice;'
      '}'
      '///'#36335#32447#25171#36710#25551#36848#20449#24687
      '@property (nonatomic, strong) NSString* desc;'
      '///'#24635#36335#31243#65292#21333#20301#65306' '#31859
      '@property (nonatomic) int distance;'
      '///'#24635#32791#26102#65292#21333#20301#65306' '#31186
      '@property (nonatomic) int duration;'
      '///'#27599#21315#31859#21333#20215#65292#21333#20301' '#20803
      '@property (nonatomic) float perKMPrice;'
      '///'#24635#20215' , '#21333#20301#65306' '#20803
      '@property (nonatomic) int totalPrice;'
      ''
      '@end'
      ''
      '///'#36335#32447#25442#20056#26041#26696#37324#30340#20132#36890#24037#20855#20449#24687#31867
      '@interface BMKVehicleInfo : NSObject{'
      '    NSString* _uid;'
      '    NSString* _title;'
      '    int       _passStationNum;'
      '    int       _totalPrice;'
      '    int       _zonePrice;'
      '}'
      '///'#35813#20132#36890#36335#32447#30340#26631#35782
      '@property (nonatomic, strong) NSString* uid;'
      '///'#35813#20132#36890#36335#32447#30340#21517#31216
      '@property (nonatomic, strong) NSString* title;'
      '///'#35813#20132#36890#36335#32447#30340#25152#20056#31449#25968
      '@property (nonatomic) int passStationNum;'
      '///'#35813#20132#36890#36335#32447#30340#20840#31243#20215#26684
      '@property (nonatomic) int totalPrice;'
      '///'#35813#20132#36890#36335#32447#30340#25152#20056#21306#38388#30340#21306#38388#20215#26684
      '@property (nonatomic) int zonePrice;'
      '@end'
      ''
      '///'#27492#31867#20195#34920#19968#20010#26102#38388#27573#65292#27599#20010#23646#24615#37117#26159#19968#20010#26102#38388#27573#12290
      '@interface BMKTime : NSObject{'
      '    int       _dates;'
      '    int       _hours;'
      '    int       _minutes;'
      '    int       _seconds;'
      '    '
      '}'
      ''
      '///'#26102#38388#27573#65292#21333#20301#65288#22825#65289
      '@property (nonatomic) int dates;'
      '///'#26102#38388#27573#65292#21333#20301#65288#23567#26102#65289
      '@property (nonatomic) int hours;'
      '///'#26102#38388#27573#65292#21333#20301#65288#20998#65289
      '@property (nonatomic) int minutes;'
      '///'#26102#38388#27573#65292#21333#20301#65288#31186#65289
      '@property (nonatomic) int seconds;'
      '@end'
      ''
      '///'#27492#31867#34920#31034#36335#32447#20013#30340#19968#33410#28857#65292#33410#28857#21253#25324#65306#36335#32447#36215#32456#28857#65292#20844#20132#31449#28857#31561
      '@interface BMKRouteNode : NSObject{'
      '    NSString*              _uid;'
      '    NSString*              _title;'
      '    CLLocationCoordinate2D _location;'
      '}'
      '///'#35813#33410#28857'uid'
      '@property (nonatomic, strong) NSString* uid;'
      '///'#35813#33410#28857#30340#21517#31216
      '@property (nonatomic, strong) NSString* title;'
      '///'#35813#33410#28857#30340#22352#26631
      '@property (nonatomic) CLLocationCoordinate2D location;'
      '@end'
      '///'#27492#31867#34920#31034#20844#20132#31449#28857#20449#24687
      '@interface BMKBusStation : BMKRouteNode'
      '@end'
      ''
      ''
      '///'#27492#31867#34920#31034#36335#32447#20013#30340#19968#20010#36335#27573#65288#22522#31867#65289
      '@interface BMKRouteStep : NSObject{'
      '    int          _distance;'
      '    int          _duration;'
      '    BMKMapPoint* _points;'
      '    int          _pointsCount;'
      '}'
      '///'#36335#27573#38271#24230' '#21333#20301#65306' '#31859
      '@property (nonatomic) int distance;'
      '///'#36335#27573#32791#26102' '#21333#20301#65306' '#31186
      '@property (nonatomic) int duration;'
      '///'#36335#27573#25152#32463#36807#30340#22320#29702#22352#26631#38598#21512
      '@property (nonatomic) BMKMapPoint* points;'
      '///'#36335#27573#25152#32463#36807#30340#22320#29702#22352#26631#38598#21512#20869#28857#30340#20010#25968
      '@property (nonatomic) int pointsCount;'
      ''
      '@end'
      '///'#27492#31867#34920#31034#20844#20132#32447#36335#20013#30340#19968#20010#36335#27573
      '@interface BMKBusStep : BMKRouteStep'
      '@end'
      '///'#27492#31867#34920#31034#20844#20132#25442#20056#36335#32447#20013#30340#19968#20010#36335#27573
      '@interface BMKTransitStep : BMKRouteStep{'
      '    BMKRouteNode*        _entrace;'
      '    BMKRouteNode*        _exit;'
      '    NSString*            _instruction;'
      '    BMKTransitStepType   _stepType;'
      '    BMKVehicleInfo*      _vehicleInfo;'
      '}'
      '///'#36335#27573#20837#21475#20449#24687
      '@property (nonatomic, strong) BMKRouteNode* entrace;'
      '///'#36335#27573#20986#21475#20449#24687
      '@property (nonatomic, strong) BMKRouteNode* exit;'
      '///'#36335#27573#25442#20056#35828#26126
      '@property (nonatomic, strong) NSString* instruction;'
      '///'#36335#27573#31867#22411
      '@property (nonatomic) BMKTransitStepType stepType;'
      '///'#24403#36335#27573#20026#20844#20132#36335#27573#25110#22320#38081#36335#27573#26102#65292#21487#20197#33719#21462#20132#36890#24037#20855#20449#24687
      '@property (nonatomic, strong) BMKVehicleInfo* vehicleInfo;'
      '@end'
      '///'#27492#31867#34920#31034#39550#36710#36335#32447#20013#30340#19968#20010#36335#27573
      '@interface BMKDrivingStep : BMKRouteStep{'
      '    int                  _direction;'
      '    BMKRouteNode*        _entrace;'
      '    NSString*            _entraceInstruction;'
      '    BMKRouteNode*        _exit;'
      '    NSString*            _exitInstruction;'
      '    NSString*            _instruction;'
      '    int                  _numTurns;'
      '}'
      '///'#35813#36335#27573#36215#28857#26041#21521#20540
      '@property (nonatomic) int direction;'
      '///'#36335#27573#20837#21475#20449#24687
      '@property (nonatomic, strong) BMKRouteNode* entrace;'
      '///'#36335#27573#20837#21475#30340#25351#31034#20449#24687
      '@property (nonatomic, strong) NSString* entraceInstruction;'
      '///'#36335#27573#20986#21475#20449#24687
      '@property (nonatomic, strong) BMKRouteNode* exit;'
      '///'#36335#27573#20986#21475#25351#31034#20449#24687
      '@property (nonatomic, strong) NSString* exitInstruction;'
      '///'#36335#27573#24635#20307#25351#31034#20449#24687
      '@property (nonatomic, strong) NSString* instruction;'
      '///'#36335#27573#38656#35201#36716#24367#25968
      '@property (nonatomic) int numTurns;'
      '///'#36335#27573#26159#21542#26377#36335#20917#20449#24687
      '@property (nonatomic) BOOL hasTrafficsInfo;'
      '///'#36335#27573#30340#36335#20917#20449#24687#65292#25104#21592#20026'NSNumber'#12290'0'#65306#26080#25968#25454#65307'1'#65306#30021#36890#65307'2'#65306#32531#24930#65307'3'#65306#25317#22581
      '@property (nonatomic, strong) NSArray* traffics;'
      ''
      '@end'
      '///'#27492#31867#34920#31034#27493#34892#36335#32447#20013#30340#19968#20010#36335#27573
      '@interface BMKWalkingStep : BMKRouteStep{'
      '    int                  _direction;'
      '    BMKRouteNode*        _entrace;'
      '    NSString*            _entraceInstruction;'
      '    BMKRouteNode*        _exit;'
      '    NSString*            _exitInstruction;'
      '    NSString*            _instruction;'
      '}'
      '///'#35813#36335#27573#36215#28857#26041#21521#20540
      '@property (nonatomic) int direction;'
      '///'#36335#27573#20837#21475#20449#24687
      '@property (nonatomic, strong) BMKRouteNode* entrace;'
      '///'#33719#21462#35813#36335#27573#25442#20056#35828#26126
      '@property (nonatomic, strong) NSString* entraceInstruction;'
      '///'#36335#27573#20986#21475#20449#24687
      '@property (nonatomic, strong) BMKRouteNode* exit;'
      '///'#33719#21462#35813#36335#27573#25442#20056#35828#26126
      '@property (nonatomic, strong) NSString* exitInstruction;'
      '///'#33719#21462#35813#36335#27573#25442#20056#35828#26126
      '@property (nonatomic, strong) NSString* instruction;'
      '@end'
      ''
      ''
      '///'#27492#31867#34920#31034#36335#32447#25968#25454#32467#26500#30340#22522#31867','#34920#31034#19968#26465#36335#32447#65292#36335#32447#21487#33021#21253#25324#65306#36335#32447#35268#21010#20013#30340#25442#20056'/'#39550#36710'/'#27493#34892#36335#32447
      '///'#27492#31867#20026#36335#32447#25968#25454#32467#26500#30340#22522#31867#65292#19968#33324#20851#27880#20854#23376#31867#23545#35937#21363#21487#65292#26080#38656#30452#25509#29983#25104#35813#31867#23545#35937
      '@interface BMKRouteLine : NSObject{'
      '    int                  _distance;'
      '    BMKTime*             _duration;'
      '    BMKRouteNode*        _starting;'
      '    BMKRouteNode*        _terminal;'
      '    NSString*            _title;'
      '    NSArray*             _steps;'
      '}'
      '///'#36335#32447#38271#24230' '#21333#20301#65306' '#31859
      '@property (nonatomic) int distance;'
      '///'#36335#32447#32791#26102' '#21333#20301#65306' '#31186
      '@property (nonatomic, strong) BMKTime* duration;'
      '///'#36335#32447#36215#28857#20449#24687
      '@property (nonatomic, strong) BMKRouteNode* starting;'
      '///'#36335#32447#32456#28857#20449#24687
      '@property (nonatomic, strong) BMKRouteNode* terminal;'
      '///'#36335#32447#21517#31216'('#39044#30041#23383#27573#65292#29616#20026#31354')'
      '@property (nonatomic, strong) NSString* title;'
      '///'#36335#32447#20013#30340#25152#26377#36335#27573#65292#25104#21592#31867#22411#20026'BMKWalkingStep'#65292'BMKDrivingStep'#65292'BMKTransitStep'
      '@property (nonatomic, strong) NSArray* steps;'
      '@end'
      '///'#27492#31867#34920#31034#19968#20010#25442#20056#36335#32447#65292#25442#20056#36335#32447#23558#26681#25454#26082#23450#31574#30053#35843#37197#22810#31181#20132#36890#24037#20855
      '@interface BMKTransitRouteLine : BMKRouteLine'
      '@end'
      '///'#27492#31867#34920#31034#19968#26465#39550#36710#36335#32447
      '@interface BMKDrivingRouteLine : BMKRouteLine{'
      '    bool                 _isSupportTraffic;//'#20174'2.7.0'#24320#22987#65292#24223#24323
      '    NSArray*             _wayPoints;'
      '}'
      '///'#35813#36335#32447#25152#22312#21306#22495#26159#21542#21547#26377#20132#36890#27969#37327#20449#24687#65292#20174'2.7.0'#24320#22987#65292#24223#24323
      '@property (nonatomic) bool isSupportTraffic;'
      '///'#36335#32447#36884#32463#28857#21015#34920#65292#25104#21592#31867#22411#20026'BMKPlanNode'
      '@property (nonatomic, strong) NSArray* wayPoints;'
      '@end'
      '///'#27492#31867#34920#31034#19968#26465#27493#34892#36335#32447
      '@interface BMKWalkingRouteLine : BMKRouteLine'
      '@end'
      ''
      
        '///'#36335#32447#25628#32034#22320#22336#32467#26524#31867'.'#24403#36755#20837#30340#36215#28857#25110#32456#28857#26377#22810#20010#22320#28857#36873#25321#26102#65292#25110#32773#36873#23450#30340#22478#24066#27809#26377#27492#22320#28857#65292#20294#20854#23427#22478#24066#26377'('#39550#20056#25110#27493#34892')'#65292#36820#22238#35813#31867#30340#23454 +
        #20363
      '@interface BMKSuggestAddrInfo : NSObject'
      '{'
      #9'NSArray* _startPoiList;'
      #9'NSArray* _endPoiList;'
      #9'NSArray* _startCityList;'
      #9'NSArray* _endCityList;'
      '    NSArray* _wayPointsPoiList;'
      '    NSArray* _wayPointsCityList;'
      '}'
      '///'#36215#28857'POI'#21015#34920#65292#25104#21592#31867#22411#20026'BMKPoiInfo'
      '@property (nonatomic, strong) NSArray* startPoiList;'
      '///'#36215#28857#22478#24066#21015#34920#65292#25104#21592#31867#22411#20026'BMKCityListInfo,'#22914#26524#36755#20837#30340#22320#28857#22312#26412#22478#24066#27809#26377#32780#22312#20854#23427#22478#24066#26377#65292#21017#36820#22238#20854#23427#22478#24066#30340#20449#24687
      '@property (nonatomic, strong) NSArray* startCityList;'
      '///'#32456#28857'POI'#21015#34920#65292#25104#21592#31867#22411#20026'BMKPoiInfo'
      '@property (nonatomic, strong) NSArray* endPoiList;'
      '///'#32456#28857#22478#24066#21015#34920#65292#25104#21592#31867#22411#20026'BMKCityListInfo,'#22914#26524#36755#20837#30340#22320#28857#22312#26412#22478#24066#27809#26377#32780#22312#20854#23427#22478#24066#26377#65292#21017#36820#22238#20854#23427#22478#24066#30340#20449#24687
      '@property (nonatomic, strong) NSArray* endCityList;'
      '///'#36884#32463#28857'POI'#21015#34920#65292#25104#21592#31867#22411#20026'NSArray<BMKPoiInfo*>'
      '@property (nonatomic, strong) NSArray* wayPointPoiList;'
      
        '///'#36884#32463#28857#22478#24066#21015#34920#65292#25104#21592#31867#22411#20026'NSArray<BMKCityListInfo*>,'#22914#26524#36755#20837#30340#22320#28857#22312#26412#22478#24066#27809#26377#32780#22312#20854#23427#22478#24066#26377#65292#21017 +
        #36820#22238#20854#23427#22478#24066#30340#20449#24687
      '@property (nonatomic, strong) NSArray* wayPointCityList;'
      '@end'
      ''
      '///'#27492#31867#34920#31034#20844#20849#20132#36890#20449#24687#26597#35810#32467#26524
      '@interface BMKBusLineResult : NSObject{'
      '    NSString* _busCompany;'
      '    NSString* _busLineName;'
      '    NSString* _uid;'
      '    NSString* _startTime;'
      '    NSString* _endTime;'
      '    int       _isMonTicket;'
      '    NSArray*  _busStations;'
      '    NSArray*  _busSteps;'
      '}'
      '///'#20844#20132#20844#21496#21517#31216
      '@property (nonatomic, strong) NSString* busCompany;'
      '///'#20844#20132#32447#36335#21517#31216
      '@property (nonatomic, strong) NSString* busLineName;'
      '///'#20844#20132#32447#36335'uid'
      '@property (nonatomic, strong) NSString* uid;'
      '///'#20844#20132#36335#32447#39318#29677#36710#26102#38388
      '@property (nonatomic, strong) NSString* startTime;'
      '///'#20844#20132#36335#32447#26411#29677#36710#26102#38388
      '@property (nonatomic, strong) NSString* endTime;'
      '///'#20844#20132#26159#32447#26159#21542#26377#26376#31080
      '@property (nonatomic) int isMonTicket;'
      '///'#25152#26377#20844#20132#31449#28857#20449#24687','#25104#21592#31867#22411#20026'BMKBusStation'
      '@property (nonatomic, strong) NSArray* busStations;'
      '///'#20844#20132#36335#32447#20998#27573#20449#24687#65292#25104#21592#31867#22411#20026'BMKBusStep'
      '@property (nonatomic, strong) NSArray* busSteps;'
      '@end'
      ''
      '///'#27492#31867#34920#31034#27493#34892#36335#32447#32467#26524
      '@interface BMKWalkingRouteResult : NSObject{'
      '    BMKTaxiInfo*        _taxiInfo;'
      '    BMKSuggestAddrInfo* _suggestAddrResult;'
      '    NSArray*            _routes;'
      '}'
      '///'#35813#36335#32447#25171#36710#20449#24687
      '@property (nonatomic, strong) BMKTaxiInfo* taxiInfo;'
      '///'#36820#22238#36215#28857#25110#32456#28857#30340#22320#22336#20449#24687#32467#26524
      
        '@property (nonatomic, strong) BMKSuggestAddrInfo* suggestAddrRes' +
        'ult;'
      '///'#27493#34892#32467#26524','#29616#22312#21482#36820#22238#19968#26465#12290#25104#21592#31867#22411#20026'BMKWalkingRouteLine'
      '@property (nonatomic, strong) NSArray* routes;'
      '@end'
      '///'#27492#31867#34920#31034#39550#36710#36335#32447#32467#26524
      '@interface BMKDrivingRouteResult : NSObject{'
      '    BMKTaxiInfo*        _taxiInfo;'
      '    BMKSuggestAddrInfo* _suggestAddrResult;'
      '    NSArray*            _routes;'
      '}'
      '///'#35813#36335#32447#25171#36710#20449#24687
      '@property (nonatomic, strong) BMKTaxiInfo* taxiInfo;'
      '///'#36820#22238#36215#28857#25110#32456#28857#30340#22320#22336#20449#24687#32467#26524
      
        '@property (nonatomic, strong) BMKSuggestAddrInfo* suggestAddrRes' +
        'ult;'
      '///'#39550#36710#32467#26524','#25903#25345#22810#36335#32447#12290#25104#21592#31867#22411#20026'BMKDrivingRouteLine'
      '@property (nonatomic, strong) NSArray* routes;'
      '@end'
      ''
      '@interface BMKTransitRouteResult : NSObject{'
      '    BMKTaxiInfo*        _taxiInfo;'
      '    BMKSuggestAddrInfo* _suggestAddrResult;'
      '    NSArray*            _routes;'
      '}'
      '///'#35813#36335#32447#25171#36710#20449#24687
      '@property (nonatomic, strong) BMKTaxiInfo* taxiInfo;'
      '///'#36820#22238#36215#28857#25110#32456#28857#30340#22320#22336#20449#24687#32467#26524
      
        '@property (nonatomic, strong) BMKSuggestAddrInfo* suggestAddrRes' +
        'ult;'
      '///'#26041#26696#25968#32452','#25104#21592#31867#22411#20026'BMKTransitRouteLine'
      '@property (nonatomic, strong) NSArray* routes;'
      ''
      '@end'
      ''
      ''
      '')
    ScrollBars = ssBoth
    TabOrder = 0
    OnDblClick = memOCCodeLinesDblClick
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 41
    Width = 964
    Height = 73
    Align = alTop
    TabOrder = 1
    object btnConvertOCHeaderFile: TButton
      Left = 8
      Top = 9
      Width = 121
      Height = 56
      Caption = 'Convert Simple'
      TabOrder = 0
      OnClick = btnConvertOCHeaderFileClick
    end
    object btnConvertOCProcedure: TButton
      Left = 738
      Top = 9
      Width = 180
      Height = 25
      Caption = 'Convert OC Method'
      TabOrder = 1
      OnClick = btnConvertOCProcedureClick
    end
    object btnConvertOCProtocol: TButton
      Left = 341
      Top = 9
      Width = 180
      Height = 25
      Caption = 'Convert OC Protocol'
      TabOrder = 2
      OnClick = btnConvertOCProtocolClick
    end
    object btnConvertOCProperty: TButton
      Left = 539
      Top = 9
      Width = 180
      Height = 25
      Caption = 'Convert OC Property'
      TabOrder = 3
      OnClick = btnConvertOCPropertyClick
    end
    object btnConvertClass: TButton
      Left = 143
      Top = 9
      Width = 180
      Height = 25
      Caption = 'Convert OC Interface'
      TabOrder = 4
      OnClick = btnConvertClassClick
    end
    object btnConvertEnum: TButton
      Left = 143
      Top = 40
      Width = 180
      Height = 25
      Caption = 'Convert C Enum'
      TabOrder = 5
      OnClick = btnConvertEnumClick
    end
    object btnConvertAnsiCProcedure: TButton
      Left = 739
      Top = 40
      Width = 180
      Height = 25
      Caption = 'Convert C Method'
      TabOrder = 6
      OnClick = btnConvertAnsiCProcedureClick
    end
    object btnConvertTypedef: TButton
      Left = 540
      Top = 40
      Width = 180
      Height = 25
      Caption = 'Convert C Typedef DataType'
      TabOrder = 7
      OnClick = btnConvertTypedefClick
    end
    object btnConvertStruct: TButton
      Left = 341
      Top = 40
      Width = 180
      Height = 25
      Caption = 'Convert C Struct'
      TabOrder = 8
      OnClick = btnConvertStructClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 114
    Width = 964
    Height = 153
    Align = alTop
    TabOrder = 2
    DesignSize = (
      964
      153)
    object lblStaticLibPath: TLabel
      Left = 12
      Top = 82
      Width = 132
      Height = 13
      Caption = 'StaticLib Path(Like '#39'****.a'#39')'
    end
    object Label3: TLabel
      Left = 381
      Top = 50
      Width = 91
      Height = 13
      Caption = 'Prefix(Like iOSapi.)'
    end
    object Label1: TLabel
      Left = 12
      Top = 52
      Width = 178
      Height = 13
      Caption = 'Unit Name(Unit ***;UnitName is ***)'
    end
    object Label2: TLabel
      Left = 565
      Top = 51
      Width = 94
      Height = 13
      Caption = 'Suffix(Like _iOSApi)'
    end
    object Label4: TLabel
      Left = 738
      Top = 52
      Width = 99
      Height = 13
      Caption = 'Current UnitName is '
    end
    object lblUnitName: TLabel
      Left = 843
      Top = 52
      Width = 56
      Height = 13
      Caption = 'lblUnitName'
    end
    object Label5: TLabel
      Left = 13
      Top = 11
      Width = 41
      Height = 13
      Caption = 'File path'
    end
    object edtStaticLibPath: TEdit
      Left = 212
      Top = 79
      Width = 218
      Height = 21
      TabOrder = 0
      Text = '{$I FrameworkDylibPath_Unknow.inc}'
    end
    object edtUnitNamePrefix: TEdit
      Left = 489
      Top = 47
      Width = 56
      Height = 21
      TabOrder = 1
      Text = 'iOSApi.'
      OnChange = edtUnitNameChange
    end
    object edtUnitName: TEdit
      Left = 212
      Top = 47
      Width = 149
      Height = 21
      TabOrder = 2
      OnChange = edtUnitNameChange
    end
    object edtUnitNameSuffix: TEdit
      Left = 677
      Top = 47
      Width = 48
      Height = 21
      TabOrder = 3
      OnChange = edtUnitNameChange
    end
    object btnSaveToFile: TButton
      Left = 381
      Top = 106
      Width = 150
      Height = 33
      Caption = 'Convert To Unit File'
      TabOrder = 4
      OnClick = btnSaveToFileClick
    end
    object chkIsAutoNameLibInc: TCheckBox
      Left = 444
      Top = 81
      Width = 170
      Height = 17
      Caption = 'Auto generate libpath inc file'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object edtStaticLibPathIncContent: TEdit
      Left = 738
      Top = 79
      Width = 180
      Height = 21
      TabOrder = 6
    end
    object edtStaticLibFileName: TEdit
      Left = 611
      Top = 79
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object memNeedConvertFilePath: TListBox
      Left = 69
      Top = 4
      Width = 716
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 8
      OnDblClick = memNeedConvertFilePathDblClick
    end
    object Button2: TButton
      Left = 791
      Top = 6
      Width = 150
      Height = 33
      Anchors = [akTop, akRight]
      Caption = 'Load From File'
      TabOrder = 9
      OnClick = Button2Click
    end
    object btnClear: TButton
      Left = 13
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 10
      OnClick = btnClearClick
    end
  end
  object memODCodeLines: TMemo
    Left = 473
    Top = 308
    Width = 491
    Height = 336
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 3
    OnDblClick = memODCodeLinesDblClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 41
    Align = alTop
    Caption = 'Sub-Module Test'
    TabOrder = 4
  end
  object Panel3: TPanel
    Left = 0
    Top = 267
    Width = 964
    Height = 41
    Align = alTop
    Caption = 'Convert Whole'
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Filter = 'C Header File|*.h'
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 168
    Top = 80
  end
end
