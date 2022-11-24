//convert pas to utf8 by ¥
//开放平台App的界面设置


unit uOpenUISetting;

interface


uses
  Classes,

  {$IFDEF ANDROID}
  Androidapi.Helpers,
  Androidapi.JNI.Os,
  uAndroidPermission_D10_2,
  {$ENDIF ANDROID}
  uOpenCommon,
  UITypes,

  SysUtils;

//type
//  TLoginButtonsStyle=(lbsButton,lbsListView);

var
  //主窗体MainForm
  //APP是否需要定位功能,默认为True,现在改用工程编译指令HAS_GPSLOCATION
  //GlobalIsNeedGPSLocation:Boolean;


//  GlobalLoginButtonsStyle:TLoginButtonsStyle;

  //登陆页面LoginFrame
  //默认是外卖的
  //初始在这里,要改的话,在各自项目的MainForm中改
  //是否启用微信登录
  GlobalIsEnabledWeichatLogin:Boolean;
  //是否启用支付宝登录
  GlobalIsEnabledAlipayLogin:Boolean;
  //是否启用苹果登录
  GlobalIsEnabledAppleLogin:Boolean;
  //是否启用QQ登录
  GlobalIsEnabledQQLogin:Boolean;
  //是否启用Facebook登录
  GlobalIsEnabledFacebookLogin:Boolean;
  //是否启用Twitter登录
  GlobalIsEnabledTwitterLogin:Boolean;
  //是否启用手机号密码登录
  GlobalIsEnabledPhonePasswordLogin:Boolean;
  //是否启用手机号验证码登录
  GlobalIsEnabledPhoneCaptchaLogin:Boolean;




  //三方登录需要完善手机号
  GlobalIsThirdPartyNeedPhone:Boolean;

  //当前是否是谷歌专版
  GlobalIsGooglePlayVersion:Boolean;

  //是否需要登陆,有些APP直接就登陆了,不需要登陆界面
  GlobalIsNeedLoginThenShowMainFrame:Boolean;

  //是否需要获取应用信息,哪些APP不需要?
  GlobalIsNeedGetAppInfo:Boolean;


  //设置页面是否需要客服电话
  GlobalIsNeedServiceTel:Boolean;
  //登录页面是否需要注册按钮
  GlobalIsNeedRegister:Boolean;
  //登录页面是否需要忘记密码按钮
  GlobalIsNeedForgetPassword:Boolean;
  //登录页面是否需要服务器设置按钮
  GlobalIsNeedServerSetting:Boolean;


  //是否需要平台商城分页
  GlobalIsNeedPlatformShopPage:Boolean;



  //IOS任务栏字体的颜色,默认为白色
//  GlobalIOSStatusBarFontColor:TAlphaColor;


  //Android是否透明任务栏,默认为True,那么pnlToolbar需要拉高25个像素
  GlobalIsAndroidTransparentToolbar:Boolean;




//  //通知分类列表的Json数组
//  GlobalNoticeClassifyNameListStr:String;
//  GlobalNoticeClassifyCaptionListStr:String;




//  //Windows下当前的版本
//  CurrentVersion:String;//='1.0.9';



var
  AIndex:Integer;
  //Android所需要的权限
  Const_Android_RequestPermissions:TArray<string>;



implementation






initialization
  {$IFDEF ANDROID}
  {$IF RTLVersion>=32}// 10.2+
  SetLength(Const_Android_RequestPermissions,6);
  AIndex:=0;
  //读取存储
  Const_Android_RequestPermissions[AIndex]:=JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  //写存储
  Inc(AIndex);
  Const_Android_RequestPermissions[AIndex]:=JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
  //拍照
  Inc(AIndex);
  Const_Android_RequestPermissions[AIndex]:=JStringToString(TJManifest_permission.JavaClass.CAMERA);
  //定位
  Inc(AIndex);
  Const_Android_RequestPermissions[AIndex]:=JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION);
  Inc(AIndex);
  Const_Android_RequestPermissions[AIndex]:=JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);
  //震动,小米推送需要使用
  Inc(AIndex);
  Const_Android_RequestPermissions[AIndex]:=JStringToString(TJManifest_permission.JavaClass.VIBRATE);
  {$ENDIF}
  {$ENDIF ANDROID}





  //默认是外卖的
  //初始在这里,要改的话,在各自项目的MainForm中改


  //默认值
  //启动定位
  //GlobalIsNeedGPSLocation:=True;




  //是否启用微信登录
  GlobalIsEnabledWeichatLogin:=False;
  //是否启用支付宝登录
  GlobalIsEnabledAlipayLogin:=False;
  //是否启用苹果登录
  GlobalIsEnabledAppleLogin:=False;
  //是否启用QQ登录
  GlobalIsEnabledQQLogin:=False;//True;
  //是否启用Facebook登录
  GlobalIsEnabledFacebookLogin:=False;//True;
  //是否启用Twitter登录
  GlobalIsEnabledTwitterLogin:=False;//True;
  //是否启用手机号密码登录
  GlobalIsEnabledPhonePasswordLogin:=False;
  //是否启用手机号验证码登录
  GlobalIsEnabledPhoneCaptchaLogin:=False;





  //是否需要调用get_app_info接口
  GlobalIsNeedGetAppInfo:=True;

  //是否需要客服电话
  GlobalIsNeedServiceTel:=True;


  GlobalIsNeedRegister:=True;
  GlobalIsNeedForgetPassword:=True;

  //登录页面是否需要服务器设置按钮
  GlobalIsNeedServerSetting:=False;


  //IOS下状态栏的字体颜色
//  GlobalIOSStatusBarFontColor:=TAlphaColorRec.White;

  GlobalIsAndroidTransparentToolbar:=True;



end.
