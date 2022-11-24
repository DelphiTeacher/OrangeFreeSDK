
unit uOpenClientCommon;


interface


{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}



//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}

uses
  Classes,
  SysUtils,
  IniFiles,
  Types,
//  UITypes,
//  uConst,

  DateUtils,


//  FMX.Types,
  uLang,

  {$IFDEF FMX}
  uDrawPicture,
  {$ENDIF}

  uBaseLog,
  Variants,
  IdURI,
  StrUtils,

//  uThumbCommon,
  uFuncCommon,
  uFileCommon,
  uBaseList,
  uDataSetToJson,

  {$IFDEF OPEN_PLATFORM_SERVER}
    //在开放平台服务端中使用
  {$ELSE}
      //在开放平台客户端中使用
    //  {$IF CompilerVersion > 21.0} // XE or older
      uGPSUtils,
    //  {$IFEND}
  {$ENDIF}

//  uOpenClientCommon,


  {$IF CompilerVersion <= 21.0} // XE or older
  SuperObject,
  superobjecthelper,
  {$ELSE}
    {$IFDEF SKIN_SUPEROBJECT}
    uSkinSuperObject,
    {$ELSE}
    XSuperObject,
    XSuperJson,
    {$ENDIF}
  {$IFEND}



//  uOpenCommon,
  uOpenCommon;




  {$IFDEF OPEN_PLATFORM_SERVER}
  //在开放平台服务端中使用
  {$ELSE}
  //在开放平台客户端中使用
type

  TImageType=(itNone,
              //用户头像
              itUserHead,
              itUserHeadMale,
              itUserHeadFemale
              );

  {$REGION '用户TUser'}
  TUser=class(TBaseJsonObject)
  public
    //wn
    fid:String;//Int64;//64,


//    //appid:Int64;//1002,
    email:String;//"",
    phone:String;//"18957901025",
//    password:String;//"123456",
    name:String;//"用户王能",
    name_s:String;//"",
    isvip:Int64;//0,
    age:Int64;//0,
    head_pic_path:String;//"",
    cert_audit_state:Int64;//0,
    sex:Int64;//0,
    user_type:Int64;//0,
    register_type:String;//"phone_num",

//    birth:String;
//    sign:string;

    wx_auth_code:String;//"",
    wx_union_id:String;//"",
    wx_open_id:String;//"",
    wx_auth_token:String;//"",

    alipay_open_id:String;//"",
    alipay_auth_token:String;//"",

    apple_open_id:String;
    apple_auth_token:String;


    fb_auth_code:String;//"",
    fb_open_id:String;//"",
    fb_auth_token:String;//"",


    tw_auth_code:String;//"",
    tw_open_id:String;//"",
    tw_auth_token:String;//"",


    score:Double;//0,
    is_deleted:Int64;//0,
    createtime:String;//"2018-03-29 09:57:27",
    is_active:Int64;//0

    notice_unread_count:Int64;//14,

    key:String;

    second_contactor_name:String;
    second_contactor_phone:String;


    fastmsg_user_id:Integer;

    followers_count:Integer;
    friends_count:Integer;
    published_news_count:Integer;

    published_community_count:Integer;
    published_group_count:Integer;


    Json:ISuperObject;
  private
    procedure AssignTo(Dest: TPersistent);override;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    function GetHeadPicUrl: String;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TUserList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TUser;
  public
    function GetArray: TStringDynArray;
    property Items[Index:Integer]:TUser read GetItem;default;
  end;
  {$ENDREGION}


  {$REGION '实名信息TUserCertInfo'}
  //用户实名认证信息
  TUserCertInfo=class(TBaseJsonObject)
  public
    fid:Int64;
    //appid:Int64;
    user_fid:String;

    id_type:Int64;
    id_code:String;//"",
    id_front_picpath:String;//"",

    audit_user_fid:String;
    audit_state:Int64;
    audit_time:String;
    audit_remark:String;
    createtime:String;
  public
    function GetIDFrontPicUrl: String;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  {$ENDREGION}


  {$REGION '活动商品'}

  //活动商品
  TGoodsInfo=class(TBaseJsonObject)
  public
   fid:Int64;
   //appid:Int64;
   shop_fid:Int64;
   shop_promotion_fid:Int64;
   shop_goods_fid:Int64;
   goods_name:String;
   goods_pic1_path:String;
   shop_goods_spec_fid:Integer;
   special_price:Double;
   origin_price:Double;
   discount:Double;
   daily_max_count:Int64;
   used_sum_count:Int64;
   start_enjoy_count:Int64;
   is_deleted:Int64;
   createtime:String;
  public
    function ParseFromJson(AJson:ISuperObject): Boolean;Override;
  public
    function GetGoodsPic1Url: String;
  end;
  TGoodsInfoList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TGoodsInfo;
  public
    function FindItemByFID(AFID:Integer):TGoodsInfo;
    property Items[Index:Integer]:TGoodsInfo read GetItem;default;
  end;
  {$ENDREGION '活动商品'}


  {$REGION '通知'}
  //通知
  TNotice=class(TBaseJsonObject)
  public
    fid:Int64;//1,
    //appid:Int64;//1001,
    sender_fid:Int64;
    notice_classify:String;
    notice_sub_type:String;
    caption:String;

    content:String;
    content_html_filepath:String;
    content_url:String;

    custom_data_json:String;
    createtime:String;
    is_deleted:Int64;

    is_readed:Int64;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TNoticeList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TNotice;
  public
    property Items[Index:Integer]:TNotice read GetItem;default;
  end;

  //通知分类
  TNoticeClassify=class(TBaseJsonObject)
  public
    notice_classify:String;
    classify_desc:String;
//    notice_classify_count:Int64;
//    notice_classify_name:String;
    notice_classify_caption:String;
    notice_classify_unread_count:Int64;
//    RecentNotice:TNotice;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  public
    constructor Create;override;
    destructor Destroy;override;
  end;

  TNoticeClassifyList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TNoticeClassify;
  public
    property Items[Index:Integer]:TNoticeClassify read GetItem;default;
  end;
  {$ENDREGION '通知'}


  {$REGION '用户银行卡'}
  //用户银行卡
  TBankCard=Class(TBaseJsonObject)
  public
    fid:Int64;//1,
    //appid:Int64;//1001,
    name:String;
    bankname:String;
    account:String;
    createtime:String;
    is_default:Int64;
    is_deleted:Int64;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TBankCardList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TBankCard;
  public
    property Items[Index:Integer]:TBankCard read GetItem;default;
  end;

  {$ENDREGION}


  {$REGION '用户收货地址列表'}
  //用户收货地址列表
  TUserRecvAddr=class(TBaseJsonObject)
  public
    fid:Int64;//4,
    //appid:Int64;//1001,
    user_fid:String;//9,
    name:String;//"1",
    sex:Integer;

    latitude:Double;
    longitude:Double;

    tag:String;
    is_deleted:Integer;

    country:String;
    phone:String;//"18957901025",
    addr:String;//"rrrrrrrr",

    street:String; //"",
    building:String; //"",
    addr_line3:String;// "",
    postcode:String;// "",

    createtime:String;//"2017-07-18 17:04:31",
    is_default:Int64;//1,
    province:String;//"",
    city:String;//""
    area:String;//"",
//    door_no:String;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
    function GetArea:String;
    function GetLongAddr:String;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TUserRecvAddrList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TUserRecvAddr;
  public
    //获取默认的收货地址
    function GetDefaultRecvAddr:TUserRecvAddr;
    //获取离商家最近的收货地址
    function GetNearestRecvAddr(AShopLongitude:Double;//商家的位置
                                AShopLatitude:Double;
                                AShopMaxDeliveryDistance:Double;//商家的配送最大范围
                                AMyLongitude:Double;//我的位置
                                AMyLatitude:Double
                                ):TUserRecvAddr;
    property Items[Index:Integer]:TUserRecvAddr read GetItem;default;
  end;
  {$ENDREGION '用户收货地址列表'}




  {$REGION '活动'}
  //活动
  TActivity=class(TBaseJsonObject)
  public
    fid:Int64;//2,
    //appid:Int64;//1002,
    shop_fid:Int64;//1,
    promotion_type:String;//"满减活动",
    name:String;//"优惠活动XXX",
    start_date:String;//"",
    end_date:String;//"2018-04-01 00:00:00",
    start_time:String;//"",
    end_time:String;//"",
    weekdays_mon:Int64;//1,
    weekdays_tue:Int64;//1,
    weekdays_wed:Int64;//1,
    weekdays_thu:Int64;//1,
    weekdays_fri:Int64;//1,
    weekdays_sat:Int64;//1,
    weekdays_sun:Int64;//1,
    dec_money:Double;//1.25,
    special_price:Double;
    discount:Double;//2.1,
    full_money1:Double;//20.1,
    dec_money1:Double;//5.1,
    full_money2:Double;//30.1,
    dec_money2:Double;//6.1,
    full_money3:Double;//40.1,
    dec_money3:Double;//7.1,
    is_share:Int64;//0,
    can_repeat_count:Int64;//1,
    is_new_user:Int64;//0,
    used_sun_count:Int64;//0,
    daily_count_per_user:Int64;//1,
//    is_coupon:Int64;//0,
    valid_time:Int64;//0,
    coupon_max_count:Int64;//0,
    geted_coupon_count:Int64;//0,
    used_coupon_count:Int64;//0,
    platform_promotion_fid:Int64;//1,
    subsidy:Double;//5.2,
    is_deleted:Int64;//0,
    createtime:String;//"2018-03-28 09:48:36",


    is_taked:Int64;

    //是否可以领取
    is_can_take:Int64;
    user_taked_count:Int64;
    today_user_taked_count:Int64;


    GoodsInfo:TGoodsInfoList;//[],
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TActivityList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TActivity;
  public
    function FindItemByFID(AFID:Integer):TActivity;
    property Items[Index:Integer]:TActivity read GetItem;default;
  end;
  {$ENDREGION '活动'}


  {$REGION '商品规格'}
  TShopGoodsSpec=class(TBaseJsonObject)
  public
    fid:Int64;//9,
    //appid:Int64;//1002,
    shop_fid:Int64;//4,
    shop_goods_fid:Int64;//15,
    name:String;//"default",
    price:Double;//15.5,
    special_price:Double;
    origin_price:Double;
    packing_fee:Double;//2,
    stock:Int64;//100,
    max_stock:Int64;//300,
    is_default:Int64;//1,
    is_offsell:Int64;//0,
    orderno:Double;//0,
    is_deleted:Int64;//0,
    createtime:String;//"2018-03-19 14:18:07" ,
    goodunit:String;//,
    small_unit:String;
    small_unit_number:Integer;

    display_origin_price:Double;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
    function GetDataJson:ISuperObject;
  end;
  TShopGoodsSpecList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TShopGoodsSpec;
  public
    function FindItemByFID(AFID:Integer):TShopGoodsSpec;
    property Items[Index:Integer]:TShopGoodsSpec read GetItem;default;
  end;
  {$ENDREGION '商品规格'}


  {$REGION '商品属性'}
  //商品属性
  TShopGoodsAttr=class(TBaseJsonObject)
  public
    fid:Int64; //7,
    //appid:Int64; //1002,
    shop_fid:Int64; //4,
    shop_goods_fid:Int64; //23,
    name:String; //"辣度",
    value_list:String; //"微辣、中辣、重辣",
    orderno:Double; //0,
    is_deleted:Int64; //0,
    createtime:String; //"2018-03-22 11:21:16"
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
    function GetDataJson:ISuperObject;
  end;
  TShopGoodsAttrList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TShopGoodsAttr;
  public
    function FindItemByFID(AFID:Integer):TShopGoodsAttr;
    property Items[Index:Integer]:TShopGoodsAttr read GetItem;default;
  end;
  {$ENDREGION '商品属性'}


  {$REGION '商品'}
  //商品
  TShopGoods=class(TBaseJsonObject)
  public
    fid:Int64;//11,
    //appid:Int64;//1002,
    shop_fid:Int64;//4,
    shop_goods_category_fid:Int64;//0,
    name:String;//"aa",
    name_s:String;//"AA",
    name_s_f:String;//"A A",
    goods_desc:String;//"bb",
    speical_desc:String;//"",
    is_deleted:Int64;//0,
    orderno:Double;//0,
    createtime:String;//"2018-03-19 10:36:59",
    month_sales:Int64;//0,
    month_rating:Double;//0,
    all_sold_num:Int64;//0,
    all_rating:Double;//0,
    rating_count:Int64;//0,
    satisfy_rate:Double;//0,
    satisfy_count:Int64;//0,
    is_featured:Int64;//0,
    is_gum:Int64;//0,
    is_new:Int64;//0,
    is_spicy:Int64;//0,
    is_not_for_minor:Int64;//0,
    length:Double;//10,
    width:Double;//20,
    height:Double;//30,
    weight:Double;//3,

    pic1_path:String;//"",
    pic2_path:String;// "",
    pic3_path:String;// "",
    pic4_path:String;// "",
    pic5_path:String;// "",
    pic6_path:String;// "",
    pic7_path:String;// "",
    pic8_path:String;// "",
    pic9_path:String;// "",

    desc_pic1_path:String;// "",
    desc_pic2_path:String;// "",
    desc_pic3_path:String;// "",
    desc_pic4_path:String;// "",
    desc_pic5_path:String;// "",
    desc_pic6_path:String;// "",
    desc_pic7_path:String;// "",
    desc_pic8_path:String;// "",
    desc_pic9_path:String;// "",
    desc_pic10_path:String;// "",

    factory:String;

    GoodsSpecList:TShopGoodsSpecList;
    GoodsAttrList:TShopGoodsAttrList;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  public
    function GetPic1Url: String;
    function GetPic2Url: String;
    function GetPic3Url: String;
    function GetPic4Url: String;
    function GetPic5Url: String;
    function GetPic6Url: String;
    function GetPic7Url: String;
    function GetPic8Url: String;
    function GetPic9Url: String;
  public
    function GetDescPic1Url:String;
    function GetDescPic2Url:String;
    function GetDescPic3Url:String;
    function GetDescPic4Url:String;
    function GetDescPic5Url:String;
    function GetDescPic6Url:String;
    function GetDescPic7Url:String;
    function GetDescPic8Url:String;
    function GetDescPic9Url:String;
    function GetDescPic10Url:String;
  end;
  TShopGoodsList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TShopGoods;
  public
    function FindItemByFID(AFID:Integer):TShopGoods;
    property Items[Index:Integer]:TShopGoods read GetItem;default;
  end;
  {$ENDREGION '商品'}


  {$REGION '商品分类-子类'}
  TSubRecord=class(TBaseJsonObject)
  public
    fid:Int64;//1,
    //appid:Int64;//1001,
    shop_fid:Int64;
    name:String;//"酒店大堂用品",
    category_desc:String;//"酒店大堂用品",
    orderno:Double;//"",
    createtime:String;//"2017-07-22 13:04:01",
    goods_list:TShopGoodsList;
  public
    function ParseFromJson(AJson:ISuperObject): Boolean;Override;
  public
    constructor Create;override;
    destructor Destroy;override;
  end;
  TSubRecordList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TSubRecord;
  public
    function FindItemByFID(AFID:Integer):TSubRecord;
    property Items[Index:Integer]:TSubRecord read GetItem;default;
    //把商品列表分类
    procedure Category(AShopGoodsList:TShopGoodsList);
  end;
  {$ENDREGION '商品分类-子类'}



  {$REGION '商品分类'}
  //商品分类
  TShopGoodsCategory=class(TBaseJsonObject)
  public
    fid:Int64;//1,
    //appid:Int64;//1001,
    shop_fid:Int64;
    name:String;//"酒店大堂用品",
    name_color:String;//分类颜色
    category_desc:String;//"酒店大堂用品",
    orderno:Double;//"",
    createtime:String;//"2017-07-22 13:04:01",
    goods_list:TShopGoodsList;

    SubRecordList:TSubRecordList;

  public
    function ParseFromJson(AJson:ISuperObject): Boolean;Override;
  public
    constructor Create;override;
    destructor Destroy;override;
  end;
  TShopGoodsCategoryList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TShopGoodsCategory;
  public
    function FindItemByFID(AFID:Integer):TShopGoodsCategory;
    property Items[Index:Integer]:TShopGoodsCategory read GetItem;default;
    //把商品列表分类
    procedure Category(AShopGoodsList:TShopGoodsList);
  end;
  {$ENDREGION '商品分类'}




  {$REGION '店铺'}
  //店铺
  TShop=class(TBaseJsonObject)
  public
    fid:Int64;
    //appid:Int64;
    user_fid:String;
    request_fid:Int64;
    is_deleted:Int64;
    createtime:String;
    is_open:Int64;
    status:Int64;
    is_collected:Int64;
    close_reason:String;
    app_business_category_fid:Int64;
    app_business_category_name:String;
    phone:String;
    name:String;
    deliver_phone:String;
    recv_sms_phone:String;

    contact_name:String;
    shop_desc:String;
    flavors:String;

    has_lot_goods:Int64;


    logo_pic_path:String;
    door_face_pic_path:String;
    inner_pic_path1:String;
    inner_pic_path2:String;
    inner_pic_path3:String;

    promotion_info:String;




    mon_start_time:String;// "2018-08-04 13:20:00",
    mon_end_time:String;// "2018-08-04 23:59:00",
    mon_is_sale:Int64;// 0,

    tues_start_time:String;// "",
    tues_end_time:String;// "",
    tues_is_sale:Int64;// 0,

    wed_start_time:String;// "",
    wed_end_time:String;// "",
    wed_is_sale:Int64;// 0,

    thur_start_time:String;// "",
    thur_end_time:String;// "",
    thur_is_sale:Integer;// 0,

    fri_start_time:String;// "",
    fri_end_time:String;// "",
    fri_is_sale:Integer;// 0,

    sat_start_time:String;// "",
    sat_end_time:String;// "",
    sat_is_sale:Integer;// 0,

    sun_start_time:String;// "",
    sun_end_time:String;// "",
    sun_is_sale:Int64;// 0,





    mon_start_time2:String;// "2018-08-04 13:20:00",
    mon_end_time2:String;// "2018-08-04 23:59:00",
    mon_is_sale2:Int64;// 0,

    tues_start_time2:String;// "",
    tues_end_time2:String;// "",
    tues_is_sale2:Int64;// 0,

    wed_start_time2:String;// "",
    wed_end_time2:String;// "",
    wed_is_sale2:Int64;// 0,

    thur_start_time2:String;// "",
    thur_end_time2:String;// "",
    thur_is_sale2:Integer;// 0,

    fri_start_time2:String;// "",
    fri_end_time2:String;// "",
    fri_is_sale2:Integer;// 0,

    sat_start_time2:String;// "",
    sat_end_time2:String;// "",
    sat_is_sale2:Integer;// 0,

    sun_start_time2:String;// "",
    sun_end_time2:String;// "",
    sun_is_sale2:Int64;// 0,






    is_public_holiday_sale:Int64;// 0,


    is_bookable:Int64;
    can_book_days:Int64;
    is_invoice:Int64;
    invoice_min_amount:Double;

    province:String;
    city:String;
    area:String;
    addr:String;
    street:String; //"",
    building:String; //"",
    addr_line3:String;// "",
    postcode:String;// "",

    latitude:Double;
    longitude:Double;

    agent_deliver_fee:Double;
    no_agent_fee_order_total:Double;
    deliver_min_order_amount:Double;
    deliver_max_distance:Double;

    bankcard_name:String;
    bankcard_bankname:String;
    bankcard_account:String;

    app_coop_scheme_fid:Int64;
    app_service_fee_rate:Double;
    app_deliver_fee:Double;
    app_deliver_type:Int64;
    city_code:String;
    region_code:String;

    poundage_undertaker:String;

    delivery_fee:Double;

    make_food_spent:Integer;

    is_support_coupon:Int64;
    is_new:Int64;
    num_ratings:Double;
    all_order_num:Int64;
    all_goods_num:Int64;
    recent_order_num:Int64;
    recent_goods_popularity:Int64;

    rating_score:Double;
    service_rating_score:Double;
    goods_rating_score:Double;

    deliver_time_spent:Int64;
    credit_score:Int64;

    app_coop_scheme_name:String;

    is_can_takeorder_and_delivery:Int64;
    is_can_takeorder_but_only_self_take:Int64;
    is_can_takeorder_but_only_eat_in_shop:Int64;

    audit_user_fid:String;
    audit_state:Int64;
    audit_remark:String;
    audit_time:String;

    is_platform_shop:Int64;

    min_posting_price:Double;
    is_need_posting_price:Int64;   //0 不包邮  1 包邮

    is_pay_goods_money_online:Int64;

    distance:Integer;

    ShopGoodsCategoryList:TShopGoodsCategoryList;

    ShopGoodsList:TShopGoodsList;

    ShopPromotionList:TActivityList;

  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    //获取图片url
    function Getlogopicpath:String;
    function Getdoorfacepicpath: String;
    function Getinnerpicpath1: String;
    function Getinnerpicpath2: String;
    function Getinnerpicpath3: String;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  public
    //清除
    procedure Clear;
  end;
  TShopList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TShop;
  public
    property Items[Index:Integer]:TShop read GetItem;default;
  end;
  {$ENDREGION '店铺'}




  {$REGION '购物车商品'}
  TCarGood=class(TBaseJsonObject)
  public
    fid:Int64;//8,
    //appid:Int64;//1002,
    user_fid:String;//31,
    shop_fid:Int64;//1,
    shop_goods_fid:Int64;//1,
    shop_goods_spec_fid:Int64;//1,
    shop_goods_attrs:String;//"微辣、中辣、重辣",
    number:Int64;//1,
    orderno:Double;//1,
    createtime:String;//"2018-04-24 13:38:17",
    goods_name:String;//"商品名称",
    goods_pic1_path:String;//"http://111.png",
    shop_goods_spec_name:String;//"大杯",
    shop_goods_spec_packing_fee:Double;//2,
    special_price:Double;//8,
    origin_price:Double;//12
    goodunit: String;// "袋",
    small_unit: String;//"斤",
    small_unit_number: Int64;// 5,
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    function GetGoodsPic1path: String;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TCarGoodList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TCarGood;
  public
    function FindItemByFID(AFID:Integer):TCarGood;
    property Items[Index:Integer]:TCarGood read GetItem;default;
  end;
  {$ENDREGION '购物车商品'}


  {$REGION '订单商品'}
  TOrderGood=class(TBaseJsonObject)
  public
    fid:Int64;//8,
    //appid:Int64;//1002,
    user_fid:String;//31,
    shop_fid:Int64;//1,
    Order_fid:Int64;
    shop_goods_fid:Int64;//1,
    shop_goods_spec_fid:Int64;//1,
    shop_goods_attrs:String;//"微辣、中辣、重辣",
    number:Int64;//1,
    orderno:Double;//1,
    createtime:String;//"2018-04-24 13:38:17",
    goods_name:String;//"商品名称",
    special_price:Double;//8,
    origin_price:Double;//12
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TOrderGoodList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TOrderGood;
  public
    function FindItemByFID(AFID:Integer):TOrderGood;
    property Items[Index:Integer]:TOrderGood read GetItem;default;
  end;
  {$ENDREGION '订单商品'}



  {$REGION '店铺收藏'}
  TShopCollection=class(TBaseJsonObject)
  public
    fid:Int64;// 3,
    //appid:Int64;// 1002,
    user_fid:String;// 48,
    shop_fid:Int64;// 4,
    createtime:String;// "2018-08-13 14:18:37",
    is_deleted:Int64;// 0,

    FShop:TShop;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  public
    //清除
    procedure Clear;
  end;
  TShopCollectionList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TShopCollection;
  public
    property Items[Index:Integer]:TShopCollection read GetItem;default;
  end;
  {$ENDREGION '店铺收藏'}


  {$REGION '足迹'}
  TFootPrint=class(TBaseJsonObject)
  public
    fid:Int64;// 3,
    //appid:Int64;// 1002,
    user_fid:String;// 48,
    shop_fid:Int64;// 4,
    createtime:String;// "2018-08-13 14:18:37",
    is_deleted:Int64;// 0,

    FShop:TShop;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  public
    //清除
    procedure Clear;
  end;
  TFootPrintList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TFootPrint;
  public
    property Items[Index:Integer]:TFootPrint read GetItem;default;
  end;
  {$ENDREGION '足迹'}




  {$REGION '购物车店铺'}
  TCarShop=class(TShop)
  public
    FCarGoodList:TCarGoodList;
    paking_fee:Double;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TCarShopList=class(TShopList)
  private
    function GetItem(Index: Integer): TCarShop;
  public
    function FindItemByFID(AFID:Integer):TCarShop;
    property Items[Index:Integer]:TCarShop read GetItem;default;
  end;
  {$ENDREGION}

  {$REGION '订单费用TOrderFee'}
  TPrepareOrderFee=class(TBaseJsonObject)
  public
    shop_fid:Int64;//4,
    shop_goods_fid:Int64;//16,
    shop_goods_spec_fid:Int64;//44,
    num:Int64;//1,
    fee_type:String;//"goods_money",
    fee_desc:String;//"大根,",
    name:String;//"油条",
    origin_price:double;//8,
    packing_fee:double;//2,
    money:double;//8,
    promotion_fid:Int64;//0
    pic1_path:String;
  public
    procedure Clear;
    procedure AssignTo(Dest: TPersistent);override;
    function GetPicUrl:String;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TPrepareOrderFeeList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TPrepareOrderFee;
  public
    property Items[Index:Integer]:TPrepareOrderFee read GetItem;default;
  end;
  {$ENDREGION}


  {$REGION '商家入驻申请'}
  //商家入驻申请
  TShopRequest=class(TBaseJsonObject)
  public
    fid:Int64;//8,
    //appid:Int64;//1002,
    user_fid:String;//31,
    is_deleted:Int64;//0,
    createtime:String;//"2018-02-01 14:57:05",
    app_business_category_fid:Int64;//2,
    app_business_category_name:String;
    phone:String;//"18361350680",
    name:String;//"东方宴",
    contact_name:String;//"合作方案1",
    shop_desc:String;//"四川辣火锅，非常好吃，你值得拥有",
    logo_pic_path:String;//"CE45E8926A864BFBAFBC03BA2310FAFD.jpg",
    door_face_pic_path:String;//"DB6EA38890944C798E21D2C381801404.jpg",
    inner_pic_path1:String;//"Upload\\1002\\Shop_Pic\\2018\\2018-02-02\\B46E72F9EED54F7C9FB86E0661094F46.jpg",
    inner_pic_path2:String;//"",
    inner_pic_path3:String;//"",
    province:String;//"浙江省",
    city:String;//"金华市",
    area:String;//"婺城区",
    addr:String;//"丹溪街道1107号龙腾创业大厦",
    street:String; //"",
    building:String; //"",
    addr_line3:String;// "",
    postcode:String;// "",
    make_food_spent:Integer;
    latitude:Double;//0,
    longitude:Double;//0,
    bankcard_name:String;//"丁丽花",
    bankcard_bankname:String;//"中国银行",
    bankcard_account:String;//"6217856100008160183",
    app_coop_scheme_fid:Int64;//2,
    app_coop_scheme_name:String;
    app_service_fee_rate:Double;//0.08,
    app_deliver_fee:Double;//4.1,
    app_deliver_type:Int64;//0,
    city_code:String;//"",
    poundage_undertaker:String;

    delivery_fee:Double;

    region_code:String;//"",
    first_audit_state:Int64;//-1,
    first_audit_user_fid:String;//0,
    first_audit_remark:String;//"",
    first_audit_time:String;//"1899-12-30 00:00:00",
    final_audit_state:Int64;//0,
    final_audit_user_fid:String;//0,
    final_audit_remark:String;//"",
    final_audit_time:String;//""
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
  public
    //获取图片url
    function Getlogopicpath:String;
    function Getdoorfacepicpath: String;
    function Getinnerpicpath1: String;
    function Getinnerpicpath2: String;
    function Getinnerpicpath3: String;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  {$ENDREGION}



  {$REGION '回复'}
  TEvaluateReply=class(TBaseJsonObject)
  public
    fid:Int64;//1,
    //appid:Int64;//1002,
    user_fid:String;//29,
    evaluate_object_fid:Int64;//3,
    order_fid:Int64;//0,
    content:String;//"dddd2",
    createtime:String;//"2018-04-19 19:37:11"
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TEvaluateReplyList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TEvaluateReply;
  public
    function FindItemByFID(AFID:Integer):TEvaluateReply;
    property Items[Index:Integer]:TEvaluateReply read GetItem;default;
  end;
  {$ENDREGION '回复'}



  {$REGION '客户评论'}
  TEvaluate=class(TBaseJsonObject)
  public
    fid:Int64;//3,
    //appid:Int64;//1002,
    user_fid:String;//29,
    is_anonymous:Int64;//1,
    from_fid:Int64;//2,
    evaluate_type:String;//"user_evaluate_order_shop",
    to_fid:String;//Int64;//4,
    to_sub_fid:Int64;//5,
    order_fid:Int64;//0,
    score:Double;//3.4,
    max_score:Int64;//5,
    content:String;//"",
    tags:String;//"评价的标签",
    user_custom_data:String;
    pic1_path:String;//"Upload\\1002\\Evaluate_Pic\\2018\\2018-03-20\\63421B3694EB45C19372A3153B9434C7.jpg",
    pic2_path:String;//"Upload\\1002\\Evaluate_Pic\\2018\\2018-03-20\\63421B3694EB45C19372A3153B9434C7.jpg",
    pic3_path:String;//"Upload\\1002\\Evaluate_Pic\\2018\\2018-03-20\\63421B3694EB45C19372A3153B9434C7.jpg",
    orderno:Double;//1,
    createtime:String;//"2018-04-19 19:34:15",
    reply_count:Int64;//1,
    is_deleted:Int64;//0,
    from_name:String;//客户-王能,
    shop_name:String;
    goods_name:String;
    shop_logo_pic_path:String;
    head_pic_path:String;
    EvaluateReplyList:TEvaluateReplyList;
  public
  {$IFDEF FMX}
    Pic1:TDrawPicture;//"1.jpeg",
    Pic2:TDrawPicture;//"2.jpeg",
    Pic3:TDrawPicture;//"3.jpeg",
    Pic4:TDrawPicture;
  {$ENDIF FMX}
  public
    //获取图片url
    function Getpic1path:String;
    function Getpic2path: String;
    function Getpic3path: String;
  public
    function GetHeadPicPath:String;
    function GetShopPicPath:String;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  public
    //清除
    procedure Clear;
  end;
  TEvaluateList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TEvaluate;
  public
    property Items[Index:Integer]:TEvaluate read GetItem;default;
  end;

  {$ENDREGION '客户评论'}


  {$REGION '红包'}
  TCoupon=class(TBaseJsonObject)
  public
    fid:Int64;//11,
    //appid:Int64;//1002,
    user_fid:String;//64,
    shop_fid:Int64;//4,
    promotion_fid:Int64;//16,
    valid_time:Int64;//0,
    is_used:Int64;//0,
    used_order_fid:Int64;//0,
    createtime:String;//"2018-05-10 08:41:25",
    fid_1:Int64;//16,
    appid_1:Int64;//1002,
    shop_fid_1:Int64;//4,
    promotion_type:String;//"special_price_goods",
    name:String;//"11.11",
    start_date:String;//"2018-04-09 00:00:00",
    end_date:String;//"2018-04-12 00:00:00",
    start_time:String;//"",
    end_time:String;//"",
    weekdays_mon:Int64;//0,
    weekdays_tue:Int64;//0,
    weekdays_wed:Int64;//0,
    weekdays_thu:Int64;//0,
    weekdays_fri:Int64;//0,
    weekdays_sat:Int64;//0,
    weekdays_sun:Int64;//0,
    dec_money:Double;//8,
    special_price:Double;//5,
    discount:Double;//0,
    full_money1:Double;//0,
    dec_money1:Double;//0,
    full_money2:Double;//0,
    dec_money2:Double;//0,
    full_money3:Double;//0,
    dec_money3:Double;//0,
    is_share:Int64;//0,
    can_repeat_count:Int64;//1,
    is_new_user:Int64;//0,
    used_sum_count:Int64;//0,
    daily_count_per_user:Int64;//1,
    valid_time_1:Int64;//0,
    is_coupon:Int64;//0,
    coupon_max_count:Int64;//0,
    geted_coupon_count:Int64;//0,
    used_coupon_count:Int64;//0,
    platform_promotion_fid:Int64;//1,
    subsidy:Double;//0,
    is_deleted:Int64;//0,
    createtime_1:String;//"2018-04-09 15:37:22"
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TCouponList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TCoupon;
  public
    function FindItemByFID(AFID:Integer):TCoupon;
    property Items[Index:Integer]:TCoupon read GetItem;default;
  end;
  {$ENDREGION '红包'}





//  //意见
//  TSuggestion=class(TBaseJsonObject)
//  public
//    fid:Int64;//2
//    //appid:Int64;//1001,
//    user_fid:String;//12,
//    content:String;//"反馈意见",
//    user_name:String;//"意见提交人
//    createtime:String;//"2017-07-17 10:11:27",
//    pic1path:String;//"",
//    pic2path:String;//"",
//    pic3path:String;//"",
//    pic4path:String;//"",
//    pic5path:String;//"",
//    pic6path:String;//"",
//
//  public
//    function ParseFromJson(AJson: ISuperObject): Boolean;override;
//  public
//    function GetPic1Url: String;
//    function GetPic2Url: String;
//    function GetPic3Url: String;
//    function GetPic4Url: String;
//    function GetPic5Url: String;
//    function GetPic6Url: String;
//  end;
//  TSuggestionList=class(TBaseJsonObjectList)
//  private
//    function GetItem(Index: Integer): TSuggestion;
//  public
//    property Items[Index:Integer]:TSuggestion read GetItem;default;
//  end;





//  //酒店分类
//  THotelClassify=class(TBaseJsonObject)
//  public
//    fid:Int64;//1,
//    //appid:Int64;//1001,
//    name:String;//"商务酒店",
//    orderno:Double;//"",
//    createtime:String;//"2017-07-22 13:04:01",
//  public
//    function ParseFromJson(AJson:ISuperObject): Boolean;Override;
//  end;
//  THotelClassifyList=class(TBaseJsonObjectList)
//  private
//    function GetItem(Index: Integer): THotelClassify;
//  public
//    function FindItemByFID(AFID:Integer):THotelClassify;
//    property Items[Index:Integer]:THotelClassify read GetItem;default;
//  end;







  //选择的商品
  TBuyGoods=class(TShopGoods)
  public
    goods_fid:Int64;
    number:Int64;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  end;
  TBuyGoodsList=class(TShopGoodsList)
  private
    function GetItem(Index: Integer): TBuyGoods;
  public
    property Items[Index:Integer]:TBuyGoods read GetItem;default;
  end;




  //购物车商品项
  TUserCartGoods=class(TBuyGoods)
  public
    user_cart_goods_fid:Int64;
    user_fid:String;
    is_checked:Int64;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TUserCartGoodsList=class(TBuyGoodsList)
  private
    function GetItem(Index: Integer): TUserCartGoods;
  public
    function FindItemByUserCartGoodsFID(AUserCartGoodsFID:Integer):TUserCartGoods;
    property Items[Index:Integer]:TUserCartGoods read GetItem;default;
  end;




   //区域管理省份
  TRegionProvince=class(TBaseJsonObject)
  public
    fid:Int64;
    //appid:Int64;
    regin_fid:Int64;
    name:String;
//    orderno:String;
    createtime:String;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TRegionProvinceList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TRegionProvince;
  public
    property Items[Index:Integer]:TRegionProvince read GetItem;default;
  end;



  //订单商品
  TOrderGoods=class(TBuyGoods)
  public
    order_fid:Int64;//6,
    order_goods_price:Double;//18,
    order_goods_commission:Double;//5,
    order_goods_orderno:Double;//0
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TOrderGoodsList=class(TBuyGoodsList)
  private
    function GetItem(Index: Integer): TOrderGoods;
  public
    property Items[Index:Integer]:TOrderGoods read GetItem;default;
  end;



//  //筛选条件
//  //汇总的条件
//  TSummaryFilterType=(sftState,
//                      sftType
//                    );
  //汇总的条件
  TSummaryFilterType=(sftDateArea,
                     sftMonth,
                     sftOrderType,
                     sftCustom,
                     sftRegion,
                     sftManager,
                     sftIsPay,
                     sftHotel,
                     sftIsFirst,


                     sftState,
                     sftType
                    );
  TSummaryFilterItem=class
    FFilterType:TSummaryFilterType;
    //过滤名称
    FFilterName:String;
    //过滤值
    FFilterValue:String;
    //过滤值的标题
    FFilterValueCaption:String;
    FFilterValue1:String;

    FFilterSelections:TStringList;
    FFilterSelectionsCaption:TStringList;
    //条件的标题
    function GetCaption:String;
  public
    constructor Create;
    destructor Destroy;override;
  end;
  TSummaryFilterList=class(TBaseList)
  private
    function GetItem(Index: Integer): TSummaryFilterItem;
  public
    function FindItemByFilterName(AFilterName:String):TSummaryFilterItem;
    property Items[Index:Integer]:TSummaryFilterItem read GetItem;default;
  end;



  //商品汇总
  TGoodsSummary=class(TBaseJsonObject)
  public
    summoney:Double;
    sumnumber:Int64;
    sumcount:Int64;
    goods_fid:Int64;
    caption:String;
    goods_unit:String;
    region_fid:Int64;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TGoodsSummaryList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TGoodsSummary;
  public
    property Items[Index:Integer]:TGoodsSummary read GetItem;default;
  end;


  //商品汇总单据
  TGoodsSummaryBill=class(TBaseJsonObject)
  public
    fid:Int64;
    //appid:Int64;
    order_fid:Int64;
    goods_fid:Int64;
    number:Int64;
    price:Double;
    orderno:Double;
    createtime:String;
    commission:Int64;
    goods_name:String;
    marque:String;
    goods_unit:String;
    goods_code:String;
    goods_classify_fid:Int64;
    goods_classify_name:String;
    bill_code:String;
    hotel_fid:Int64;
    user_fid:String;
    goods_origin_summoney:Double;
    goods_summoney:Double;
    summoney:Double;
    goods_sum_commission:Int64;
    done_time:String;
    goods_kind_num:Int64;
    goods_num:Int64;
    is_deleted:Int64;
    is_first_order:Int64;
    order_date:String;
    order_month:String;
    order_year:String;
    hotel_name:String;
    hotel_star:Int64;
    hotel_user_fid:String;
    hotel_province:String;
    user_phone:String;
    user_name:String;
    region_fid:Int64;
    region_name:String;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TGoodsSummaryBillList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TGoodsSummaryBill;
  public
    property Items[Index:Integer]:TGoodsSummaryBill read GetItem;default;
  end;


  //订单单据汇总
  TOrderSummaryBill=class(TBaseJsonObject)
  public
    fid:Int64;
    //appid:Int64;
    bill_code:String;
    hotel_fid:Int64;
    user_fid:String;
    goods_origin_summoney:Double;
    goods_summoney:Double;
    freight:Int64;
    summoney:Double;
    goods_sum_commission:Int64;
    recv_addr_fid:Int64;
    recv_name:String;
    recv_phone:String;
    recv_province:String;
    recv_city:String;
    recv_area:String;
    recv_addr:String;
    remark:String;
    createtime:String;
    done_time:String;
    order_state:String;
    pay_state:String;
    is_deleted:Int64;
    is_first_order:Int64;
    goods_kind_num:Int64;
    goods_num:Int64;
    is_hide:Int64;
    reduce:Int64;
    order_date:String;
    order_month:String;
    order_year:String;
    hotel_name:String;
    hotel_star:Int64;
    hotel_addr:String;
    hotel_tel:String;
    hotel_user_fid:String;
    hotel_province:String;
    hotel_city:String;
    hotel_area:String;
    hotel_is_ordered:Int64;
    user_phone:String;
    user_name:String;
    region_fid:Int64;
    region_name:String;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TOrderSummaryBillList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TOrderSummaryBill;
  public
    property Items[Index:Integer]:TOrderSummaryBill read GetItem;default;
  end;



  {$REGION '用户订单'}
  TOrder=class(TBaseJsonObject)
  public
    fid:Int64;//1,
    //appid:Int64;//1002,
    user_fid:String;//64,
    shop_fid:Int64;//4,

    shoper_fid:String;//77 商家ID

    delivery_center_order_fid:Int64;//123,
    bill_code:String;//0,
    order_state:String;//"wait_pay",
    order_state_for_display:String;
    want_arrive_time:String;//"2018-04-27 23:59:00",
    is_book:Int64;//0,
    book_time:String;//"",
    goods_money:Double;//0,
    shop_order_index:Int64;//5,
    is_need_invoice:Int64;//0,
    invoice_type:Int64;//0,
    invoice_title:String;//"",
    invoice_tax_no:String;//"",
    recv_name:String;//"王能",
    recv_sex:Int64;//1,
    recv_phone:String;//"18957901025",
    recv_province:String;//"浙江省",
    recv_city:String;//"金华市",
    recv_area:String;//"婺城区",
    recv_addr:String;//"丹溪路1171号龙腾创业大厦",
    recv_door_no:String;//"826",
    recv_latitude:Double;//119.648994,
    recv_longitude:Double;//29.076664,
    origin_money:Double;//20,
    dec_money:Double;//0,
    sum_money:Double;//20,
    pay_type:String;//"",
    pay_state:String;//"wait_pay",
    pay_time:String;//"",

    shop_latitude:Double;
    shop_longitude:Double;

    pay_fee:Double;//0.24 手续费
    client_bear_pay_fee:Double;

    deliver_type:String;//"need_delivery",
    deliver_time:String;//"",
    deliver_fee:Double;//0,
    deliver_state:String;//"",

    shop_take_time:String;//"",
    shop_order_state:String;//"",
    tableware_quantity:Int64;//2,
    taste_tags:String;//"",
    memo:String;//"不要誎",
    is_hide:Int64;//0,
    is_deleted:Int64;//0,
    createtime:String;//"2018-04-27 11:20:00",
    cancel_code:String;//"",
    cancel_reason:String;//"",
    reject_code:String;//"",
    reject_reason:String;//"" ,
    settlement_state:String;//"",

    is_user_evaluated:Integer;//0,
    is_shoper_evaluated_rider:Integer;//0,

    rider_user_fid:String;// 49,
    rider_name:String;//骑手-王能,

    shop_logo_pic_path:String;//"",
    goods_name:String;//"",
    shop_name:String;//"",
    goods_type_num:Integer;//0

    finish_food_time:String;

    done_time:String;

    goods_pic1_path:String;

    shop_income:Double;

    distance:Double;

    poundage_undertaker:String;



    OrderFees:TPrepareOrderFeeList;

    OrderGoodsList:TOrderGoodList;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  public
    function GetShopLogoPicUrl: String;
    function GetOrderGoodsPic1Path:String;
  public
    constructor Create;override;
    destructor Destroy;override;
  end;
  TOrderList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TOrder;
  public
    property Items[Index:Integer]:TOrder read GetItem;default;
  end;
  {$ENDREGION '用户订单'}


  {$REGION '商家订单TShopOrder'}
  TShopOrder=class(TOrder)
  public
    user_ordered_count:Int64;

    user_name:String;
    user_phone:String;
    user_email:String;
    user_sex:Int64;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TShopOrderList=class(TOrderList)
  private
    function GetItem(Index: Integer): TShopOrder;
  public
    property Items[Index:Integer]:TShopOrder read GetItem;default;
  end;
  {$ENDREGION '商家订单'}


  {$REGION '订单状态跟踪TOrderStateTrack'}
  TOrderStateTrack=class(TBaseJsonObject)
  public
    fid:Int64;//43,
    //appid:Int64;//1002,
    order_fid:Int64;//28,
    order_state:String;//"rider_arrived",
    createtime:String;//"2018-05-24 09:44:48"
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TOrderStateTrackList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TOrderStateTrack;
  public
    function FindItemByOrderState(AOrderState:String):TOrderStateTrack;
    property Items[Index:Integer]:TOrderStateTrack read GetItem;default;
  end;
  {$ENDREGION}


  {$REGION '配送单商品TDeliveryOrderGoods'}
  TDeliveryOrderGoods=class(TBaseJsonObject)
  public
    fid:Int64;//43,
    //appid:Int64;//1002,
    order_fid:Int64;//38,
    name:String;//"油条",
    goods_desc:String;//"大根/11111",
    money:Double;//8,
    number:Int64;//2,
    orderno:Int64;//1,
    createtime:String;//"2018-05-28 16:59:14"
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TDeliveryOrderGoodsList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TDeliveryOrderGoods;
  public
    property Items[Index:Integer]:TDeliveryOrderGoods read GetItem;default;
  end;
  {$ENDREGION}

  {$REGION '配送单TDeliveryOrder'}
  TDeliveryOrder=class(TBaseJsonObject)
  public
    fid:Int64;//13,
    //appid:Int64;//1002,
    user_fid:String;//64,
    shop_center_order_fid:Int64;//71,
    bill_code:String;//0,
    order_state:String;//"payed",
    order_state_for_display:String;
    want_take_time:String;//"2018-05-16 15:43:38",
    want_arrive_time:String;//"2018-05-16 15:43:38",
    is_book:Int64;//0,
    goods_name:String;//"多规格菜品等",
    goods_money:Double;//21.2,
    is_need_pay_goods_money:Int64;//0,
    goods_weight:Double;//0,
    goods_length:Double;//0,
    goods_width:Double;//0,
    goods_height:Double;//0,
    memo:String;//"",
    send_user_fid:String;//31,
    send_name:String;//"王能",
    send_sex:Int64;//0,
    send_phone:String;//"18957901025",
    send_addr_name:String;//"",
    send_province:String;//"浙江",
    send_city:String;//"金华",
    send_area:String;//"婺城",
    send_addr:String;//"龙腾创业大厦",
    send_door_no:String;//"",
    send_latitude:Double;//29.074786,
    send_longitude:Double;//119.652738,
    recv_user_fid:String;//64,
    recv_name:String;//"傅应文",
    recv_sex:Int64;//1,
    recv_phone:String;//"18006890741",
    recv_addr_name:String;//"",
    recv_province:String;//"浙江省",
    recv_city:String;//"金华市",
    recv_area:String;//"婺城区",
    recv_addr:String;//"寺前皇小区丹南街10",
    recv_door_no:String;//"827",
    recv_latitude:Double;//29.074786,
    recv_longitude:Double;//119.652738,
    bad_weather_add_money:Double;//0,
    weight_add_money:Double;//3,
    size_add_money:Double;//0,
    night_add_money:Double;//0,
    origin_money:Double;//31.2,
    dec_money:Double;//0,
    sum_money:Double;//31.2,
    distance:Int64;//0,
    pay_type:String;//"",
    pay_state:String;//"payed",
    pay_time:String;//"",
    is_hide:Int64;//0,
    is_deleted:Int64;//0,
    is_actived:Int64;//1,
    createtime:String;//"2018-05-16 15:43:38",
    cancel_code:String;//"",
    cancel_reason:String;//"",
    reject_code:String;//"",
    reject_reason:String;//"",
    settlement_state:String;//"",
    is_sender_evaluated:Int64;//0,
    is_recver_evaludated:Int64;//0,
    take_distance:Int64;//377,
    send_distance:Int64;//377

    rider_income:Double;
    shop_order_index:Integer;

    deliver_type:String;

    OrderGoodsList:TDeliveryOrderGoodsList;
    OrderStateTrackList:TOrderStateTrackList;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  public
    constructor Create;override;
    destructor Destroy;override;
  end;
  TDeliveryOrderList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TDeliveryOrder;
  public
    property Items[Index:Integer]:TDeliveryOrder read GetItem;default;
  end;
  {$ENDREGION '配送单TDeliveryOrder'}


  {$REGION '骑手配送单TRiderOrder'}
  TRiderDeliveryOrder=class(TDeliveryOrder)

  end;
  TRiderDeliveryOrderList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TRiderDeliveryOrder;
  public
    property Items[Index:Integer]:TRiderDeliveryOrder read GetItem;default;
  end;
  {$ENDREGION '骑手配送单TRiderOrder'}



  {$REGION '物品种类'}

  TGoodClass=class(TBaseJsonObject)
  public
    fid:Int64;//43,
    //appid:Int64;//1002,
    parent_fid:Int64;//0,
    name:String; //"日用",
    category_desc:String;// "牙刷",
    orderno:Double;// 99.9,
    is_deleted:Int64;// 0,
    createtime:String;//"2018-05-28 16:59:14"
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TGoodClassList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TGoodClass;
  public
    property Items[Index:Integer]:TGoodClass read GetItem;default;
  end;

  {$ENDREGION '物品种类'}

  //订单付款
  TOrderPayment=class(TBaseJsonObject)
  public
    fid:Int64;//5,
    //appid:Int64;//1001,
    order_fid:Int64;//6,
    user_fid:String;//12,
    payment_type:String;//"bank_transer",
    transer_time:String;//"2017-07-30 00:00:00",
    transer_bankaccount_name:String;//"王能",
    transer_bankaccount_bankname:String;//"建行",
    transer_bankaccount_account:String;//"6443556555432232",
    transer_payment_voucher:String;//"123456789",
    money:Double;//100.1,
    remark:String;//"",
    pay_state:String;
    pic1path:String;//"",
    pic2path:String;//"",
    pic3path:String;//"",
    pic4path:String;//"",
    pic5path:String;//"",
    pic6path:String;//"",
    audit_user_fid:String;//0,
    audit_state:Int64;//0,
    audit_time:String;//"",
    audit_remark:String;//"",
    createtime:String;//"2017-08-02 15:22:57"
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  public
    function GetPic1Url: String;
    function GetPic2Url: String;
    function GetPic3Url: String;
    function GetPic4Url: String;
    function GetPic5Url: String;
    function GetPic6Url: String;
  end;

  TOrderPaymentList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TOrderPayment;
  public
    property Items[Index:Integer]:TOrderPayment read GetItem;default;
  end;


//  //订单发货
//  TOrderDelivery=class(TBaseJsonObject)
//  public
//    fid:Int64;
//    //appid:Int64;
//    order_fid:Int64;
//    emp_fid:Int64;
//    delivery_type:String;
//    delivery_company:String;
//    delivery_bill_code:String;
//    createtime:String;
//    remark:String;
//    delivery_time:String;
//  public
//    function ParseFromJson(AJson: ISuperObject): Boolean;override;
//  end;
//  TOrderDeliveryList=class(TBaseJsonObjectList)
//  private
//    function GetItem(Index: Integer): TOrderDelivery;
//  public
//    property Items[Index:Integer]:TOrderDelivery read GetItem;default;
//  end;



  //区域管理
  TRegion=class(TBaseJsonObject)
  public
    fid:Int64;
    //appid:Int64;
    name:String;
    orderno:String;
    manager_fid:Int64;
    manager_name:String;
    createtime:String;

    RegionProvinceList:TRegionProvinceList;
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  public
    constructor Create;override;
    destructor Destroy;override;
  end;
  TRegionList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TRegion;
  public
    property Items[Index:Integer]:TRegion read GetItem;default;
  end;

  //广告
  THomeAd=class(TBaseJsonObject)
  public
    fid:Int64;//3,
    //appid:Int64;//1001,
    name:String;//"首页广告3",
    picpath:String;//"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3355283602,2380210295",
    url:String;//"http://www.baidu.com",
    goods_fid:Int64;//0,
    navigation_fid:Int64;// 0,
    shop_fid:Int64;// 0,
    orderno:Double;//0,
    goods_name:String;//'饮水机'
    createtime:String;//"2017-08-05 23:31:25",
    is_deleted:Int64;
    content:string;
  public
    function GetPicUrl: String;//0
  public
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  THomeAdList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): THomeAd;
  public
    property Items[Index:Integer]:THomeAd read GetItem;default;
  end;

 {$REGION '用户资金往来'}
  TUserBillMoney=class(TBaseJsonObject)
  public
    fid:Int64;//155,
    //appid:Int64;//1002,
    user_fid:String;//64,
    money_type:String;//"consume",
    name:String;//"王能的早餐店外卖订单",
    order_desc:String;//"多规格菜品等多件",
    order_fid:Int64;//92,
    from_money_fid:Int64;//0,
    order_type:String;//"shop_center",
    bill_code:String;//"DH-20180528-0001",
    pay_type:String;//"wxpay",
    money:Double;//-57.81,
    user_money:Double;
    third_pay_fid:Int64;//440,
    third_pay_no:String;//"DED99168EABE4146B3EEB72974CE8818",
    createtime:String;//"2018-05-28 13:58:35",
    pay_state:String;//"payed",
    settle_state:String;//"",
    is_need_change_user_money:Double;//0,
    is_succ:Int64;//0 1 2
    is_hide:Int64;//0,
    is_deleted:Int64;//0
  public
    procedure Clear;
    function ParseFromJson(AJson: ISuperObject): Boolean;override;
  end;
  TUserBillMoneyList=class(TBaseJsonObjectList)
  private
    function GetItem(Index: Integer): TUserBillMoney;
  public
    property Items[Index:Integer]:TUserBillMoney read GetItem;default;
  end;
 {$ENDREGION '用户资金往来'}



  TBaseManager=class
  protected
    function CustomLoadFromINI(AIniFile:TIniFile): Boolean;virtual;
    function CustomSaveToINI(AIniFile:TIniFile): Boolean;virtual;
  public
    //定位相关

    //经纬度
    Longitude:Double;
    Latitude:Double;
    //地址
    Addr:string;
    RegionName:string;
    Province:String;
    City:String;
    Area:String;
    //是否第一次
    IsGPSLocated:Boolean;
  public
    //是否第一次启动
    IsFirstStart:Boolean;

    //是否第一次启动显示过向导页面
    IsShowedGuideFrame:Boolean;

//    UserFID:String;

    //用户信息
    User:TUser;
    //隐私设置
    FMyFocusedPrivacySetting: string;
    FMyFansPrivateSetting: string;
    FMyVisitorPrivacySetting: string;


    //上次选择的语言
    LangKind:TLangKind;


    //用户名
    LastLoginUser:String;
    //密码
    LastLoginPass:String;

//    LastFastMsgUserID:Integer;
//    //登录类型
//    LastLoginType:String;
    //登录key
    LastLoginKey:String;
    //登录状态
    IsLogin:Boolean;

    //自动播放视频
    AutoPlayVideoOnWiFi:string;
    AutoPlayVideoWithoutWiFi:string;
  public
    //服务器
    ServerHost:String;
    //服务器端口
    ServerPort:Integer;
    //广告信息
    LastNonce:String;

    //点击关闭按钮所执行的操作
    ClickCloseButtonAction:String;
  public
    //公司名称,授权公司名
    CompanyName:String;
    //公司名称,授权公司名
    CompanyID:String;
//    //授权中心的服务器,默认都是www.orangeui.cn:10020
//    CenterServerHost:String;
//    CenterServerPort:Integer;
  public
    //应用信息
    AppJson:ISuperObject;

    //存放搜索历史的目录
    function GetUserLocalDir:String;

//    function LoadFromUserInfoINI(AINIFilePath: String): Boolean;
//
//    function SaveToUserInfoINI(AINIFilePath: String): Boolean;
  public
    function LoadFromINI(AINIFilePath: String): Boolean;
    function SaveToINI(AINIFilePath: String): Boolean;
  public
    //加载上次登录的用户信息、本地搜索历史
    procedure LoadUserConfig;virtual;
    //保存本地搜索历史
    procedure SaveUserConfig;virtual;
    //保存上次登录的用户信息
    procedure SaveLastLoginInfo;virtual;

    //保存上次的广告信息
    procedure SaveLastPosterInfo;virtual;
  public
    procedure Load;
    procedure Save;
  public
    constructor Create;virtual;
    destructor Destroy;override;
  end;



  {$ENDIF}










var
  ServerHost:String;
  //接口地址
  InterfaceUrl:String;


  //用户中心接口地址
  UserCenterInterfaceUrl:String;
  UserSuggectionUserCenterInterfaceUrl:String;
  CaptchaCenterInterfaceUrl:String;
  //店铺中心接口地址
  ShopCenterInterfaceUrl:String;
  //配送中心接口地址
  DeliveryCenterInterfaceUrl:String;
  //支付中心接口地址
  PayCenterInterfaceUrl:String;
  AlipayCenterInterfaceUrl:String;
  //推送管理的接口地址
  PushManageInterfaceUrl:String;
  //评论中心接口
  EvaluateCenterInterfaceUrl:String;
  //基础数据接口地址
  BasicDataManageInterfaceUrl:String;
  //验证码接口地址
  CapchaInterfaceUrl:String;
  //图片上传下载url
  ImageHttpServerUrl:String;
  AppUpdateServerUrl:String;

  //通用接口框架
  TableRestCenterInterfaceUrl:String;
  ProgramFrameworkRestCenterInterfaceUrl:String;
  //茶叶生态
//  TeaEcologyInterfaceUrl:String;
  //积分中心
  ScoreCenterInterfaceUrl:String;
  //夺宝中心
  IndianaCenterInterfaceUrl:String;


  //宠圈中心
  PetchipInterfaceUrl:String;
  //内容中心
  ContentCenterInterfaceUrl:String;
  //优惠活动中心
  PromotionCenterInterfaceUrl:String;
  //亿诚通讯中心
  TelCenterInterfaceUrl:String;

  //旋风在线接口地址
  XFOlineRestServiceUrl:String;
  FastmsgCenterInterfaceUrl:String;

var

  //通用接口
  CommonRestCenterInterfaceUrl:String;
  //汽修管理接口地址
  CarglCenterInterfaceUrl:String;
  //门业管理
  DoorManageInterfaceUrl:String;
  //中心授权服务器
  CenterInterfaceUrl:String;


  //医生工作站中心接口地址
  DoctorWorkStationCenterInterfaceUrl:String;




{$IFDEF OPEN_PLATFORM_SERVER}
//在开放平台服务端中使用
{$ELSE}
//在开放平台客户端中使用

var
  //程序ID(公共配置,用于济胜汽修、门业管理)
  ConfigAppID:Integer;

var
  //客户应用ID
  //app-id
  AppID:String;

  //用户类型
  APPUserType:TUserType;
  //用户类型名称,比如client,shop,rider,emp
  APPUserTypeName:String;

  //是否需要登录的时候根据手机号获取AppID
  GlobalIsNeedAPPIDSetting:Boolean;

var
  GlobalBaseManager:TBaseManager;
{$ENDIF}





//更新服务器设置
procedure CommonSyncServerSetting(AServer:String;APort:Integer;AIsSSL:Boolean=False);

//授权信息
function GetVIPProductAuthInfo(AAuthJson:ISuperObject):String;
//授权结束日期
function GetVIPProductAuthEndDate(AAuthJson:ISuperObject):String;

function GetImageLocalPath(APicPath:String):String;


//获取内容中心该用户的账号列表的统计数据
procedure GetContentCenterAccountStatistics(AAccountList:ISuperArray;ADataJson:ISuperObject);



{$IFDEF OPEN_PLATFORM_SERVER}
//在开放平台服务端中使用
{$ELSE}
//在开放平台客户端中使用



procedure SaveJsonToFile(AJson:ISuperObject;AFilePath:String);
procedure SaveJsonArrayToFile(AJsonArray:ISuperArray;AFilePath:String);
procedure LoadJsonFromFile(var AJson:ISuperObject;AFilePath:String);
procedure LoadJsonArrayFromFile(var AJsonArray:ISuperArray;AFilePath:String);

function GetDefaultUserHeadUrl:String;
function GetDefaultGroupHeadUrl:String;
//获取图片链接
function GetImageUrl(APicPath:String;
                    AImageType:TImageType=itNone;
                    AIsThumb:Boolean=False):String;




//店铺当前是否正在营业
function IsDoBusiness(AShop:TShop):Boolean;
//获取店铺的所有营业时间
function GetBusinessTime(AShop:TShop):String;
//获取下次营业时间
function GetNextBusinessTime(AShop: TShop): String;


function GetActivityRules(AFullMoney1:Double;
                          ADescMoney1:Double;
                          AFullMoney2:Double;
                          ADescMoney2:Double;
                          AFullMoney3:Double;
                          ADescMoney3:Double):String;

function GetMonthTime(AMonday:Integer;
                      ATuesday:Integer;
                      AWednesday:Integer;
                      AThursday:Integer;
                      AFriday:Integer;
                      ASaturday:Integer;
                      ASunday:Integer ):String;

function IsTakeAwayFoodShop(AShop:TShop):Boolean;
{$ENDIF}



implementation


//获取内容中心该用户的账号列表的统计数据
procedure GetContentCenterAccountStatistics(AAccountList:ISuperArray;ADataJson:ISuperObject);
var
  I:Integer;
  ARecordDataJson:ISuperObject;
begin
  //作品数
  ADataJson.I['content_count']:=0;
  //私信数
  ADataJson.I['message_count']:=0;
  //粉丝数
  ADataJson.I['fans_count']:=0;


  //播放量
  ADataJson.I['view_count']:=0;
  //点赞数
  ADataJson.I['like_count']:=0;
  //评论数
  ADataJson.I['comment_count']:=0;
  //分享数/转发数
  ADataJson.I['transfer_count']:=0;


  //计算出作品数
  if AAccountList<>nil then
  begin
    for I := 0 to AAccountList.Length-1 do
    begin
      ARecordDataJson:=AAccountList.O[I];

      //作品数
      ADataJson.I['content_count']:=ADataJson.I['content_count']+ARecordDataJson.I['content_count'];
      //私信数
      ADataJson.I['message_count']:=ADataJson.I['message_count']+ARecordDataJson.I['message_count'];
      //粉丝数
      ADataJson.I['fans_count']:=ADataJson.I['fans_count']+ARecordDataJson.I['fans_count'];


      //播放量
      ADataJson.I['view_count']:=ADataJson.I['view_count']+ARecordDataJson.I['view_count'];
      //点赞数
      ADataJson.I['like_count']:=ADataJson.I['like_count']+ARecordDataJson.I['like_count'];
      //评论数
      ADataJson.I['comment_count']:=ADataJson.I['comment_count']+ARecordDataJson.I['comment_count'];
      //分享数/转发数
      ADataJson.I['transfer_count']:=ADataJson.I['transfer_count']+ARecordDataJson.I['transfer_count'];

    end;
  end;
end;


//授权信息
function GetVIPProductAuthInfo(AAuthJson:ISuperObject):String;
begin
  Result:='';
  if AAuthJson.Contains('ValidVIPDateAreaJson') then
  begin
    Result:=AAuthJson.O['ValidVIPDateAreaJson'].S['name'];

    if (AAuthJson.O['ValidVIPDateAreaJson'].I['is_trial']=1) then
    begin
      Result:=Result+' 试用';
    end;

  end;
end;

//授权信息
function GetVIPProductAuthVIPType(AAuthJson:ISuperObject):String;
begin
  Result:='试用';
  if AAuthJson.Contains('ValidVIPDateAreaJson') then
  begin

    if (AAuthJson.O['ValidVIPDateAreaJson'].I['is_trial']=1) then
    begin
      Result:='试用';
    end
    else
    begin
      Result:='VIP';

    end;

  end;
end;

//授权结束日期
function GetVIPProductAuthEndDate(AAuthJson:ISuperObject):String;
var
  AEndDate:TDateTime;
begin
  Result:='';
  if AAuthJson.Contains('ValidVIPDateAreaJson') then
  begin
    Result:=AAuthJson.O['ValidVIPDateAreaJson'].S['end_date'];

    AEndDate:=StdStrToDateTime(Result);
    Result:=GetVIPProductAuthVIPType(AAuthJson)+'至'+FormatDateTime('YYYY-MM-DD',AEndDate);
  end;
end;

{$IFDEF OPEN_PLATFORM_SERVER}
//在开放平台服务端中使用
{$ELSE}
//在开放平台客户端中使用

function IsTakeAwayFoodShop(AShop:TShop):Boolean;
begin
  Result:=(Pos('外卖',AShop.app_business_category_name)>0)
end;
{$ENDIF}

procedure CommonSyncServerSetting(AServer: String; APort: Integer; AIsSSL:Boolean);
begin
  //设置连接
  ServerHost:=AServer;


  if not AIsSSL then
  begin
    //服务端接口地址
    InterfaceUrl:='http://'+AServer+':'+IntToStr(APort)+'/';
  end
  else
  begin
    //服务端接口地址
    InterfaceUrl:='https://'+AServer+':'+IntToStr(APort)+'/';
  end;

  //支持HTTPS
//  InterfaceUrl:='https://'+AServer+':'+IntToStr(443)+'/';




  UserCenterInterfaceUrl:=InterfaceUrl+'usercenter/';
  UserSuggectionUserCenterInterfaceUrl:=UserCenterInterfaceUrl;
  CaptchaCenterInterfaceUrl:=InterfaceUrl+'captcha/';
  ShopCenterInterfaceUrl:=InterfaceUrl+'shopcenter/';
  DeliveryCenterInterfaceUrl:=InterfaceUrl+'deliverycenter/';
  PayCenterInterfaceUrl:=InterfaceUrl+'paycenter/';
  AlipayCenterInterfaceUrl:=InterfaceUrl+'alipayservice/';
  PushManageInterfaceUrl:=InterfaceUrl+'pushmanage/';
  BasicDataManageInterfaceUrl:=InterfaceUrl+'basicdatamanage/';
  EvaluateCenterInterfaceUrl:=InterfaceUrl+'evaluatecenter/';
//  TeaEcologyInterfaceUrl:=InterfaceUrl+'tea_ecology/';
  ScoreCenterInterfaceUrl:=InterfaceUrl+'scorecenter/';
  IndianaCenterInterfaceUrl:=InterfaceUrl+'indianacenter/';
  //验证码
  CapchaInterfaceUrl:=InterfaceUrl+'capcha/';
  TableRestCenterInterfaceUrl:=InterfaceUrl+'tablecommonrest/';
  ProgramFrameworkRestCenterInterfaceUrl:=InterfaceUrl+'program_framework/';


  PromotionCenterInterfaceUrl:=InterfaceUrl+'promotioncenter/';
  TelCenterInterfaceUrl:=InterfaceUrl+'telcenter/';

  XFOlineRestServiceUrl:=InterfaceUrl+'xfonline/';

  //图片上传下载地址
  ImageHttpServerUrl:='http://'+AServer+':'+IntToStr(APort+1);
  //支持HTTPS
//  ImageHttpServerUrl:='https://'+AServer+':'+IntToStr(444);


  //内容中心
  ContentCenterInterfaceUrl:=InterfaceUrl+'contentcenter/';


  //医生工作站
  //http://127.0.0.1:10000/doctor_workstation/
//  DoctorWorkStationCenterInterfaceUrl:=InterfaceUrl+'doctor_workstation/';


  //APP更新地址
  AppUpdateServerUrl:='http://'+AServer+':'+IntToStr(APort+1);


  //医生工作站
  //http://127.0.0.1:10000/doctor_workstation/
  DoctorWorkStationCenterInterfaceUrl:=InterfaceUrl+'doctor_workstation/';


end;



function GetImageLocalPath(APicPath:String):String;
var
  ATempIndex:Integer;
begin
  Result:='';
  if APicPath='' then
  begin
  end
  else
  begin
      if (Pos('http:',LowerCase(APicPath))>0)
        or (Pos('https:',LowerCase(APicPath))>0) then
      begin
          Result:='';
      end
      else
      begin
          APicPath:=GetApplicationPath+APicPath;

          Result:=APicPath;
      end;
  end;
end;





{$IFDEF OPEN_PLATFORM_SERVER}
//在开放平台服务端中使用
{$ELSE}
//在开放平台客户端中使用


function GetDefaultUserHeadUrl:String;
begin
  //默认用户头像
  ///upload/1011/userhead_pic/Default_Pic/user_pic.png
  Result:=ImageHttpServerUrl+'/'
              +'upload'+'/'
              +(AppID)+'/'
              +'userhead_pic'+'/'
              +'Default_Pic'+'/'
              +'user_pic.png';

end;

function GetDefaultGroupHeadUrl:String;
begin
  //默认用户头像
  Result:=ImageHttpServerUrl+'/'
              +'upload'+'/'
              +(AppID)+'/'
              +'userhead_pic'+'/'
              +'Default_Pic'+'/'
              +'group.png';

end;

function GetImageUrl(APicPath:String;
                      AImageType:TImageType=itNone;
                      AIsThumb:Boolean=False):String;
var
  ATempIndex:Integer;
begin
  Result:='';
  if APicPath='' then
  begin
      case AImageType of
        itNone: ;
        itUserHead:
        begin
          Result:=GetDefaultUserHeadUrl;
        end;
      end;
  end
  else
  begin
      if (Pos('http:',LowerCase(APicPath))>0)
        or (Pos('https:',LowerCase(APicPath))>0) then
      begin
          Result:=APicPath;
      end
      else
      begin
          APicPath:=ImageHttpServerUrl+'/'+ReplaceStr(APicPath,'\','/');


          {$IF CompilerVersion > 21.0} // XE or older
          if AIsThumb then
          begin
            //处理下  改成缩略图的路径    原图占内存太大了
            ATempIndex:=APicPath.LastIndexOf('/');
            APicPath:=APicPath.Substring(0,ATempIndex+1)
                          +'thumb_'
                          +APicPath.Substring(ATempIndex+1);
//            APicPath:=ExtractFilePath(APicPath)+'thumb_'+ExtractFileName(APicPath);
          end;
          {$IFEND}

          Result:=APicPath;
      end;
  end;
end;



function GetActivityRules(AFullMoney1:Double;
                          ADescMoney1:Double;
                          AFullMoney2:Double;
                          ADescMoney2:Double;
                          AFullMoney3:Double;
                          ADescMoney3:Double):String;
begin
  Result:='';

  if BiggerDouble(ADescMoney1,0) then
  begin
    Result:=Result+'满'+FloatToStr(AFullMoney1)+'减'+FloatToStr(ADescMoney1)+' ';
  end;

  if BiggerDouble(ADescMoney2,0) then
  begin
    Result:=Result+'满'+FloatToStr(AFullMoney2)+'减'+FloatToStr(ADescMoney2)+' ';
  end;

  if BiggerDouble(ADescMoney3,0) then
  begin
    Result:=Result+'满'+FloatToStr(AFullMoney3)+'减'+FloatToStr(ADescMoney3)+' ';
  end;


end;

function GetMonthTime(AMonday:Integer;
                      ATuesday:Integer;
                      AWednesday:Integer;
                      AThursday:Integer;
                      AFriday:Integer;
                      ASaturday:Integer;
                      ASunday:Integer ):String;
begin
  Result:='';

  if (AMonday=1) and (ATuesday=1) and (AWednesday=1) and (AThursday=1)
    and (AFriday=1) and (ASaturday=1) and (ASunday=1) then
  begin
    Result:='整周';
  end
  else
  begin
    if AMonday=1 then
    begin
      Result:=Result+'周一';
    end;

    if ATuesday=1 then
    begin
      Result:=Result+'周二';
    end;

    if AWednesday=1 then
    begin
      Result:=Result+'周三';
    end;

    if AThursday=1 then
    begin
      Result:=Result+'周四';
    end;

    if AFriday=1 then
    begin
      Result:=Result+'周五';
    end;

    if ASaturday=1 then
    begin
      Result:=Result+'周六';
    end;

    if ASunday=1 then
    begin
      Result:=Result+'周日';
    end;
  end;




end;
{$ENDIF}



{$IFDEF OPEN_PLATFORM_SERVER}
//在开放平台服务端中使用
{$ELSE}
//在开放平台客户端中使用

//获取等待营业的时间
function GetDayWaitBusinessTime(AShop:TShop;ADay:TDateTime):String;
begin
  Result:='';

  case DayofWeek(ADay) of
    1:
    begin
        //星期天
        if (Result='') and (AShop.sun_is_sale=1) then
        begin
          Result:='周日'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time));
        end;
        if (Result='') and (AShop.sun_is_sale2=1) then
        begin
          Result:='周日'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time2));
        end;
    end;
    2:
    begin
        //周一
        if (Result='') and (AShop.mon_is_sale=1) then
        begin
          Result:='周一'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time));
        end;
        if (Result='') and (AShop.mon_is_sale2=1) then
        begin
          Result:='周一'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time2));
        end;

    end;
    3:
    begin
        //周二
        if (Result='') and (AShop.tues_is_sale=1) then
        begin
          Result:='周二'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time));
        end;
        if (Result='') and (AShop.tues_is_sale2=1) then
        begin
          Result:='周二'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time2));
        end;

    end;
    4:
    begin
        //周三
        if (Result='') and (AShop.wed_is_sale=1) then
        begin
          Result:='周三'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time));
        end;
        if (Result='') and (AShop.wed_is_sale2=1) then
        begin
          Result:='周三'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time2));
        end;
    end;
    5:
    begin
        //周四
        if (Result='') and (AShop.thur_is_sale=1) then
        begin
          Result:='周四'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time))+'继续营业';
        end;
        if (Result='') and (AShop.thur_is_sale2=1) then
        begin
          Result:='周四'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time2))+'继续营业';
        end;
    end;
    6:
    begin
        //周五
        if (Result='') and (AShop.fri_is_sale=1) then
        begin
          Result:='周五'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time))+'继续营业';
        end;
        if (Result='') and (AShop.fri_is_sale2=1) then
        begin
          Result:='周五'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time2))+'继续营业';
        end;

    end;
    7:
    begin
        //周六
        if (Result='') and (AShop.sat_is_sale=1) then
        begin
          Result:='周六'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time))+'继续营业';
        end;
        if (Result='') and (AShop.sat_is_sale2=1) then
        begin
          Result:='周六'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time2))+'继续营业';
        end;

    end;
  end;
end;


//获取今天等待营业的时间
function GetTodayWaitBusinessTime(AShop:TShop):String;
var
  ATodayTimeStr:String;
begin
  Result:='';

  ATodayTimeStr:=FormatDateTime('HH:MM',Now);

  case DayofWeek(Now) of
    1:
    begin
        //星期天
        if (Result='') and (AShop.sun_is_sale=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))) then
        begin
            //比开始时间早
            Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))
                     +'-'+
                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time));
        end;
        if (Result='') and (AShop.sun_is_sale2=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time2))) then
        begin
            Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time2))
                     +'-'+
                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time2));
        end;
    end;
    2:
    begin
        //周一
        if (Result='') and (AShop.mon_is_sale=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))) then
        begin
            Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))
                     +'-'+
                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time));
        end;
        if (Result='') and (AShop.mon_is_sale2=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time2))) then
        begin
            Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time2))
                     +'-'+
                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time2));
        end;

    end;
    3:
    begin
        //周二
        if (Result='') and (AShop.tues_is_sale=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))) then
        begin
            Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))
                     +'-'+
                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time));
        end;
        if (Result='') and (AShop.tues_is_sale2=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time2))) then
        begin
            Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time2))
                     +'-'+
                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time2));
        end;

    end;
    4:
    begin
        //周三
        if (Result='') and (AShop.wed_is_sale=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))) then
        begin
            Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time));
        end;
        if (Result='') and (AShop.wed_is_sale2=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time2))) then
        begin
            Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time2));
        end;
    end;
    5:
    begin
        //周四
        if (Result='') and (AShop.thur_is_sale=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))) then
        begin
          Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time));
        end;
        if (Result='') and (AShop.thur_is_sale2=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time2))) then
        begin
          Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time2));
        end;
    end;
    6:
    begin
        if (Result='') and (AShop.fri_is_sale=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))) then
        begin
          Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time));
        end;
        if (Result='') and (AShop.fri_is_sale2=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time2))) then
        begin
          Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time2));
        end;

    end;
    7:
    begin
        if (Result='') and (AShop.sat_is_sale=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))) then
        begin
          Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time));
        end;
        if (Result='') and (AShop.sat_is_sale2=1) and (ATodayTimeStr<FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time2))) then
        begin
          Result:=FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time2))
                   +'-'+
                   FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time2));
        end;

    end;
  end;

  if Result<>'' then
  begin
    Result:='今天'+Result+'继续营业';
  end;
end;

function GetNextBusinessTime(AShop: TShop): String;
var
  I: Integer;
begin


  //判断今天有没有时间在营业,因为今天是要判断时分秒的,明后天是不需要的
  Result:=GetTodayWaitBusinessTime(AShop);
  if Result='' then
  begin

      //接下去六天,每天都判断一下有没有营业的时间,有了,就不再判断
      for I := 1 to 6 do
      begin
        Result:=GetDayWaitBusinessTime(AShop,Now+I);
        if Result<>'' then
        begin
          Break;
        end;
      end;

  end;


  if Result='' then
  begin
    Result:='待营业';
  end;



//  case DayofWeek(Now) of
//    1:
//    begin
//          //星期天
//          if AShop.sun_is_sale=1 then
//          begin
//            Result:='今天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))
//                     +'-'+
//                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time))+'继续营业';
//
//          end
//          else if AShop.mon_is_sale=1 then
//          begin
//            Result:='明天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))
//                     +'-'+
//                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time))+'继续营业';
//
//          end
//          else if Ashop.tues_is_sale=1 then
//          begin
//            Result:='后天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))
//                     +'-'+
//                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time))+'继续营业';
//
//          end
//          else if AShop.wed_is_sale=1 then
//          begin
//            Result:='周三'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))
//                     +'-'+
//                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time))+'继续营业';
//
//          end
//          else if AShop.thur_is_sale=1 then
//          begin
//            Result:='周四'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))
//                     +'-'+
//                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time))+'继续营业';
//
//          end
//          else if AShop.fri_is_sale=1 then
//          begin
//            Result:='周五'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))
//                     +'-'+
//                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time))+'继续营业';
//
//          end
//          else if AShop.sat_is_sale=1 then
//          begin
//            Result:='周六'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))
//                     +'-'+
//                     FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time))+'继续营业';
//
//          end;
//    end;
//    2:
//    if AShop.mon_is_sale=1 then
//    begin
//      Result:='今天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time))+'继续营业';
//
//    end
//    else if Ashop.tues_is_sale=1 then
//    begin
//      Result:='明天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time))+'继续营业';
//
//    end
//    else if AShop.wed_is_sale=1 then
//    begin
//      Result:='后天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time))+'继续营业';
//
//    end
//    else if AShop.thur_is_sale=1 then
//    begin
//      Result:='周四'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time))+'继续营业';
//
//    end
//    else if AShop.fri_is_sale=1 then
//    begin
//      Result:='周五'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time))+'继续营业';
//
//    end
//    else if AShop.sat_is_sale=1 then
//    begin
//      Result:='周六'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time))+'继续营业';
//
//    end
//    else if AShop.sun_is_sale=1 then
//    begin
//      Result:='周日'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time))+'继续营业';
//
//    end;
//    3:
//    if Ashop.tues_is_sale=1 then
//    begin
//      Result:='今天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time))+'继续营业';
//
//    end
//    else if AShop.wed_is_sale=1 then
//    begin
//      Result:='明天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time))+'继续营业';
//
//    end
//    else if AShop.thur_is_sale=1 then
//    begin
//      Result:='后天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time))+'继续营业';
//
//    end
//    else if AShop.fri_is_sale=1 then
//    begin
//      Result:='周五'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time))+'继续营业';
//
//    end
//    else if AShop.sat_is_sale=1 then
//    begin
//      Result:='周六'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time))+'继续营业';
//
//    end
//    else if AShop.sun_is_sale=1 then
//    begin
//      Result:='周日'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time))+'继续营业';
//
//    end
//    else if AShop.mon_is_sale=1 then
//    begin
//      Result:='下周一'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time))+'继续营业';
//
//    end;
//    4:
//    if AShop.wed_is_sale=1 then
//    begin
//      Result:='今天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time))+'继续营业';
//
//    end
//    else if AShop.thur_is_sale=1 then
//    begin
//      Result:='明天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time))+'继续营业';
//
//    end
//    else if AShop.fri_is_sale=1 then
//    begin
//      Result:='后天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time))+'继续营业';
//
//    end
//    else if AShop.sat_is_sale=1 then
//    begin
//      Result:='周六'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time))+'继续营业';
//
//    end
//    else if AShop.sun_is_sale=1 then
//    begin
//      Result:='周日'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time))+'继续营业';
//
//    end
//    else if AShop.mon_is_sale=1 then
//    begin
//      Result:='下周一'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time))+'继续营业';
//
//    end
//    else if Ashop.tues_is_sale=1 then
//    begin
//      Result:='下周二'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time))+'继续营业';
//
//    end;
//    5:
//    if AShop.thur_is_sale=1 then
//    begin
//      Result:='今天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time))+'继续营业';
//
//    end
//    else if AShop.fri_is_sale=1 then
//    begin
//      Result:='明天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time))+'继续营业';
//
//    end
//    else if AShop.sat_is_sale=1 then
//    begin
//      Result:='后天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time))+'继续营业';
//
//    end
//    else if AShop.sun_is_sale=1 then
//    begin
//      Result:='周日'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time))+'继续营业';
//
//    end
//    else if AShop.mon_is_sale=1 then
//    begin
//      Result:='下周一'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time))+'继续营业';
//
//    end
//    else if Ashop.tues_is_sale=1 then
//    begin
//      Result:='下周二'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time))+'继续营业';
//
//    end
//    else if AShop.wed_is_sale=1 then
//    begin
//      Result:='下周三'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time))+'继续营业';
//
//    end;
//    6:
//    if AShop.fri_is_sale=1 then
//    begin
//      Result:='今天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time))+'继续营业';
//
//    end
//    else if AShop.sat_is_sale=1 then
//    begin
//      Result:='明天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time))+'继续营业';
//
//    end
//    else if AShop.sun_is_sale=1 then
//    begin
//      Result:='周日'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time))+'继续营业';
//
//    end
//    else if AShop.mon_is_sale=1 then
//    begin
//      Result:='下周一'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time))+'继续营业';
//
//    end
//    else if Ashop.tues_is_sale=1 then
//    begin
//      Result:='下周二'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time))+'继续营业';
//
//    end
//    else if AShop.wed_is_sale=1 then
//    begin
//      Result:='下周三'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time))+'继续营业';
//
//    end
//    else if AShop.thur_is_sale=1 then
//    begin
//      Result:='下周四'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time))+'继续营业';
//
//    end;
//    7:
//    if AShop.sat_is_sale=1 then
//    begin
//      Result:='今天'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time))+'继续营业';
//
//    end
//    else if AShop.sun_is_sale=1 then
//    begin
//      Result:='周日'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time))+'继续营业';
//
//    end
//    else if AShop.mon_is_sale=1 then
//    begin
//      Result:='下周一'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time))+'继续营业';
//
//    end
//    else if Ashop.tues_is_sale=1 then
//    begin
//      Result:='下周二'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time))+'继续营业';
//
//    end
//    else if AShop.wed_is_sale=1 then
//    begin
//      Result:='下周三'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time))+'继续营业';
//
//    end
//    else if AShop.thur_is_sale=1 then
//    begin
//      Result:='下周四'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time))+'继续营业';
//
//    end
//    else if AShop.fri_is_sale=1 then
//    begin
//      Result:='下周五'+FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))
//               +'-'+
//               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time))+'继续营业';
//
//    end;
//  end;

end;


function GetBusinessTime(AShop:TShop):String;
begin
  Result:='';



  if AShop.mon_is_sale=1 then
  begin
    Result:=Result+'周一'+' '+
               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time))
               +'-'
               +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time))+#13#10;

  end;
  if AShop.mon_is_sale2=1 then
  begin
    Result:=Result+'周一'+' '+
               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_start_time2))
               +'-'
               +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.mon_end_time2))+#13#10;

  end;




  if AShop.tues_is_sale=1 then
  begin
    Result:=Result+'周二'+' '+
               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time))
               +'-'
               +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time))+#13#10;
  end;
  if AShop.tues_is_sale2=1 then
  begin
    Result:=Result+'周二'+' '+
               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_start_time2))
               +'-'
               +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.tues_end_time2))+#13#10;
  end;




  if AShop.wed_is_sale=1 then
  begin
    Result:=Result+'周三'+' '+
               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time))
               +'-'
               +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time))+#13#10;
  end;
  if AShop.wed_is_sale2=1 then
  begin
    Result:=Result+'周三'+' '+
               FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_start_time2))
               +'-'
               +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.wed_end_time2))+#13#10;
  end;







  if AShop.thur_is_sale=1 then
  begin
    Result:=Result+'周四'+' '+
             FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time))
             +'-'
             +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time))+#13#10;
  end;
  if AShop.thur_is_sale2=1 then
  begin
    Result:=Result+'周四'+' '+
             FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_start_time2))
             +'-'
             +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.thur_end_time2))+#13#10;
  end;





  if AShop.fri_is_sale=1 then
  begin
    Result:=Result+'周五'+' '+
       FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time))
       +'-'
       +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time))+#13#10;
  end;
  if AShop.fri_is_sale2=1 then
  begin
    Result:=Result+'周五'+' '+
       FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_start_time2))
       +'-'
       +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.fri_end_time2))+#13#10;
  end;




  if AShop.sat_is_sale=1 then
  begin
    Result:=Result+'周六'+' '+
       FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time))
       +'-'
       +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time))+#13#10;

  end;
  if AShop.sat_is_sale2=1 then
  begin
    Result:=Result+'周六'+' '+
       FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_start_time2))
       +'-'
       +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sat_end_time2))+#13#10;

  end;



  if AShop.sun_is_sale=1 then
  begin
    Result:=Result+'周日'+' '+
       FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time))
       +'-'
       +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time))+#13#10;
  end;
  if AShop.sun_is_sale2=1 then
  begin
    Result:=Result+'周日'+' '+
       FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_start_time2))
       +'-'
       +FormatDateTime('HH:MM',StandardStrToDateTime(AShop.sun_end_time2))+#13#10;
  end;




end;

function IsDoBusiness(AShop:TShop):Boolean;
begin
    Result:=False;

    //CompareDateTime、CompareDate、CompareTime 返回的是 -1、0、1;
    //前者 = 后者: 返回 0;
    //前者 > 后者: 返回 1;
    //前者 < 后者: 返回 -1;
    //
    //SameDateTime、SameDate、SameTime 返回的是 True 和 False.


    case DayofWeek(Now) of
      1:
      begin
          //周日
          if (AShop.sun_is_sale=1) and (CompareTime(Now,StandardStrToDateTime(AShop.sun_start_time))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.sun_end_time))=-1)
            or (AShop.sun_is_sale2=1) and (CompareTime(Now,StandardStrToDateTime(AShop.sun_start_time2))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.sun_end_time2))=-1)
            then
          begin
            Result:=True;
          end;
      end;

      2:
      begin
          //周一
          if (AShop.mon_is_sale=1) and (CompareTime(Now,StandardStrToDateTime(AShop.mon_start_time))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.mon_end_time))=-1)
            or (AShop.mon_is_sale2=1) and (CompareTime(Now,StandardStrToDateTime(AShop.mon_start_time2))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.mon_end_time2))=-1) then
          begin
           Result:=True;
          end;
      end;

      3:
      begin
        //周二
        if (AShop.tues_is_sale=1) and (CompareTime(Now,StandardStrToDateTime(AShop.tues_start_time))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.tues_end_time))=-1)
          or (AShop.tues_is_sale2=1) and (CompareTime(Now,StandardStrToDateTime(AShop.tues_start_time2))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.tues_end_time2))=-1) then
         begin
           Result:=True;
         end;
      end;

      4:
      begin
         //周三
         if (AShop.wed_is_sale=1) and (CompareTime(Now,StandardStrToDateTime(AShop.wed_start_time))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.wed_end_time))=-1)
          or (AShop.wed_is_sale2=1) and (CompareTime(Now,StandardStrToDateTime(AShop.wed_start_time2))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.wed_end_time2))=-1) then
         begin
           Result:=True;
         end;
      end;

      5:
      begin
          //周四
         if (AShop.thur_is_sale=1) and (CompareTime(Now,StandardStrToDateTime(AShop.thur_start_time))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.thur_end_time))=-1)
          or (AShop.thur_is_sale2=1) and (CompareTime(Now,StandardStrToDateTime(AShop.thur_start_time2))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.thur_end_time2))=-1) then
         begin
           Result:=True;
         end;
      end;

      6:
      begin
         //周五
         if (AShop.fri_is_sale=1) and (CompareTime(Now,StandardStrToDateTime(AShop.fri_start_time))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.fri_end_time))=-1)
          or (AShop.fri_is_sale2=1) and (CompareTime(Now,StandardStrToDateTime(AShop.fri_start_time2))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.fri_end_time2))=-1) then
         begin
           Result:=True;
         end;
      end;

      7:
      begin
          //周六
          if (AShop.sat_is_sale=1) and (CompareTime(Now,StandardStrToDateTime(AShop.sat_start_time))=1) and (CompareTime(Now,StandardStrToDateTime(AShop.sat_end_time))=-1)
            or (AShop.sat_is_sale2=1) and (CompareTime(Now,StandardStrToDateTime(AShop.sat_start_time2))=1 )and (CompareTime(Now,StandardStrToDateTime(AShop.sat_end_time2))=-1) then
          begin
            Result:=True;
          end;
      end;
    end;

end;
{$ENDIF}




{$IFDEF OPEN_PLATFORM_SERVER}
//在开放平台服务端中使用
{$ELSE}
//在开放平台客户端中使用

{ TNotice }

function TNotice.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//2
//  //Self.appid:=AJson.I['appid'];//1001,
  sender_fid:=AJson.I['sender_fid'];
  notice_classify:=AJson.S['notice_classify'];
  notice_sub_type:=AJson.S['notice_sub_type'];
  caption:=AJson.S['caption'];
  content:=AJson.S['content'];
  content_html_filepath:=AJson.S['content_html_filepath'];
  custom_data_json:=AJson.S['custom_data_json'];
  content_url:=AJson.S['content_url'];
  createtime:=AJson.S['createtime'];
  is_deleted:=AJson.I['is_deleted'];

//  is_readed:=StrToInt(AJson.S['is_readed']);
  is_readed:=AJson.I['is_readed'];
end;

{ TNoticeList }

function TNoticeList.GetItem(Index: Integer): TNotice;
begin
  Result:=TNotice(Inherited Items[Index]);
end;

{ TNoticeClassify }

constructor TNoticeClassify.Create;
begin
  inherited;
//  RecentNotice:=TNotice.Create;
end;

destructor TNoticeClassify.Destroy;
begin
//  FreeAndNil(RecentNotice);
  inherited;
end;

function TNoticeClassify.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  notice_classify:=AJson.S['notice_classify'];
  classify_desc:=AJson.S['classify_desc'];
//  notice_classify_count:=AJson.I['notice_classify_count'];
//  notice_classify_name:=AJson.S['notice_classify_name'];
  notice_classify_caption:=AJson.S['notice_classify_caption'];
  notice_classify_unread_count:=AJson.I['notice_classify_unread_count'];

//  Self.RecentNotice.ParseFromJson(AJson.A['RecentNotice'].O[0]);
end;

{ TNoticeClassifyList }

function TNoticeClassifyList.GetItem(Index: Integer): TNoticeClassify;
begin
  Result:=TNoticeClassify(Inherited Items[Index]);
end;


{ TUserList }

function TUserList.GetArray: TStringDynArray;
var
  I: Integer;
begin
  SetLength(Result,Self.Count);
  for I := 0 to Self.Count-1 do
  begin
    Result[I]:=Self.Items[I].Name;
  end;

end;

function TUserList.GetItem(Index: Integer): TUser;
begin
  Result:=TUser(Inherited Items[Index]);
end;


{ TBankCard }

procedure TBankCard.AssignTo(Dest: TPersistent);
begin
  if Dest is TBankCard then
  begin
    TBankCard(Dest).fid:=fid;//1,
//    TBankCard(Dest).//Self.appid:=Self.appid;//1001,
    TBankCard(Dest).name:=name;
    TBankCard(Dest).bankname:=bankname;
    TBankCard(Dest).account:=account;
    TBankCard(Dest).createtime:=createtime;
    TBankCard(Dest).is_default:=is_default;
    TBankCard(Dest).is_deleted:=is_deleted;
  end;
end;

procedure TBankCard.Clear;
begin
  fid:=0;//1,
//  //Self.appid:=0;//1001,
  name:='';
  bankname:='';
  account:='';
  createtime:='';
  is_default:=0;
  is_deleted:=0;

end;

function TBankCard.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//2
//  //Self.appid:=AJson.I['appid'];//1001,
  name:=AJson.S['bankcard_name'];
  bankname:=AJson.S['bankcard_type'];
  account:=AJson.S['bankcard_account'];
  createtime:=AJson.S['createtime'];
  is_default:=AJson.I['is_default'];
  is_deleted:=AJson.I['is_deleted'];

end;

{ TBankCardList }

function TBankCardList.GetItem(Index: Integer): TBankCard;
begin
  Result:=TBankCard(Inherited Items[Index]);
end;

{ TUserRecvAddr }

procedure TUserRecvAddr.AssignTo(Dest: TPersistent);
begin
  TUserRecvAddr(Dest).fid:=fid;
//  TUserRecvAddr(Dest).//Self.appid:=Self.appid;
  TUserRecvAddr(Dest).user_fid:=user_fid;
  TUserRecvAddr(Dest).name:=name;
  TUserRecvAddr(Dest).sex:=sex;
  TUserRecvAddr(Dest).latitude:=latitude;
  TUserRecvAddr(Dest).longitude:=longitude;
  TUserRecvAddr(Dest).tag:=tag;
  TUserRecvAddr(Dest).is_deleted:=is_deleted;
  TUserRecvAddr(Dest).country:=country;
  TUserRecvAddr(Dest).province:=province;
  TUserRecvAddr(Dest).city:=city;
//  TUserRecvAddr(Dest).door_no:=door_no;
  TUserRecvAddr(Dest).phone:=phone;
  TUserRecvAddr(Dest).addr:=addr;
  TUserRecvAddr(Dest).street:=street;
  TUserRecvAddr(Dest).building:=building;
  TUserRecvAddr(Dest).addr_line3:=addr_line3;
  TUserRecvAddr(Dest).postcode:=postcode;
  TUserRecvAddr(Dest).is_default:=is_default;
  TUserRecvAddr(Dest).createtime:=createtime;
  TUserRecvAddr(Dest).area:=area;
end;

procedure TUserRecvAddr.Clear;
begin
  fid:=0;//4,
//  //Self.appid:=0;//1001,
  user_fid:='0';//9,
  name:='';//"1",
  sex:=0;

  latitude:=0;
  longitude:=0;

  tag:='';
  is_deleted:=0;

  country:='';
  phone:='';//"18957901025",
  addr:='';//"rrrrrrrr",

  street:=''; //"",
  building:=''; //"",
  addr_line3:='';// "",
  postcode:='';// "",

  createtime:='';//"2017-07-18 17:04:31",
  is_default:=0;//1,
  province:='';//"",
  city:='';//""
  area:='';//"",
//  door_no:='';
end;

function TUserRecvAddr.GetArea: String;
begin
  {$IFDEF USE_GOOGLE_ROUTE_PLAN}
  Result:=Self.area+','+Self.city+','+Self.province;
  {$ELSE}
  Result:=Self.province+' '+Self.city+' '+Self.area+'';
  {$ENDIF}
end;

function TUserRecvAddr.GetLongAddr: String;
begin
  {$IFDEF USE_GOOGLE_ROUTE_PLAN}
  Result:=Self.addr+Self.area+Self.city+Self.province+Self.country;
  {$ELSE}
  Result:=Self.country+Self.province+Self.city+Self.area+Self.addr;
  {$ENDIF}
end;

function TUserRecvAddr.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//4,
  //Self.appid:=AJson.I['appid'];//1001,
  user_fid:=AJson.V['user_fid'];//9,
  name:=AJson.S['name'];//"1",
  sex:=AJson.I['sex'];

  latitude:=GetJsonDoubleValue(AJson,'latitude');
  longitude:=GetJsonDoubleValue(AJson,'longitude');

  tag:=AJson.S['tag'];
  is_deleted:=AJson.I['is_deleted'];

  country:=AJson.S['country'];
  phone:=AJson.S['phone'];//"18957901025",
  addr:=AJson.S['addr'];//"rrrrrrrr",

  street:=AJson.S['street']; //"",
  building:=AJson.S['building']; //"",
  addr_line3:=AJson.S['addr_line3'];// "",
  postcode:=AJson.S['postcode'];// "",

  createtime:=AJson.S['createtime'];//"2017-07-18 17:04:31",
  is_default:=AJson.I['is_default'];//1,
  province:=AJson.S['province'];//"",
  city:=AJson.S['city'];//""
  area:=AJson.S['area'];//"",
//  door_no:=AJson.S['door_no'];
end;

{ TUserRecvAddrList }

function TUserRecvAddrList.GetDefaultRecvAddr: TUserRecvAddr;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if Items[I].is_default=1 then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TUserRecvAddrList.GetItem(Index: Integer): TUserRecvAddr;
begin
  Result:=TUserRecvAddr(Inherited Items[Index]);
end;

function TUserRecvAddrList.GetNearestRecvAddr(
                                AShopLongitude:Double;//商家的位置
                                AShopLatitude:Double;
                                AShopMaxDeliveryDistance:Double;//商家的配送最大范围
                                AMyLongitude:Double;//我的位置
                                AMyLatitude:Double): TUserRecvAddr;
var
  AShopDistance:Double;
  AMyDistance:Double;
  AMin:Double;
  I: Integer;
begin
  AMin:=MaxInt;
  Result:=nil;

  uBaseLog.HandleException(nil,'OrangeUI GetNearestRecvAddr');

  //先获取在商家配送范围内的收货地址,并且离我最近的
  for I := 0 to Self.Count-1 do
  begin
    AShopDistance:=uGPSUtils.GetFlatternDistance(
                  AShopLatitude,AShopLongitude,
                  Items[I].latitude,Items[I].longitude
                  );
    uBaseLog.HandleException(nil,'OrangeUI AShopDistance');

    AMyDistance:=uGPSUtils.GetFlatternDistance(
                  AMyLatitude,AMyLongitude,
                  Items[I].latitude,Items[I].longitude
                  );
    uBaseLog.HandleException(nil,'OrangeUI AMyDistance');

    if (AShopDistance<AShopMaxDeliveryDistance)//收货地址在商家配送范围之内
       and (AMyDistance<AMin)
       then
    begin
      AMin:=AMyDistance;
      Result:=Items[I];
    end;

  end;
end;




{ TShop }

procedure TShop.AssignTo(Dest: TPersistent);
var
  DestObject:TShop;
begin
  DestObject:=TShop(Dest);
  DestObject.fid:=fid;
//  //DestObject.//Self.appid:=Self.appid;
  DestObject.user_fid:=user_fid;
  DestObject.request_fid:=request_fid;
  DestObject.is_deleted:=is_deleted;
  DestObject.createtime:=createtime;
  DestObject.is_open:=is_open;
  DestObject.status:=status;
  DestObject.is_collected:=is_collected;
  DestObject.close_reason:=close_reason;
  DestObject.phone:=phone;
  DestObject.name:=name;
  DestObject.make_food_spent:=make_food_spent;
  DestObject.deliver_phone:=deliver_phone;
  DestObject.recv_sms_phone:=recv_sms_phone;
  DestObject.contact_name:=contact_name;
  DestObject.shop_desc:=shop_desc;
  DestObject.flavors:=flavors;
  DestObject.logo_pic_path:=logo_pic_path;
  DestObject.door_face_pic_path:=door_face_pic_path;
  DestObject.inner_pic_path1:=inner_pic_path1;
  DestObject.inner_pic_path2:=inner_pic_path2;
  DestObject.inner_pic_path3:=inner_pic_path3;
  DestObject.promotion_info:=promotion_info;

  DestObject.has_lot_goods:=has_lot_goods;





  DestObject.mon_start_time:=mon_start_time;
  DestObject.mon_end_time:=mon_end_time;
  DestObject.mon_is_sale:=mon_is_sale;

  DestObject.tues_start_time:=tues_start_time;
  DestObject.tues_end_time:=tues_end_time;
  DestObject.tues_is_sale:=tues_is_sale;

  DestObject.wed_start_time:=wed_start_time;
  DestObject.wed_end_time:=wed_end_time;
  DestObject.wed_is_sale:=wed_is_sale;

  DestObject.thur_start_time:=thur_start_time;
  DestObject.thur_end_time:=thur_end_time;
  DestObject.thur_is_sale:=thur_is_sale;

  DestObject.fri_start_time:=fri_start_time;
  DestObject.fri_end_time:=fri_end_time;
  DestObject.fri_is_sale:=fri_is_sale;

  DestObject.sat_start_time:=sat_start_time;
  DestObject.sat_end_time:=sat_end_time;
  DestObject.sat_is_sale:=sat_is_sale;

  DestObject.sun_start_time:=sun_start_time;
  DestObject.sun_end_time:=sun_end_time;
  DestObject.sun_is_sale:=sun_is_sale;



  DestObject.mon_start_time2:=mon_start_time2;
  DestObject.mon_end_time2:=mon_end_time2;
  DestObject.mon_is_sale2:=mon_is_sale2;

  DestObject.tues_start_time2:=tues_start_time2;
  DestObject.tues_end_time2:=tues_end_time2;
  DestObject.tues_is_sale2:=tues_is_sale2;

  DestObject.wed_start_time2:=wed_start_time2;
  DestObject.wed_end_time2:=wed_end_time2;
  DestObject.wed_is_sale2:=wed_is_sale2;

  DestObject.thur_start_time2:=thur_start_time2;
  DestObject.thur_end_time2:=thur_end_time2;
  DestObject.thur_is_sale2:=thur_is_sale2;

  DestObject.fri_start_time2:=fri_start_time2;
  DestObject.fri_end_time2:=fri_end_time2;
  DestObject.fri_is_sale2:=fri_is_sale2;

  DestObject.sat_start_time2:=sat_start_time2;
  DestObject.sat_end_time2:=sat_end_time2;
  DestObject.sat_is_sale2:=sat_is_sale2;

  DestObject.sun_start_time2:=sun_start_time2;
  DestObject.sun_end_time2:=sun_end_time2;
  DestObject.sun_is_sale2:=sun_is_sale2;






  DestObject.is_public_holiday_sale:=is_public_holiday_sale;

  DestObject.poundage_undertaker:=poundage_undertaker;

  DestObject.delivery_fee:=delivery_fee;

  DestObject.is_new:=is_new;
  DestObject.is_bookable:=is_bookable;
  DestObject.can_book_days:=can_book_days;
  DestObject.is_support_coupon:=is_support_coupon;
  DestObject.is_invoice:=is_invoice;
  DestObject.invoice_min_amount:=invoice_min_amount;
  DestObject.app_business_category_fid:=app_business_category_fid;
  DestObject.province:=province;
  DestObject.city:=city;
  DestObject.area:=area;
  DestObject.addr:=addr;
  DestObject.street:=street;
  DestObject.building:=building;
  DestObject.addr_line3:=addr_line3;
  DestObject.postcode:=postcode;
  DestObject.latitude:=latitude;
  DestObject.longitude:=longitude;
  DestObject.agent_deliver_fee:=agent_deliver_fee;
  DestObject.no_agent_fee_order_total:=no_agent_fee_order_total;
  DestObject.deliver_min_order_amount:=deliver_min_order_amount;
  DestObject.deliver_max_distance:=deliver_max_distance;
  DestObject.num_ratings:=num_ratings;
  DestObject.all_order_num:=all_order_num;
  DestObject.all_goods_num:=all_goods_num;
  DestObject.recent_order_num:=recent_order_num;
  DestObject.recent_goods_popularity:=recent_goods_popularity;
  DestObject.rating_score:=rating_score;
  DestObject.service_rating_score:=service_rating_score;
  DestObject.goods_rating_score:=goods_rating_score;
  DestObject.deliver_time_spent:=deliver_time_spent;
  DestObject.credit_score:=credit_score;
  DestObject.bankcard_name:=bankcard_name;
  DestObject.bankcard_bankname:=bankcard_bankname;
  DestObject.bankcard_account:=bankcard_account;
  DestObject.app_coop_scheme_fid:=app_coop_scheme_fid;
  DestObject.app_service_fee_rate:=app_service_fee_rate;
  DestObject.app_deliver_fee:=app_deliver_fee;
  DestObject.app_deliver_type:=app_deliver_type;
  DestObject.city_code:=city_code;
  DestObject.region_code:=region_code;
  DestObject.audit_state:=audit_state;
  DestObject.audit_user_fid:=audit_user_fid;
  DestObject.audit_remark:=audit_remark;
  DestObject.audit_time:=audit_time;
  DestObject.app_business_category_name:=app_business_category_name;

  DestObject.is_can_takeorder_and_delivery:=is_can_takeorder_and_delivery;
  DestObject.is_can_takeorder_but_only_self_take:=is_can_takeorder_but_only_self_take;
  DestObject.is_can_takeorder_but_only_eat_in_shop:=is_can_takeorder_but_only_eat_in_shop;

  DestObject.distance:=distance;

  DestObject.is_platform_shop:=is_platform_shop;

  DestObject.min_posting_price:=min_posting_price;
  DestObject.is_need_posting_price:=is_need_posting_price;

  DestObject.is_pay_goods_money_online:=is_pay_goods_money_online;
end;

procedure TShop.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  user_fid:='0';
  request_fid:=0;
  is_deleted:=0;
  createtime:='';
  is_open:=0;
  status:=0;
  is_collected:=0;
  close_reason:='';
  phone:='';
  name:='';
  deliver_phone:='';
  recv_sms_phone:='';
  contact_name:='';
  shop_desc:='';
  flavors:='';
  make_food_spent:=0;
  logo_pic_path:='';
  door_face_pic_path:='';
  inner_pic_path1:='';
  inner_pic_path2:='';
  inner_pic_path3:='';
  promotion_info:='';




  mon_start_time:='';// "2018-08-04 13:20:00",
  mon_end_time:='';// "2018-08-04 23:59:00",
  mon_is_sale:=0;// 0,

  tues_start_time:='';// "",
  tues_end_time:='';// "",
  tues_is_sale:=0;// 0,

  wed_start_time:='';// "",
  wed_end_time:='';// "",
  wed_is_sale:=0;// 0,

  thur_start_time:='';// "",
  thur_end_time:='';// "",
  thur_is_sale:=0;// 0,

  fri_start_time:='';// "",
  fri_end_time:='';// "",
  fri_is_sale:=0;// 0,

  sat_start_time:='';// "",
  sat_end_time:='';// "",
  sat_is_sale:=0;// 0,

  sun_start_time:='';// "",
  sun_end_time:='';// "",
  sun_is_sale:=0;// 0,





  mon_start_time2:='';// "2018-08-04 13:20:00",
  mon_end_time2:='';// "2018-08-04 23:59:00",
  mon_is_sale2:=0;// 0,

  tues_start_time2:='';// "",
  tues_end_time2:='';// "",
  tues_is_sale2:=0;// 0,

  wed_start_time2:='';// "",
  wed_end_time2:='';// "",
  wed_is_sale2:=0;// 0,

  thur_start_time2:='';// "",
  thur_end_time2:='';// "",
  thur_is_sale2:=0;// 0,

  fri_start_time2:='';// "",
  fri_end_time2:='';// "",
  fri_is_sale2:=0;// 0,

  sat_start_time2:='';// "",
  sat_end_time2:='';// "",
  sat_is_sale2:=0;// 0,

  sun_start_time2:='';// "",
  sun_end_time2:='';// "",
  sun_is_sale2:=0;// 0,







  is_public_holiday_sale:=0;// 0,

  poundage_undertaker:='';

  delivery_fee:=0;

  is_new:=0;
  is_bookable:=0;
  can_book_days:=0;
  is_support_coupon:=0;
  is_invoice:=0;
  invoice_min_amount:=0.0;
  app_business_category_fid:=0;
  province:='';
  city:='';
  area:='';
  addr:='';
  street:=''; //"",
  building:=''; //"",
  addr_line3:='';// "",
  postcode:='';// "",
  latitude:=0.0;
  longitude:=0.0;
  agent_deliver_fee:=0.0;
  no_agent_fee_order_total:=0.0;
  deliver_min_order_amount:=0;
  deliver_max_distance:=0.0;
  num_ratings:=0.0;
  all_order_num:=0;
  all_goods_num:=0;
  recent_order_num:=0;
  recent_goods_popularity:=0;
  rating_score:=0.0;
  service_rating_score:=0.0;
  goods_rating_score:=0;
  deliver_time_spent:=0;
  credit_score:=0;
  bankcard_name:='';
  bankcard_bankname:='';
  bankcard_account:='';
  app_coop_scheme_fid:=0;
  app_service_fee_rate:=0.0;
  app_deliver_fee:=0.0;
  app_deliver_type:=0;
  city_code:='';
  region_code:='';
  audit_state:=0;
  audit_user_fid:='0';
  audit_remark:='';
  audit_time:='';
  app_business_category_name:='';

  is_can_takeorder_and_delivery:=0;
  is_can_takeorder_but_only_self_take:=0;
  is_can_takeorder_but_only_eat_in_shop:=0;

  distance:=0;

  is_platform_shop:=0;

  min_posting_price:=0;
  is_need_posting_price:=0;

  is_pay_goods_money_online:=0;


end;

constructor TShop.Create;
begin
  inherited;
  ShopPromotionList:=TActivityList.Create;
  ShopGoodsCategoryList:=TShopGoodsCategoryList.Create;
  ShopGoodsList:=TShopGoodsList.Create;
end;

destructor TShop.Destroy;
begin
  FreeAndNil(ShopGoodsCategoryList);

  FreeAndNil(ShopGoodsList);
  FreeAndNil(ShopPromotionList);
  inherited;
end;

function TShop.Getdoorfacepicpath: String;
begin
  Result:='';
  if Self.door_face_pic_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.door_face_pic_path,'\','/');
  end;
end;

function TShop.Getinnerpicpath1: String;
begin
  Result:='';
  if Self.inner_pic_path1<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.inner_pic_path1,'\','/');
  end;
end;

function TShop.Getinnerpicpath2: String;
begin
  Result:='';
  if Self.inner_pic_path2<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.inner_pic_path2,'\','/');
  end;
end;

function TShop.Getinnerpicpath3: String;
begin
  Result:='';
  if Self.inner_pic_path3<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.inner_pic_path3,'\','/');
  end;
end;

function TShop.Getlogopicpath: String;
begin
  Result:='';
  if Self.logo_pic_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.logo_pic_path,'\','/');
  end;

end;

function TShop.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  uBaseLog.HandleException(nil,'TShop.ParseFromJson Begin');
  fid:=AJson.I['fid'];

  //Self.appid:=AJson.I['appid'];
  try
    user_fid:=AJson.V['user_fid'];
  except
    user_fid:=IntToStr(AJson.I['user_fid']);
  end;


  request_fid:=AJson.I['request_fid'];
  is_deleted:=AJson.I['is_deleted'];
  createtime:=AJson.S['createtime'];
  is_open:=Ajson.I['is_open'];
  status:=AJson.I['status'];
  is_collected:=AJson.I['is_collected'];
  close_reason:=AJson.S['close_reason'];
  app_business_category_fid:=AJson.I['app_business_category_fid'];

  phone:=AJson.S['phone'];
  name:=AJson.S['name'];
  deliver_phone:=AJson.S['deliver_phone'];
  recv_sms_phone:=AJson.S['recv_sms_phone'];

  contact_name:=AJson.S['contact_name'];
  shop_desc:=AJson.S['shop_desc'];
  flavors:=AJson.S['flavors'];

  has_lot_goods:=AJson.I['has_lot_goods'];


  make_food_spent:=AJson.I['make_food_spent'];


  logo_pic_path:=AJson.S['logo_pic_path'];
  door_face_pic_path:=AJson.S['door_face_pic_path'];
  inner_pic_path1:=AJson.S['inner_pic_path1'];
  inner_pic_path2:=AJson.S['inner_pic_path2'];
  inner_pic_path3:=AJson.S['inner_pic_path3'];

  promotion_info:=AJson.S['promotion_info'];





  mon_start_time:=AJson.S['mon_start_time'];// "2018-08-04 13:20:00",
  mon_end_time:=AJson.S['mon_end_time'];// "2018-08-04 23:59:00",
  mon_is_sale:=AJson.I['mon_is_sale'];// 0,

  tues_start_time:=Ajson.S['tues_start_time'];// "",
  tues_end_time:=AJson.S['tues_end_time'];// "",
  tues_is_sale:=AJson.I['tues_is_sale'];// 0,

  wed_start_time:=AJson.S['wed_start_time'];// "",
  wed_end_time:=AJson.S['wed_end_time'];// "",
  wed_is_sale:=AJson.I['wed_is_sale'];// 0,

  thur_start_time:=AJson.S['thur_start_time'];// "",
  thur_end_time:=AJson.S['thur_end_time'];// "",
  thur_is_sale:=AJson.I['thur_is_sale'];// 0,

  fri_start_time:=AJson.S['fri_start_time'];// "",
  fri_end_time:=AJson.S['fri_end_time'];// "",
  fri_is_sale:=AJson.I['fri_is_sale'];// 0,

  sat_start_time:=AJson.S['sat_start_time'];// "",
  sat_end_time:=AJson.S['sat_end_time'];// "",
  sat_is_sale:=AJson.I['sat_is_sale'];// 0,

  sun_start_time:=AJson.S['sun_start_time'];// "",
  sun_end_time:=AJson.S['sun_end_time'];// "",
  sun_is_sale:=AJson.I['sun_is_sale'];// 0,




  mon_start_time2:=AJson.S['mon_start_time2'];// "2018-08-04 13:20:00",
  mon_end_time2:=AJson.S['mon_end_time2'];// "2018-08-04 23:59:00",
  mon_is_sale2:=AJson.I['mon_is_sale2'];// 0,

  tues_start_time2:=Ajson.S['tues_start_time2'];// "",
  tues_end_time2:=AJson.S['tues_end_time2'];// "",
  tues_is_sale2:=AJson.I['tues_is_sale2'];// 0,

  wed_start_time2:=AJson.S['wed_start_time2'];// "",
  wed_end_time2:=AJson.S['wed_end_time2'];// "",
  wed_is_sale2:=AJson.I['wed_is_sale2'];// 0,

  thur_start_time2:=AJson.S['thur_start_time2'];// "",
  thur_end_time2:=AJson.S['thur_end_time2'];// "",
  thur_is_sale2:=AJson.I['thur_is_sale2'];// 0,

  fri_start_time2:=AJson.S['fri_start_time2'];// "",
  fri_end_time2:=AJson.S['fri_end_time2'];// "",
  fri_is_sale2:=AJson.I['fri_is_sale2'];// 0,

  sat_start_time2:=AJson.S['sat_start_time2'];// "",
  sat_end_time2:=AJson.S['sat_end_time2'];// "",
  sat_is_sale2:=AJson.I['sat_is_sale2'];// 0,

  sun_start_time2:=AJson.S['sun_start_time2'];// "",
  sun_end_time2:=AJson.S['sun_end_time2'];// "",
  sun_is_sale2:=AJson.I['sun_is_sale2'];// 0,




  is_public_holiday_sale:=AJson.I['is_public_holiday_sale'];// 0,

  poundage_undertaker:=AJson.S['poundage_undertaker'];

  delivery_fee:=AJSon.F['delivery_fee'];

  is_bookable:=AJson.I['is_bookable'];
  can_book_days:=AJson.I['can_book_days'];

  is_invoice:=AJson.I['is_invoice'];
  invoice_min_amount:=GetJsonDoubleValue(AJson,'invoice_min_amount');

  province:=AJson.S['province'];
  city:=AJson.S['city'];
  area:=AJson.S['area'];
  addr:=AJson.S['addr'];
  street:=AJson.S['street']; //"",
  building:=AJson.S['building']; //"",
  addr_line3:=AJson.S['addr_line3'];// "",
  postcode:=AJson.S['postcode'];// "",

  latitude:=GetJsonDoubleValue(AJson,'latitude');
  longitude:=GetJsonDoubleValue(AJson,'longitude');

  agent_deliver_fee:=GetJsonDoubleValue(AJson,'agent_deliver_fee');
  no_agent_fee_order_total:=GetJsonDoubleValue(AJson,'no_agent_fee_order_total');
  deliver_min_order_amount:=GetJsonDoubleValue(AJson,'deliver_min_order_amount');
  deliver_max_distance:=GetJsonDoubleValue(AJson,'deliver_max_distance');

  bankcard_name:=AJson.S['bankcard_name'];
  bankcard_bankname:=AJson.S['bankcard_bankname'];
  bankcard_account:=AJson.S['bankcard_account'];

  app_coop_scheme_fid:=AJson.I['app_coop_scheme_fid'];
  app_service_fee_rate:=GetJsonDoubleValue(AJson,'app_service_fee_rate');
  app_deliver_fee:=GetJsonDoubleValue(AJson,'app_deliver_fee');
  app_deliver_type:=AJson.I['app_deliver_type'];
  city_code:=AJson.S['city_code'];
  region_code:=AJson.S['region_code'];

  is_support_coupon:=AJson.I['is_support_coupon'];
  is_new:=AJson.I['is_new'];
  num_ratings:=GetJsonDoubleValue(AJson,'num_ratings');
  all_order_num:=AJson.I['all_order_num'];
  all_goods_num:=AJson.I['all_goods_num'];
  recent_order_num:=AJson.I['recent_order_num'];
  recent_goods_popularity:=AJson.I['recent_goods_popularity'];

  rating_score:=GetJsonDoubleValue(AJson,'rating_score');
  service_rating_score:=GetJsonDoubleValue(AJson,'service_rating_score');
  goods_rating_score:=GetJsonDoubleValue(AJson,'goods_rating_score');

  deliver_time_spent:=AJson.I['deliver_time_spent'];
  credit_score:=AJson.I['credit_score'];

  app_business_category_name:=AJson.S['app_business_category_name'];
  app_coop_scheme_name:=AJson.S['app_coop_scheme_name'];

  try
    audit_user_fid:=AJson.V['audit_user_fid'];
  except
    audit_user_fid:=IntToStr(AJson.I['audit_user_fid']);
  end;

  audit_state:=AJson.I['audit_state'];
  audit_remark:=AJson.S['audit_remark'];
  audit_time:=AJson.S['audit_time'];

  is_can_takeorder_and_delivery:=AJson.I['is_can_takeorder_and_delivery'];
  is_can_takeorder_but_only_self_take:=AJson.I['is_can_takeorder_but_only_self_take'];
  is_can_takeorder_but_only_eat_in_shop:=AJson.I['is_can_takeorder_but_only_eat_in_shop'];

  distance:=AJson.I['distance'];

  is_platform_shop:=AJson.I['is_platform_shop'];

  min_posting_price:=AJSon.F['min_posting_price'];
  is_need_posting_price:=AJSon.I['is_need_posting_price'];

  is_pay_goods_money_online:=AJSon.I['is_pay_goods_money_online'];

  ShopPromotionList.Clear(True);

  ShopPromotionList.ParseFromJsonArray(TActivity,AJson.A['ShopPromotionList']);

  ShopGoodsCategoryList.Clear(True);

  ShopGoodsCategoryList.ParseFromJsonArray(TShopGoodsCategory,AJson.A['GoodsCategoryList']);

  ShopGoodsList.Clear(True);

  ShopGoodsList.ParseFromJsonArray(TShopGoods,AJson.A['GoodsList']);
  uBaseLog.HandleException(nil,'TShop.ParseFromJson End');

end;




{ TShopGoods }


procedure TShopGoods.AssignTo(Dest: TPersistent);
var
  DestObject:TShopGoods;
begin
  DestObject:=TShopGoods(Dest);
  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.shop_fid:=shop_fid;
  DestObject.shop_goods_category_fid:=shop_goods_category_fid;
  DestObject.name:=name;
  DestObject.name_s:=name_s;
  DestObject.name_s_f:=name_s_f;
  DestObject.goods_desc:=goods_desc;
  DestObject.speical_desc:=speical_desc;
  DestObject.is_deleted:=is_deleted;
  DestObject.orderno:=orderno;
  DestObject.createtime:=createtime;
  DestObject.month_sales:=month_sales;
  DestObject.month_rating:=month_rating;
  DestObject.all_sold_num:=all_sold_num;
  DestObject.all_rating:=all_rating;
  DestObject.rating_count:=rating_count;
  DestObject.satisfy_rate:=satisfy_rate;
  DestObject.satisfy_count:=satisfy_count;
  DestObject.is_featured:=is_featured;
  DestObject.is_gum:=is_gum;
  DestObject.is_new:=is_new;
  DestObject.is_spicy:=is_spicy;
  DestObject.is_not_for_minor:=is_not_for_minor;
  DestObject.length:=length;
  DestObject.width:=width;
  DestObject.height:=height;
  DestObject.weight:=weight;

  DestObject.pic1_path:=pic1_path;
  DestObject.pic2_path:=pic2_path;
  DestObject.pic3_path:=pic3_path;
  DestObject.pic4_path:=pic4_path;
  DestObject.pic5_path:=pic5_path;
  DestObject.pic6_path:=pic6_path;
  DestObject.pic7_path:=pic7_path;
  DestObject.pic8_path:=pic8_path;
  DestObject.pic9_path:=pic9_path;

  DestObject.desc_pic1_path:=desc_pic1_path;
  DestObject.desc_pic2_path:=desc_pic2_path;
  DestObject.desc_pic3_path:=desc_pic3_path;
  DestObject.desc_pic4_path:=desc_pic4_path;
  DestObject.desc_pic5_path:=desc_pic5_path;
  DestObject.desc_pic6_path:=desc_pic6_path;
  DestObject.desc_pic7_path:=desc_pic7_path;
  DestObject.desc_pic8_path:=desc_pic8_path;
  DestObject.desc_pic9_path:=desc_pic9_path;
  DestObject.desc_pic10_path:=desc_pic10_path;

  DestObject.factory:=factory;

end;

procedure TShopGoods.Clear;
begin
  Self.GoodsSpecList.Clear(True);

  fid:=0;
//  //Self.appid:=0;
  shop_fid:=0;
  shop_goods_category_fid:=0;
  name:='';
  name_s:='';
  name_s_f:='';
  goods_desc:='';
  speical_desc:='';
  is_deleted:=0;
  orderno:=0;
  createtime:='';
  month_sales:=0;
  month_rating:=0;
  all_sold_num:=0;
  all_rating:=0;
  rating_count:=0;
  satisfy_rate:=0;
  satisfy_count:=0;
  is_featured:=0;
  is_gum:=0;
  is_new:=0;
  is_spicy:=0;
  is_not_for_minor:=0;
  length:=0;
  width:=0;
  height:=0;
  weight:=0;

  pic1_path:='';//"",
  pic2_path:='';// "",
  pic3_path:='';// "",
  pic4_path:='';// "",
  pic5_path:='';// "",
  pic6_path:='';// "",
  pic7_path:='';// "",
  pic8_path:='';// "",
  pic9_path:='';// "",

  desc_pic1_path:='';// "",
  desc_pic2_path:='';// "",
  desc_pic3_path:='';// "",
  desc_pic4_path:='';// "",
  desc_pic5_path:='';// "",
  desc_pic6_path:='';// "",
  desc_pic7_path:='';// "",
  desc_pic8_path:='';// "",
  desc_pic9_path:='';// "",
  desc_pic10_path:='';// "",


  factory:='';
end;

constructor TShopGoods.Create;
begin
  inherited;
  GoodsSpecList:=TShopGoodsSpecList.Create;
  GoodsAttrList:=TShopGoodsAttrList.Create;
end;

destructor TShopGoods.Destroy;
begin
  FreeAndNil(GoodsSpecList);
  FreeAndNil(GoodsAttrList);
  inherited;
end;

function TShopGoods.GetDescPic10Url: String;
begin
  Result:='';
  if Self.desc_pic10_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(desc_pic10_path,'\','/');
  end;
end;

function TShopGoods.GetDescPic1Url: String;
begin
  Result:='';
  if Self.desc_pic1_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(desc_pic1_path,'\','/');
  end;
end;

function TShopGoods.GetDescPic2Url: String;
begin
  Result:='';
  if Self.desc_pic2_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(desc_pic2_path,'\','/');
  end;
end;

function TShopGoods.GetDescPic3Url: String;
begin
  Result:='';
  if Self.desc_pic3_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(desc_pic3_path,'\','/');
  end;
end;

function TShopGoods.GetDescPic4Url: String;
begin
  Result:='';
  if Self.desc_pic4_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(desc_pic4_path,'\','/');
  end;
end;

function TShopGoods.GetDescPic5Url: String;
begin
  Result:='';
  if Self.desc_pic5_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(desc_pic5_path,'\','/');
  end;
end;

function TShopGoods.GetDescPic6Url: String;
begin
  Result:='';
  if Self.desc_pic6_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(desc_pic6_path,'\','/');
  end;
end;

function TShopGoods.GetDescPic7Url: String;
begin
  Result:='';
  if Self.desc_pic7_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(desc_pic7_path,'\','/');
  end;
end;

function TShopGoods.GetDescPic8Url: String;
begin
  Result:='';
  if Self.desc_pic8_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(desc_pic8_path,'\','/');
  end;
end;

function TShopGoods.GetDescPic9Url: String;
begin
  Result:='';
  if Self.desc_pic9_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(desc_pic9_path,'\','/');
  end;
end;

function TShopGoods.GetPic1Url: String;
begin
  Result:='';
  if Self.pic1_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(pic1_path,'\','/');
  end;
end;

function TShopGoods.GetPic2Url: String;
begin
  Result:='';
  if Self.pic2_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(pic2_path,'\','/');
  end;
end;

function TShopGoods.GetPic3Url: String;
begin
  Result:='';
  if Self.pic3_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(pic3_path,'\','/');
  end;
end;

function TShopGoods.GetPic4Url: String;
begin
  Result:='';
  if Self.pic4_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(pic4_path,'\','/');
  end;
end;

function TShopGoods.GetPic5Url: String;
begin
  Result:='';
  if Self.pic5_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(pic5_path,'\','/');
  end;
end;

function TShopGoods.GetPic6Url: String;
begin
  Result:='';
  if Self.pic6_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(pic6_path,'\','/');
  end;
end;

function TShopGoods.GetPic7Url: String;
begin
  Result:='';
  if Self.pic7_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(pic7_path,'\','/');
  end;
end;

function TShopGoods.GetPic8Url: String;
begin
  Result:='';
  if Self.pic8_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(pic8_path,'\','/');
  end;
end;

function TShopGoods.GetPic9Url: String;
begin
  Result:='';
  if Self.pic9_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(pic9_path,'\','/');
  end;
end;

function TShopGoods.ParseFromJson(AJson: ISuperObject): Boolean;
begin

  fid:=AJson.I['fid'];//11,
  //Self.appid:=AJson.I['appid'];//1002,
  shop_fid:=AJson.I['shop_fid'];//4,
  shop_goods_category_fid:=AJson.I['shop_goods_category_fid'];//0,
  name:=AJson.S['name'];//"aa",
  name_s:=AJson.S['name_s'];//"AA",
  name_s_f:=AJson.S['name_s_f'];//"A A",
  goods_desc:=AJson.S['goods_desc'];//"bb",
  speical_desc:=AJson.S['speical_desc'];//"",
  is_deleted:=AJson.I['is_deleted'];//0,
  orderno:=GetJsonDoubleValue(AJson,'orderno');//0,
  createtime:=AJson.S['createtime'];//"2018-03-19 10:36:59",
  month_sales:=AJson.I['month_sales'];//0,
  month_rating:=GetJsonDoubleValue(AJson,'month_rating');//0,
  all_sold_num:=AJson.I['all_sold_num'];//0,
  all_rating:=GetJsonDoubleValue(AJson,'all_rating');//0,
  rating_count:=AJson.I['rating_count'];//0,
  satisfy_rate:=GetJsonDoubleValue(AJson,'satisfy_rating');//0,
  satisfy_count:=AJson.I['satisfy_rating_count'];//0,
  is_featured:=AJson.I['is_featured'];//0,
  is_gum:=AJson.I['is_gum'];//0,
  is_new:=AJson.I['is_new'];//0,
  is_spicy:=AJson.I['is_spicy'];//0,
  is_not_for_minor:=AJson.I['is_not_for_minor'];//0,

  length:=GetJsonDoubleValue(AJson,'length');//10,
  width:=GetJsonDoubleValue(AJson,'width');//20,
  height:=GetJsonDoubleValue(AJson,'height');//30,
  weight:=GetJsonDoubleValue(AJson,'weight');//3

  pic1_path:=AJson.S['pic1_path'];//"",
  pic2_path:=AJson.S['pic2_path'];// "",
  pic3_path:=AJson.S['pic3_path'];// "",
  pic4_path:=AJson.S['pic4_path'];// "",
  pic5_path:=AJson.S['pic5_path'];// "",
  pic6_path:=AJson.S['pic6_path'];// "",
  pic7_path:=AJson.S['pic7_path'];// "",
  pic8_path:=AJson.S['pic8_path'];// "",
  pic9_path:=AJson.S['pic9_path'];// "",

  desc_pic1_path:=AJson.S['desc_pic1_path'];// "",
  desc_pic2_path:=AJson.S['desc_pic2_path'];// "",
  desc_pic3_path:=AJson.S['desc_pic3_path'];// "",
  desc_pic4_path:=AJson.S['desc_pic4_path'];// "",
  desc_pic5_path:=AJson.S['desc_pic5_path'];// "",
  desc_pic6_path:=AJson.S['desc_pic6_path'];// "",
  desc_pic7_path:=AJson.S['desc_pic7_path'];// "",
  desc_pic8_path:=AJson.S['desc_pic8_path'];// "",
  desc_pic9_path:=AJson.S['desc_pic9_path'];// "",
  desc_pic10_path:=AJson.S['desc_pic10_path'];// "",


  factory:=AJson.S['factory'];// "",


  Self.GoodsSpecList.Clear(True);
  GoodsSpecList.ParseFromJsonArray(TShopGoodsSpec,AJson.A['GoodsSpec']);

  Self.GoodsAttrList.Clear(True);
  GoodsAttrList.ParseFromJsonArray(TShopGoodsAttr,AJson.A['GoodsAttr']);


end;

{ TShopGoodsList }

function TShopGoodsList.FindItemByFID(AFID: Integer): TShopGoods;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TShopGoodsList.GetItem(Index: Integer): TShopGoods;
begin
  Result:=TShopGoods(Inherited Items[Index]);
end;

{ TUserCartGoodsList }

function TUserCartGoodsList.FindItemByUserCartGoodsFID(
  AUserCartGoodsFID: Integer): TUserCartGoods;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].user_cart_goods_fid=AUserCartGoodsFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TUserCartGoodsList.GetItem(Index: Integer): TUserCartGoods;
begin
  Result:=TUserCartGoods(Inherited Items[Index]);
end;

{ TUserCartGoods }

procedure TUserCartGoods.AssignTo(Dest: TPersistent);
begin
  inherited;
  if Dest is TUserCartGoods then
  begin
    TUserCartGoods(Dest).user_cart_goods_fid:=user_cart_goods_fid;
    TUserCartGoods(Dest).user_fid:=user_fid;
    TUserCartGoods(Dest).goods_fid:=goods_fid;
    TUserCartGoods(Dest).number:=number;
    TUserCartGoods(Dest).is_checked:=is_checked;
  end;
end;

function TUserCartGoods.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  Inherited;

  user_cart_goods_fid:=AJson.I['user_cart_goods_fid'];//2
  user_fid:=AJson.V['user_fid'];//12
  goods_fid:=AJson.I['goods_fid'];
  number:=AJson.I['number'];
  is_checked:=AJson.I['is_checked'];

end;

{ TOrderList }

function TOrderList.GetItem(Index: Integer): TOrder;
begin
  Result:=TOrder(Inherited Items[Index]);
end;

{ TOrder }

procedure TOrder.AssignTo(Dest: TPersistent);
var
  DestObject:TOrder;
begin
  DestObject:=TOrder(Dest);

  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.user_fid:=user_fid;
  DestObject.shop_fid:=shop_fid;

  DestObject.shoper_fid:=shoper_fid;

  DestObject.delivery_center_order_fid:=delivery_center_order_fid;
  DestObject.bill_code:=bill_code;
  DestObject.order_state:=order_state;
  DestObject.order_state_for_display:=order_state_for_display;
  DestObject.want_arrive_time:=want_arrive_time;
  DestObject.is_book:=is_book;
  DestObject.book_time:=book_time;
  DestObject.goods_money:=goods_money;
  DestObject.shop_order_index:=shop_order_index;
  DestObject.is_need_invoice:=is_need_invoice;
  DestObject.invoice_type:=invoice_type;
  DestObject.invoice_title:=invoice_title;
  DestObject.invoice_tax_no:=invoice_tax_no;
  DestObject.recv_name:=recv_name;
  DestObject.recv_sex:=recv_sex;
  DestObject.recv_phone:=recv_phone;
  DestObject.recv_province:=recv_province;
  DestObject.recv_city:=recv_city;
  DestObject.recv_area:=recv_area;
  DestObject.recv_addr:=recv_addr;
  DestObject.recv_door_no:=recv_door_no;
  DestObject.recv_latitude:=recv_latitude;
  DestObject.recv_longitude:=recv_longitude;
  DestObject.origin_money:=origin_money;
  DestObject.dec_money:=dec_money;
  DestObject.sum_money:=sum_money;
  DestObject.shop_latitude:=shop_latitude;
  DestObject.shop_longitude:=shop_longitude;
  DestObject.pay_type:=pay_type;
  DestObject.pay_state:=pay_state;
  DestObject.pay_time:=pay_time;
  DestObject.pay_fee:=pay_fee;
  DestObject.client_bear_pay_fee:=client_bear_pay_fee;

  DestObject.deliver_type:=deliver_type;
  DestObject.deliver_time:=deliver_time;
  DestObject.deliver_fee:=deliver_fee;
  DestObject.deliver_state:=deliver_state;
  DestObject.shop_take_time:=shop_take_time;
  DestObject.shop_order_state:=shop_order_state;
  DestObject.tableware_quantity:=tableware_quantity;
  DestObject.taste_tags:=taste_tags;
  DestObject.memo:=memo;
  DestObject.is_hide:=is_hide;
  DestObject.is_deleted:=is_deleted;
  DestObject.createtime:=createtime;
  DestObject.cancel_code:=cancel_code;
  DestObject.cancel_reason:=cancel_reason;
  DestObject.reject_code:=reject_code;
  DestObject.reject_reason:=reject_reason;
  DestObject.settlement_state:=settlement_state;
  DestObject.is_user_evaluated:=is_user_evaluated;
  DestObject.is_shoper_evaluated_rider:=is_shoper_evaluated_rider;
  DestObject.rider_user_fid:=rider_user_fid;
  DestObject.rider_name:=rider_name;
  DestObject.shop_logo_pic_path:=shop_logo_pic_path;
  DestObject.shop_name:=shop_name;
  DestObject.goods_name:=goods_name;
  DestObject.goods_type_num:=goods_type_num;
  DestObject.finish_food_time:=finish_food_time;
  DestObject.shop_income:=shop_income;
  DestObject.distance:=distance;
  DestObject.done_time:=done_time;

  DestObject.poundage_undertaker:=poundage_undertaker;

  DestObject.goods_pic1_path:=goods_pic1_path;


//  OrderFees.Ass
end;

procedure TOrder.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  user_fid:='';
  shop_fid:=0;

  shoper_fid:='';

  delivery_center_order_fid:=0;
  bill_code:='';
  order_state:='';
  order_state_for_display:='';
  want_arrive_time:='';
  is_book:=0;
  book_time:='';
  goods_money:=0;
  shop_order_index:=0;
  is_need_invoice:=0;
  invoice_type:=0;
  invoice_title:='';
  invoice_tax_no:='';
  recv_name:='';
  recv_sex:=0;
  recv_phone:='';
  recv_province:='';
  recv_city:='';
  recv_area:='';
  recv_addr:='';
  recv_door_no:='';
  recv_latitude:=0.0;
  recv_longitude:=0.0;
  origin_money:=0;
  dec_money:=0;
  sum_money:=0;

  shop_latitude:=0;
  shop_longitude:=0;

  pay_type:='';
  pay_state:='';
  pay_time:='';
  pay_fee:=0;
  client_bear_pay_fee:=0;

  deliver_type:='';
  deliver_time:='';
  deliver_fee:=0;
  deliver_state:='';
  shop_take_time:='';
  shop_order_state:='';
  tableware_quantity:=0;
  taste_tags:='';
  memo:='';
  is_hide:=0;
  is_deleted:=0;
  createtime:='';
  cancel_code:='';
  cancel_reason:='';
  reject_code:='';
  reject_reason:='';
  settlement_state:='';

  is_user_evaluated:=0;
  is_shoper_evaluated_rider:=0;
  rider_user_fid:='0';
  rider_name:='';

  shop_logo_pic_path:='';
  goods_name:='';
  shop_name:='';
  goods_type_num:=0;
  finish_food_time:='';

  shop_income:=0;

  distance:=0;

  done_time:='';
  goods_pic1_path:='';

  poundage_undertaker:='';

  OrderFees.Clear(True);

  OrderGoodsList.Clear(True);
end;

constructor TOrder.Create;
begin
  inherited;
//  OrderGoodsList:=TOrderGoodsList.Create;
  OrderFees:=TPrepareOrderFeeList.Create;

  OrderGoodsList:=TOrderGoodList.Create;
end;

destructor TOrder.Destroy;
begin
  FreeAndNil(OrderFees);

  FreeAndNil(OrderGoodsList);
//  FreeAndNil(OrderGoodsList);
  inherited;
end;

function TOrder.GetOrderGoodsPic1Path: String;
begin
  Result:='';
  if Self.goods_pic1_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(goods_pic1_path,'\','/');
  end;
end;

function TOrder.GetShopLogoPicUrl: String;
begin
  Result:='';
  if Self.shop_logo_pic_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(shop_logo_pic_path,'\','/');
  end;
end;

function TOrder.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//1,
  //Self.appid:=AJson.I['appid'];//1002,
  user_fid:=AJson.V['user_fid'];//64,
  shop_fid:=AJson.I['shop_fid'];//4,

  try
    shoper_fid:=AJson.S['shoper_fid'];// 77
  except

  end;

  delivery_center_order_fid:=AJson.I['delivery_center_order_fid'];//123,
  bill_code:=AJson.S['bill_code'];//0,
  book_time:=AJson.S['book_time'];//"",
  goods_money:=GetJsonDoubleValue(AJson,'goods_money');//0,
  shop_order_index:=AJson.I['shop_order_index'];//5,
  order_state:=AJson.S['order_state'];//"wait_pay",
  order_state_for_display:=AJson.S['order_state_for_display'];
  want_arrive_time:=AJson.S['want_arrive_time'];//"2018-04-27 23:59:00",
  is_book:=AJson.I['is_book'];//0,
  is_need_invoice:=AJson.I['is_need_invoice'];//0,
  invoice_type:=AJson.I['invoice_type'];//0,
  invoice_title:=AJson.S['invoice_title'];//"",
  invoice_tax_no:=AJson.S['invoice_tax_no'];//"",
  recv_name:=AJson.S['recv_name'];//"王能",
  recv_sex:=AJson.I['recv_sex'];//1,
  recv_phone:=AJson.S['recv_phone'];//"18957901025",
  recv_province:=AJson.S['recv_province'];//"浙江省",
  recv_city:=AJson.S['recv_city'];//"金华市",
  recv_area:=AJson.S['recv_area'];//"婺城区",
  recv_addr:=AJson.S['recv_addr'];//"丹溪路1171号龙腾创业大厦",
  recv_door_no:=AJson.S['recv_door_no'];//"826",
  recv_latitude:=GetJsonDoubleValue(AJson,'recv_latitude');//119.648994,
  recv_longitude:=GetJsonDoubleValue(AJson,'recv_longitude');//29.076664,
  origin_money:=AJson.F['origin_money'];//20,
  dec_money:=AJson.F['dec_money'];//0,
  sum_money:=AJson.F['sum_money'];//20,

  shop_latitude:=GetJsonDoubleValue(AJson,'shop_latitude');
  shop_longitude:=GetJsonDoubleValue(AJson,'shop_longitude');

  pay_type:=AJson.S['pay_type'];//"",
  pay_state:=AJson.S['pay_state'];//"wait_pay",
  pay_time:=AJson.S['pay_time'];//"",

  pay_fee:=AJson.F['pay_fee'];//0.67,
  client_bear_pay_fee:=AJson.F['client_bear_pay_fee'];

  deliver_type:=AJson.S['deliver_type'];//"need_delivery",
  deliver_time:=AJson.S['deliver_time'];//"",
  deliver_fee:=AJson.F['deliver_fee'];//0,
  deliver_state:=AJson.S['deliver_state'];//"",
  shop_take_time:=AJson.S['shop_take_time'];//"",
  shop_order_state:=AJson.S['shop_order_state'];//"",
  tableware_quantity:=AJson.I['tableware_quantity'];//2,
  taste_tags:=AJson.S['taste_tags'];//"",
  memo:=AJson.S['memo'];//"不要誎",
  is_hide:=AJson.I['is_hide'];//0,
//  is_deleted:=AJson.I['is_deleted'];//0,
  createtime:=AJson.S['createtime'];//"2018-04-27 11:20:00",
  cancel_code:=AJson.S['cancel_code'];//"",
  cancel_reason:=AJson.S['cancel_reason'];//"",
  reject_code:=AJson.S['reject_code'];//"",
  reject_reason:=AJson.S['reject_reason'];//"",
  settlement_state:=AJson.S['settlement_state'];//""
  is_user_evaluated:=AJson.I['is_user_evaluated'];//0,
  is_shoper_evaluated_rider:=AJson.I['is_shoper_evaluated_rider'];
  rider_user_fid:=AJson.V['rider_user_fid'];// 49,
  rider_name:=AJson.S['rider_name'];//骑手-王能,
  shop_logo_pic_path:=AJson.S['shop_logo_pic_path'];//"",
  shop_name:=AJson.S['shop_name'];
  goods_name:=AJson.S['goods_name'];//"",
  goods_type_num:=AJson.I['goods_type_num'];//0
  finish_food_time:=AJson.S['finish_food_time'];
  shop_income:=GetJsonDoubleValue(AJson,'shop_income');
  distance:=GetJsonDoubleValue(AJson,'distance');

  done_time:=AJson.S['done_time'];

  goods_pic1_path:=AJson.S['goods_pic1_path'];



  poundage_undertaker:=AJson.S['poundage_undertaker'];

  OrderFees.Clear(True);

  OrderFees.ParseFromJsonArray(TPrepareOrderFee,AJson.A['OrderFees']);

  OrderGoodsList.Clear(True);

  OrderGoodsList.ParseFromJsonArray(TOrderGood,AJson.A['OrderGoodsList']);
end;

{ TOrderGoodsList }

function TOrderGoodsList.GetItem(Index: Integer): TOrderGoods;
begin
  Result:=TOrderGoods(Inherited Items[Index]);

end;

{ TOrderGoods }

procedure TOrderGoods.AssignTo(Dest: TPersistent);
begin
  inherited;
  if Dest is TOrderGoods then
  begin
    TOrderGoods(Dest).order_fid:=order_fid;
    TOrderGoods(Dest).goods_fid:=goods_fid;
    TOrderGoods(Dest).number:=number;
    TOrderGoods(Dest).order_goods_price:=order_goods_price;
    TOrderGoods(Dest).order_goods_commission:=order_goods_commission;
    TOrderGoods(Dest).order_goods_orderno:=order_goods_orderno;
  end;

end;

function TOrderGoods.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  Inherited;

  order_fid:=AJson.I['order_fid'];//6,
  goods_fid:=AJson.I['goods_fid'];//1,
  number:=AJson.I['number'];//10,
  order_goods_price:=GetJsonDoubleValue(AJson,'order_goods_price');//AJson.I[''];//18,
  order_goods_commission:=GetJsonDoubleValue(AJson,'order_goods_commission');//AJson.I[''];//5,
  order_goods_orderno:=GetJsonDoubleValue(AJson,'order_goods_orderno');//AJson.I[''];//0

end;

{ TRegin }

constructor TRegion.Create;
begin
  inherited;
  RegionProvinceList:=TRegionProvinceList.Create;
end;

destructor TRegion.Destroy;
begin
  FreeAndNil(RegionProvinceList);
  inherited;
end;

function TRegion.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];
  //Self.appid:=AJson.I['appid'];
  name:=AJson.S['name'];
//  orderno:=AJson.S['orderno'];
  manager_fid:=AJson.I['manager_fid'];
  manager_name:=AJson.S['manager_name'];
  createtime:=AJson.S['createtime'];
  Self.RegionProvinceList.ParseFromJsonArray(TRegionProvince,AJson.A['RegionProvinceList']);
end;

{ TReginList }

function TRegionList.GetItem(Index: Integer): TRegion;
begin
  Result:=TRegion(Inherited  Items[Index]);
end;

{ TReginProvince }

function TRegionProvince.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];
  //Self.appid:=AJson.I['appid'];
  regin_fid:=AJson.I['regin_fid'];
  name:=AJson.S['name'];
//  orderno:=AJson.S['orderno'];
  createtime:=AJson.S['createtime'];

end;

{ TReginProvinceList }

function TRegionProvinceList.GetItem(Index: Integer): TRegionProvince;
begin
  Result:=TRegionProvince(Inherited  Items[Index]);
end;

{ TOrderPayment }

function TOrderPayment.GetPic1Url: String;
begin
   Result:='';
  if Self.pic1path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/Upload/'+(appid)+'/Pay_Pic/'+Self.pic1path;
  end;
end;

function TOrderPayment.GetPic2Url: String;
begin
   Result:='';
  if Self.pic1path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/Upload/'+(appid)+'/Pay_Pic/'+Self.pic2path;
  end;
end;

function TOrderPayment.GetPic3Url: String;
begin
   Result:='';
  if Self.pic1path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/Upload/'+(appid)+'/Pay_Pic/'+Self.pic3path;
  end;
end;

function TOrderPayment.GetPic4Url: String;
begin
   Result:='';
  if Self.pic1path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/Upload/'+(appid)+'/Pay_Pic/'+Self.pic4path;
  end;
end;
function TOrderPayment.GetPic5Url: String;
begin
   Result:='';
  if Self.pic1path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/Upload/'+appid+'/Pay_Pic/'+Self.pic5path;
  end;
end;
function TOrderPayment.GetPic6Url: String;
begin
   Result:='';
  if Self.pic1path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/Upload/'+appid+'/Pay_Pic/'+Self.pic6path;
  end;
end;

function TOrderPayment.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//5,
  //Self.appid:=AJson.I['appid'];//1001,
  order_fid:=AJson.I['order_fid'];//6,
  user_fid:=AJson.V['user_fid'];//12,
  payment_type:=AJson.S['payment_type'];//"bank_transer",
  transer_time:=AJson.S['transer_time'];//"2017-07-30 00:00:00",
  transer_bankaccount_name:=AJson.S['transer_bankaccount_name'];//"王能",
  transer_bankaccount_bankname:=AJson.S['transer_bankaccount_bankname'];//"建行",
  transer_bankaccount_account:=AJson.S['transer_bankaccount_account'];//"6443556555432232",
  transer_payment_voucher:=AJson.S['transer_payment_voucher'];//"123456789",
  money:=GetJsonDoubleValue(AJson,'money');//AJson.F['money'];//100.1,
  remark:=AJson.S['remark'];//"",
  pay_state:=AJson.S['pay_state'];//"",
  pic1path:=AJson.S['pic1path'];//"",
  pic2path:=AJson.S['pic2path'];//"",
  pic3path:=AJson.S['pic3path'];//"",
  pic4path:=AJson.S['pic4path'];//"",
  pic5path:=AJson.S['pic5path'];//"",
  pic6path:=AJson.S['pic6path'];//"",
  audit_user_fid:=AJson.V['audit_user_fid'];//0,
  audit_state:=AJson.I['audit_state'];//0,
  audit_time:=AJson.S['audit_time'];//"",
  audit_remark:=AJson.S['audit_remark'];//"",
  createtime:=AJson.S['createtime'];//"2017-08-02 15:22:57"
end;

{ THomeAd }

function THomeAd.GetPicUrl: String;
begin
  Result:='';
  if Self.picpath<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(picpath,'\','/');
  end;
//  Result:='';
//  if Self.picpath<>'' then
//  begin
//    if Pos('http',Self.picpath)>0 then
//    begin
//      Result:=picpath;
//    end
//    else
//    begin
//      Result:=ImageHttpServerUrl+'/'+ReplaceStr(picpath,'\','/');
//    end;
//  end;
end;

function THomeAd.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//3,
  //Self.appid:=AJson.I['appid'];//1001,
  name:=AJson.S['name'];//"首页广告3",
  picpath:=AJson.S['picpath'];//"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3355283602,2380210295",
  url:=AJson.S['url'];//"http://www.baidu.com",
  goods_fid:=AJson.I['goods_fid'];//0,
  navigation_fid:=AJson.I['navigation_fid'];// 0,
  shop_fid:=AJson.I['shop_fid'];// 0,
  orderno:=GetJsonDoubleValue(AJson,'orderno');//0,
  goods_name:=AJson.S['goods_name'];//"饮水机" ，
  createtime:=AJson.S['createtime'];//"2017-08-05 23:31:25",
  is_deleted:=AJson.I['is_deleted'];//0
  content:=AJson.S['content'];//"<B>内容</B>",
end;

{ THomeAdList }

function THomeAdList.GetItem(Index: Integer): THomeAd;
begin
  Result:=THomeAd(Inherited Items[Index]);
end;


{ TOrderPaymentList }

function TOrderPaymentList.GetItem(Index: Integer): TOrderPayment;
begin
  Result:=TOrderPayment(Inherited  Items[Index]);
end;

{ TBuyGoodsList }

function TBuyGoodsList.GetItem(Index: Integer): TBuyGoods;
begin
  Result:=TBuyGoods(Inherited  Items[Index]);
end;

{ TBuyGoods }

procedure TBuyGoods.AssignTo(Dest: TPersistent);
begin
  inherited;
  if Dest is TBuyGoods then
  begin
    TBuyGoods(Dest).goods_fid:=goods_fid;
    TBuyGoods(Dest).number:=number;
  end;
end;

//{ TOrderDelivery }
//
//function TOrderDelivery.ParseFromJson(AJson: ISuperObject): Boolean;
//begin
//  fid:=AJson.I['fid'];
//  //Self.appid:=AJson.I['appid'];
//  order_fid:=AJson.I['order_fid'];
//  emp_fid:=AJson.I['emp_fid'];
//  delivery_type:=AJson.S['delivery_type'];
//  delivery_company:=AJson.S['delivery_company'];
//  delivery_bill_code:=AJson.S['delivery_bill_code'];;
//  createtime:=AJson.S['createtime'];;
//  remark:=AJson.S['remark'];;
//  delivery_time:=AJson.S['delivery_time'];;
//end;
//
//{ TOrderDeliveryList }
//
//function TOrderDeliveryList.GetItem(Index: Integer): TOrderDelivery;
//begin
//  Result:=TOrderDelivery(Inherited  Items[Index]);
//end;

{ TUserBillMoney }

procedure TUserBillMoney.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  user_fid:='0';
  money_type:='';
  name:='';
  order_desc:='';
  order_fid:=0;
  from_money_fid:=0;
  order_type:='';
  bill_code:='';
  pay_type:='';
  money:=0.0;
  user_money:=0.0;
  third_pay_fid:=0;
  third_pay_no:='';
  createtime:='';
  pay_state:='';
  settle_state:='';
  is_need_change_user_money:=0.0;
  is_succ:=0;
  is_hide:=0;
  is_deleted:=0;

end;

function TUserBillMoney.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//155,
  //Self.appid:=AJson.I['appid'];//1002,
  user_fid:=AJson.V['user_fid'];//64,
  money_type:=AJson.S['money_type'];//"consume",
  name:=AJson.S['name'];//"王能的早餐店外卖订单",
  order_desc:=AJson.S['order_desc'];//"多规格菜品等多件",
  order_fid:=AJson.I['order_fid'];//92,
  from_money_fid:=AJson.I['from_money_fid'];//0,
  order_type:=AJson.S['order_type'];//"shop_center",
  bill_code:=AJson.S['bill_code'];//"DH-20180528-0001",
  pay_type:=AJson.S['pay_type'];//"wxpay",
  money:=GetJsonDoubleValue(AJson,'money');//-57.81,
  user_money:=GetJsonDoubleValue(AJson,'user_money');
  third_pay_fid:=AJson.I['third_pay_fid'];//440,
  third_pay_no:=AJson.S['third_pay_no'];//"DED99168EABE4146B3EEB72974CE8818",
  createtime:=AJson.S['createtime'];//"2018-05-28 13:58:35",
  pay_state:=AJson.S['pay_state'];//"payed",
  settle_state:=AJson.S['settle_state'];//"",
  is_need_change_user_money:=GetJsonDoubleValue(AJson,'is_need_change_user_money');//0,
  is_succ:=AJson.I['is_succ'];//0 1 2
  is_hide:=AJson.I['is_hide'];//0,
  is_deleted:=AJson.I['is_deleted'];//0

end;

{ TUserBillMoneyList }

function TUserBillMoneyList.GetItem(Index: Integer): TUserBillMoney;
begin
  Result:=TUserBillMoney(Inherited Items[Index]);
end;

{ TShopGoodsCategory }

constructor TShopGoodsCategory.Create;
begin
  inherited;
  goods_list:=TShopGoodsList.Create(ooReference);
  SubRecordList:=TSubRecordList.Create(ooReference);
end;

destructor TShopGoodsCategory.Destroy;
begin
  FreeAndNil(goods_list);
  FreeAndNil(SubRecordList);
  inherited;
end;

function TShopGoodsCategory.ParseFromJson(AJson:ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//1,
  //Self.appid:=AJson.I['appid'];//1001,
  name:=AJson.S['name'];//"酒店大堂用品",
  name_color:=AJson.S['name_color'];//分类颜色
  shop_fid:=AJson.I['shop_fid'];//1001,
  category_desc:=AJson.S['category_desc'];
  orderno:=GetJsonDoubleValue(AJson,'orderno');//"",
  createtime:=AJson.S['createtime'];//"2017-07-22 13:04:01",

  goods_list.Clear(True);
  goods_list.ParseFromJsonArray(TShopGoods,AJson.A['GoodsList']);

  if AJson.Contains('SubRecordList') then
  begin
    Self.SubRecordList.Clear(True);
    Self.SubRecordList.ParseFromJsonArray(TSubRecord,AJson.A['SubRecordList']);
  end;
end;

{ TShopGoodsCategoryList }

procedure TShopGoodsCategoryList.Category(AShopGoodsList: TShopGoodsList);
var
  I: Integer;
  J:Integer;
begin
  for I := 0 to Self.Count-1 do
  begin
    Items[I].goods_list.Clear(False);

    for J := 0 to AShopGoodsList.Count-1 do
    begin
      if Items[I].fid=AShopGoodsList[J].shop_goods_category_fid then
      begin
        Items[I].goods_list.Add(AShopGoodsList[J]);
      end;
    end;
  end;

end;

function TShopGoodsCategoryList.FindItemByFID(AFID: Integer): TShopGoodsCategory;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TShopGoodsCategoryList.GetItem(Index: Integer): TShopGoodsCategory;
begin
  Result:=TShopGoodsCategory(Inherited Items[Index]);
end;


{ TGoodsSummary }

function TGoodsSummary.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  summoney:=GetJsonDoubleValue(AJson,'summoney');
  sumnumber:=AJson.I['sumnumber'];
  sumcount:=AJson.I['sumcount'];
  goods_fid:=AJson.I['goods_fid'];
  caption:=AJson.S['caption'];
  goods_unit:=AJson.S['unit'];
  region_fid:=AJson.I['region_fid'];
end;

{ TGoodsSummaryList }

function TGoodsSummaryList.GetItem(Index: Integer): TGoodsSummary;
begin
  Result:=TGoodsSummary(Inherited Items[Index]);
end;

{ TOrderSummaryBill }

function TOrderSummaryBill.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];
  //Self.appid:=AJson.I['appid'];
  bill_code:=AJson.S['bill_code'];
  hotel_fid:=AJson.I['hotel_fid'];
  user_fid:=AJson.V['user_fid'];
  goods_origin_summoney:=GetJsonDoubleValue(AJson,'goods_origin_summoney');
  goods_summoney:=GetJsonDoubleValue(AJson,'goods_summoney');
  freight:=AJson.I['freight'];
  summoney:=GetJsonDoubleValue(AJson,'summoney');
  goods_sum_commission:=AJson.I['goods_sum_commission'];
  recv_addr_fid:=AJson.I['recv_addr_fid'];
  recv_name:=AJson.S['recv_name'];
  recv_phone:=AJson.S['recv_phone'];
  recv_province:=AJson.S['recv_province'];
  recv_city:=AJson.S['recv_city'];
  recv_area:=AJson.S['recv_area'];
  recv_addr:=AJson.S['recv_addr'];
  remark:=AJson.S['recv_phone'];
  createtime:=AJson.S['createtime'];
  done_time:=AJson.S['done_time'];
  order_state:=AJson.S['order_state'];
  pay_state:=AJson.S['pay_state'];
  is_deleted:=AJson.I['is_deleted'];
  is_first_order:=AJson.I['is_first_order'];
  goods_kind_num:=AJson.I['goods_kind_num'];
  goods_num:=AJson.I['goods_num'];
  is_hide:=AJson.I['is_hide'];
  reduce:=AJson.I['reduce'];
  order_date:=AJSon.S['order_date'];
  order_month:=AJson.S['order_month'];
  order_year:=AJson.S['order_year'];
  hotel_name:=AJson.S['hotel_name'];
  hotel_star:=AJson.I['hotel_star'];
  hotel_addr:=AJson.S['hotel_addr'];
  hotel_tel:=AJson.S['hotel_tel'];
  hotel_user_fid:=AJson.S['hotel_user_fid'];
  hotel_province:=AJson.S['hotel_province'];
  hotel_city:=AJson.S['hotel_city'];
  hotel_area:=AJson.S['hotel_area'];
  hotel_is_ordered:=AJson.I['hotel_is_ordered'];
  user_phone:=AJson.S['user_phone'];
  user_name:=AJson.S['user_name'];
  region_fid:=AJson.I['region_fid'];
  region_name:=AJson.S['region_name'];
end;

{ TOrderSummaryBillList }

function TOrderSummaryBillList.GetItem(Index: Integer): TOrderSummaryBill;
begin
  Result:=TOrderSummaryBill(Inherited Items[Index]);
end;

{ TGoodsSummaryBill }

function TGoodsSummaryBill.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];
  //Self.appid:=AJson.I['appid'];
  order_fid:=AJson.I['order_fid'];
  goods_fid:=AJson.I['goods_fid'];
  number:=AJson.I['number'];
  price:=GetJsonDoubleValue(AJson,'price');
  orderno:=GetJsonDoubleValue(AJson,'orderno');
  goods_name:=AJson.S['goods_name'];
  marque:=AJson.S['marque'];
  goods_unit:=AJson.S['unit'];
  goods_code:=AJson.S['goods_code'];
  goods_classify_fid:=AJson.I['goods_classify_fid'];
  goods_classify_name:=AJson.S['goods_classify_name'];
  bill_code:=AJson.S['bill_code'];
  hotel_fid:=AJson.I['hotel_fid'];
  user_fid:=AJson.V['user_fid'];
  goods_origin_summoney:=GetJsonDoubleValue(AJson,'goods_origin_summoney');
  goods_summoney:=GetJsonDoubleValue(AJson,'goods_summoney');
  summoney:=GetJsonDoubleValue(AJson,'summoney');;
  goods_sum_commission:=AJson.I['goods_sum_commission'];
  done_time:=AJson.S['done_time'];
  goods_kind_num:=AJson.I['goods_kind_num'];
  goods_num:=AJson.I['goods_num'];
  is_deleted:=AJson.I['is_delete'];
  is_first_order:=AJson.I['is_first_order'];
  order_date:=AJson.S['order_date'];
  order_month:=AJson.S['order_month'];
  order_year:=AJson.S['order_year'];
  hotel_name:=AJson.S['hotel_name'];
  hotel_star:=AJson.I['hotel_star'];
  hotel_user_fid:=AJson.S['hotel_user_fid'];
  hotel_province:=AJson.S['hotel_province'];
  user_phone:=AJson.S['user_phone'];
  user_name:=AJson.S['user_name'];
  region_fid:=AJson.I['region_fid'];
  region_name:=AJson.S['region_name'];
end;

{ TGoodsSummaryBillList }

function TGoodsSummaryBillList.GetItem(Index: Integer): TGoodsSummaryBill;
begin
  Result:=TGoodsSummaryBill(Inherited Items[Index]);
end;

{ TSummaryFilterList }

function TSummaryFilterList.FindItemByFilterName(AFilterName: String): TSummaryFilterItem;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if Items[I].FFilterName=AFilterName then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TSummaryFilterList.GetItem(Index: Integer): TSummaryFilterItem;
begin
  Result:=TSummaryFilterItem(Inherited Items[Index]);
end;

{ TSummaryFilterItem }

constructor TSummaryFilterItem.Create;
begin
  FFilterSelections:=TStringList.Create;
  FFilterSelectionsCaption:=TStringList.Create;

end;

destructor TSummaryFilterItem.Destroy;
begin
  FreeAndNil(FFilterSelections);
  FreeAndNil(FFilterSelectionsCaption);
  inherited;
end;

function TSummaryFilterItem.GetCaption: String;
begin
  Result:=FFilterValueCaption;
  case FFilterType of
    sftDateArea:
    begin
      //时间范围
      if FFilterValue<>FFilterValue1 then
      begin
        Result:=FFilterValue+'至'+FFilterValue1;
      end
      else
      begin
        Result:=FFilterValue;
      end;
    end;
  end;
end;


//{ THotelClassify }
//
//function THotelClassify.ParseFromJson(AJson: ISuperObject): Boolean;
//begin
//  fid:=AJsOn.I['fid'];//1,
//  //Self.appid:=AJsOn.I['appid'];//1001,
//  name:=AJsOn.S['name'];//"商务酒店",
//  orderno:=GetJsonDoubleValue(AJson,'orderno');//"",
//  createtime:=AJsOn.S['createtime'];//"2017-07-22 13:04:01",
//end;
//
//{ THotelClassifyList }
//
//function THotelClassifyList.FindItemByFID(AFID: Integer): THotelClassify;
//var
//  I: Integer;
//begin
//  Result:=nil;
//  for I := 0 to Self.GetCount-1 do
//  begin
//    if Self.Items[I].fid=AFID then
//    begin
//      Result:=Self.Items[I];
//      Break;
//    end;
//  end;
//end;
//
//function THotelClassifyList.GetItem(Index: Integer): THotelClassify;
//begin
//  Result:=THotelClassify(Inherited Items[Index]);
//end;

{ TSuggestion }

//function TSuggestion.GetPic1Url: String;
//begin
//  Result:='';
//  if Self.pic1path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+appid+'/Suggestion_Pic/'+Self.pic1path;
//  end;
//end;
//
//function TSuggestion.GetPic2Url: String;
//begin
//  Result:='';
//  if Self.pic2path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+appid+'/Suggestion_Pic/'+Self.pic2path;
//  end;
//end;
//
//function TSuggestion.GetPic3Url: String;
//begin
//  Result:='';
//  if Self.pic3path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+appid+'/Suggestion_Pic/'+Self.pic3path;
//  end;
//end;
//
//function TSuggestion.GetPic4Url: String;
//begin
//  Result:='';
//  if Self.pic4path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+appid+'/Suggestion_Pic/'+Self.pic4path;
//  end;
//end;
//
//function TSuggestion.GetPic5Url: String;
//begin
//  Result:='';
//  if Self.pic5path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+appid+'/Suggestion_Pic/'+Self.pic5path;
//  end;
//end;
//
//function TSuggestion.GetPic6Url: String;
//begin
//  Result:='';
//  if Self.pic6path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+appid+'/Suggestion_Pic/'+Self.pic6path;
//  end;
//end;
//
//function TSuggestion.ParseFromJson(AJson: ISuperObject): Boolean;
//begin
//  fid:=AJson.I['fid'];//2
//  //Self.appid:=AJson.I['appid'];//1001,
//  user_fid:=AJson.V['user_fid'];//12,
//  content:=AJson.S['content'];//"反馈意见",
//  user_name:=AJson.S['user_name'];//"意见提交人",
//  createtime:=AJson.S['createtime'];//"2017-07-17 10:11:27",
//  pic1path:=AJson.S['pic1path'];//"",
//  pic2path:=AJson.S['pic2path'];//"",
//  pic3path:=AJson.S['pic3path'];//"",
//  pic4path:=AJson.S['pic4path'];//"",
//  pic5path:=AJson.S['pic5path'];//"",
//  pic6path:=AJson.S['pic6path'];//"",
//
//end;
//
//{ TSuggestionList }
//
//function TSuggestionList.GetItem(Index: Integer): TSuggestion;
//begin
//  Result:=TSuggestion(Inherited Items[Index]);
//end;




//{ TShopUserList }
//
//function TShopUserList.GetItem(Index: Integer): TShop;
//begin
//  Result:=TShop(Inherited Items[Index]);
//end;

{ TUserCertInfo }

function TUserCertInfo.GetIDFrontPicUrl: String;
begin
  Result:='';
  if id_front_picpath<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.id_front_picpath,'\','/');
  end;
end;

function TUserCertInfo.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//2,
  //Self.appid:=AJson.I['appid'];//1001,
  user_fid:=AJson.V['user_fid'];

  id_type:=AJson.I['id_type'];
  id_code:=AJson.S['id_code'];//"",
  id_front_picpath:=AJson.S['id_front_picpath'];//"",

  audit_user_fid:=AJson.S['audit_user_fid'];
  audit_state:=AJson.I['audit_state'];
  audit_time:=Ajson.S['audit_time'];
  audit_remark:=AJson.S['audit_remark'];
  createtime:=AJson.S['createtime'];
end;


{ TShopRequest }

procedure TShopRequest.AssignTo(Dest: TPersistent);
var
  DestObject:TShopRequest;
begin
  DestObject:=TShopRequest(Dest);

  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.user_fid:=user_fid;
  DestObject.is_deleted:=is_deleted;
  DestObject.createtime:=createtime;
  DestObject.app_business_category_fid:=app_business_category_fid;
  DestObject.app_business_category_name:=app_business_category_name;
  DestObject.phone:=phone;
  DestObject.name:=name;
  DestObject.contact_name:=contact_name;
  DestObject.shop_desc:=shop_desc;
  DestObject.logo_pic_path:=logo_pic_path;
  DestObject.door_face_pic_path:=door_face_pic_path;
  DestObject.inner_pic_path1:=inner_pic_path1;
  DestObject.inner_pic_path2:=inner_pic_path2;
  DestObject.inner_pic_path3:=inner_pic_path3;
  DestObject.province:=province;
  DestObject.city:=city;
  DestObject.area:=area;
  DestObject.addr:=addr;
  DestObject.street:=street;
  DestObject.building:=building;
  DestObject.addr_line3:=addr_line3;
  DestObject.postcode:=postcode;
  DestObject.make_food_spent:=make_food_spent;
  DestObject.latitude:=latitude;
  DestObject.longitude:=longitude;
  DestObject.bankcard_name:=bankcard_name;
  DestObject.bankcard_bankname:=bankcard_bankname;
  DestObject.bankcard_account:=bankcard_account;
  DestObject.app_coop_scheme_fid:=app_coop_scheme_fid;
  DestObject.app_service_fee_rate:=app_service_fee_rate;
  DestObject.app_deliver_fee:=app_deliver_fee;
  DestObject.app_deliver_type:=app_deliver_type;
  DestObject.city_code:=city_code;
  DestObject.region_code:=region_code;
  DestObject.poundage_undertaker:=poundage_undertaker;

  DestObject.delivery_fee:=delivery_fee;

  DestObject.first_audit_state:=first_audit_state;
  DestObject.first_audit_user_fid:=first_audit_user_fid;
  DestObject.first_audit_remark:=first_audit_remark;
  DestObject.first_audit_time:=first_audit_time;
  DestObject.final_audit_state:=final_audit_state;
  DestObject.final_audit_user_fid:=final_audit_user_fid;
  DestObject.final_audit_remark:=final_audit_remark;
  DestObject.final_audit_time:=final_audit_time;
  DestObject.app_coop_scheme_name:=app_coop_scheme_name;
end;

procedure TShopRequest.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  user_fid:='0';
  is_deleted:=0;
  createtime:='';
  app_business_category_fid:=0;
  app_business_category_name:='';
  phone:='';
  name:='';
  contact_name:='';
  shop_desc:='';
  logo_pic_path:='';
  door_face_pic_path:='';
  inner_pic_path1:='';
  inner_pic_path2:='';
  inner_pic_path3:='';
  province:='';
  city:='';
  area:='';
  addr:='';
  street:=''; //"",
  building:=''; //"",
  addr_line3:='';// "",
  postcode:='';// "",
  make_food_spent:=0;
  latitude:=0;
  longitude:=0;
  bankcard_name:='';
  bankcard_bankname:='';
  bankcard_account:='';
  app_coop_scheme_fid:=0;
  app_coop_scheme_name:='';
  app_service_fee_rate:=0.0;
  app_deliver_fee:=0.0;
  app_deliver_type:=0;
  city_code:='';
  poundage_undertaker:='';

  delivery_fee:=0;

  region_code:='';
  first_audit_state:=0;
  first_audit_user_fid:='0';
  first_audit_remark:='';
  first_audit_time:='';
  final_audit_state:=0;
  final_audit_user_fid:='0';
  final_audit_remark:='';
  final_audit_time:='';
end;

function TShopRequest.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//8,
  //Self.appid:=AJson.I['appid'];//1002,
  user_fid:=AJson.V['user_fid'];//31,
  is_deleted:=AJson.I['is_deleted'];//0,
  createtime:=AJson.S['createtime'];//"2018-02-01 14:57:05",
  app_business_category_fid:=AJson.I['app_business_category_fid'];//2,
  app_business_category_name:=AJson.S['app_business_category_name'];
  phone:=AJson.S['phone'];//"18361350680",
  name:=AJson.S['name'];//"东方宴",
  contact_name:=AJson.S['contact_name'];//"合作方案1",
  shop_desc:=AJson.S['shop_desc'];//"四川辣火锅，非常好吃，你值得拥有",
  logo_pic_path:=AJson.S['logo_pic_path'];//"CE45E8926A864BFBAFBC03BA2310FAFD.jpg",
  door_face_pic_path:=AJson.S['door_face_pic_path'];//"DB6EA38890944C798E21D2C381801404.jpg",
  inner_pic_path1:=AJson.S['inner_pic_path1'];//"Upload\\1002\\Shop_Pic\\2018\\2018-02-02\\B46E72F9EED54F7C9FB86E0661094F46.jpg",
  inner_pic_path2:=AJson.S['inner_pic_path2'];//"",
  inner_pic_path3:=AJson.S['inner_pic_path3'];//"",
  province:=AJson.S['province'];//"浙江省",
  city:=AJson.S['city'];//"金华市",
  area:=AJson.S['area'];//"婺城区",
  addr:=AJson.S['addr'];//"丹溪街道1107号龙腾创业大厦",
  street:=AJson.S['street']; //"",
  building:=AJson.S['building']; //"",
  addr_line3:=AJson.S['addr_line3'];// "",
  postcode:=AJson.S['postcode'];// "",
  make_food_spent:=AJson.I['make_food_spent'];
  latitude:=GetJsonDoubleValue(AJson,'latitude');//0,
  longitude:=GetJsonDoubleValue(AJson,'longitude');//0,
  bankcard_name:=AJson.S['bankcard_name'];//"丁丽花",
  bankcard_bankname:=AJson.S['bankcard_bankname'];//"中国银行",
  bankcard_account:=AJson.S['bankcard_account'];//"6217856100008160183",
  app_coop_scheme_fid:=AJson.I['app_coop_scheme_fid'];//2,
  app_coop_scheme_name:=AJson.S['app_coop_scheme_name'];
//  app_service_fee_rate:=AJson.F['app_service_fee_rate'];//0.08,
//  app_deliver_fee:=AJson.F['app_deliver_fee'];//4.1,
  app_deliver_type:=AJson.I['app_deliver_type'];//0,
  city_code:=GetJsonStringValue(AJson,'city_code');//"",
  region_code:=GetJsonStringValue(AJson,'region_code');//"",
  poundage_undertaker:=AJson.S['poundage_undertaker'];

  delivery_fee:=AJSon.F['delivery_fee'];

  first_audit_state:=AJson.I['first_audit_state'];//-1,

  {$IFDEF INT_USER_FID}
  first_audit_user_fid:=IntToStr(AJson.I['first_audit_user_fid']);//0,
  {$ELSE}
  first_audit_user_fid:=AJson.S['first_audit_user_fid'];//0,
  {$ENDIF}


  first_audit_remark:=AJson.S['first_audit_remark'];//"",
  first_audit_time:=AJson.S['first_audit_time'];//"1899-12-30 00:00:00",
  final_audit_state:=AJson.I['final_audit_state'];//0,
  {$IFDEF INT_USER_FID}
  final_audit_user_fid:=IntToStr(AJson.I['final_audit_user_fid']);//0,
  {$ELSE}
  final_audit_user_fid:=AJson.S['final_audit_user_fid'];//0,
  {$ENDIF}
  final_audit_remark:=AJson.S['final_audit_remark'];//"",
  final_audit_time:=AJson.S['final_audit_time'];//""
end;

function TShopRequest.Getdoorfacepicpath: String;
begin
  Result:='';
  if Self.door_face_pic_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.door_face_pic_path,'\','/');
  end;
end;

function TShopRequest.Getinnerpicpath1: String;
begin
  Result:='';
  if Self.inner_pic_path1<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.inner_pic_path1,'\','/');
  end;
end;

function TShopRequest.Getinnerpicpath2: String;
begin
  Result:='';
  if Self.inner_pic_path2<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.inner_pic_path2,'\','/');
  end;
end;

function TShopRequest.Getinnerpicpath3: String;
begin
  Result:='';
  if Self.inner_pic_path3<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.inner_pic_path3,'\','/');
  end;
end;

function TShopRequest.Getlogopicpath: String;
begin
  Result:='';
  if Self.logo_pic_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.logo_pic_path,'\','/');
  end;

end;


{ TShopGoodsSpec }

procedure TShopGoodsSpec.AssignTo(Dest: TPersistent);
var
  DestObject:TShopGoodsSpec;
begin
  DestObject:=TShopGoodsSpec(Dest);
  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.shop_fid:=shop_fid;
  DestObject.shop_goods_fid:=shop_goods_fid;
  DestObject.name:=name;
  DestObject.price:=price;
  DestObject.special_price:=special_price;
  DestObject.origin_price:=origin_price;
  DestObject.packing_fee:=packing_fee;
  DestObject.stock:=stock;
  DestObject.max_stock:=max_stock;
  DestObject.is_default:=is_default;
  DestObject.is_offsell:=is_offsell;
  DestObject.orderno:=orderno;
  DestObject.is_deleted:=is_deleted;
  DestObject.createtime:=createtime;
  DestObject.goodunit:=goodunit;
  DestObject.small_unit:=small_unit;
  DestObject.small_unit_number:=small_unit_number;
  DestObject.display_origin_price:=display_origin_price;


end;

procedure TShopGoodsSpec.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  shop_fid:=0;
  shop_goods_fid:=0;
  name:='';
  price:=0.0;
  packing_fee:=0;
  stock:=0;
  max_stock:=0;
  is_default:=0;
  is_offsell:=1;
  orderno:=0;
  is_deleted:=0;
  createtime:='';

  goodunit:='';//,
  small_unit:='';
  small_unit_number:=0;

  display_origin_price:=0;
end;

function TShopGoodsSpec.GetDataJson: ISuperObject;
begin
  Result:=TSuperObject.Create();
  Result.I['fid']:=fid;
  if name<>'' then
  begin
    Result.S['name']:=name;
  end
  else
  begin
    {$IFDEF NZ}
    Result.S['name']:='Default';
    {$ELSE}
    Result.S['name']:='默认规格';
    {$ENDIF}
  end;
  Result.I['stock']:=stock;
  Result.I['max_stock']:=max_stock;
  Result.I['is_default']:=is_default;
  Result.I['is_offsell']:=is_offsell;
  Result.F['price']:=price;
  Result.F['packing_fee']:=packing_fee;
  Result.F['orderno']:=orderno;
  Result.S['unit']:=goodunit;
  Result.S['small_unit']:=small_unit;
  Result.I['small_unit_number']:=small_unit_number;
end;

function TShopGoodsSpec.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//9,
  //Self.appid:=AJson.I['appid'];//1002,
  shop_fid:=AJson.I['shop_fid'];//4,
  shop_goods_fid:=AJson.I['shop_goods_fid'];//15,
  name:=AJson.S['name'];//"default",
  price:=GetJsonDoubleValue(AJson,'price');//15.5,
  special_price:=GetJsonDoubleValue(AJson,'special_price');
  origin_price:=GetJsonDoubleValue(AJson,'origin_price');
  packing_fee:=GetJsonDoubleValue(AJson,'packing_fee');//2,
  stock:=AJson.I['stock'];//100,
  max_stock:=AJson.I['max_stock'];//300,
  is_default:=AJson.I['is_default'];//1,
  is_offsell:=AJson.I['is_offsell'];//0,
  orderno:=GetJsonDoubleValue(AJson,'orderno');//0,
  is_deleted:=AJson.I['is_deleted'];//0,
  createtime:=AJson.S['createtime'];//"2018-03-19 14:18:07"

  goodunit:=AJson.S['unit'];
  small_unit:=AJson.S['small_unit'];;
  small_unit_number:=AJson.I['small_unit_number'];

  display_origin_price:=AJson.F['display_origin_price'];

end;

{ TShopGoodsSpecList }


function TShopGoodsSpecList.FindItemByFID(AFID: Integer): TShopGoodsSpec;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TShopGoodsSpecList.GetItem(Index: Integer): TShopGoodsSpec;
begin
  Result:=TShopGoodsSpec(Inherited Items[Index]);
end;

{ TShopGoodsAttr }

procedure TShopGoodsAttr.AssignTo(Dest: TPersistent);
var
  DestObject:TShopGoodsAttr;
begin

  DestObject:=TShopGoodsAttr(Dest);
  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.shop_fid:=shop_fid;
  DestObject.shop_goods_fid:=shop_goods_fid;
  DestObject.name:=name;
  DestObject.value_list:=value_list;
  DestObject.orderno:=orderno;
  DestObject.is_deleted:=is_deleted;
  DestObject.createtime:=createtime;
end;

procedure TShopGoodsAttr.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  shop_fid:=0;
  shop_goods_fid:=0;
  name:='';
  value_list:='';
  orderno:=0;
  is_deleted:=0;
  createtime:='';
end;

function TShopGoodsAttr.GetDataJson: ISuperObject;
begin
  Result:=TSuperObject.Create();
  Result.I['fid']:=fid;
  Result.S['name']:=name;
  Result.S['value_list']:=value_list;
  Result.I['is_deleted']:=is_deleted;
  Result.F['orderno']:=orderno;
end;

function TShopGoodsAttr.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];
  //Self.appid:=AJson.I['appid'];//1002,
  shop_fid:=AJson.I['shop_fid'];
  shop_goods_fid:=AJson.I['shop_goods_fid'];
  name:=AJson.S['name'];
  value_list:=AJson.S['value_list'];
  orderno:=GetJsonDoubleValue(AJson,'orderno');//0,
  is_deleted:=AJson.I['is_deleted'];//0,
  createtime:=AJson.S['createtime'];//"2018-03-19 14:18:07"
end;

{ TShopGoodsAttrList }

function TShopGoodsAttrList.FindItemByFID(AFID: Integer): TShopGoodsAttr;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;


function TShopGoodsAttrList.GetItem(Index: Integer): TShopGoodsAttr;
begin
  Result:=TShopGoodsAttr(Inherited Items[Index]);
end;

{ TActivity }

procedure TActivity.AssignTo(Dest: TPersistent);
var
  DestObject:TActivity;
begin
  DestObject:=TActivity(Dest);

  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.shop_fid:=shop_fid;
  DestObject.promotion_type:=promotion_type;
  DestObject.name:=name;
  DestObject.start_date:=start_date;
  DestObject.end_date:=end_date;
  DestObject.start_time:=start_time;
  DestObject.end_time:=end_time;
  DestObject.weekdays_mon:=weekdays_mon;
  DestObject.weekdays_tue:=weekdays_tue;
  DestObject.weekdays_wed:=weekdays_wed;
  DestObject.weekdays_thu:=weekdays_thu;
  DestObject.weekdays_fri:=weekdays_fri;
  DestObject.weekdays_sat:=weekdays_sat;
  DestObject.weekdays_sun:=weekdays_sun;
  DestObject.dec_money:=dec_money;
  DestObject.special_price:=special_price;
  DestObject.discount:=discount;
  DestObject.full_money1:=full_money1;
  DestObject.dec_money1:=dec_money1;
  DestObject.full_money2:=full_money2;
  DestObject.dec_money2:=dec_money2;
  DestObject.full_money3:=full_money3;
  DestObject.dec_money3:=dec_money3;
  DestObject.is_share:=is_share;
  DestObject.can_repeat_count:=can_repeat_count;
  DestObject.is_new_user:=is_new_user;
  DestObject.used_sun_count:=used_sun_count;
  DestObject.daily_count_per_user:=daily_count_per_user;
//  DestObject.is_coupon:=is_coupon;
  DestObject.valid_time:=valid_time;
  DestObject.coupon_max_count:=coupon_max_count;
  DestObject.geted_coupon_count:=geted_coupon_count;
  DestObject.used_coupon_count:=used_coupon_count;
  DestObject.platform_promotion_fid:=platform_promotion_fid;
  DestObject.subsidy:=subsidy;
  DestObject.is_deleted:=is_deleted;
  DestObject.createtime:=createtime;
  DestObject.is_taked:=is_taked;

  //是否可以领取
  DestObject.is_can_take:=is_can_take;
  DestObject.user_taked_count:=user_taked_count;
  DestObject.today_user_taked_count:=today_user_taked_count;


//  DestObject.GoodsInfo:=GoodsInfo;
end;

constructor TActivity.Create;
begin
  inherited;
  GoodsInfo:=TGoodsInfoList.Create;
end;

destructor TActivity.Destroy;
begin
  FreeAndNil(GoodsInfo);
  inherited;
end;

function TActivity.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//2,
  //Self.appid:=AJson.I['appid'];//1002,
  shop_fid:=AJson.I['shop_fid'];//1,
  promotion_type:=AJson.S['promotion_type'];//"满减活动",
  name:=AJson.S['name'];//"优惠活动XXX",
  start_date:=AJson.S['start_date'];//"",
  end_date:=AJson.S['end_date'];//"2018-04-01 00:00:00",
  start_time:=AJson.S['start_time'];//"",
  end_time:=AJson.S['end_time'];//"",
  weekdays_mon:=AJson.I['weekdays_mon'];//1,
  weekdays_tue:=AJson.I['weekdays_tue'];//1,
  weekdays_wed:=AJson.I['weekdays_wed'];//1,
  weekdays_thu:=AJson.I['weekdays_thu'];//1,
  weekdays_fri:=AJson.I['weekdays_fri'];//1,
  weekdays_sat:=AJson.I['weekdays_sat'];//1,
  weekdays_sun:=AJson.I['weekdays_sun'];//1,
  dec_money:=GetJsonDoubleValue(AJson,'dec_money');//1.25,
  special_price:=GetJsonDoubleValue(AJson,'special_price');
  discount:=GetJsonDoubleValue(AJson,'discount');//2.1,
  full_money1:=GetJsonDoubleValue(AJson,'full_money1');//20.1,
  dec_money1:=GetJsonDoubleValue(AJson,'dec_money1');//5.1,
  full_money2:=GetJsonDoubleValue(AJson,'full_money2');//30.1,
  dec_money2:=GetJsonDoubleValue(AJson,'dec_money2');//6.1,
  full_money3:=GetJsonDoubleValue(AJson,'full_money3');//40.1,
  dec_money3:=GetJsonDoubleValue(AJson,'dec_money3');//7.1,
  is_share:=AJson.I['is_share'];//0,
  can_repeat_count:=AJson.I['can_repeat_count'];//1,
  is_new_user:=AJson.I['is_new_user'];//0,
  used_sun_count:=AJson.I['used_sun_count'];//0,
  daily_count_per_user:=AJson.I['daily_count_per_user'];//1,
//  is_coupon:=AJson.I['is_coupon'];//0,
  valid_time:=AJson.I['valid_time'];
  coupon_max_count:=AJson.I['coupon_max_count'];//0,
  geted_coupon_count:=AJson.I['geted_coupon_count'];//0,
  used_coupon_count:=AJson.I['used_coupon_count'];//0,
  platform_promotion_fid:=AJson.I['platform_promotion_fid'];//1,
  subsidy:=GetJsonDoubleValue(AJson,'subsidy');//5.2,
  is_deleted:=AJson.I['is_deleted'];//0,
  createtime:=AJson.S['createtime'];//"2018-03-28 09:48:36",



  is_taked:=AJson.I['is_taked'];

  is_can_take:=AJson.I['is_can_take'];
  user_taked_count:=AJson.I['user_taked_count'];
  today_user_taked_count:=AJson.I['today_user_taked_count'];





  Self.GoodsInfo.Clear(True);
  GoodsInfo.ParseFromJsonArray(TGoodsInfo,AJson.A['GoodsInfo']);
end;

{ TActivityList }

function TActivityList.FindItemByFID(AFID: Integer): TActivity;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TActivityList.GetItem(Index: Integer): TActivity;
begin
  Result:=TActivity(Inherited Items[Index]);
end;

{ TGoodsInfo }

function TGoodsInfo.GetGoodsPic1Url: String;
begin
  Result:='';
  if Self.goods_pic1_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(goods_pic1_path,'\','/');
  end;
end;

function TGoodsInfo.ParseFromJson(AJson: ISuperObject): Boolean;
begin
   fid:=AJson.I['fid'];
   //Self.appid:=AJson.I['appid'];
   shop_fid:=AJson.I['shop_fid'];
   shop_promotion_fid:=AJson.I['shop_promotion_fid'];
   shop_goods_fid:=AJson.I['shop_goods_fid'];
   goods_name:=AJson.S['goods_name'];
   goods_pic1_path:=AJson.S['goods_pic1_path'];
   shop_goods_spec_fid:=AJson.I['shop_goods_spec_fid'];
   special_price:=GetJsonDoubleValue(AJson,'special_price');
   origin_price:=GetJsonDoubleValue(AJson,'origin_price');
   discount:=GetJsonDoubleValue(AJson,'discount');
   daily_max_count:=AJson.I['daily_max_count'];
   used_sum_count:=AJson.I['used_sum_count'];
   start_enjoy_count:=AJson.I['start_enjoy_count'];
   is_deleted:=AJson.I['is_deleted'];
   createtime:=AJson.S['createtime'];
end;

{ TGoodsInfoList }

function TGoodsInfoList.FindItemByFID(AFID: Integer): TGoodsInfo;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TGoodsInfoList.GetItem(Index: Integer): TGoodsInfo;
begin
  Result:=TGoodsInfo(Inherited Items[Index]);
end;

{ TShopList }

function TShopList.GetItem(Index: Integer): TShop;
begin
  Result:=TShop(Inherited Items[Index]);
end;

{ TEvaluateReply }

procedure TEvaluateReply.AssignTo(Dest: TPersistent);
var
  DestObject:TEvaluateReply;
begin
  DestObject:=TEvaluateReply(Dest);

  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.user_fid:=user_fid;
  DestObject.evaluate_object_fid:=evaluate_object_fid;
  DestObject.order_fid:=order_fid;
  DestObject.content:=content;
  DestObject.createtime:=createtime;

end;

procedure TEvaluateReply.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  user_fid:='0';
  evaluate_object_fid:=0;
  order_fid:=0;
  content:='';
  createtime:='';
end;

function TEvaluateReply.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//1,
  //Self.appid:=AJson.I['appid'];//1002,
  user_fid:=AJson.V['user_fid'];//29,
  evaluate_object_fid:=AJson.I['evaluate_object_fid'];//3,
  order_fid:=AJson.I['order_fid'];//0,
  content:=AJson.S['content'];//"dddd2",
  createtime:=AJson.S['createtime'];//"2018-04-19 19:37:11"
end;

{ TEvaluateReplyList }

function TEvaluateReplyList.FindItemByFID(AFID: Integer): TEvaluateReply;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TEvaluateReplyList.GetItem(Index: Integer): TEvaluateReply;
begin
  Result:=TEvaluateReply(Inherited Items[Index]);
end;

{ TEvaluate }

procedure TEvaluate.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  user_fid:='0';
  is_anonymous:=0;
  from_fid:=0;
  evaluate_type:='';
  to_fid:='0';
  to_sub_fid:=0;
  order_fid:=0;
  score:=0;
  max_score:=0;
  content:='';
  tags:='';

  user_custom_data:='';

  pic1_path:='';
  pic2_path:='';//"Upload\\1002\\Evaluate_Pic\\2018\\2018-03-20\\63421B3694EB45C19372A3153B9434C7.jpg",
  pic3_path:='';//"Upload\\1002\\Evaluate_Pic\\2018\\2018-03-20\\63421B3694EB45C19372A3153B9434C7.jpg",
  orderno:=0;//1,
  createtime:='';//"2018-04-19 19:34:15",
  reply_count:=0;//1,
  is_deleted:=0;//0,

  from_name:='';//客户-王能,
  shop_name:='';
  goods_name:='';

  shop_logo_pic_path:='';

  head_pic_path:='';

  EvaluateReplyList.Clear(True);
end;

constructor TEvaluate.Create;
begin
  inherited;
  EvaluateReplyList:=TEvaluateReplyList.Create;

  {$IFDEF FMX}
  Pic1:=TDrawPicture.Create('','');//"1.jpeg",
  Pic2:=TDrawPicture.Create('','');//"2.jpeg",
  Pic3:=TDrawPicture.Create('','');//"3.jpeg",
  Pic4:=TDrawPicture.Create('','');
  {$ENDIF FMX}
end;

destructor TEvaluate.Destroy;
begin
  FreeAndNil(EvaluateReplyList);

  {$IFDEF FMX}
  SysUtils.FreeAndNil(Pic1);
  SysUtils.FreeAndNil(Pic2);
  SysUtils.FreeAndNil(Pic3);
  SysUtils.FreeAndNil(Pic4);
  {$ENDIF FMX}
  inherited;
end;

function TEvaluate.GetHeadPicPath: String;
begin
  Result:='';
  if Self.head_pic_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.head_pic_path,'\','/');
  end
  else
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr('Upload\'+(AppID)+'\userhead_pic\Default_Pic\user_pic.png','\','/');
  end;
end;

function TEvaluate.Getpic1path: String;
begin
  Result:='';
  if Self.pic1_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.pic1_path,'\','/');
  end;

end;

function TEvaluate.Getpic2path: String;
begin
  Result:='';
  if Self.pic2_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.pic2_path,'\','/');
  end;

end;

function TEvaluate.Getpic3path: String;
begin
  Result:='';
  if Self.pic3_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.pic3_path,'\','/');
  end;

end;

function TEvaluate.GetShopPicPath: String;
begin
  Result:='';

  if Self.shop_logo_pic_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.shop_logo_pic_path,'\','/');
  end;
end;

function TEvaluate.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//3,
  //Self.appid:=AJson.I['appid'];//1002,
  user_fid:=AJson.V['user_fid'];//29,
  is_anonymous:=AJson.I['is_anonymous'];//1,
  from_fid:=AJson.I['from_fid'];//2,
  evaluate_type:=AJson.S['evaluate_type'];//"user_evaluate_order_shop",
  to_fid:=AJson.V['to_fid'];//4,
  to_sub_fid:=AJson.I['to_sub_fid'];//5,
  order_fid:=AJson.I['order_fid'];//0,
  score:=GetJsonDoubleValue(AJson,'score');//3.4,
  max_score:=AJson.I['max_score'];//5,
  content:=AJson.S['content'];//"",
  tags:=AJson.S['tags'];//"评价的标签",
  pic1_path:=AJson.S['pic1_path'];//"Upload\\1002\\Evaluate_Pic\\2018\\2018-03-20\\63421B3694EB45C19372A3153B9434C7.jpg",
  pic2_path:=AJson.S['pic2_path'];//"Upload\\1002\\Evaluate_Pic\\2018\\2018-03-20\\63421B3694EB45C19372A3153B9434C7.jpg",
  pic3_path:=AJson.S['pic3_path'];//"Upload\\1002\\Evaluate_Pic\\2018\\2018-03-20\\63421B3694EB45C19372A3153B9434C7.jpg",
  orderno:=GetJsonDoubleValue(AJson,'orderno');//1,
  createtime:=AJson.S['createtime'];//"2018-04-19 19:34:15",
  reply_count:=AJson.I['reply_count'];//1,
  is_deleted:=AJson.I['is_deleted'];//0,
  from_name:=AJson.S['from_name'];

  shop_name:=AJson.S['shop_name'];
  goods_name:=AJson.S['goods_name'];

  shop_logo_pic_path:=AJson.S['shop_logo_pic_path'];

  head_pic_path:=AJson.S['head_pic_path'];

  {$IFDEF FMX}
  Pic1.Url:=Self.Getpic1path;//"1.jpeg",
  Pic2.Url:=Self.Getpic2path;//"2.jpeg",
  Pic3.Url:=Self.Getpic3path;//"3.jpeg",
  {$ENDIF FMX}


  user_custom_data:=AJson.S['user_custom_data'];


  EvaluateReplyList.Clear(True);

  EvaluateReplyList.ParseFromJsonArray(TEvaluateReply,AJson.A['EvaluateReplyList']);

end;


{ TEvaluateList }

function TEvaluateList.GetItem(Index: Integer): TEvaluate;
begin
  Result:=TEvaluate(Inherited Items[Index]);
end;

{ TCarGood }

procedure TCarGood.AssignTo(Dest: TPersistent);
var
  DestObject:TCarGood;
begin
  DestObject:=TCarGood(Dest);

  DestObject.fid:=fid;//8,
  //DestObject.//Self.appid:=Self.appid;//1002,
  DestObject.user_fid:=user_fid;//31,
  DestObject.shop_fid:=shop_fid;//1,
  DestObject.shop_goods_fid:=shop_goods_fid;//1,
  DestObject.shop_goods_spec_fid:=shop_goods_spec_fid;//1,
  DestObject.shop_goods_attrs:=shop_goods_attrs;//"微辣、中辣、重辣",
  DestObject.number:=number;//1,
  DestObject.orderno:=orderno;//1,
  DestObject.createtime:=createtime;//"2018-04-24 13:38:17",
  DestObject.goods_name:=goods_name;//"商品名称",
  DestObject.goods_pic1_path:=goods_pic1_path;//"http://111.png",
  DestObject.shop_goods_spec_name:=shop_goods_spec_name;//"大杯",
  DestObject.shop_goods_spec_packing_fee:=shop_goods_spec_packing_fee;//2,
  DestObject.special_price:=special_price;//8,
  DestObject.origin_price:=origin_price;//12
  DestObject.goodunit:=goodunit;// "袋",
  DestObject.small_unit:=small_unit;//"斤",
  DestObject.small_unit_number:=small_unit_number;// 5,

end;

function TCarGood.GetGoodsPic1path: String;
begin
  Result:='';
  if Self.goods_pic1_path<>'' then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.goods_pic1_path,'\','/');
  end;

end;

function TCarGood.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//8,
  //Self.appid:=AJson.I['appid'];//1002,
  user_fid:=AJson.V['user_fid'];//31,
  shop_fid:=AJson.I['shop_fid'];//1,
  shop_goods_fid:=AJson.I['shop_goods_fid'];//1,
  shop_goods_spec_fid:=AJson.I['shop_goods_spec_fid'];//1,
  shop_goods_attrs:=AJson.S['shop_goods_attrs'];//"微辣、中辣、重辣",
  number:=AJson.I['number'];//1,
  orderno:=GetJsonDoubleValue(AJson,'orderno');//1,
  createtime:=AJson.S['createtime'];//"2018-04-24 13:38:17",
  goods_name:=AJson.S['goods_name'];//"商品名称",
  goods_pic1_path:=AJson.S['goods_pic1_path'];//"http://111.png",
  shop_goods_spec_name:=AJson.S['shop_goods_spec_name'];//"大杯",
  shop_goods_spec_packing_fee:=GetJsonDoubleValue(AJson,'shop_goods_spec_packing_fee');//2,
  special_price:=GetJsonDoubleValue(AJson,'special_price');//8,
  origin_price:=GetJsonDoubleValue(AJson,'origin_price');//12

  goodunit:=AJson.S['unit'];// "袋",
  small_unit:=AJson.S['small_unit'];//"斤",
  small_unit_number:=AJson.I['small_unit_number'];// 5,
end;

{ TCarGoodList }

function TCarGoodList.FindItemByFID(AFID: Integer): TCarGood;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TCarGoodList.GetItem(Index: Integer): TCarGood;
begin
  Result:=TCarGood(Inherited Items[Index]);
end;

{ TCarShop }

procedure TCarShop.Clear;
begin
  FCarGoodList.Clear(True);
  paking_fee:=0;
end;

constructor TCarShop.Create;
begin
  inherited;
  FCarGoodList:=TCarGoodList.Create;
end;

destructor TCarShop.Destroy;
begin
  FreeAndNil(FCarGoodList);
  inherited;
end;

function TCarShop.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  inherited;
  Self.FCarGoodList.Clear(True);

  Self.FCarGoodList.ParseFromJsonArray(TCarGood,AJson.A['AddedShopGoodsList']);

  paking_fee:=GetJsonDoubleValue(AJson,'paking_fee');
end;

{ TCarShopList }

function TCarShopList.FindItemByFID(AFID: Integer): TCarShop;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TCarShopList.GetItem(Index: Integer): TCarShop;
begin
  Result:=TCarShop(Inherited Items[Index]);
end;

{ TPrepareOrderFee }

procedure TPrepareOrderFee.AssignTo(Dest: TPersistent);
var
  DestObject:TPrepareOrderFee;
begin
  DestObject:=TPrepareOrderFee(Dest);
  DestObject.shop_fid:=shop_fid;
  DestObject.shop_goods_fid:=shop_goods_fid;
  DestObject.shop_goods_spec_fid:=shop_goods_spec_fid;
  DestObject.num:=num;
  DestObject.fee_type:=fee_type;
  DestObject.fee_desc:=fee_desc;
  DestObject.name:=name;
  DestObject.origin_price:=origin_price;
  DestObject.packing_fee:=packing_fee;
  DestObject.money:=money;
  DestObject.promotion_fid:=promotion_fid;
  DestObject.pic1_path:=pic1_path;
end;

procedure TPrepareOrderFee.Clear;
begin
  shop_fid:=0;
  shop_goods_fid:=0;
  shop_goods_spec_fid:=0;
  num:=0;
  fee_type:='';
  fee_desc:='';
  name:='';
  origin_price:=0;
  packing_fee:=0;
  money:=0;
  promotion_fid:=0;
  pic1_path:='';
end;

function TPrepareOrderFee.GetPicUrl: String;
begin
  Result:='';
  if Self.fee_type=Const_FeeType_GoodsMoney then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr(pic1_path,'\','/');
  end;

  if Self.fee_type=Const_FeeType_DeliveryFee then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr('Upload\'+AppID+'\other_pic\delivery_fee.png','\','/');
  end;


  if Self.fee_type=Const_FeeType_PackingFee then
  begin
    Result:=ImageHttpServerUrl+'/'+ReplaceStr('Upload\'+AppID+'\other_pic\packing_fee.png','\','/');
  end;

end;

function TPrepareOrderFee.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  shop_fid:=AJson.I['shop_fid'];//4,
  shop_goods_fid:=AJson.I['order_goods_fid'];//16,
  shop_goods_spec_fid:=AJson.I['shop_goods_spec_fid'];//44,
  num:=AJson.I['num'];//1,
  fee_type:=AJson.S['fee_type'];//"goods_money",
  fee_desc:=AJson.S['fee_desc'];//"大根,",
  name:=AJson.S['name'];//"油条",
  origin_price:=AJson.F['origin_price'];//8,
  packing_fee:=AJson.F['packing_fee'];//2,
  money:=AJson.F['money'];//8,
  promotion_fid:=AJson.I['promotion_fid'];//0
  pic1_path:=AJson.S['pic1_path'];
end;

{ TPrepareOrderFeeList }

function TPrepareOrderFeeList.GetItem(Index: Integer): TPrepareOrderFee;
begin
  Result:=TPrepareOrderFee(Inherited Items[Index]);
end;

{ TCoupon }

procedure TCoupon.AssignTo(Dest: TPersistent);
var
  DestObject:TCoupon;
begin
  DestObject:=TCoupon(Dest);

  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.user_fid:=user_fid;
  DestObject.shop_fid:=shop_fid;
  DestObject.promotion_fid:=promotion_fid;
  DestObject.valid_time:=valid_time;
  DestObject.is_used:=is_used;
  DestObject.used_order_fid:=used_order_fid;
  DestObject.createtime:=createtime;
  DestObject.fid_1:=fid_1;
  DestObject.appid_1:=appid_1;
  DestObject.shop_fid_1:=shop_fid_1;
  DestObject.promotion_type:=promotion_type;
  DestObject.name:=name;
  DestObject.start_date:=start_date;
  DestObject.end_date:=end_date;
  DestObject.start_time:=start_time;
  DestObject.end_time:=end_time;
  DestObject.weekdays_mon:=weekdays_mon;
  DestObject.weekdays_tue:=weekdays_tue;
  DestObject.weekdays_wed:=weekdays_wed;
  DestObject.weekdays_thu:=weekdays_thu;
  DestObject.weekdays_fri:=weekdays_fri;
  DestObject.weekdays_sat:=weekdays_sat;
  DestObject.weekdays_sun:=weekdays_sun;
  DestObject.dec_money:=dec_money;
  DestObject.special_price:=special_price;
  DestObject.discount:=discount;
  DestObject.full_money1:=full_money1;
  DestObject.dec_money1:=dec_money1;
  DestObject.full_money2:=full_money2;
  DestObject.dec_money2:=dec_money2;
  DestObject.full_money3:=full_money3;
  DestObject.dec_money3:=dec_money3;
  DestObject.is_share:=is_share;
  DestObject.can_repeat_count:=can_repeat_count;
  DestObject.is_new_user:=is_new_user;
  DestObject.used_sum_count:=used_sum_count;
  DestObject.daily_count_per_user:=daily_count_per_user;
  DestObject.valid_time_1:=valid_time_1;
  DestObject.is_coupon:=is_coupon;
  DestObject.coupon_max_count:=coupon_max_count;
  DestObject.geted_coupon_count:=geted_coupon_count;
  DestObject.used_coupon_count:=used_coupon_count;
  DestObject.platform_promotion_fid:=platform_promotion_fid;
  DestObject.subsidy:=subsidy;
  DestObject.is_deleted:=is_deleted;
  DestObject.createtime_1:=createtime_1;

end;

procedure TCoupon.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  user_fid:='0';
  shop_fid:=0;
  promotion_fid:=0;
  valid_time:=0;
  is_used:=0;
  used_order_fid:=0;
  createtime:='';
  fid_1:=0;
  appid_1:=0;
  shop_fid_1:=0;
  promotion_type:='';
  name:='';
  start_date:='';
  end_date:='';
  start_time:='';
  end_time:='';
  weekdays_mon:=0;
  weekdays_tue:=0;
  weekdays_wed:=0;
  weekdays_thu:=0;
  weekdays_fri:=0;
  weekdays_sat:=0;
  weekdays_sun:=0;
  dec_money:=0;
  special_price:=0;
  discount:=0;
  full_money1:=0;
  dec_money1:=0;
  full_money2:=0;
  dec_money2:=0;
  full_money3:=0;
  dec_money3:=0;
  is_share:=0;
  can_repeat_count:=0;
  is_new_user:=0;
  used_sum_count:=0;
  daily_count_per_user:=0;
  valid_time_1:=0;
  is_coupon:=0;
  coupon_max_count:=0;
  geted_coupon_count:=0;
  used_coupon_count:=0;
  platform_promotion_fid:=0;
  subsidy:=0;
  is_deleted:=0;
  createtime_1:='';
end;

function TCoupon.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//11,
  //Self.appid:=AJson.I['appid'];//1002,
  user_fid:=AJson.V['user_fid'];//64,
  shop_fid:=AJson.I['shop_fid'];//4,
  promotion_fid:=AJson.I['promotion_fid'];//16,
  valid_time:=AJson.I['valid_time'];//0,
  is_used:=AJson.I['is_used'];//0,
  used_order_fid:=AJson.I['used_order_fid'];//0,
  createtime:=AJson.S['createtime'];//"2018-05-10 08:41:25",
  fid_1:=AJson.I['fid_1'];//16,
  appid_1:=AJson.I['appid_1'];//1002,
  shop_fid_1:=AJson.I['shop_fid_1'];//4,
  promotion_type:=AJson.S['promotion_type'];//"special_price_goods",
  name:=AJson.S['name'];//"11.11",
  start_date:=AJson.S['start_date'];//"2018-04-09 00:00:00",
  end_date:=AJson.S['end_date'];//"2018-04-12 00:00:00",
  start_time:=AJson.S['start_time'];//"",
  end_time:=AJson.S['end_time'];//"",
  weekdays_mon:=AJson.I['weekdays_mon'];//0,
  weekdays_tue:=AJson.I['weekdays_tue'];//0,
  weekdays_wed:=AJson.I['weekdays_wed'];//0,
  weekdays_thu:=AJson.I['weekdays_thu'];//0,
  weekdays_fri:=AJson.I['weekdays_fri'];//0,
  weekdays_sat:=AJson.I['weekdays_sat'];//0,
  weekdays_sun:=AJson.I['weekdays_sun'];//0,
  dec_money:=GetJsonDoubleValue(AJson,'dec_money');//1.25,
  special_price:=GetJsonDoubleValue(AJson,'special_price');
  discount:=GetJsonDoubleValue(AJson,'discount');//2.1,
  full_money1:=GetJsonDoubleValue(AJson,'full_money1');//20.1,
  dec_money1:=GetJsonDoubleValue(AJson,'dec_money1');//5.1,
  full_money2:=GetJsonDoubleValue(AJson,'full_money2');//30.1,
  dec_money2:=GetJsonDoubleValue(AJson,'dec_money2');//6.1,
  full_money3:=GetJsonDoubleValue(AJson,'full_money3');//40.1,
  dec_money3:=GetJsonDoubleValue(AJson,'dec_money3');//7.1,
  is_share:=AJson.I['is_share'];//0,
  can_repeat_count:=AJson.I['can_repeat_count'];//1,
  is_new_user:=AJson.I['is_new_user'];//0,
  used_sum_count:=AJson.I['used_sum_count'];//0,
  daily_count_per_user:=AJson.I['daily_count_per_user'];//1,
  valid_time_1:=AJson.I['valid_time_1'];//0,
  is_coupon:=AJson.I['is_coupon'];//0,
  coupon_max_count:=AJson.I['coupon_max_count'];//0,
  geted_coupon_count:=AJson.I['geted_coupon_count'];//0,
  used_coupon_count:=AJson.I['used_coupon_count'];//0,
  platform_promotion_fid:=AJson.I['platform_promotion_fid'];//1,
  subsidy:=GetJsonDoubleValue(AJson,'subsidy');//0,
  is_deleted:=AJson.I['is_deleted'];//0,
  createtime_1:=AJson.S['createtime_1'];//"2018-04-09 15:37:22"
end;

{ TCouponList }

function TCouponList.FindItemByFID(AFID: Integer): TCoupon;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TCouponList.GetItem(Index: Integer): TCoupon;
begin
  Result:=TCoupon(Inherited Items[Index]);
end;

{ TShopOrderList }

function TShopOrderList.GetItem(Index: Integer): TShopOrder;
begin
  Result:=TShopOrder(Inherited Items[Index]);
end;

{ TShopOrder }

procedure TShopOrder.AssignTo(Dest: TPersistent);
var
  DestObject:TShopOrder;
begin
  inherited;
  DestObject:=TShopOrder(Dest);

  DestObject.user_ordered_count:=user_ordered_count;

  DestObject.user_name:=user_name;
  DestObject.user_phone:=user_phone;
  DestObject.user_email:=user_email;
  DestObject.user_sex:=user_sex;
end;

procedure TShopOrder.Clear;
begin
  user_ordered_count:=0;

  user_name:='';
  user_phone:='';
  user_email:='';
  user_sex:=0;
end;

function TShopOrder.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  inherited;
  user_ordered_count:=AJson.I['user_ordered_count'];

  if AJson.O['BuyerInfo']<>nil then
  begin
    user_name:=AJson.O['BuyerInfo'].S['name'];
    user_phone:=AJson.O['BuyerInfo'].S['phone'];
    user_email:=AJson.O['BuyerInfo'].S['email'];
    user_sex:=AJson.O['BuyerInfo'].I['sex'];
  end;
end;

{ TDeliveryOrderList }

function TDeliveryOrderList.GetItem(Index: Integer): TDeliveryOrder;
begin
  Result:=TDeliveryOrder(Inherited Items[Index]);
end;

{ TRiderDeliveryOrderList }

function TRiderDeliveryOrderList.GetItem(Index: Integer): TRiderDeliveryOrder;
begin
  Result:=TRiderDeliveryOrder(Inherited Items[Index]);
end;

{ TDeliveryOrder }

procedure TDeliveryOrder.AssignTo(Dest: TPersistent);
var
  DestObject:TDeliveryOrder;
begin
  uBaseLog.HandleException(nil,'OrangeUI Arrive13 Successful FOriginOrder3');
  DestObject:=TDeliveryOrder(Dest);

  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.user_fid:=user_fid;
  DestObject.shop_center_order_fid:=shop_center_order_fid;
  DestObject.bill_code:=bill_code;
  DestObject.order_state:=order_state;
  DestObject.order_state_for_display:=order_state_for_display;
  DestObject.want_take_time:=want_take_time;
  DestObject.want_arrive_time:=want_arrive_time;
  DestObject.is_book:=is_book;
  DestObject.goods_name:=goods_name;
  DestObject.goods_money:=goods_money;
  DestObject.is_need_pay_goods_money:=is_need_pay_goods_money;
  DestObject.goods_weight:=goods_weight;
  DestObject.goods_length:=goods_length;
  DestObject.goods_width:=goods_width;
  DestObject.goods_height:=goods_height;
  DestObject.memo:=memo;
  DestObject.send_user_fid:=send_user_fid;
  DestObject.send_name:=send_name;
  DestObject.send_sex:=send_sex;
  DestObject.send_phone:=send_phone;
  DestObject.send_addr_name:=send_addr_name;
  DestObject.send_province:=send_province;
  DestObject.send_city:=send_city;
  DestObject.send_area:=send_area;
  DestObject.send_addr:=send_addr;
  DestObject.send_door_no:=send_door_no;
  DestObject.send_latitude:=send_latitude;
  DestObject.send_longitude:=send_longitude;
  DestObject.recv_user_fid:=recv_user_fid;
  DestObject.recv_name:=recv_name;
  DestObject.recv_sex:=recv_sex;
  DestObject.recv_phone:=recv_phone;
  DestObject.recv_addr_name:=recv_addr_name;
  DestObject.recv_province:=recv_province;
  DestObject.recv_city:=recv_city;
  DestObject.recv_area:=recv_area;
  DestObject.recv_addr:=recv_addr;
  DestObject.recv_door_no:=recv_door_no;
  DestObject.recv_latitude:=recv_latitude;
  DestObject.recv_longitude:=recv_longitude;
  DestObject.bad_weather_add_money:=bad_weather_add_money;
  DestObject.weight_add_money:=weight_add_money;
  DestObject.size_add_money:=size_add_money;
  DestObject.night_add_money:=night_add_money;
  DestObject.origin_money:=origin_money;
  DestObject.dec_money:=dec_money;
  DestObject.sum_money:=sum_money;
  DestObject.distance:=distance;
  DestObject.pay_type:=pay_type;
  DestObject.pay_state:=pay_state;
  DestObject.pay_time:=pay_time;
  DestObject.is_hide:=is_hide;
  DestObject.is_deleted:=is_deleted;
  DestObject.is_actived:=is_actived;
  DestObject.createtime:=createtime;
  DestObject.cancel_code:=cancel_code;
  DestObject.cancel_reason:=cancel_reason;
  DestObject.reject_code:=reject_code;
  DestObject.reject_reason:=reject_reason;
  DestObject.settlement_state:=settlement_state;
  DestObject.is_sender_evaluated:=is_sender_evaluated;
  DestObject.is_recver_evaludated:=is_recver_evaludated;
  DestObject.take_distance:=take_distance;
  DestObject.send_distance:=send_distance;

  DestObject.deliver_type:=deliver_type;

  DestObject.rider_income:=rider_income;
  DestObject.shop_order_index:=shop_order_index;



end;

procedure TDeliveryOrder.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  user_fid:='0';
  shop_center_order_fid:=0;
  bill_code:='';
  order_state:='';
  order_state_for_display:='';
  want_take_time:='';
  want_arrive_time:='';
  is_book:=0;
  goods_name:='';
  goods_money:=0.0;
  is_need_pay_goods_money:=0;
  goods_weight:=0;
  goods_length:=0;
  goods_width:=0;
  goods_height:=0;
  memo:='';
  send_user_fid:='0';
  send_name:='';
  send_sex:=0;
  send_phone:='';
  send_addr_name:='';
  send_province:='';
  send_city:='';
  send_area:='';
  send_addr:='';
  send_door_no:='';
  send_latitude:=0.0;
  send_longitude:=0.0;
  recv_user_fid:='0';
  recv_name:='';
  recv_sex:=0;
  recv_phone:='';
  recv_addr_name:='';
  recv_province:='';
  recv_city:='';
  recv_area:='';
  recv_addr:='';
  recv_door_no:='';
  recv_latitude:=0.0;
  recv_longitude:=0.0;
  bad_weather_add_money:=0;
  weight_add_money:=0;
  size_add_money:=0;
  night_add_money:=0;
  origin_money:=0.0;
  dec_money:=0;
  sum_money:=0.0;
  distance:=0;
  pay_type:='';
  pay_state:='';
  pay_time:='';
  is_hide:=0;
  is_deleted:=0;
  is_actived:=0;
  createtime:='';
  cancel_code:='';
  cancel_reason:='';
  reject_code:='';
  reject_reason:='';
  settlement_state:='';
  is_sender_evaluated:=0;
  is_recver_evaludated:=0;
  take_distance:=0;
  send_distance:=0;

  rider_income:=0;
  shop_order_index:=0;

  deliver_type:='';

  OrderGoodsList.Clear(True);
  OrderStateTrackList.Clear(True);
end;

constructor TDeliveryOrder.Create;
begin
  inherited;

  OrderGoodsList:=TDeliveryOrderGoodsList.Create;
  OrderStateTrackList:=TOrderStateTrackList.Create;
end;

destructor TDeliveryOrder.Destroy;
begin
  FreeAndNil(OrderGoodsList);
  FreeAndNil(OrderStateTrackList);
  inherited;
end;

function TDeliveryOrder.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//13,
  //Self.appid:=AJson.I['appid'];//1002,
  user_fid:=AJson.V['user_fid'];//64,
  shop_center_order_fid:=AJson.I['shop_center_order_fid'];//71,
  bill_code:=AJson.S['bill_code'];//0,
  order_state:=AJson.S['order_state'];//"payed",
  order_state_for_display:=AJson.S['order_state_for_display'];//"payed",
  want_take_time:=AJson.S['want_take_time'];//"2018-05-16 15:43:38",
  want_arrive_time:=AJson.S['want_arrive_time'];//"2018-05-16 15:43:38",
  is_book:=AJson.I['is_book'];//0,
  goods_name:=AJson.S['goods_name'];//"多规格菜品等",
  goods_money:=GetJsonDoubleValue(AJson,'goods_money');//21.2,
  is_need_pay_goods_money:=AJson.I['is_need_pay_goods_money'];//0,
  goods_weight:=AJson.F['goods_weight'];//0,
  goods_length:=AJson.F['goods_length'];//0,
  goods_width:=AJson.F['goods_width'];//0,
  goods_height:=AJson.F['goods_height'];//0,
  memo:=AJson.S['memo'];//"",
  send_user_fid:=AJson.S['send_user_fid'];//31,
  send_name:=AJson.S['send_name'];//"王能",
  send_sex:=AJson.I['send_sex'];//0,
  send_phone:=AJson.S['send_phone'];//"18957901025",
  send_addr_name:=AJson.S['send_addr_name'];//"",
  send_province:=AJson.S['send_province'];//"浙江",
  send_city:=AJson.S['send_city'];//"金华",
  send_area:=AJson.S['send_area'];//"婺城",
  send_addr:=AJson.S['send_addr'];//"龙腾创业大厦",
  send_door_no:=AJson.S['send_door_no'];//"",
  send_latitude:=GetJsonDoubleValue(AJson,'send_latitude');//29.074786,
  send_longitude:=GetJsonDoubleValue(AJson,'send_longitude');//119.652738,
  recv_user_fid:=AJson.S['recv_user_fid'];//64,
  recv_name:=AJson.S['recv_name'];//"傅应文",
  recv_sex:=AJson.I['recv_sex'];//1,
  recv_phone:=AJson.S['recv_phone'];//"18006890741",
  recv_addr_name:=AJson.S['recv_addr_name'];//"",
  recv_province:=AJson.S['recv_province'];//"浙江省",
  recv_city:=AJson.S['recv_city'];//"金华市",
  recv_area:=AJson.S['recv_area'];//"婺城区",
  recv_addr:=AJson.S['recv_addr'];//"寺前皇小区丹南街10",
  recv_door_no:=AJson.S['recv_door_no'];//"827",
  recv_latitude:=GetJsonDoubleValue(AJson,'recv_latitude');//29.074786,
  recv_longitude:=GetJsonDoubleValue(AJson,'recv_longitude');//119.652738,
  bad_weather_add_money:=AJson.F['bad_weather_add_money'];//0,
  weight_add_money:=AJson.F['weight_add_money'];//3,
  size_add_money:=AJson.F['size_add_money'];//0,
  night_add_money:=AJson.F['night_add_money'];//0,
  origin_money:=GetJsonDoubleValue(AJson,'origin_money');//31.2,
  dec_money:=AJson.F['dec_money'];//0,
  sum_money:=GetJsonDoubleValue(AJson,'sum_money');//31.2,
  distance:=AJson.I['distance'];//0,
  pay_type:=AJson.S['pay_type'];//"",
  pay_state:=AJson.S['pay_state'];//"payed",
  pay_time:=AJson.S['pay_time'];//"",
  is_hide:=AJson.I['is_hide'];//0,
  is_deleted:=AJson.I['is_deleted'];//0,
  is_actived:=AJson.I['is_actived'];//1,
  createtime:=AJson.S['createtime'];//"2018-05-16 15:43:38",
  cancel_code:=AJson.S['cancel_code'];//"",
  cancel_reason:=AJson.S['cancel_reason'];//"",
  reject_code:=AJson.S['reject_code'];//"",
  reject_reason:=AJson.S['reject_reason'];//"",
  settlement_state:=AJson.S['settlement_state'];//"",
  is_sender_evaluated:=AJson.I['is_sender_evaluated'];//0,
  is_recver_evaludated:=AJson.I['is_recver_evaludated'];//0,
  take_distance:=AJson.I['take_distance'];//377,
  send_distance:=AJson.I['send_distance'];//377

  deliver_type:=AJSon.S['deliver_type'];

  rider_income:=GetJsonDoubleValue(AJson,'rider_income');//31.2,
  shop_order_index:=AJson.I['shop_order_index'];//31.2,


  OrderGoodsList.Clear(True);
  OrderGoodsList.ParseFromJsonArray(TDeliveryOrderGoods,AJson.A['GoodsList']);

  OrderStateTrackList.Clear(True);
  OrderStateTrackList.ParseFromJsonArray(TOrderStateTrack,AJson.A['OrderStateTracKList']);
end;




{ TDeliveryOrderGoods }

procedure TDeliveryOrderGoods.AssignTo(Dest: TPersistent);
var
  DestObject:TDeliveryOrderGoods;
begin
  DestObject:=TDeliveryOrderGoods(Dest);
  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.order_fid:=order_fid;
  DestObject.name:=name;
  DestObject.goods_desc:=goods_desc;
  DestObject.money:=money;
  DestObject.number:=number;
  DestObject.orderno:=orderno;
  DestObject.createtime:=createtime;
end;

procedure TDeliveryOrderGoods.Clear;
begin
  fid:=0;
//  //Self.appid:=0;
  order_fid:=0;
  name:='';
  goods_desc:='';
  money:=0;
  number:=0;
  orderno:=0;
  createtime:='';
end;

function TDeliveryOrderGoods.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//43,
  //Self.appid:=AJson.I['appid'];//1002,
  order_fid:=AJson.I['order_fid'];//38,
  name:=AJson.S['name'];//"油条",
  goods_desc:=AJson.S['goods_desc'];//"大根/11111",
  money:=GetJsonDoubleValue(AJson,'money');//8,
  number:=AJson.I['number'];//2,
  orderno:=AJson.I['orderno'];//1,
  createtime:=AJson.S['createtime'];//"2018-05-28 16:59:14"
end;

{ TDeliveryOrderGoodsList }

function TDeliveryOrderGoodsList.GetItem(Index: Integer): TDeliveryOrderGoods;
begin
  Result:=TDeliveryOrderGoods(Inherited Items[Index]);
end;

{ TOrderStateTrack }

function TOrderStateTrack.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//43,
  //Self.appid:=AJson.I['appid'];//1002,
  order_fid:=AJson.I['order_fid'];//28,
  order_state:=AJson.S['order_state'];//"rider_arrived",
  createtime:=AJson.S['createtime'];//"2018-05-24 09:44:48"
end;

{ TOrderStateTrackList }

function TOrderStateTrackList.FindItemByOrderState(AOrderState: String): TOrderStateTrack;
var
  I:Integer;
begin
  Result:=nil;

  for I := 0 to Self.Count-1 do
  begin
    if Items[I].order_state=AOrderState then
    begin
      Result:=Items[I];
      Break;
    end;
  end;

end;

function TOrderStateTrackList.GetItem(Index: Integer): TOrderStateTrack;
begin
  Result:=TOrderStateTrack(Inherited Items[Index]);
end;

{ TGoodClass }

procedure TGoodClass.AssignTo(Dest: TPersistent);
var
  DestObject:TGoodClass;
begin
  DestObject:=TGoodClass(Dest);
  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.parent_fid:=parent_fid;
  DestObject.name:=name;
  DestObject.category_desc:=category_desc;
  DestObject.orderno:=orderno;
  DestObject.is_deleted:=is_deleted;
  DestObject.createtime:=createtime;
end;

procedure TGoodClass.Clear;
begin
  fid:=0;//43,
//  //Self.appid:=0;//1002,
  parent_fid:=0;//0,
  name:=''; //"日用",
  category_desc:='';// "牙刷",
  orderno:=0.0;// 99.9,
  is_deleted:=0;// 0,
  createtime:='';//"2018-05-28 16:59:14"
end;

function TGoodClass.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];
  //Self.appid:=AJson.I['appid'];
  parent_fid:=AJson.I['parent_fid'];//0,
  name:=AJson.S['name']; //"日用",
  category_desc:=AJson.S['category_desc'];// "牙刷",
  orderno:=GetJsonDoubleValue(AJson,'orderno');// 99.9,
  is_deleted:=AJson.I['is_deleted'];// 0,
  createtime:=AJson.S['createtime'];
end;

{ TGoodClassList }

function TGoodClassList.GetItem(Index: Integer): TGoodClass;
begin
  Result:=TGoodClass(Inherited Items[Index]);
end;

{ TShopCollection }

procedure TShopCollection.AssignTo(Dest: TPersistent);
var
  DestObject:TShopCollection;
begin
  DestObject:=TShopCollection(Dest);
  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.user_fid:=user_fid;
  DestObject.shop_fid:=shop_fid;
  DestObject.createtime:=createtime;
  DestObject.is_deleted:=is_deleted;
end;

procedure TShopCollection.Clear;
begin
  fid:=0;// 3,
//  //Self.appid:=0;// 1002,
  user_fid:='0';// 48,
  shop_fid:=0;// 4,
  createtime:='';// "2018-08-13 14:18:37",
  is_deleted:=0;// 0,
end;

constructor TShopCollection.Create;
begin
  inherited;
  FShop:=TShop.Create;
end;

destructor TShopCollection.Destroy;
begin
  FreeAndNil(FShop);
  inherited;
end;

function TShopCollection.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];// 3,
  //Self.appid:=AJson.I['appid'];// 1002,
  user_fid:=AJson.V['user_fid'];// 48,
  shop_fid:=AJson.I['shop_fid'];// 4,
  createtime:=AJson.S['createtime'];// "2018-08-13 14:18:37",
  is_deleted:=AJson.I['is_deleted'];// 0,

  FShop.ParseFromJson(AJson.A['ShopInfo'].O[0]);
end;

{ TShopCollectionList }

function TShopCollectionList.GetItem(Index: Integer): TShopCollection;
begin
  Result:=TShopCollection(Inherited Items[Index]);
end;

{ TFootPrint }

procedure TFootPrint.AssignTo(Dest: TPersistent);
var
  DestObject:TFootPrint;
begin
  DestObject:=TFootPrint(Dest);
  DestObject.fid:=fid;
  //DestObject.//Self.appid:=Self.appid;
  DestObject.user_fid:=user_fid;
  DestObject.shop_fid:=shop_fid;
  DestObject.createtime:=createtime;
  DestObject.is_deleted:=is_deleted;
end;

procedure TFootPrint.Clear;
begin
  fid:=0;// 3,
//  //Self.appid:=0;// 1002,
  user_fid:='0';// 48,
  shop_fid:=0;// 4,
  createtime:='';// "2018-08-13 14:18:37",
  is_deleted:=0;// 0,
end;

constructor TFootPrint.Create;
begin
  inherited;
  FShop:=TShop.Create;
end;

destructor TFootPrint.Destroy;
begin
  FreeAndNil(FShop);
  inherited;
end;

function TFootPrint.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];// 3,
  //Self.appid:=AJson.I['appid'];// 1002,
  user_fid:=AJson.V['user_fid'];// 48,
  shop_fid:=AJson.I['shop_fid'];// 4,
  createtime:=AJson.S['createtime'];// "2018-08-13 14:18:37",
  is_deleted:=AJson.I['is_deleted'];// 0,

  FShop.ParseFromJson(AJson.A['ShopInfo'].O[0]);
end;

{ TFootPrintList }

function TFootPrintList.GetItem(Index: Integer): TFootPrint;
begin
  Result:=TFootPrint(Inherited Items[Index]);
end;

{ TOrderGood }

function TOrderGood.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//8,
  //Self.appid:=AJson.I['appid'];//1002,
  user_fid:=AJson.V['user_fid'];//31,
  shop_fid:=AJson.I['shop_fid'];//1,
  order_fid:=AJson.I['order_fid'];
  shop_goods_fid:=AJson.I['shop_goods_fid'];//1,
  shop_goods_spec_fid:=AJson.I['shop_goods_spec_fid'];//1,
  shop_goods_attrs:=AJson.S['shop_goods_attrs'];//"微辣、中辣、重辣",
  number:=AJson.I['number'];//1,
  orderno:=GetJsonDoubleValue(AJson,'orderno');//1,
  createtime:=AJson.S['createtime'];//"2018-04-24 13:38:17",
  goods_name:=AJson.S['goods_name'];//"商品名称",
  special_price:=GetJsonDoubleValue(AJson,'special_price');//8,
  origin_price:=GetJsonDoubleValue(AJson,'origin_price');//12
end;

{ TOrderGoodList }

function TOrderGoodList.FindItemByFID(AFID: Integer): TOrderGood;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TOrderGoodList.GetItem(Index: Integer): TOrderGood;
begin
  Result:=TOrderGood(Inherited Items[Index]);
end;

{ TSubRecord }

constructor TSubRecord.Create;
begin
  inherited;
  goods_list:=TShopGoodsList.Create(ooReference);
end;

destructor TSubRecord.Destroy;
begin
  FreeAndNil(goods_list);
  inherited;
end;

function TSubRecord.ParseFromJson(AJson: ISuperObject): Boolean;
begin
  fid:=AJson.I['fid'];//1,
  //Self.appid:=AJson.I['appid'];//1001,
  name:=AJson.S['name'];//"酒店大堂用品",
  shop_fid:=AJson.I['shop_fid'];//1001,
  category_desc:=AJson.S['category_desc'];
  orderno:=GetJsonDoubleValue(AJson,'orderno');//"",
  createtime:=AJson.S['createtime'];//"2017-07-22 13:04:01",

  goods_list.Clear(True);
  goods_list.ParseFromJsonArray(TShopGoods,AJson.A['GoodsList']);
end;

{ TSubRecordList }

procedure TSubRecordList.Category(AShopGoodsList: TShopGoodsList);
var
  I: Integer;
  J:Integer;
begin
  for I := 0 to Self.Count-1 do
  begin
    Items[I].goods_list.Clear(False);

    for J := 0 to AShopGoodsList.Count-1 do
    begin
      if Items[I].fid=AShopGoodsList[J].shop_goods_category_fid then
      begin
        Items[I].goods_list.Add(AShopGoodsList[J]);
      end;
    end;
  end;

end;

function TSubRecordList.FindItemByFID(AFID: Integer): TSubRecord;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.GetCount-1 do
  begin
    if Self.Items[I].fid=AFID then
    begin
      Result:=Self.Items[I];
      Break;
    end;
  end;
end;

function TSubRecordList.GetItem(Index: Integer): TSubRecord;
begin
  Result:=TSubRecord(Inherited Items[Index]);
end;



{ TUser }

procedure TUser.Clear;
begin
  //wn
  fid:='';
  {$IFDEF INT_USER_FID}
  fid:='0';
  {$ENDIF}

//  //Self.appid:=0;

  email:='';
  phone:='';
//  password:='';
  name:='';
  name_s:='';
  age:=0;
  head_pic_path:='';
  cert_audit_state:=0;
  sex:=0;
  user_type:=0;
  register_type:='';

  wx_auth_code:='';
  wx_union_id:='';
  wx_open_id:='';
  wx_auth_token:='';


  alipay_open_id:='';
  alipay_auth_token:='';

  apple_open_id:='';
  apple_auth_token:='';

  fb_auth_code:='';
  fb_open_id:='';
  fb_auth_token:='';
  tw_auth_code:='';
  tw_open_id:='';
  tw_auth_token:='';
  score:=0;
  is_deleted:=0;
  createtime:='';
  is_active:=0;

  second_contactor_name:='';
  second_contactor_phone:='';

  fastmsg_user_id:=0;

  followers_count:=0;
  friends_count:=0;
  published_news_count:=0;

  published_community_count:=0;
  published_group_count:=0;

end;

procedure TUser.AssignTo(Dest: TPersistent);
var
  DestObject:TUser;
begin

  DestObject:=TUser(Dest);
  DestObject.fid:=fid;
//  //DestObject.//Self.appid:=Self.appid;
  DestObject.email:=email;
  DestObject.phone:=phone;
//  DestObject.password:=password;
  DestObject.name:=name;
  DestObject.name_s:=name_s;
  DestObject.age:=age;
  DestObject.head_pic_path:=head_pic_path;
  DestObject.cert_audit_state:=cert_audit_state;
  DestObject.sex:=sex;
  DestObject.user_type:=user_type;
  DestObject.register_type:=register_type;


  DestObject.wx_auth_code:=wx_auth_code;
  DestObject.wx_union_id:=wx_union_id;
  DestObject.wx_open_id:=wx_open_id;
  DestObject.wx_auth_token:=wx_auth_token;


  DestObject.alipay_open_id:=alipay_open_id;
  DestObject.alipay_auth_token:=alipay_auth_token;

  DestObject.apple_open_id:=apple_open_id;
  DestObject.apple_auth_token:=apple_auth_token;



  DestObject.fb_auth_code:=fb_auth_code;
  DestObject.fb_open_id:=fb_open_id;
  DestObject.fb_auth_token:=fb_auth_token;
  DestObject.tw_auth_code:=tw_auth_code;
  DestObject.tw_open_id:=tw_open_id;
  DestObject.tw_auth_token:=tw_auth_token;
  DestObject.score:=score;
  DestObject.is_deleted:=is_deleted;
  DestObject.createtime:=createtime;
  DestObject.is_active:=is_active;

  DestObject.second_contactor_name:=second_contactor_name;
  DestObject.second_contactor_phone:=second_contactor_phone;


  DestObject.fastmsg_user_id:=fastmsg_user_id;


  DestObject.followers_count:=followers_count;
  DestObject.friends_count:=followers_count;
  DestObject.published_news_count:=followers_count;

  DestObject.published_community_count:=followers_count;
  DestObject.published_group_count:=published_group_count;



end;

constructor TUser.Create;
begin
  inherited;
  {$IFDEF INT_USER_FID}
  fid:='0';
  {$ENDIF}
end;

destructor TUser.Destroy;
begin
  inherited;
end;

//function TUser.GetArea: String;
//begin
//  Result:=Self.province+' '+Self.city+' '+Self.area;
//end;

function TUser.GetHeadPicUrl: String;
begin
//  if HeadPicPath='' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/UserHead/'+'default.png';
//  end
//  else
//  begin
//    Result:=ImageHttpServerUrl+ReplaceStr(Self.head_pic_path,'\','/');
//  end;

  Result:=GetImageUrl(head_pic_path,itUserHead);

//  Result:='';
//  if Self.head_pic_path<>'' then
//  begin
//      if (Pos('http:',LowerCase(head_pic_path))>0)
//        or (Pos('https:',LowerCase(head_pic_path))>0) then
//      begin
//          Result:=head_pic_path;
//      end
//      else
//      begin
//          Result:=ImageHttpServerUrl+'/'+ReplaceStr(Self.head_pic_path,'\','/');
//      end;
//  end
//  else
//  begin
//    if APPUserType=utRider then
//    begin
//      Result:=ImageHttpServerUrl+'/'+ReplaceStr('Upload\'+AppID+'\userhead_pic\Default_Pic\rider_pic.png','\','/');
//    end;
//
//    if APPUserType=utClient then
//    begin
//      Result:=ImageHttpServerUrl+'/'+ReplaceStr('Upload\'+AppID+'\userhead_pic\Default_Pic\user_pic.png','\','/');
//    end;
//
//    if APPUserType=utShop then
//    begin
//      Result:=ImageHttpServerUrl+'/'+ReplaceStr('Upload\'+AppID+'\userhead_pic\Default_Pic\user_pic.png','\','/');
//    end;
//  end;
end;

procedure LoadJsonFromFile(var AJson:ISuperObject;AFilePath: String);
var
  AStringStream:TStringStream;
begin
  if FileExists(AFilePath) then
  begin
    AStringStream:=TStringStream.Create('',TEncoding.UTF8);
    try
      AStringStream.LoadFromFile(AFilePath);
      AStringStream.Position:=0;

      AJson:=TSuperObject.Create(AStringStream.DataString);


    finally
      FreeAndNil(AStringStream);
    end;

  end;
end;

procedure LoadJsonArrayFromFile(var AJsonArray:ISuperArray;AFilePath: String);
var
  AStringStream:TStringStream;
begin
  if FileExists(AFilePath) then
  begin
    AStringStream:=TStringStream.Create('',TEncoding.UTF8);
    try
      AStringStream.LoadFromFile(AFilePath);
      AStringStream.Position:=0;

      AJsonArray:=TSuperArray.Create(AStringStream.DataString);


    finally
      FreeAndNil(AStringStream);
    end;

  end;
end;

function TUser.ParseFromJson(AJson: ISuperObject): Boolean;
begin
//  fid:=AJson.I['fid'];//2,
//  //Self.appid:=AJson.I['appid'];//1001,
//  phone:=AJson.S['phone'];//"18957901025",
//  name:=AJson.S['name'];//"ggggcexx",
//
//  province:=AJson.S['province'];//"",
//  city:=AJson.S['city'];//"",
//  area:=AJson.S['area'];//"",
//  phone_imei:=AJson.S['phone_imei'];//"",
//  phone_uuid:=AJson.S['phone_uuid'];//""
//  addr:=AJson.S['addr'];//"",
//  phone_type:=AJson.S['phone_type'];//"",
//  password:=AJson.S['password'];//"123456",
//  headpicpath:=AJson.S['headpicpath'];//"",
//  createtime:=AJson.S['createtime'];//"2017-07-12 16:08:54",
//  sex:=AJson.I['sex'];//"",
//
//  wx_union_id:=AJson.S['wx_union_id'];
//  wx_open_id:=AJson.S['wx_open_id'];
//  wx_auth_token:=AJson.S['wx_auth_token'];
//
//  alipay_open_id:=AJson.S['alipay_open_id'];
//  alipay_auth_token:=AJson.S['alipay_auth_token'];
//
//
//  apple_open_id:=AJson.S['apple_open_id'];//"",
//  apple_auth_token:=AJson.S['apple_auth_token'];//"",
//
//  score:=AJson.I['score'];
//
//  is_hotel_manager:=AJson.I['is_hotel_manager'];//"",
//  is_emp:=AJson.I['is_emp'];//"",
//  is_admin:=AJson.I['is_admin'];//"",
//  is_deleted:=AJson.I['is_deleted'];//"",
//  is_leave:=AJson.I['is_leave'];//"",
//
//  cert_audit_user_fid:=AJson.V['cert_audit_user_fid'];//0,
//  cert_audit_state:=AJson.I['cert_audit_state'];//0,
//  cert_audit_remark:=AJson.S['cert_audit_remark'];//"",
//  cert_audit_time:=AJson.S['cert_audit_time'];//"",
//
////  is_valid_manager:=AJson.I['is_valid_manager'];//"",
//  bind_introducer_fid:=AJson.I['bind_introducer_fid'];//2,
//  bind_introducer_name:=AJson.S['bind_introducer_name'];//"",
//  bind_introducer_phone:=AJson.S['bind_introducer_phone'];//"",
//
//  audit_user_fid:=AJson.V['audit_user_fid'];//1,
//  audit_state:=AJson.I['audit_state'];//1,
//  audit_remark:=AJson.S['audit_remark'];//"",
//  audit_time:=AJson.S['audit_time'];//"2017-07-13 07:12:40",
//
//  remark:=AJson.S['remark'];//"",
//  tel:=AJson.S['tel'];//"",
//
//  notice_unread_count:=AJson.I['notice_unread_count'];
//
//  region_fids:=AJson.S['region_fids'];//管辖区域fid
//  region_names:=AJson.S['region_names']; //管辖区域名称
  Json:=AJson;


  //wn
//  fid:=AJson.I['fid'];//64,
  if AJson.Contains('fid') then
  begin
    try
      {$IFDEF INT_USER_FID}
      //兼容旧版本
      fid:=IntToStr(AJson.I['fid']);//64,
      {$ELSE}
      fid:=AJson.V['fid'];//64,
      {$ENDIF}
    except
      //兼容旧版本
      fid:=IntToStr(AJson.I['fid']);//64,
    end;
  end;




//  //Self.appid:=AJson.I['appid'];//1002,
  email:=AJson.S['email'];//"",
  phone:=AJson.S['phone'];//"18957901025",
//  password:=AJson.S['password'];//"123456",
  name:=AJson.S['name'];//"用户王能",
  name_s:=AJson.S['name_s'];//"",
  isvip:=AJson.I['isvip'];//0,
  age:=AJson.I['age'];//0,
  head_pic_path:=AJson.S['head_pic_path'];//"",
  cert_audit_state:=AJson.I['cert_audit_state'];//0,
  sex:=AJson.I['sex'];//0,
  user_type:=AJson.I['user_type'];//0,
  register_type:=AJson.S['register_type'];//"phone_num",

//  birth:=AJson.S['birth'];
//  sign:= AJson.S['sign'];

  wx_auth_code:=AJson.S['wx_auth_code'];//"",
  wx_union_id:=AJson.S['wx_union_id'];//"",
  wx_open_id:=AJson.S['wx_open_id'];//"",
  wx_auth_token:=AJson.S['wx_auth_token'];//"",


  alipay_open_id:=AJson.S['alipay_open_id'];//"",
  alipay_auth_token:=AJson.S['alipay_auth_token'];//"",

  apple_open_id:=AJson.S['apple_open_id'];//"",
  apple_auth_token:=AJson.S['apple_auth_token'];//"",




  fb_auth_code:=AJson.S['fb_auth_code'];//"",
  fb_open_id:=AJson.S['fb_open_id'];//"",
  fb_auth_token:=AJson.S['fb_auth_token'];//"",
  tw_auth_code:=AJson.S['tw_auth_code'];//"",
  tw_open_id:=AJson.S['tw_open_id'];//"",
  tw_auth_token:=AJson.S['tw_auth_token'];//"",
  score:=AJson.F['score'];//0,
  is_deleted:=AJson.I['is_deleted'];//0,
  createtime:=AJson.S['createtime'];//"2018-03-29 09:57:27",
//  is_active:=AJson.I['is_active'];//0

  second_contactor_name:=AJson.S['second_contactor_name'];//0
  second_contactor_phone:=AJson.S['second_contactor_phone'];//0

  fastmsg_user_id:=AJson.I['fastmsg_user_id'];//0


  followers_count:=AJson.I['followers_count'];
  friends_count:=AJson.I['friends_count'];
  published_news_count:=AJson.I['published_news_count'];

  published_community_count:=AJson.I['published_community_count'];
  published_group_count:=AJson.I['published_group_count'];



end;

procedure SaveJsonToFile(AJson:ISuperObject;AFilePath: String);
var
  AStringStream:TStringStream;
begin
  if AJson<>nil then
  begin
    AStringStream:=TStringStream.Create('',TEncoding.UTF8);
    try
      AStringStream.WriteString(AJson.AsJSON);
      AStringStream.Position:=0;
      AStringStream.SaveToFile(AFilePath);
    finally
      FreeAndNil(AStringStream);
    end;
  end;
end;

procedure SaveJsonArrayToFile(AJsonArray:ISuperArray;AFilePath: String);
var
  AStringStream:TStringStream;
begin
  if AJsonArray<>nil then
  begin
    AStringStream:=TStringStream.Create('',TEncoding.UTF8);
    try
      AStringStream.WriteString(AJsonArray.AsJSON);
      AStringStream.Position:=0;
      AStringStream.SaveToFile(AFilePath);
    finally
      FreeAndNil(AStringStream);
    end;
  end;
end;



{ TBaseManager }


procedure TBaseManager.Load;
begin
  Self.LoadFromINI(uFileCommon.GetApplicationPath+'Config.ini');
end;

procedure TBaseManager.SaveLastLoginInfo;
begin
  ForceDirectories(GetUserLocalDir);
  SaveJsonToFile(Self.User.Json,GetUserLocalDir+'LastLoginInfo.json');
end;

procedure TBaseManager.SaveLastPosterInfo;
begin
  
end;

constructor TBaseManager.Create;
begin

  IsFirstStart:=True;
  User:=TUser.Create;

  GlobalBaseManager:=Self;

//
//  //授权中心的服务器,默认都是
//  CenterServerHost:='www.orangeui.cn';
//  CenterServerPort:=10020;


end;

function TBaseManager.CustomLoadFromINI(AIniFile: TIniFile): Boolean;
begin

end;

function TBaseManager.CustomSaveToINI(AIniFile: TIniFile): Boolean;
begin

end;

destructor TBaseManager.Destroy;
begin
  SysUtils.FreeAndNil(User);

  inherited;
end;

function TBaseManager.GetUserLocalDir: String;
begin
  //wn
//  Result:=uFileCommon.GetApplicationPath+IntToStr(Self.User.fid)+PathDelim;
  Result:=uFileCommon.GetApplicationPath+Self.User.fid+PathDelim;
end;

function TBaseManager.LoadFromINI(AINIFilePath: String): Boolean;
var
  AIniFile:TIniFile;
begin
//  Result:=False;

  AIniFile:=TIniFile.Create(AINIFilePath{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});

  //是否第一次启动
  Self.IsFirstStart:=AIniFile.ReadBool('','IsFirstStart',True);
  Self.IsShowedGuideFrame:=AIniFile.ReadBool('','IsShowedGuideFrame',False);

  //wn
  //上次登录的用户FID
//  Self.User.fid:=AIniFile.ReadInteger('','LastLoginUserFid',0);

  {$IFDEF INT_USER_FID}
  Self.User.fid:=AIniFile.ReadString('','LastLoginUserFid','0');
  {$ELSE}
  Self.User.fid:=AIniFile.ReadString('','LastLoginUserFid','');
  {$ENDIF}



//  Self.LastFastMsgUserID:=AIniFile.ReadInteger('','LastFastMsgUserID',0);


  //上次登录的用户名密码验证码
  Self.LastLoginUser:=AIniFile.ReadString('','LastLoginUser','');
  Self.LastLoginPass:=AIniFile.ReadString('','LastLoginPass','');


  //用户登录key
  Self.LastLoginKey:=AIniFile.ReadString('','LastLoginKey','');

  //用户的登录状态
  Self.IsLogin:=AIniFile.ReadBool('','IsLogin',False);

  //公告
  Self.LastNonce:=AIniFile.ReadString('','LastNonce','');

  Self.ServerHost:=AIniFile.ReadString('','ServerHost',ServerHost);
  Self.ServerPort:=AIniFile.ReadInteger('','ServerPort',ServerPort);


  Self.LangKind:=TLangKind(AIniFile.ReadInteger('','LangKind',Ord(LangKind)));


  //用户定位的经纬度
  Self.Longitude:=AIniFile.ReadFloat('','Longitude',0);
  Self.Latitude:=AIniFile.ReadFloat('','Latitude',0);
  //地址
  Self.Addr:=AIniFile.ReadString('','Addr',Self.Addr);
  Self.Province:=AIniFile.ReadString('','Province',Self.Province);
  Self.City:=AIniFile.ReadString('','City',Self.City);
  Self.Area:=AIniFile.ReadString('','Area',Self.Area);
  Self.RegionName:=AIniFile.ReadString('','RegionName',Self.RegionName);

  //自动播放视频
  Self.AutoPlayVideoOnWiFi:=AIniFile.ReadString('','AutoPlayVideoOnWiFi',Self.AutoPlayVideoOnWiFi);
  Self.AutoPlayVideoWithoutWiFi:=AIniFile.ReadString('','AutoPlayVideoWithoutWiFi',Self.AutoPlayVideoWithoutWiFi);


  Self.CompanyName:=AIniFile.ReadString('','CompanyName',Self.CompanyName);
  Self.CompanyID:=AIniFile.ReadString('','CompanyID',Self.CompanyID);
  if (AppID='') or GlobalIsNeedAPPIDSetting then
  begin
    AppID:=AIniFile.ReadString('','AppID',AppID);
  end;

  ClickCloseButtonAction:=AIniFile.ReadString('','ClickCloseButtonAction', '');

  CustomLoadFromINI(AIniFile);


  SysUtils.FreeAndNil(AIniFile);

  Result:=True;

end;

procedure TBaseManager.LoadUserConfig;
begin

  //最后一次登录的用户的部分信息
  if FileExists(GetUserLocalDir+'LastLoginInfo.json') then
  begin
    LoadJsonFromFile(User.Json,GetUserLocalDir+'LastLoginInfo.json');
    Self.User.ParseFromJson(User.Json);
//    TopRecentChatsJsonArrayStr:=User.Json.S['TopRecentChatsJsonArrayStr'];
  end;

end;

function TBaseManager.SaveToINI(AINIFilePath: String): Boolean;
var
  AIniFile:TIniFile;
begin
//  Result:=False;
  AIniFile:=TIniFile.Create(AINIFilePath{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});

  //是否第一次启动
  AIniFile.WriteBool('','IsFirstStart',Self.IsFirstStart);
  AIniFile.WriteBool('','IsShowedGuideFrame',Self.IsShowedGuideFrame);

  //wn
  //上次登录的用户FID
//  AIniFile.WriteInteger('','LastLoginUserFid',Self.User.fid);
  AIniFile.WriteString('','LastLoginUserFid',Self.User.fid);
//  AIniFile.WriteInteger('','LastFastMsgUserID',LastFastMsgUserID);



  //上次登录的用户名密码验证码
  AIniFile.WriteString('','LastLoginUser',Self.LastLoginUser);
  AIniFile.WriteString('','LastLoginPass',Self.LastLoginPass);

  //用户登录key,用
  AIniFile.WriteString('','LastLoginKey',Self.LastLoginKey);


  //广告
  AIniFile.WriteString('','LastNonce',Self.LastNonce);


  //用户的登录状态
  AIniFile.WriteBool('','IsLogin',Self.IsLogin);


  AIniFile.WriteString('','ServerHost',Self.ServerHost);
  AIniFile.WriteInteger('','ServerPort',Self.ServerPort);

  AIniFile.WriteInteger('','LangKind',Ord(Self.LangKind));


  //用户选择的经纬度
  AIniFile.WriteFloat('','Longitude',Self.Longitude);
  AIniFile.WriteFloat('','Latitude',Self.Latitude);
  //地址
  AIniFile.WriteString('','Addr',Self.Addr);
  AIniFile.WriteString('','Province',Self.Province);
  AIniFile.WriteString('','City',Self.City);
  AIniFile.WriteString('','Area',Self.Area);
  AIniFile.WriteString('','RegionName',Self.RegionName);

  //自动播放视频
  AIniFile.WriteString('','AutoPlayVideoOnWiFi',Self.AutoPlayVideoOnWiFi);
  AIniFile.WriteString('','AutoPlayVideoWithoutWiFi',Self.AutoPlayVideoWithoutWiFi);


  //公司名称
  AIniFile.WriteString('','CompanyName',Self.CompanyName);
  AIniFile.WriteString('','CompanyID',Self.CompanyID);
  AIniFile.WriteString('','AppID',AppID);

  AIniFile.WriteString('','ClickCloseButtonAction',Self.ClickCloseButtonAction);

  CustomSaveToINI(AIniFile);


  SysUtils.FreeAndNil(AIniFile);
  Result:=True;

end;

procedure TBaseManager.Save;
begin
  Self.SaveToINI(uFileCommon.GetApplicationPath+'Config.ini');
end;

procedure TBaseManager.SaveUserConfig;
begin

  ForceDirectories(GetUserLocalDir);

end;


{$ENDIF}



//initialization
//  {$IFDEF NZ}
//  GlobalCountryString:='NZ';
//  {$ELSE}
//  GlobalCountryString:='CN';
//  {$ENDIF}


end.



