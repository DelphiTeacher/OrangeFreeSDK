unit UpdateTextFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation,

  uUIFunction,

  uSkinMaterial,
//  uMapCommon,
//  uGPSUtils,
//
//  uOpenCommon,
//  uOpenClientCommon,
//  uOpenCommon,

//  uManager,
  uTimerTask,

  DateUtils,

  uBaseHttpControl,
  uFrameContext,
//  uRestInterfaceCall,

//  XSuperObject,
//  XSuperJson,

//  uGPSLocation,

//  uPayPublic,

  MessageBoxFrame,
  WaitingFrame,

//  CommonImageDataMoudle,
//  EasyServiceCommonMaterialDataMoudle,



  uSkinFireMonkeyEdit, uSkinButtonType,
  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinPanelType,
  uSkinFireMonkeyPanel, uSkinLabelType, uSkinFireMonkeyLabel;

type
  TFrameUpdateText = class(TFrame)
    pnlChangeName: TSkinFMXPanel;
    btnOk: TSkinFMXButton;
    pnlToolBar: TSkinFMXPanel;
    btnReturn: TSkinFMXButton;
    edtText: TSkinFMXEdit;
    ClearEditButton2: TClearEditButton;
    pnlName: TSkinFMXPanel;
    procedure btnReturnClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ClearEditButton2Click(Sender: TObject);
    procedure btnAddrClick(Sender: TObject);
  private
//    //修改用户信息
//    procedure DoChangeUserInfoExecute(ATimerTask:TObject);
//    procedure DoChangeUserInfoExecuteEnd(ATimerTask:TObject);
//  private
//    //从设置位置点页面返回
////    procedure OnReturnFrameFromSetPointMapFrame(AFrame:TFrame);
//     {rivate declarations }
  public
//    FFilterText:String;
//
//    FIsChange:Boolean;
//
//    FFilterMoney:String;
//
//    //经纬度
//    FLongitude:Double;
//    FLatitude:Double;


    FCaption:String;

//    FAddr:String;
//    FProvince:String;
//    FCity:String;
//    FArea:String;
//
//    //清空
//    procedure Clear;
//    //添加
//    procedure AddName(ACaption:String);
    //修改
    procedure EditName(
//                      AIsChange:Boolean;
                      ACaption:String;
                      AText:String);
//    //添加金钱
//    procedure AddMoney(ACaption:String);
//    //修改金钱
//    procedure EditMoney(ACaption:String;AMoney:String);
//    //修改地址
//    procedure EditAddr(ACaption:String;
//                       AAddr:String;
//                       AProvince:String;
//                       ACity:String;
//                       AArea:String;
//                       ALongitude:Double;
//                       ALatitude:Double
//                      );
//  public
//    //修改个人信息
//    procedure ChangeUserInfo;
  public
//    FrameHistroy: TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;

var
  GlobalUpdateTextFrame:TFrameUpdateText;

implementation

{$R *.fmx}

//uses
//  MainForm,
//  MainFrame//,
////  SetGPSPointFrame
//  ;

{ TFrameUpDateName }


//procedure TFrameUpDateName.AddName(ACaption: String);
//begin
//  Clear;
//
//  Self.pnlMoney.Visible:=False;
//
//  Self.pnlAddr.Visible:=False;
//
//  Self.pnlName.Visible:=True;
//  Self.edtText.Properties.HelpText:='请输入'+ACaption;
//
//  FCaption:=ACaption;
//  //添加
//  Self.pnlToolBar.Caption:='添加'+ACaption;
//end;
//
//procedure TFrameUpDateName.AddMoney(ACaption: String);
//begin
//  Clear;
//
//  Self.pnlName.Visible:=False;
//  Self.pnlAddr.Visible:=False;
//
//  Self.pnlMoney.Visible:=True;
//  Self.edtMoney.Properties.HelpText:='请输入'+ACaption;
//
//  FCaption:=ACaption;
//  //添加
//  Self.pnlToolBar.Caption:='添加'+ACaption;
//end;

procedure TFrameUpdateText.btnAddrClick(Sender: TObject);
//var
//  AMapAnnotation:TMapAnnotation;
begin
//  //单独页面的模式
//  HideFrame;
//  ShowFrame(TFrame(GlobalSetGPSPointFrame),TFrameSetGPSPoint,OnReturnFrameFromSetPointMapFrame);
//
//  AMapAnnotation:=TMapAnnotation.Create;
//
//  try
//    if APPUserType=utRider then
//    begin
//      AMapAnnotation.Location:=TLocation.Create(
//            GlobalManager.AsRider.RiderInfo.work_latitude,
//            GlobalManager.AsRider.RiderInfo.work_longitude,
//            gtGCJ02
//            );
//      AMapAnnotation.Addr:=GlobalManager.AsRider.RiderInfo.work_addr;
//
//      GlobalSetGPSPointFrame.Load(AMapAnnotation,
//                                  '骑手常驻区域',
//                                  '设置为常驻区域'
//                                  );
//    end;
//
//    if APPUserType=utShop then
//    begin
////      AMapAnnotation.Location:=TLocation.Create(
////            GlobalManager.AsShop.Shop.latitude,
////            GlobalManager.AsShop.Shop.longitude,
////            gtGCJ02
////            );
//
//      AMapAnnotation.Location:=TLocation.Create(
//            Self.FLatitude,
//            Self.FLongitude,
//            gtGCJ02
//            );
//
//      AMapAnnotation.Addr:=Self.FAddr;
//
//      GlobalSetGPSPointFrame.Load(AMapAnnotation,
//                                  '店铺所在区域',
//                                  '设置为店铺所在区域区域'
//                                  );
//    end;
//
//  finally
//    FreeAndNil(AMapAnnotation);
//  end;

end;

procedure TFrameUpdateText.btnOkClick(Sender: TObject);
begin
  if Self.pnlName.Visible=True then
  begin
    if Self.edtText.Text='' then
    begin
      ShowMessageBoxFrame(Self,'请输入'+FCaption,'',TMsgDlgType.mtInformation,['确定'],nil);
      Exit;
    end;
  end;

//  if Self.pnlMoney.Visible=True then
//  begin
//    if Self.edtMoney.Text='' then
//    begin
//      ShowMessageBoxFrame(Self,'请输入'+FCaption,'',TMsgDlgType.mtInformation,['确定'],nil);
//      Exit;
//    end;
//  end;
//
//  if Self.pnlAddr.Visible=True then
//  begin
//    if Self.edtAddr.Text='' then
//    begin
//      ShowMessageBoxFrame(Self,'请输入'+FCaption,'',TMsgDlgType.mtInformation,['确定'],nil);
//      Exit;
//    end;
//  end;
//
//
//
//
//  FFilterMoney:=Trim(Self.edtMoney.Text);
//
//  FAddr:=Self.edtAddr.Text;
//
//  if FIsChange=True then
//  begin
//    if Self.FFilterText<>Self.edtText.Text then
//    begin
//      FFilterText:=Trim(Self.edtText.Text);
//      //修改用户名
//      Self.ChangeUserInfo;
//    end
//    else
//    begin
      //返回
      HideFrame;//(Self, hfcttBeforeReturnFrame);
      ReturnFrame;//(Self.FrameHistroy);
//    end;
//  end;
//
//
//
//  if FIsChange=False then
//  begin
//    FFilterText:=Trim(Self.edtText.Text);
//    //返回
//    HideFrame;//(Self, hfcttBeforeReturnFrame);
//    ReturnFrame;//(Self.FrameHistroy);
//  end;

end;

procedure TFrameUpdateText.btnReturnClick(Sender: TObject);
begin
  if IsRepeatClickReturnButton(Self) then Exit;

  //返回
  HideFrame;//(Self, hfcttBeforeReturnFrame);
  ReturnFrame;//(Self.FrameHistroy);
end;

//procedure TFrameUpDateName.ChangeUserInfo;
//begin
//
//  ShowWaitingFrame(Self,'修改中...');
//  uTimerTask.GetGlobalTimerThread.RunTempTask(
//                DoChangeUserInfoExecute,
//                DoChangeUserInfoExecuteEnd,
//                'ChangeUserInfo');
//
//
//end;
//
//procedure TFrameUpDateName.Clear;
//begin
//  FCaption:='';
//  FFilterText:='';
//
//  FFilterMoney:='';
//
//  Self.edtText.Text:='';
//
//  Self.pnlToolBar.Caption:='';
//
//  FIsChange:=False;
//
//
//
//  Self.pnlName.Visible:=False;
//
//  Self.pnlMoney.Visible:=False;
//
//  Self.pnlAddr.Visible:=False;
//
//  Self.FAddr:='';
//
//  FLongitude:=0;
//  FLatitude:=0;
//end;

procedure TFrameUpdateText.ClearEditButton2Click(Sender: TObject);
begin
  Self.edtText.Text:='';

  Self.edtText.Properties.HelpText:='请输入'+Self.FCaption;
end;

constructor TFrameUpdateText.Create(AOwner: TComponent);
begin
  inherited;

//  FIsChange:=False;

  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);

  Self.edtText.SelfOwnMaterialToDefault.BackColor.BorderColor.Color:=SkinThemeColor;
//  Self.edtMoney.SelfOwnMaterialToDefault.BackColor.BorderColor.Color:=SkinThemeColor;
//  Self.edtAddr.SelfOwnMaterialToDefault.BackColor.BorderColor.Color:=SkinThemeColor;
end;

//procedure TFrameUpDateName.DoChangeUserInfoExecute(ATimerTask: TObject);
//begin
//  //出错
//  TTimerTask(ATimerTask).TaskTag:=1;
//
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI('update_my_info',
//                                                    nil,
//                                                    UserCenterInterfaceUrl,
//                                                    ['appid',
//                                                    'user_fid',
//                                                    'key',
//                                                    'head_img',
//                                                    'name',
//                                                    'second_contactor_name',
//                                                    'second_contactor_phone'],
//                                                    [AppID,
//                                                    GlobalManager.User.fid,
//                                                    GlobalManager.User.key,
//                                                    GlobalManager.User.head_pic_path,
//                                                    Self.FFilterText,
//                                                    GlobalManager.User.second_contactor_name,
//                                                    GlobalManager.User.second_contactor_phone],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                                                    );
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;
//end;
//
//procedure TFrameUpDateName.DoChangeUserInfoExecuteEnd(ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
//begin
//
//  try
//    if TTimerTask(ATimerTask).TaskTag=0 then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//        //修改信息成功
//        GlobalManager.User.ParseFromJson(ASuperObject.O['Data'].A['User'].O[0]);
//        //返回
//        HideFrame;//(Self, hfcttBeforeReturnFrame);
//        ReturnFrame;//(Self.FrameHistroy);
//      end
//      else
//      begin
//        //调用失败
//        ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //网络异常
//      ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
//end;

procedure TFrameUpdateText.EditName(
//                                  AIsChange:Boolean;
                                  ACaption, AText: String);
begin

//  FIsChange:=AIsChange;

  Self.pnlToolBar.Caption:='修改'+ACaption;

  FCaption:=ACaption;

//  Self.pnlMoney.Visible:=False;
//
//  Self.pnlAddr.Visible:=False;

  Self.pnlName.Visible:=True;
  Self.edtText.Text:=AText;

//  FFilterText:=AText;
end;

//procedure TFrameUpDateName.OnReturnFrameFromSetPointMapFrame(AFrame: TFrame);
////var
////  ACountry:String;
////  ARount:String;
////  AStreet:String;
////  AAddr:String;
//begin
////  Self.edtAddr.Text:=GlobalSetGPSPointFrame.FMapAnnotation.Addr;
////
////  Self.FAddr:=GlobalSetGPSPointFrame.FMapAnnotation.Addr;
////
//////  Self.FProvince:=GlobalSetGPSPointFrame.FMapAnnotation.Province;
//////  Self.FCity:=GlobalSetGPSPointFrame.FMapAnnotation.City;
//////  Self.FArea:=GlobalSetGPSPointFrame.FMapAnnotation.Area;
////  Self.FLongitude:=GlobalSetGPSPointFrame.FMapAnnotation.Location.Longitude;
////  Self.FLatitude:=GlobalSetGPSPointFrame.FMapAnnotation.Location.Latitude;
//
////  //根据经纬度获取省市区
////  uGPSLocation.GetGeocoder(GlobalSetGPSPointFrame.FMapAnnotation.Location,
////                           AAddr,
////                           ACountry,
////                           Self.FProvince,
////                           Self.FCity,
////                           Self.FArea,
////                           ARount,
////                           AStreet);
//end;

//procedure TFrameUpDateName.EditAddr(ACaption, AAddr: String;
//                                    AProvince:String;
//                                    ACity:String;
//                                    AArea:String;
//                                    ALongitude:Double;
//                                    ALatitude:Double
//                                    );
//begin
//  Self.pnlToolBar.Caption:='修改'+ACaption;
//
//  FCaption:=ACaption;
//
//  Self.pnlName.Visible:=False;
//
//  Self.pnlMoney.Visible:=False;
//
//  Self.pnlAddr.Visible:=True;
//
//  Self.edtAddr.Text:=AAddr;
//
//  FAddr:=AAddr;
//
//  Self.FProvince:=AProvince;
//  Self.FCity:=ACity;
//  Self.FArea:=AArea;
//
//  Self.FLongitude:=ALongitude;
//  Self.FLatitude:=ALatitude;
//end;

//procedure TFrameUpDateName.EditMoney(ACaption, AMoney: String);
//begin
//  Self.pnlToolBar.Caption:='修改'+ACaption;
//
//  FCaption:=ACaption;
//
//  Self.pnlName.Visible:=False;
//
//  Self.pnlAddr.Visible:=False;
//
//  Self.pnlMoney.Visible:=True;
//  Self.edtMoney.Text:=AMoney;
//
//  FFilterMoney:=AMoney;
//end;


end.

