//convert pas to utf8 by ¥
unit uOpenCommon;

interface

uses

//  {$IFDEF ANDROID}
//    Androidapi.Helpers,
//    Androidapi.JNIBridge,
//    Androidapi.JNI.JavaTypes,
//    Androidapi.JNI.Net,
//    Androidapi.JNI.GraphicsContentViewText,
//    Androidapi.JNI.Os,
//    Androidapi.JNI.App,
//    System.Generics.Collections,
//    System.Messaging,
//
//
//    {$IFNDEF IN_ANDROIDSERVICE}
//    //Android服务中不能使用这个文件,不然会卡死
//    FMX.Helpers.Android,
//    {$ENDIF}
//
//    {$IF RTLVersion>=33}// 10.3+
//    System.Permissions, // 动态权限单元
//    {$ENDIF}
//    {$IF RTLVersion=31}// 10.2
//    uAndroidPermission_D10_2,
//    {$ENDIF}
//
//  {$ENDIF}


//  uLang,
  SysUtils;



const
  //缩略图前缀
  THUMB_FILE_PREFIX='thumb_';

const
  //AccessToken的自定义头名称
  CUSTROM_HEADER_ACCESS_TOKEN='key';



const
  Const_AIModel_ChatGPT3_5='chatgpt 3.5';
  Const_AIModel_ChatGPT4='chatgpt 4';


const
  //编辑页面输入Panel的默认素材
  Const_ControlStyle_EditPageInputPanelDefault='EditPageInputPanelDefault';
  //编辑页面输入Label的默认素材
  Const_ControlStyle_EditPageHintLabelDefult='EditPageHintLabelDefault';


  {$REGION '页面框架的页面类型'}
const
  //页面框架的页面类型
  //列表页面
  Const_PageType_ListPage='list_page';
  //表格管理页面
  Const_PageType_TableManagePage='table_manage_page';
  //编辑页面
  Const_PageType_EditPage='edit_page';
  //查看页面
  Const_PageType_ViewPage='view_page';



  //自定义页面
  Const_PageType_CustomPage='custom_page';
  //树型列表页面
  Const_PageType_TreeListPage='tree_list_page';
  //主从编辑页面
  Const_PageType_MasterDetailEditPage='master_detail_edit_page';
  //主从查看页面
  Const_PageType_MasterDetailViewPage='master_detail_view_page';
  {$ENDREGION '页面框架的页面类型'}


  {$REGION '页面框架的页面区域'}
const
  //页面框架的页面区域
  //主区域
  Const_PagePart_Main='';
  Const_PagePart_Grid='grid';
  //搜索栏
  Const_PagePart_SearchBar='search_bar';
  //顶部工具栏
  Const_PagePart_TopToolbar='top_toolbar';
  //表格中的行操作区
  Const_PagePart_RowOperBar='row_oper_bar';
  //底部工具栏
  Const_PagePart_BottomToolbar='bottom_toolbar';
//  //其他
//  Const_PagePart_Other='other';
//  //列表页面的默认设计面板
//  Const_PagePart_DefaultItemDesignerPanel='default_item_designer_panel';
  {$ENDREGION '页面框架的页面区域'}


  {$REGION '页面框架的操作'}
const
  //页面框架的操作
  //跳转到新增页面
  Const_PageAction_JumpToNewRecordPage='jump_to_new_record_page';
  //跳转到编辑页面
  Const_PageAction_JumpToEditRecordPage='jump_to_edit_record_page';
  //跳转到自定义页面
  Const_PageAction_JumpToPage='jump_to_page';
  //跳转到查看页面
  Const_PageAction_JumpToViewRecordPage='jump_to_view_record_page';
  //跳转到主从新增页面
  Const_PageAction_JumpToNewMasterDetailRecordPage='jump_to_new_master_detail_record_page';
  //跳转到主从编辑页面
  Const_PageAction_JumpToEditMasterDetailRecordPage='jump_to_edit_master_detail_record_page';
  //跳转到主从查看页面
  Const_PageAction_JumpToViewMasterDetailRecordPage='jump_to_view_master_detail_record_page';


  //批量删除
  Const_PageAction_BatchDelRecord='batch_del_record';
  //批量保存
  Const_PageAction_BatchSaveRecord='batch_save_record';
  //搜索
  Const_PageAction_LoadData='load_data';
  //批量删除
  Const_PageAction_DeleteRecordList='delete_record_list';
  //新建
  Const_PageAction_AddRecord='add_record';
  //编辑
  Const_PageAction_EditRecord='edit_record';
  //取消
  Const_PageAction_CancelAddEditRecord='cancel_add_edit_record';
  //删除
  Const_PageAction_DelRecord='del_record';
  //返回
  Const_PageAction_ReturnPage='return_page';
  //关闭页面
  Const_PageAction_ClosePage='close_page';
  //保存
  Const_PageAction_SaveRecord='save_record';
  //取消保存
  Const_PageAction_CancelSaveRecord='cancel_save_record';
  //保存并返回
  Const_PageAction_SaveRecordAndReturn='save_record_and_return';
  //保存新增并继续新增
  Const_PageAction_SaveRecordAndContinueAdd='save_record_and_continue_add';
  //点击单元格
  Const_PageAction_ClickCell='click_cell';
  Const_PageAction_AfterSaveRecord='after_save_record';
  Const_PageAction_AfterCancelAddRecord='after_cancel_add_record';
  Const_PageAction_AfterCancelEditRecord='after_cancel_edit_record';


  Const_PageAction_SelectDateArea='select_date_area';
  Const_PageAction_ValueChange='value_change';
  Const_PageAction_ReturnFrame='return_frame';
  {$ENDREGION '页面框架的页面区域'}


  {$REGION '页面布局类型'}
const
  //页面布局-自动
  Const_PageAlignType_Auto='auto';
  //页面布局-手动
  Const_PageAlignType_Manual='manual';
  {$ENDREGION '页面布局类型'}


const
  //接口类型
  //通用接口
  Const_IntfType_TableCommonRest='table_common_rest';





const
  //页面框架的功能类型
  Const_FunctionType_DataManage='data_manage';


const
  //验证码类型
  //注册的验证码
  Const_CaptchaType_Register='register';
  //登录的验证码
  Const_CaptchaType_Login='login';
  //忘记密码的验证码
  Const_CaptchaType_ForgetPassword='forget_password';
  //更换手机号的验证码
  Const_CaptchaType_ChangePhoneNum='change_phone_num';
  //绑定手机号的验证码
  Const_CaptchaType_BindPhoneNum='bind_phone_num';
  //短信群发的验证码
  Const_CaptchaType_BatchSend='batch_send';

  //盛世OnLine的游戏验证码
  Const_CaptchaType_shengshionline_game='shengshionline_game';
  //盛世OnLine的礼包验证码
  Const_CaptchaType_shengshionline_gift='shengshionline_gift';







const
  //开放平台的APPID
  Const_OpenPlatform_AppID='1000';

//  //授权中心的服务器,默认都是
//  CenterServerHost='www.orangeui.cn';
//  CenterServerPort=10020;



  {$REGION '积分规则类型'}
const
  //积分规则类型
  //注册
  Const_RuleType_Register='register';//没有用到,仅用于显示这个积分是怎么来的
  //邀请好友注册
  Const_RuleType_InviteRegister='invite_register';


  //消费金额
  Const_RuleType_ConsumeMoney='consume_money';
  //下单评论
  Const_RuleType_CommentOrder='comment_order';




  //分期每天赠送剩余
  Const_RuleType_DelayDailyGiftLeft='delay_daily_gift_left';
  //邀请的好友消费金额
  Const_RuleType_MyManConsumeMoney='my_man_consume_money';


  //积分兑换
  Const_RuleType_ExchangeScore='exchange_score';
  //积分抵扣
  Const_RuleType_UsedScore='used_score';
  //积分退还
  Const_RuleType_ScoreReBack='score_reback';




  //积分兑换申请审核失败  积分返还
  Const_RuleType_AuditFailReback='audit_fail_reback';
  //积分兑换申请处理失败  积分返还
  Const_RuleType_ProcessFailReback='process_fail_reback';

  //积分充值
  Const_RuleType_InvestScore='invest_score';
  //积分夺宝
  Const_RuleType_IndianaGoods='indiana_goods';

  //平台商家下单积分抵扣
  Const_RuleType_PlatformShopUsedScore='platform_shop_used_score';
  //普通商家下单积分抵扣
  Const_RuleType_ShopUsedScore='shop_used_score';


  //购买股份赠送
  Const_RuleType_BuyStock='buy_stock';



  //购买股份赠送话费余额
  Const_RuleType_BuyStockGiftPhoneBalance='buy_stock_gift_phone_balance';
  //注册赠送话费余额
  Const_RuleType_RegisterGiftPhoneBalance='register_gift_phone_balance';
//<<<<<<< .mine
////  //积分兑换话费规则
////  Const_RuleType_ScoreExchangePhoneBalance='score_exchange_phone_balance';
////  //金额兑换话费规则
////  Const_RuleType_MoneyExchangePhoneBalance='money_exchange_phone_balance';
//  //话费充值
//||||||| .r10989
//  //积分兑换话费规则
//  Const_RuleType_ScoreExchangePhoneBalance='score_exchange_phone_balance';
//  //金额兑换话费规则
//  Const_RuleType_MoneyExchangePhoneBalance='money_exchange_phone_balance';
  //购买股份赠送
//=======
  //积分兑换话费规则
  Const_RuleType_ScoreExchangePhoneBalance='score_exchange_phone_balance';
  //金额兑换话费规则
  Const_RuleType_MoneyExchangePhoneBalance='money_exchange_phone_balance';
  //话费充值
//>>>>>>> .r11181
  Const_RuleType_RechargePhoneBalance='recharge_phone_balance';


  //签到赠送积分
  Const_RuleType_UserSignIn='user_sign_in';
  //活动赠送积分
  Const_RuleType_ActivityScore='activity_score';
  //积分兑换活动
  Const_RuleType_ScoreExchange='score_exchange';
  //修改名称扣积分
  Const_RuleType_ChangeNickName='change_nickname';
  //意见被采纳
  Const_RuleType_SuggestionAuditPass='suggestion_audit_pass';
  //投诉被采纳
  Const_RuleType_ComplainAuditPass='complain_audit_pass';
  //打赏内容
  Const_RuleType_TipContent='tip_content';
  //拍砖内容
  Const_RuleType_BrickContent='brick_content';
  //打赏拍砖结算奖励
  Const_RuleType_TipBrickSettle='tip_brick_settle';
  {$ENDREGION '积分规则类型'}


//  {$REGION '积分奖励规则'}
//  const
//    //积分奖励规则
//    //注册成功赠送
//    Const_ScoreRuleType_Register='invite_register';
//    //下单评论后赠送
//    Const_ScoreRuleType_CommentOrder='comment_order';
//    //兑换码赠送
//    Const_ScoreRuleType_ChangeCode='change_code';
//  {$ENDREGION}
//

  {$REGION '注册和登陆的类型'}
const


  // 手机号码登录类型(验证码、密码)
  Const_RegisterLoginType_PhoneNum_PassWord = 'phone_num_password';
  Const_RegisterLoginType_PhoneNum_Captcha = 'phone_num_captcha';
  Const_RegisterLoginType_UserName_PassWord = 'user_name_password';
  Const_RegisterLoginType_Only_UserName_PassWord = 'only_user_name_password';



  // 手机号码注册类型
  Const_RegisterLoginType_PhoneNum = 'phone_num';
  // 邮箱注册
  Const_RegisterLoginType_Email = 'email';
  // 微信登录
  Const_RegisterLoginType_WeiXin = 'wei_xin';
  // FaceBook登录
  Const_RegisterLoginType_FaceBook = 'face_book';
  // Twitter登录
  Const_RegisterLoginType_Twitter = 'twitter';
  // 支付宝登录
  Const_RegisterLoginType_Alipay = 'alipay';
  Const_RegisterLoginType_Apple = 'apple';
  Const_RegisterLoginType_FumaMX = 'fumamx';
  {$ENDREGION}


  {$REGION '订单状态'}
const
  //订单状态,要用小写,在url要用到//
  //待付款
  Const_OrderState_WaitPay='wait_pay';
  //已取消
  Const_OrderState_Cancelled='cancelled';
  //已付款/待商家接单/待员工审核/待接单骑手
  Const_OrderState_Payed='payed';
  //商家接单/员工审核通过/骑手接单
  Const_OrderState_Accepted='accepted';
  //商家拒单/审核拒绝/
  Const_OrderState_Reject='reject';

  //用户待收货/商家已发货/员工已发货/骑手已送达
  Const_OrderState_Sent='sent';
  //已完成/用户确认收货
  Const_OrderState_Done='done';




  //到店付
  Const_OrderState_PayTillDown='pay_till_done';


  //商家出餐
  Const_OrderState_Shoper_Finish_Goods='shoper_finish_goods';


  //次要状态
  //骑手接单
  Const_OrderState_Rider_Accept_Order='rider_accept_order';
  //骑手到店
  Const_OrderState_Rider_At_Sender='rider_at_sender';
  //骑手取货
  Const_OrderState_Rider_Take_Goods='rider_take_goods';
  //骑手派送中
  Const_OrderState_Rider_Sending='rider_sending';
  //骑手送达
  Const_OrderState_Rider_Arrived='rider_arrived';
  //骑手取消订单
  Const_OrderState_Rider_Cancelled='rider_cancelled';



  //自己配送的商家派单给骑手
  Const_OrderState_shoper_pending_order='shoper_pending_order';



  //用户确认收货
  Const_OrderState_User_Accept='user_accept';





  //(我)申请了售后服务
  Const_OrderState_Wait_Process_Customer_Service='wait_process_customer_service';
  //(我)取消了售后服务
  Const_OrderState_Cancelled_Customer_Service='cancelled_customer_service';
  //(我或者客服)修改了售后服务
  Const_OrderState_Updated_Customer_Service='updated_customer_service';
  //(服务商)同意售后服务
  Const_OrderState_Accepted_Customer_Service='accepted_customer_service';
  //(服务商)拒绝售后服务
  Const_OrderState_Reject_Customer_Service='reject_customer_service';
  //(服务端)支付售后服务的退款
  Const_OrderState_Payed_Customer_Service='payed_customer_service';
  //售后服务结束
  Const_OrderState_Done_Customer_Service='done_customer_service';
  {$ENDREGION}


  {$REGION '订单类型'}
  //商家中心订单
  Const_OrderType_ShopCenter='shop_center';
  //配送中心订单
  Const_OrderType_DeliveryCenter='delivery_center';
  //售后服务中心的订单
  Const_OrderType_CustomerSerivceCenter='customer_serivce_center';
  //帮送、跑腿
  Const_OrderType_RunErrands='run_errands';
  //代买
  Const_OrderType_HelpBuy='help_buy';
  //余额充值
  Const_OrderType_InvestMoney='invest_money';
  //积分充值
  Const_OrderType_InvestScore='invest_score';
  //购买股份
  Const_OrderType_BuyStock='buy_stock';



  //茶叶项目
  //积分兑换
  Const_OrderType_ExchangeScore='exchange_score';
  //积分兑换
  Const_OrderType_UsedScore='used_score';
  //积分兑换申请审核/处理失败  积分返还
  Const_OrderType_ScoreReback='score_reback';
  //分期每天赠送剩余
  Const_OrderType_DelayDailyGiftLeft='delay_daily_gift_left';
  //邀请的好友消费金额
  Const_OrderType_MyManConsumeMoney='my_man_consume_money';

  //积分夺宝
  Const_OrderType_IndianaGoods='indiana_goods';

  //话费充值
  Const_OrderType_RechargePhoneBalance='recharge_phone_balance';
  {$ENDREGION}


  {$REGION '付款类型'}
const
  //付款类型//
  //线下转账
  Const_PaymentType_BankTranser='bank_transer';
  //微信支付
  Const_PaymentType_WeiXinPay='wxpay';
  Const_PaymentType_WeiXinPayScanQRCode='wxpay_scan_qrcode';
  //支付宝支付
  Const_PaymentType_Alipay='alipay';
  Const_PaymentType_AlipayScanQRCode='alipay_scan_qrcode';
  //Pxpay支付
  Const_PaymentType_Pxpay='pxpay';
  //用户余额
  Const_PaymentType_AccountBalance='account_balance';

  //货到付款
  Const_PaymentType_CashOnDelivery='cash_on_delivery';
  //到店付
  Const_PaymentType_PayAtStore='pay_at_store';
  //pos机刷借记卡
  Const_PaymentType_PosDebitCard='pos_debit_card';
  //pos机刷信用卡
  Const_PaymentType_PosCreditCard='pos_credit_card';
  //payment express刷信用卡
  Const_PaymentType_PaymentCreditCard='payment_credit_card';
  //payment express刷借记卡
  Const_PaymentType_PaymentDebitCard='payment_debit_card';

  //Stripe支付
  Const_PaymentType_Stripepay='stripepay';
  //Polipay支付
  Const_PaymentType_Polipay='polipay';


  //积分支付
  Const_PaymentType_Score='score';
  //话费账户余额支付
  Const_PaymentType_PhoneBalance='phone_balance';
  {$ENDREGION}


  {$REGION '评价类型'}
const
  //评价类型//
  //用户评价店铺
  Const_EvaluateType_UserEvaluateShop='user_evaluate_order_shop';
  //用户评价商品
  Const_EvaluateType_UserEvaluateGoods='user_evaluate_order_goods';
  //用户评价骑手
  Const_EvaluateType_UserEvaluateRider='user_evaluate_order_rider';
  //店家评价骑手
  Const_EvaluateType_ShopEvaluateRider='shop_evaluate_rider';
  {$ENDREGION}


  {$REGION '配送类型'}
const
  //订单的配送类型,下单时选择//
  //堂食
  Const_DeliverType_EatInShop='eat_in_shop';
  //自取
  Const_DeliverType_SelfTake='self_take';
  //需要配送
  Const_DeliverType_NeedDeliver='need_delivery';
  //快递  亿诚生活
  Const_DeliverType_Express='express';


  Const_DeliverTypes:array [0..3] of string=(
      Const_DeliverType_NeedDeliver,
      Const_DeliverType_EatInShop,
      Const_DeliverType_SelfTake,
      Const_DeliverType_Express
      );
  {$ENDREGION}


  {$REGION '活动类型'}
 //满减
 Const_Activity_Type_Full='full_dec_money';
 //特价
 Const_Activity_Type_Special='special_price_goods';
 //打折
 Const_Activity_Type_Discount='discount';
 //红包
 Const_Activity_Type_Coupon='coupon';
 //游戏礼包
 Const_Activity_Type_Gift='gift';

  {$ENDREGION}


  {$REGION '结算状态'}
const
  //结算状态//
  //待结算
  Const_SettleState_Wait='wait_settle';
  //结算成功
  Const_SettleState_Succ='settle_succ';
  //结算失败
  Const_SettleState_Fail='settle_fail';
  {$ENDREGION}


  {$REGION '入驻申请类型'}
const
  //入驻申请类型//
  //申请开店
  Const_Shop_Request='shop_request';
  //修改店铺资料
  Const_Update_Shop_Info='update_shop_info';
  //修改入驻申请
  Const_Update_Shop_Request_Info='update_shop_request_info';
  {$ENDREGION}


  {$REGION '付款状态'}
const
  //付款状态,要用小写,在url要用到//
  //未付款
  Const_PayState_WaitPay='wait_pay';
  //已付款
  Const_PayState_Payed='payed';
  //已退款
  Const_PayState_Refunded='refunded';
  //到店付或者pos机刷卡
  Const_PayState_PayTillDone='pay_till_done';

//  //付款失败就是未付款,不需要
//  Const_PayState_PayFail='pay_fail';
//  //不需要付款
//  Const_PayState_NoNeedPay='no_need_pay';
  {$ENDREGION}


  {$REGION '费用类型'}
  //商品金额
  Const_FeeType_GoodsMoney='goods_money';
  //打包费用
  Const_FeeType_PackingFee='packing_fee';
  //运费
  Const_FeeType_DeliveryFee='freight';
  Const_FeeType_Delivery_Basic='basicFree';//	基础配送费用
  Const_FeeType_Delivery_Distance='distance';//	距离费用
  Const_FeeType_Delivery_Weight='weight';//	重量费用
  Const_FeeType_Delivery_Volumn='volume';//	体积费用
  Const_FeeType_Delivery_Weather='weather';//	天气费用
  Const_FeeType_Delivery_Time='time';//	时间段费用


  Const_FeeType_PromotionDec='promotion_dec';//	优惠活动减免
  Const_FeeType_CouponDec='coupon_dec';//	红包减免

  {$ENDREGION}


  {$REGION '通知大分类'}
const
  //通知大分类,要用小写,在url要用到//
  //系统公告,所有人都能看的到的消息
  Const_NoticeCalssify_System='system';
  //订单消息,订单状态更改的通知
  Const_NoticeCalssify_Order='order';
  //其他消息,如申请挂勾码、酒店审核通过、
   Const_NoticeCalssify_Other='other';
  //站内信,员工通知酒店经理
  Const_NoticeCalssify_Mail='mail';
  //内容中心,点赞,评论
  Const_NoticeCalssify_Content='content';



  //内容中心//
  //有人点赞了你的内容
  Const_NoticeCalssify_LikeMyContent='like_my_content';
  //有人评论了你的内容
  Const_NoticeCalssify_CommentMyContent='comment_my_content';


  {$ENDREGION}



  {$REGION '通知的小分类'}
const
  //通知的小分类,要用小写,在url要用到//
  //账号注册成功
  Const_NoticeSubType_UserRegSucc='user_reg_succ';
  //注册用户申请挂勾码
  Const_NoticeSubType_RegisterRequestBindCode='register_request_bind_code';
  //账号实名认证审核结果
  Const_NoticeSubType_UserCertAuditResult='user_cert_audit_result';
  //账号审核结果
  Const_NoticeSubType_UserAuditResult='user_audit_result';

  //酒店审核结果
  Const_NoticeSubType_HotelAuditResult='hotel_audit_result';

  //入驻申请或店铺信息修改结果
  Const_NoticeSubType_RequestAuditResult='request_audit_result';




  //商家中心//
  //订单审核结果
  Const_NoticeSubType_OrderAuditResult='order_audit_result';
  //订单已发货
  Const_NoticeSubType_OrderDeliver='order_delivery';
  //订单被拒
  Const_NoticeSubType_OrderReject='order_reject';
  //订单完成
  Const_NoticeSubType_OrderDone='order_done';
  //订单佣金支付通知
  Const_NoticeSubType_CommissionPayed='order_commmission_payed';


  //订单付款成功后通知员工
  Const_NoticeSubType_OrderPayed='payed_notice_emp';
  //订单确认收货后通知员工
  Const_NoticeSubType_OrderReceived='received_notice_emp';

  //订单确认收货后通知用户
  Const_NoticeSubType_OrderReceived_NoticeUser='received_notice_user';
  //订单确认收货后通知店家
  Const_NoticeSubType_OrderReceived_NoticeShoper='received_notice_shoper';

  //订单付款成功后通知店家
  Const_NoticeSubType_OrderPayed_NoticeShoper='payed_notice_shoper';
  //商家接单后通知买家
  Const_NoticeSubType_OrderAccept='order_accept';
  //商家接单后通知骑手
  Const_NoticeSubType_OrderAcceptNoticeRider='order_accept_notice_rider';

  //商家接单后取消订单通知买家
  Const_NoticeSubType_OrderAcceptAndCancelled='order_accept_and_cancelled';

  //用户催单
  Const_NoticeSubType_NoticeShoperAccept='notice_shoper_accept';

  //骑手接单通知商家或用户
  Const_NoticeSubType_RiderAccept='rider_accept';
  //骑手到店
  Const_NoticeSubType_RiderArrivedShop='rider_arrived_shop';


  //用户提交售后申请   通知商家或骑手
  Const_NoticeSubType_CustomerService='customer_service';




  //内容中心//
  //有人关注了你
  Const_NoticeSubType_FocusedYou='focused_you';
  //有人点赞了你的内容
  Const_NoticeSubType_LikeMyContent='like_my_content';
  //有人点赞了你的评论
  Const_NoticeSubType_LikeMyComment='like_my_comment';
  //有人评论了你的内容
  Const_NoticeSubType_CommentMyContent='comment_my_content';
  //有人打赏了你的内容
  Const_NoticeSubType_TipMyContent='tip_my_content';
  //有人拍砖了你的内容
  Const_NoticeSubType_BrickMyContent='brick_my_content';




  //派琦//
  //预约项目提醒
  Const_NoticeSubType_ServiceItemBookTimeHint='service_item_book_time_hint';






  //夺宝中心//
  Const_NoticeSubType_IndianaWiner='indiana_winer';

  //商家推荐商品
  Const_NoticeSubType_ShoperSender='shoper_send';

  //下级下单通知介绍人
  Const_NoticeSubType_GetCommission='get_commission';



  //夺宝中心//
  //夺宝中奖了
  Const_NoticeSubCalssify_IndianaWiner='indiana_winer';

  //商家推荐商品
  Const_NoticeSubCalssify_ShoperSender='shoper_send';


  //股东分红赠送
  Const_NoticeSubCalssify_StockShareDividend='stock_share_dividend';
  //邀请股东赠送stock_gift_to_introducer_money
  Const_NoticeSubCalssify_StockGiftToIntroducerMoney='stock_gift_to_introducer_money';

  //赠送话费
  Const_NoticeSubCalssify_GiftPhoneBalance='gift_phone_balance';


  //急救达人//
  //身体异常
  Const_NoticeSubCalssify_Exception='exception';


  //其他
  Const_NoticeSubType_Other='other';
  {$ENDREGION}


  {$REGION '资金类型'}
  //收入
  Const_MoneyType_Income='income';
  //消费
  Const_MoneyType_Consume='consume';
  //提现
  Const_MoneyType_Withdraw='withdraw';
  //退款
  Const_MoneyType_Refund='refund';
  //赔付
  Const_MoneyType_Compensate='compensate';
  //提现失败  资金返还
  Const_MoneyType_Reback='reback';
  //扣除服务费
  Const_MoneyType_ServiceFee='servicefee';
  //积分兑换
  Const_MoneyType_Score_Exchange='score_exchange';
  //邀请的好友消费赠送余额
  Const_MoneyType_MyManConsumeMoney='my_man_consume_money';

  //商家付费推送消息
  Const_MoneyType_PayForPush='pay_for_push';

  //每月股票分红,股东分红赠送
  Const_MoneyType_StockShareDividend='stock_share_dividend';

  //邀请的人购买股份奖励,邀请股东赠送
  Const_MoneyType_StockGiftToIntroducer='stock_gift_to_introducer';

  {$ENDREGION}


  {$REGION '申请的服务类型'}
const
  //仅退款    目前暂时只做这个
  Const_ServiceType_Only_Reund_Money='only_refund_money';
  //退货退款
  Const_ServiceType_Refund_Money_And_Goods='refund_money_and_goods';
  //换货
  Const_ServiceType_Change_Goods='change_goods';
  {$ENDREGION}


  {$REGION '售后服务处理状态'}
const
  //待处理
  Const_ProcessType_Wait_Process='wait_process';
  //用户取消申请
  Const_ProcessType_User_Cancelled='user_cancelled';
  {$ENDREGION}


  {$REGION '手续费承担方类型'}
const
  //商家
  Const_ServiceFree_Client='client';
  //客户
  Const_ServiceFree_Shop='shop';
  {$ENDREGION}


const
  //审核类型
  //用户审核
  Const_AuditType_Audit='audit';
  //实名认证审核
  Const_AuditType_CertAudit='cert_audit';

const
  //获取通知的哪一部分
  //标题
  Const_NoticePart_Title='title';
  //内容
  Const_NoticePart_Content='content';





{$REGION '店铺列表过滤排序方式'}
const
  //店铺列表过滤排序方式
  //销量最高
  Const_SortType_TopSales='top_sales';
  //起送价最低
  Const_SortType_LowestBidPrice='lowest_bid_price';
  //配送最快
  Const_SortType_FastestDeliver='fastest_delivery';
  //距离最近
  Const_SortType_NearestDistance='nearest_distance';
  //好评优先
  Const_SortType_HighOpinion='high_opinion';
{$ENDREGION}



type
  //不能随便改
  //审核状态
  TAuditState=( asRequestAudit=-1,        //申请审核
                asDefault=0,              //0
                asAuditPass=1,            //1审核通过
                asAuditReject=2           //2审核拒绝
                );

  //处理状态
  TProcessState=( asRequestProcess=-1,        //待处理
                  asProcessDefault=0,         //0
                  asProcessPass=1,            //1处理成功
                  asProcessReject=2           //2处理失败
                 );

  //用户类型
  TUserType=(
            utClient=0,        //客户
            utShop=1,          //商家
            utRider=2,         //骑手
            utEmp=3//,           //员工
//            utDesigner=4       //设计器
            );


  //合作方案的配送类型
  TCoopSchemeDeliverType=(
                dtNone=0,     //不配送
                dtExpress,    //平台专送
                dtSelf,       //自已配送
                dtPosting     //快递
                );


  //店铺状态
  TOpenShopState=(ossNone=0,
                  ossRequest=1,//申请中
                  ossOnline=2  //上线
                  );

  //店铺营业状态
  TShopBusinessState=(sbsNone,             //无
                      sbsSale,             //餐厅营业中
                      sbsClose,            //餐厅关闭
                      sbsNetWorkBad,       //餐厅网络不稳定
                      sbsRest,             //餐厅休息中
                      sbsReserveOnly,      //只接受预定
                      sbsOrderByPhoneOnly, //只接受电话订餐
                      sbsHoliday           //餐厅休假中
                      );




  // 加群身份验证
  TGroupJoinSetting = (
    gjsAllUsers = 0,
    gjsNeedCheck = 1,
    gjsNoJoin = 2,
    //需要回答问题
    gjsNeedAnswerQuestion = 3,
    //需要回答选择问题
    gjsNeedAnswerSelection = 4
  );












var
  //当前客户端版本号
  CurrentVersionID:Cardinal;
  CurrentVersion:String;



//获取通知分类名
//function GetNoticeCalssifyName(ANoticeCalssify:String):String;
//获取审核状态 audit  实名认证状态  cert_audit
function GetAuditStateStr(AAuditState:TAuditState;AAuditType:String=''):String;
//获取处理状态
function GetProcessStateStr(AProcessState:TProcessState):String;
//获取支付方式
function GetPaymentTypeStr(APaymentType:String):String;
//用户获取订单状态
function GetUserOrderStateStr(AOrderState:String;AHasRider:Boolean=True):String;
//用户获取配送订单状态
function GetUserDeliveryOrderStateStr(AOrderState:String):String;
//骑手获取配送订单状态
function GetRiderDeliveryOrderStateStr(AOrderState:String):String;
//获取付款状态
function GetPayStateStr(APayState:String):String;
//获取配送方式
function GetDeliverTypeStr(ADeliverType:String):String;
//平台配送方案的配送方式
function GetCoopSchemeDeliverTypeStr(ACoopSchemeDeliverType:TCoopSchemeDeliverType):String;
//获取资金类型
function GetBillMoneyType(AMoneyType:String):String;
//获取活动类型
function GetActivityName(AType:String):String;

function GetSexStr(ASex:Integer):String;

//获取积分规则类型
function GetRuleType(ATuleType:String):String;

//获取配送方式
//function GetDeliverMethod(AMethod:Integer):String;
//获取兑换状态
function GetExechangeState(AAuditState:TAuditState;AProcessState:TProcessState):String;

//获取通知标题及内容
function GetNoticeTitleAndContent(APart:String;      //获取内容还是标题
                                  ANoticeType:string;//通知类型
                                  ASelfData:String=''//部分动态变化的内容
                                  ):String;

function GetUploadFilePath(AAppID:String;
                           AFileDir:String
                          ):String;

function GetScoreRuleTypeStr(ARuleType:String):String;


function GetTelAPIMessage(ACode:Integer):String;


//1孚盟大数据（包括深挖库数据-李丽提供给王能，现有领英库数据-王能自己从库里查询）
//2 Google
//3 Facebook
//4 Instagram
//5 Google Map
//6 Yelp
//7 Yellow Page
//8 Yandex
function GetPlatformByMXAutoDevSource(ADevSource:Integer):String;
function GetMXAutoDevSourceByPlatform(AFromPlatform:String):Integer;

implementation

function GetPlatformByMXAutoDevSource(ADevSource:Integer):String;
begin
  Result:='';
  case ADevSource of
    1:Result:='fumadata';//孚盟大数据（包括深挖库数据-李丽提供给王能，现有领英库数据-王能自己从库里查询）
    2:Result:='google';// Google
    3:Result:='facebook';// Facebook
    4:Result:='instagram';// Instagram
    5:Result:='googleMap';// Google Map
    6:Result:='yelp';// Yelp
    7:Result:='yellowPage';// Yellow Page
    8:Result:='yandex';// Yandex
    else
    begin
      Result:='else';
    end;
  end;
end;

function GetMXAutoDevSourceByPlatform(AFromPlatform:String):Integer;
begin
  Result:=0;
  //孚盟大数据（包括深挖库数据-李丽提供给王能，现有领英库数据-王能自己从库里查询）
  if (AFromPlatform='fumadata') or (AFromPlatform='linkedin_db') then Result:=1;
  // Google
  if AFromPlatform='google' then Result:=2;
  // Facebook
  if AFromPlatform='facebook' then Result:=3;
  // Instagram
  if AFromPlatform='ins' then Result:=4;
  // Google Map
  if AFromPlatform='googleMap' then Result:=5;
  // Yelp
  if AFromPlatform='yelp' then Result:=6;
  // Yellow Page
  if AFromPlatform='yellowPage' then Result:=7;
  // Yandex
  if AFromPlatform='yandex' then Result:=8;

end;



function GetTelAPIMessage(ACode:Integer):String;
begin
  case ACode of
    2000:Result:='操作成功';
    9001:Result:='查询成功无记录';
    9002:Result:='查询失败';
    1000:Result:='账户不存在或被禁用';
    1001:Result:='请求的接口不存在';
    1002:Result:='没有该接口的访问权限';
    1004:Result:='参数为空或格式错误';
    1005:Result:='数据签名错误';
    1010:Result:='余额不够，或者过期';
    1011:Result:='查询权限已被限制';
    1012:Result:='数据重复';
    1099:Result:='非法IP请求';
    9999:Result:='系统异常';
    else
    begin
      Result:='接口返回失败';
    end;
  end;

end;



function GetScoreRuleTypeStr(ARuleType:String):String;
begin
  Result:=ARuleType;


  if ARuleType=Const_RuleType_MyManConsumeMoney then
  begin
    Result:='好友下单赠送积分';
  end;

  if ARuleType=Const_RuleType_ScoreReBack then
  begin
    Result:='订单取消,返还抵扣积分';
  end;

  if ARuleType=Const_RuleType_IndianaGoods then
  begin
    Result:='积分夺宝';
  end;

  if ARuleType=Const_RuleType_UsedScore then
  begin
    Result:='消费积分抵扣';
  end;

  if ARuleType=Const_RuleType_ExchangeScore then
  begin
    Result:='积分兑换余额';
  end;

  if ARuleType=Const_RuleType_InviteRegister then
  begin
    Result:='邀请好友注册';
  end;

  if ARuleType=Const_RuleType_Register then
  begin
    Result:='新用户注册奖励';
  end;

  if ARuleType=Const_RuleType_InvestScore then
  begin
    Result:='积分充值';
  end;

  if ARuleType=Const_RuleType_BuyStock then
  begin
    Result:='购买股份赠送';
  end;
  if ARuleType=Const_RuleType_BuyStockGiftPhoneBalance then
  begin
    Result:='购买股份赠送话费余额';
  end;
  if ARuleType=Const_RuleType_RegisterGiftPhoneBalance then
  begin
    Result:='注册赠送话费';
  end;
  if ARuleType=Const_RuleType_ScoreExchangePhoneBalance then
  begin
    Result:='积分兑换话费规则';
  end;
  if ARuleType=Const_RuleType_MoneyExchangePhoneBalance then
  begin
    Result:='金额兑换话费规则';
  end;
  if ARuleType=Const_RuleType_RechargePhoneBalance then
  begin
    Result:='话费充值';
  end;
  if ARuleType=Const_RuleType_UserSignIn then
  begin
    Result:='每日签到';
  end;
  if ARuleType=Const_RuleType_ActivityScore then
  begin
    Result:='活动奖励积分';
  end;
  if ARuleType=Const_RuleType_ScoreExchange then
  begin
    Result:='积分兑换';
  end;
  if ARuleType=Const_RuleType_ChangeNickName then
  begin
    Result:='修改昵称';
  end;
  if ARuleType=Const_RuleType_SuggestionAuditPass then
  begin
    Result:='意见被采纳';
  end;
  if ARuleType=Const_RuleType_ComplainAuditPass then
  begin
    Result:='投诉被采纳';
  end;
  if ARuleType=Const_RuleType_TipContent then
  begin
    Result:='打赏内容';
  end;
  if ARuleType=Const_RuleType_BrickContent then
  begin
    Result:='拍砖内容';
  end;
  if ARuleType=Const_RuleType_TipBrickSettle then
  begin
    Result:='打赏拍砖结算';
  end;

end;


function GetUploadFilePath(AAppID:String;
                           AFileDir:String
                          ):String;
begin
  Result:='Upload'+'\'
                  +(AAppID)+'\'
                  +AFileDir+'\'
                  +FormatDateTime('YYYY',Now)+'\'
                  +FormatDateTime('YYYY-MM-DD',Now)+'\';
end;

function GetSexStr(ASex:Integer):String;
begin
  Result:='';
  if ASex=0 then
  begin
    Result:=('先生');
  end
  else if ASex=1 then
  begin
    Result:=('女士');
  end;
end;

//function GetDeliverMethod(AMethod:Integer):String;
//begin
//  Result:='';
//  if AMethod=0 then
//  begin
//    Result:=('不配送');
//  end
//  else if AMethod=1 then
//  begin
//    Result:=('平台配送');
//  end
//  else if AMethod=3 then
//  begin
//    Result:=('快递');
//  end
//  else
//  begin
//    Result:=('商家自己配送');
//  end;
//end;

function GetExechangeState(AAuditState:TAuditState;AProcessState:TProcessState):String;
begin
  Result:='';

  case AAuditState of
    asRequestAudit: Result:='待审核';
    asAuditReject: Result:='审核拒绝';
    asAuditPass:
    begin
      case AProcessState of
        asRequestProcess: Result:='待处理';
        asProcessPass: Result:='处理成功';
        asProcessReject: Result:='处理拒绝';
      end;
    end;
  end;



end;

function GetRuleType(ATuleType:String):String;
begin
  Result:='';

  if ATuleType=Const_RuleType_Register then Result:=('注册');
  if ATuleType=Const_RuleType_InviteRegister then Result:=('邀请好友注册');
  if ATuleType=Const_RuleType_ConsumeMoney then Result:=('消费');
  if ATuleType=Const_RuleType_MyManConsumeMoney then Result:=('邀请的好友消费赠送积分');
  if ATuleType=Const_RuleType_DelayDailyGiftLeft then Result:=('分期每天赠送剩余积分');
  if ATuleType=Const_RuleType_CommentOrder then Result:=('下单评论');
  if ATuleType=Const_RuleType_ExchangeScore then Result:=('积分兑换');
  if ATuleType=Const_RuleType_AuditFailReback then Result:=('积分兑换申请审核失败,返还');
  if ATuleType=Const_RuleType_ProcessFailReback then Result:=('积分兑换申请处理失败,返还');

end;

function GetCoopSchemeDeliverTypeStr(ACoopSchemeDeliverType:TCoopSchemeDeliverType):String;
begin
  case ACoopSchemeDeliverType of
    dtNone: Result:=('不配送');
    dtExpress: Result:=('平台专送');
    dtSelf: Result:=('自己配送');
    dtPosting: Result:=('快递');
  end;
end;

function GetDeliverTypeStr(ADeliverType:String):String;
begin
  Result:='';
  if ADeliverType=Const_DeliverType_EatInShop then Result:=('堂食');
  if ADeliverType=Const_DeliverType_SelfTake then Result:=('自取');
  if ADeliverType=Const_DeliverType_NeedDeliver then Result:=('需要配送');
  if ADeliverType=Const_DeliverType_Express then Result:=('快递');

end;

function GetBillMoneyType(AMoneyType:String):String;
begin
  Result:='';

  if AMoneyType=Const_MoneyType_Income then Result:=('收入');
  if AMoneyType=Const_MoneyType_Consume then Result:=('消费');
  if AMoneyType=Const_MoneyType_Withdraw then Result:=('提现');
  if AMoneyType=Const_MoneyType_Refund then Result:=('退款');
  if AMoneyType=Const_MoneyType_Compensate then Result:=('赔付');
  if AMoneyType=Const_MoneyType_Reback then Result:=('返还');
  if AMoneyType=Const_MoneyType_ServiceFee then Result:=('扣除服务费');
  if AMoneyType=Const_MoneyType_Score_Exchange then Result:=('积分兑换');
  if AMoneyType=Const_MoneyType_MyManConsumeMoney then Result:=('邀请的好友消费赠送余额');
  if AMoneyType=Const_MoneyType_PayForPush then Result:=('商家付费推送消息');
  if AMoneyType=Const_MoneyType_StockShareDividend then Result:=('股东分红赠送');
  if AMoneyType=Const_MoneyType_StockGiftToIntroducer then Result:=('邀请股东赠送');


end;

function GetActivityName(AType:String):String;
begin
  Result:='';

  if AType=Const_Activity_Type_Full then
  begin
    Result:=('满减活动');
  end
  else if AType=Const_Activity_Type_Special then
  begin
    Result:=('特价活动');
  end
  else if AType=Const_Activity_Type_Discount then
  begin
    Result:=('打折活动');
  end
  else if AType=Const_Activity_Type_Coupon then
  begin
    Result:=('红包');
  end
  else
  begin
    Result:=AType;
  end;

end;

//function GetNoticeCalssifyName(ANoticeCalssify:String):String;
//begin
//  Result:='';
//  if ANoticeCalssify=Const_NoticeCalssify_System then Result:=('系统公告');
//  if ANoticeCalssify=Const_NoticeCalssify_Order then Result:=('订单消息');
////  if ANoticeCalssify=Const_NoticeCalssify_Account then Result:=('账号消息');
//  if ANoticeCalssify=Const_NoticeCalssify_Other then Result:=('其他消息');
//  if ANoticeCalssify=Const_NoticeCalssify_Mail then Result:=('站内信');
//end;

function GetAuditStateStr(AAuditState:TAuditState;AAuditType:String):String;
begin
  //用户审核状态
  //实名认证状态
  if AAuditType='cert_audit' then
  begin
    case AAuditState of
      asRequestAudit: Result:=('待实名审核');
      asDefault: Result:=('实名未审核');
      asAuditPass: Result:=('实名通过');
      asAuditReject: Result:=('实名审核拒绝');
    end;
  end
  else //if (AAuditType='') or (AAuditType='audit') then
  begin
    case AAuditState of
      asRequestAudit: Result:=('待审核');
      asDefault: Result:=('未审核');
      asAuditPass: Result:=('审核通过');
      asAuditReject: Result:=('审核拒绝');
    end;
  end
end;

function GetProcessStateStr(AProcessState:TProcessState):String;
begin
  case AProcessState of
    asRequestProcess: Result:=('等待处理');
    asProcessDefault: Result:=('未处理');
    asProcessPass: Result:=('处理成功');
    asProcessReject: Result:=('处理失败');
  end;
end;

function GetPaymentTypeStr(APaymentType:String):String;
begin
  //默认
  Result:=APaymentType;
  if APaymentType=Const_PaymentType_BankTranser then Result:=('线下转账');
  if APaymentType=Const_PaymentType_WeiXinPay then Result:=('微信支付');
  if APaymentType=Const_PaymentType_Alipay then Result:=('支付宝支付');
  if APaymentType=Const_PaymentType_Pxpay then Result:=('Pxpay支付');
  if APaymentType=Const_PaymentType_Stripepay then Result:=('Stripe支付');
  if APaymentType=Const_PaymentType_Polipay then Result:=('Polipay支付');
  if APaymentType=Const_PaymentType_AccountBalance then Result:=('余额支付');
  if APaymentType=Const_PaymentType_CashOnDelivery then Result:=('货到付款');

  if APaymentType=Const_PaymentType_CashOnDelivery then Result:=('货到付款');
  if APaymentType=Const_PaymentType_PayAtStore then Result:=('到店付');
  if APaymentType=Const_PaymentType_PosDebitCard then Result:=('POS机刷借记卡');
  if APaymentType=Const_PaymentType_PosCreditCard then Result:=('POS机刷信用卡');
  if APaymentType=Const_PaymentType_PaymentCreditCard then Result:=('PxPay刷信用卡');
  if APaymentType=Const_PaymentType_PaymentDebitCard then Result:=('PxPay刷借记卡');
end;

function GetUserOrderStateStr(AOrderState:String;AHasRider:Boolean=True):String;
begin
//  Result:=AOrderState;
  Result:='';

  if AOrderState=Const_OrderState_WaitPay then Result:=('待付款');
  if AOrderState=Const_OrderState_Cancelled then Result:=('已取消');
  if AOrderState=Const_OrderState_Payed then Result:=('已付款,待商家接单');
  if AOrderState=Const_OrderState_Accepted then Result:=('商家已接单');
  if AOrderState=Const_OrderState_Reject then Result:=('商家拒单');

  if AHasRider then
  begin
    if AOrderState=Const_OrderState_Sent then Result:=('商家已出餐');

    //次要状态
    if AOrderState=Const_OrderState_Shoper_Finish_Goods then Result:=('商家已出餐');


    //有骑手端时打开
    if AOrderState=Const_OrderState_Rider_Accept_Order then Result:=('骑手已接单');
    if AOrderState=Const_OrderState_Rider_At_Sender then Result:=('骑手已到店');
    if AOrderState=Const_OrderState_Rider_Take_Goods then Result:=('骑手已取货');
    if AOrderState=Const_OrderState_Rider_Sending then Result:=('骑手派送中');
    if AOrderState=Const_OrderState_Rider_Arrived then Result:=('骑手已送达');

  end
  else
  begin
    //亿诚生活  商家就是骑手    加了骑手端
    if AOrderState=Const_OrderState_Sent then Result:=('商家已发货');

    //次要状态
    //有骑手端时注释
    if AOrderState=Const_OrderState_Shoper_Finish_Goods then Result:=('商家已发货');
    if AOrderState=Const_OrderState_Rider_Accept_Order then Result:=('商家已出发');
    if AOrderState=Const_OrderState_Rider_At_Sender then Result:=('商家已出发');
    if AOrderState=Const_OrderState_Rider_Take_Goods then Result:=('商家已出发');
    if AOrderState=Const_OrderState_Rider_Sending then Result:=('商家已出发');
    if AOrderState=Const_OrderState_Rider_Arrived then Result:=('商家已送达');
    //------

    //这个状态  平台商家 发货应该还要用
    if AOrderState=Const_OrderState_User_Accept then Result:=('用户确认收货');

    if AOrderState=Const_OrderState_shoper_pending_order then Result:=('待骑手接单');

  end;
  //有骑手端时打开
//  if AOrderState=Const_OrderState_Rider_Accept_Order then Result:=('骑手已接单');
//  if AOrderState=Const_OrderState_Rider_At_Sender then Result:=('骑手已到店');
//  if AOrderState=Const_OrderState_Rider_Take_Goods then Result:=('骑手已取货');
//  if AOrderState=Const_OrderState_Rider_Sending then Result:=('骑手派送中');
//  if AOrderState=Const_OrderState_Rider_Arrived then Result:=('骑手已送达');




  if AOrderState=Const_OrderState_Done then Result:=('已完成');

  if AOrderState=Const_OrderState_PayTillDown then Result:=('待商家接单');

end;

function GetUserDeliveryOrderStateStr(AOrderState:String):String;
begin
//  Result:=AOrderState;
  Result:='';

  if AOrderState=Const_OrderState_WaitPay then Result:=('待付款');
  if AOrderState=Const_OrderState_Cancelled then Result:=('已取消');
  if AOrderState=Const_OrderState_Payed then Result:=('待骑手接单');
  if AOrderState=Const_OrderState_Accepted then Result:=('待骑手取货');
  if AOrderState=Const_OrderState_Reject then Result:=('订单被拒绝');

  if AOrderState=Const_OrderState_Rider_Sending then Result:=('骑手派送中');
  if AOrderState=Const_OrderState_Rider_At_Sender then Result:=('骑手已到店');
  if AOrderState=Const_OrderState_Rider_Take_Goods then Result:=('骑手已取货');
  if AOrderState=Const_OrderState_Rider_Arrived then Result:=('骑手已送达');

  if AOrderState=Const_OrderState_Sent then Result:=('骑手派送中');
  if AOrderState=Const_OrderState_Done then Result:=('已完成');

end;

function GetRiderDeliveryOrderStateStr(AOrderState:String):String;
begin
//  Result:=AOrderState;
  Result:='';

  if AOrderState=Const_OrderState_WaitPay then Result:=('待付款');
  if AOrderState=Const_OrderState_Cancelled then Result:=('已取消');
  if AOrderState=Const_OrderState_Payed then Result:=('待接单');
  if AOrderState=Const_OrderState_PayTillDown then Result:=('待接单');
  
  if AOrderState=Const_OrderState_Accepted then Result:=('待取货');
  if AOrderState=Const_OrderState_Reject then Result:=('订单被拒绝');

  if AOrderState=Const_OrderState_Rider_Arrived then Result:=('已到达');
  if AOrderState=Const_OrderState_Rider_At_Sender then Result:=('已到店');
  if AOrderState=Const_OrderState_Rider_Take_Goods then Result:=('已取货');
  if AOrderState=Const_OrderState_Rider_Sending then Result:=('配送中');

  if AOrderState=Const_OrderState_Sent then Result:=('配送中');

  if AOrderState=Const_OrderState_Done then Result:=('已完成');

end;

function GetPayStateStr(APayState:String):String;
begin
  Result:='';
//const
//  //付款状态,要用小写,在url要用到//
//  //未付款
//  Const_PayState_WaitPay='wait_pay';
//  //已付款
//  Const_PayState_Payed='payed';
//  //付款失败
//  Const_PayState_PayFail='pay_fail';
  if APayState=Const_PayState_WaitPay then Result:=('未付款');
  if APayState=Const_PayState_Payed then Result:=('已付款');
  if APayState=Const_PayState_PayTillDone then Result:=('待付款');
  if (APayState=Const_PayState_Refunded)
      or (APayState='refuned') then Result:=('已退款');


//  if APayState=Const_PayState_PayFail then Result:=('付款失败');
//  if APayState=Const_PayState_NoNeedPay then Result:=('不需要付款');
end;

//获取通知标题及内容
function GetNoticeTitleAndContent(APart:String;      //获取内容还是标题
                                  ANoticeType:string;//通知类型
                                  ASelfData:String=''//部分动态变化的内容
                                  ):String;
begin
  Result:='';
  //暂时没用到的
  //账号注册成功
  //if ANoticeType=Const_NoticeSubType_UserRegSucc then Result:='';
  //订单审核结果
  //if ANoticeType=Const_NoticeSubType_OrderAuditResult then Result:='';

  //暂时不共用的
  //商家接单后通知骑手
  //if ANoticeType=Const_NoticeSubType_OrderAcceptNoticeRider then Result:='';
  //骑手到店
  //if ANoticeType=Const_NoticeSubType_RiderArrivedShop then Result:='';
  //下级下单通知介绍人
  //Const_NoticeSubType_GetCommission='get_commission';
  //订单完成
  //if ANoticeType=Const_NoticeSubType_OrderDone then Result:='';

  //不同的部分在代码中区分了   还有一部分是通用的
  //商家接单后通知买家
  //if ANoticeType=Const_NoticeSubType_OrderAccept then Result:='';

  //骑手接单通知商家或用户
  //if ANoticeType=Const_NoticeSubType_RiderAccept then Result:='';

  //通用的部分
  //商家接单后取消订单通知买家
  //if ANoticeType=Const_NoticeSubType_OrderAcceptAndCancelled then Result:='';
  //入驻申请或店铺信息修改结果
  //if ANoticeType=Const_NoticeSubType_RequestAuditResult then Result:='';
  //订单已发货
  //if ANoticeType=Const_NoticeSubType_OrderDeliver then Result:='';
  //账号审核结果
  //if ANoticeType=Const_NoticeSubType_UserAuditResult then Result:='';
  //订单被拒
  //if ANoticeType=Const_NoticeSubType_OrderReject then Result:='';
  //订单确认收货后通知用户
  //if ANoticeType=Const_NoticeSubType_OrderReceived_NoticeUser then Result:='';


  {$IFDEF NZ}
  //外卖
  if APart=Const_NoticePart_Content then
  begin
    //订单确认收货后通知店家
    if ANoticeType=Const_NoticeSubType_OrderReceived_NoticeShoper then Result:='用户已确认收货,请及时查看账户金额';
    //订单付款成功后通知店家
    if ANoticeType=Const_NoticeSubType_OrderPayed_NoticeShoper then Result:='您有一条新的外卖订单，请及时处理。';
  end;
  {$ENDIF NZ}



  {$IFDEF YC}
  //亿诚生活
  if APart=Const_NoticePart_Content then
  begin
    //订单确认收货后通知店家
    if ANoticeType=Const_NoticeSubType_OrderReceived_NoticeShoper then Result:='订单已完成,请及时查看账户金额';
    //订单付款成功后通知店家
    if ANoticeType=Const_NoticeSubType_OrderPayed_NoticeShoper then Result:='您有一条新订单，请及时处理。';
  end;
  {$ENDIF YC}
end;

{ TBaseManager }



end.



