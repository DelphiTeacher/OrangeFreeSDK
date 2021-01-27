unit uCaptcha;

interface

uses
  SysUtils,
  Math;

//const
//  //验证码类型
//  //注册的验证码
//  Const_CaptchaType_Register='register';
//  //登录的验证码
//  Const_CaptchaType_Login='login';
//  //忘记密码的验证码
//  Const_CaptchaType_ForgetPassword='forget_password';
//  //更换手机号的验证码
//  Const_CaptchaType_ChangePhoneNum='change_phone_num';
//  //绑定手机号的验证码
//  Const_CaptchaType_BindPhoneNum='bind_phone_num';
//  //短信群发的验证码
//  Const_CaptchaType_BatchSend='batch_send';
//

////生成验证码,四位
//function GenerateCaptcha:String;
//
//function GetRandStr(len : Integer;
//                    lowercase : Boolean = True;
//                    num : Boolean = True;
//                    uppercase : Boolean = False) : string;
//

implementation


//
//function GetRandStr(len : Integer;
//                    lowercase : Boolean = True;
//                    num : Boolean = True;
//                    uppercase : Boolean = False) : string;
//const
//  upperStr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
//  lowerStr = 'abcdefghijklmnopqrstuvwxyz';
//  numStr = '0123456789';
//var
//  sourceStr : string;
//  i : Integer;
//begin
//  sourceStr := '';
//  Result := '';
//  if uppercase = True then
//    sourceStr := sourceStr + upperStr;
//  if lowercase = True then
//    sourceStr := sourceStr + lowerStr;
//  if num = True then
//    sourceStr := sourceStr + numStr;
//  if (sourceStr = '') or (len<1) then
//    exit;
//
//  Randomize;
//  for i:=1 to len do
//  begin
//    Result := Result + sourceStr[Random(Length(sourceStr)-1)+1];
//  end;
//end;
//
//
//
//function GenerateCaptcha:String;
//begin
//  Result:=IntToStr(Math.RandomRange(0,9))
//           +IntToStr(Math.RandomRange(0,9))
//           +IntToStr(Math.RandomRange(0,9))
//           +IntToStr(Math.RandomRange(0,9));
//end;





end.
