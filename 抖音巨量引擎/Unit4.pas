unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  {$IFDEF ANDROID}
  FMX.Platform.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.Widget,


  Androidapi.JNI.Net,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  FMX.Helpers.Android,
  Androidapi.JNI.Os,
    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}
  {$ENDIF}
  Androidapi.JNI.helper,
//  Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar,
  Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar,


  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm4 = class(TForm)
    btnInit: TButton;
    btnRegister: TButton;
    btnPay: TButton;
    btnStartPlay: TButton;
    Button2: TButton;
    btnCreateGameRole: TButton;
    procedure btnInitClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnPayClick(Sender: TObject);
    procedure btnStartPlayClick(Sender: TObject);
    procedure btnCreateGameRoleClick(Sender: TObject);
  private
    { Private declarations }
  public
    config:JInitConfig;
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.btnPayClick(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TForm4.btnPayClick Begin');
  //

  //// 提交购买/下单，属性：商品/内容类型，商品/内容名称，商品ID/内容id，商品数量，支付渠道，币种，是否成功，金额
  //GameReportHelper.onEventCheckOut("","","",1,"","",true,0);
  //GameReportHelper.onEventCheckOut("","","",1,"","",true,0);
  TJGameReportHelper.JavaClass.onEventCheckOut(
        StringToJString('gift'),StringToJString('flower'), StringToJString('008'),1, True,
        StringToJString('wechat'),StringToJString('¥'),true, 1);

  //内置事件 “支付”，属性：商品类型，商品名称，商品ID，商品数量，支付渠道，币种，是否成功（必传），金额（必传）
  //GameReportHelper.onEventPurchase("gift","flower", "008",1,                "wechat","¥", true, 1);
  TJGameReportHelper.JavaClass.onEventPurchase(
        StringToJString('gift'),StringToJString('flower'), StringToJString('008'),1,
        StringToJString('wechat'),StringToJString('¥'), true, 1);

  FMX.Types.Log.d('OrangeUI TForm4.btnPayClick End');
end;

procedure TForm4.btnRegisterClick(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TForm4.btnRegisterClick Begin');

  //内置事件: “注册” ，属性：注册方式，是否成功，属性值为：wechat ，true
  TJGameReportHelper.JavaClass.onEventRegister(StringToJString('wechat'),true);

  FMX.Types.Log.d('OrangeUI TForm4.btnRegisterClick End');
end;

procedure TForm4.btnStartPlayClick(Sender: TObject);
begin
  //import com.bytedance.applog.game.WhalerGameHelper;
  //
  ///**
  // * 广告按钮点击：gt_ad_button_click ad_type  string
  // * 广告类型：激励视频、插屏、banner等，直接使用汉字或者英文进行标识 ad_position_type  string
  // * 广告点位类型：按照提供分类接入 ad_position string  广告点位：复活、翻倍、试用、buff、奖励道具、新道具、减CD等，直接使用文字或者英文进行标识
  // * 触发条件：用户点击app内各广告位button时。
  // */
  //public static void adButtonClick(String ad_type,String ad_position_type,String ad_position,HashMap otherParams);
  //
  ///** 广告开始展示：gt_ad_show ad_type           string  广告类型：激励视频、插屏、banner等，直接使用汉字或者英文进行标识 ad_position_type  string
  // 广告点位类型：按照提供分类接入 ad_position       string  广告点位：复活、翻倍、试用、buff、奖励道具、新道具、减CD等，直接使用文字或者英文进行标识
  // 触发条件：用户点击并观看广告时。穿山甲广告有回调，可以直接获取。 */
  //public static void adShow(String ad_type,String ad_position_type,String ad_position,HashMap otherParams);
  //
  ///** 广告结束展示：gt_ad_show_end ad_type           string  广告类型：激励视频、插屏、banner等，直接使用汉字或者英文进行标识 ad_position_type  string  广告点位类型：按照提供分类接入 ad_position       string  广告点位：复活、翻倍、试用、buff、奖励道具、新道具、减CD等，直接使用文字或者英文进行标识 result            string  广告观看结果：跳过、成功、失败等，使用英文进行标识.  跳过标记为skip, 成功标记为success，失败为fail 触发条件：用户观看广告结束时。
  // */
  //public static void adShowEnd(String ad_type,String ad_position_type,String ad_position,String result,HashMap otherParams);
  //
  ///** （总等级）升级和经验：gt_levelup lev             int 当前玩家等级 get_exp     int 获得经验 method      string  获得经验途径：闯关成功、引导完成、领取奖励等，使用汉字或者英文进行标识 aflev          int 用户获得经验后等级，如获得经验未导致升级，则lev=aflev，如导致升级，则lev 触发条件：用户获得经验或者等级发生变化时。
  // */
  //public static void levelUp(int lev,int get_exp,String method,int aflev,HashMap otherParams);
  //
  ///** 开始玩法：gt_start_play ectype_name string  针对闯关性质玩法，标注关卡名称 触发条件：用户开始玩法时。 */
  //public static void startPlay(String ectype_name,HashMap otherParams);
  ///** 结束玩法：gt_end_play ectype_name string  针对闯关性质玩法，标注关卡名称 result      string  玩法的结果：未完成、成功、失败等，使用英文进行标识.  未完成标记为uncompleted, 成功标记为success，失败为fail duration    int 消耗时间，单位秒 触发条件：用户结束玩法时，涵盖中途退出、完成但失败和完成且成功。 */
  //public static void endPlay(String ectype_name,WhalerGameHelper.Result result,int duration,HashMap otherParams);
  ///** 获得游戏币：gt_get_coins coin_type    string    货币类型：元宝、绑元、金币、银币等，使用文字或者英文进行标识 method    string    获得途径：观看激励视频、闯关成功、活动奖励等，使用文字或者英文进行标识 coin_num    int    获得数量 触发条件：用户获得游戏币，导致游戏币增加时 */
  //public static void getCoins(String coin_type,String method,int coin_num,HashMap otherParams);
  ///** 消耗游戏币：gt_cost_coins coin_type    string    货币类型：元宝、绑元、金币、银币等，使用文字或者英文进行标识 method    string    消耗途径：复活、购买道具、解锁关卡等，使用文字或者英文进行标识 coin_num    int    消耗数量 触发条件：用户消耗游戏币，导致游戏币减少时。 */
  //public static void costCoins(String coin_type,String method,int coin_num,HashMap otherParams);
  ///** 初始化信息：gt_init_info lev              int    玩家等级 coin_type    string    获得货币的类型 coin_left    int    用户身上剩余的货币数量 触发条件：用户启动游戏，初始化完成时上报 */
  //public static void gameInitInfo(int lev,String coin_type,int coin_left,HashMap otherParams);
  //



  //// 绑定社交账号，属性：社交账号类型，是否成功
  //GameReportHelper.onEventAccessAccount("wechat",true);
  //// 添加支付渠道，属性：支付渠道，是否成功
  //GameReportHelper.onEventAccessPaymentChannel("zhifubao",true);
  //// 添加到购物车，属性：商品类型，商品名称，商品ID，商品数量,是否成功
  //GameReportHelper.onEventAddCart("","","",0,true);
  //// 添加至收藏，属性：商品类型，商品名称，商品ID，商品数量,是否使用虚拟币种，虚拟币币种，真实货币类型，是否成功
  //GameReportHelper.onEventAddToFavorite("","","",0,true,"","",true);
  //// 提交购买/下单，属性：商品/内容类型，商品/内容名称，商品ID/内容id，商品数量，支付渠道，币种，是否成功，金额
  //GameReportHelper.onEventCheckOut("","","",1,"","",true,0);


  //GameReportHelper.onEventCreateGameRole("");  // 创建角色，属性：角色id
  //GameReportHelper.onEventLogin("",true);  // 登录，属性：登录方式，是否成功
  //GameReportHelper.onEventUpdateLevel(99); // 升级，属性：当前等级
  //// 完成教学任务/副本，属性：任务id，任务类型，教学/任务/副本名，第几个任务，状态，其它描述
  //GameReportHelper.onEventQuest("","","",0,true,"");


  FMX.Types.Log.d('OrangeUI TForm4.btnRegisterClick Begin');

  ///** 开始玩法：gt_start_play ectype_name string  针对闯关性质玩法，标注关卡名称 触发条件：用户开始玩法时。 */
//  public static void startPlay(String ectype_name,HashMap otherParams);
  TJWhalerGameHelper.JavaClass.startPlay(StringToJString('第一关'),nil);

  FMX.Types.Log.d('OrangeUI TForm4.btnRegisterClick End');


end;

procedure TForm4.btnCreateGameRoleClick(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TForm4.btnCreateGameRoleClick Begin');

  //GameReportHelper.onEventCreateGameRole("");  // 创建角色，属性：角色id
  TJGameReportHelper.JavaClass.onEventCreateGameRole(StringToJString('DelphiTeacher'));
  TJGameReportHelper.JavaClass.onEventLogin(StringToJString('DelphiTeacher'),True);
  TJGameReportHelper.JavaClass.onEventUpdateLevel(1);

  FMX.Types.Log.d('OrangeUI TForm4.btnCreateGameRoleClick End');

end;

procedure TForm4.btnInitClick(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TForm4.btnInitClick Begin');

//  /* 初始化SDK开始 */
  // 第一个参数APPID: 参考2.1节获取
  // 第二个参数CHANNEL: 填写渠道信息，请注意不能为空
//  final InitConfig config = new InitConfig("507644", "test");

//  config:=TJInitConfig.JavaClass.init(StringToJString('507644'),StringToJString('test'));
  config:=TJInitConfig.JavaClass.init(StringToJString('538250'),StringToJString('test'));


  // 设置数据上送地址
  config.setUriConfig(TJUriConstants.JavaClass.DEFAULT);
  config.setImeiEnable(false);//建议关停获取IMEI（出于合规考虑）
  config.setAutoTrackEnabled(true); // 全埋点开关，true开启，false关闭
//  config.setLogEnable(false); // true:开启日志，参考4.3节设置logger，false:关闭日志
  config.setLogEnable(true); // true:开启日志，参考4.3节设置logger，false:关闭日志

  //配置心跳事件
  //...
  // 游戏模式，YES会开始 playSession 上报，
  //每隔一分钟上报心跳日志
  config.setEnablePlay(true);
//  ...AppLog.init(this, config);/* 初始化结束 */


  TJAppLog.JavaClass.setEncryptAndCompress(true); // 加密开关，true开启，false关闭
  //AppLog.init(this, config);
  TJHelper.JavaClass.initAppLog2(TAndroidHelper.Context,config, TAndroidHelper.Activity);
  //  /* 初始化SDK结束 */

  FMX.Types.Log.d('OrangeUI TForm4.btnInitClick End');
end;

end.
