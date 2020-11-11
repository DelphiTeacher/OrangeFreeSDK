unit Unit5;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  iOSApi.CTCellularData,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm5 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
  	procedure DoCellularDataRestrictionDidUpdateNotifierEvent(state:CTCellularDataRestrictedState);
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.Button1Click(Sender: TObject);
var
  cellularData:CTCellularData;
begin
  //
//#pragma mark -- 检测app是否授权网络状态
//
//- (void)networkState{
//
//    CTCellularData *cellularData = [[CTCellularData alloc]init];
  cellularData:=TCTCellularData.Create;
  cellularData.setCellularDataRestrictionDidUpdateNotifier(DoCellularDataRestrictionDidUpdateNotifierEvent);
//  case CTCellularDataRestrictedState_(cellularData.restrictedState) of
//    kCTCellularDataRestrictedStateUnknown: 
//    begin
//      FMX.Types.Log.d('OrangeUI TForm5.DoCellularDataRestrictionDidUpdateNotifierEvent Unknown');
//      
//    end;
//    kCTCellularDataRestricted: 
//    begin
//      FMX.Types.Log.d('OrangeUI TForm5.DoCellularDataRestrictionDidUpdateNotifierEvent Restricted');
//
//    end;
//    kCTCellularDataNotRestricted: 
//    begin
//      FMX.Types.Log.d('OrangeUI TForm5.DoCellularDataRestrictionDidUpdateNotifierEvent Not Restricted');
//    end;
//  end;
  
//    cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state){
//
//        BOOL_isRestricted =YES;
//
//        //获取联网状态
//
//        switch(state) {
//
//            case kCTCellularDataRestricted:
//
//                NSLog(@"Restricted");//拒绝
//
//                break;
//
//            case kCTCellularDataNotRestricted:
//
//                _isRestricted =NO;
//
//                NSLog(@"Not Restricted");//允许
//
//                break;
//
//            case kCTCellularDataRestrictedStateUnknown:
//
//                NSLog(@"Unknown");//未知
//
//                break;
//
//            default:
//
//                break;
//
//        };
//
//        if(_isRestricted ==YES) {
//
//            self.netState=@"需开启";
//
//        }else{
//
//            self.netState=@"无需开启";
//
//        }
//
//    };
//
//}

end;

procedure TForm5.DoCellularDataRestrictionDidUpdateNotifierEvent(
  state: CTCellularDataRestrictedState);
begin

  FMX.Types.Log.d('OrangeUI TForm5.DoCellularDataRestrictionDidUpdateNotifierEvent');
  
  case CTCellularDataRestrictedState_(state) of
    kCTCellularDataRestrictedStateUnknown: 
    begin
      FMX.Types.Log.d('OrangeUI TForm5.DoCellularDataRestrictionDidUpdateNotifierEvent Unknown');
      
    end;
    kCTCellularDataRestricted: 
    begin
      FMX.Types.Log.d('OrangeUI TForm5.DoCellularDataRestrictionDidUpdateNotifierEvent Restricted');

    end;
    kCTCellularDataNotRestricted: 
    begin
      FMX.Types.Log.d('OrangeUI TForm5.DoCellularDataRestrictionDidUpdateNotifierEvent Not Restricted');
    end;
  end;

//        BOOL_isRestricted =YES;
//
//        //获取联网状态
//
//        switch(state) {
//
//            case kCTCellularDataRestricted:
//
//                NSLog(@"Restricted");//拒绝
//
//                break;
//
//            case kCTCellularDataNotRestricted:
//
//                _isRestricted =NO;
//
//                NSLog(@"Not Restricted");//允许
//
//                break;
//
//            case kCTCellularDataRestrictedStateUnknown:
//
//                NSLog(@"Unknown");//未知
//
//                break;
//
//            default:
//
//                break;
//
//        };
//
//        if(_isRestricted ==YES) {
//
//            self.netState=@"需开启";
//
//        }else{
//
//            self.netState=@"无需开启";
//
//        }
//
//    };

end;

end.
