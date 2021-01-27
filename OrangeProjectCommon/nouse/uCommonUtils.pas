//convert pas to utf8 by ¥
/// <summary>
///   <para>
///     公共函数,要求:客户端和服务端都能调用
///   </para>
///   <para>
///     Public function
///   </para>
/// </summary>
unit uCommonUtils;

interface


uses
  Classes,
  System.Types,
  StrUtils,
  Math,

  System.UITypes,
  SysUtils;







//隐藏手机号码(中国的手机号码,国外的不一样)
function HideMobPhone( num:string ):String;
//隐藏银行卡号
function HideBankCardNumber( num:string ):String;
//检测银行卡号是否合法
function checkBankCardNo(cardNo:String):Boolean;



//是否是合法的手机号码(中国的手机号码,新西兰的手机号码,02+6到8位数字))
function IsMobPhone( num:string ):boolean;

//是否是合法的身份证号码(中国的身份证号码,国外的不一样)
function ValidatePID(const APID: string): string;

//邮箱是否合法
function CheckEmail(email:String):Boolean;

//'$000000' 转 0
Function HexToInt(AHex:String):Integer;

implementation



//- (BOOL) checkCardNo:(NSString*) cardNo{
//    int oddsum = 0;     //奇数求和
//    int evensum = 0;    //偶数求和
//    int allsum = 0;
//    int cardNoLength = (int)[cardNo length];
//    int lastNum = [[cardNo substringFromIndex:cardNoLength-1] intValue];
//
//    cardNo = [cardNo substringToIndex:cardNoLength - 1];
//    for (int i = cardNoLength -1 ; i>=1;i--) {
//        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
//        int tmpVal = [tmpString intValue];
//        if (cardNoLength % 2 ==1 ) {
//            if((i % 2) == 0){
//                tmpVal *= 2;
//                if(tmpVal>=10)
//                    tmpVal -= 9;
//                evensum += tmpVal;
//            }else{
//                oddsum += tmpVal;
//            }
//        }else{
//            if((i % 2) == 1){
//                tmpVal *= 2;
//                if(tmpVal>=10)
//                    tmpVal -= 9;
//                evensum += tmpVal;
//            }else{
//                oddsum += tmpVal;
//            }
//        }
//    }
//
//    allsum = oddsum + evensum;
//    allsum += lastNum;
//    if((allsum % 10) == 0)
//        return YES;
//    else
//        return NO;
//}

function HexToInt(AHex: String): Integer;
var
  I: Integer;
  function Ncf(ANum, AF:Integer): Integer;
  var
    I: Integer;
  begin
    Result := 1;
    if AF = 0 then Exit;
    for I := 1 to AF do
      Result := Result * ANum;
  end;
  function HexCharToInt(HexToken: Char): Integer;
  begin
    if HexToken > #97 then
      HexToken := Chr(Ord(HexToken) - 32);
      Result := 0;
    if (HexToken > #47) and (HexToken < #58) then { chars 0....9 }
      Result := Ord(HexToken) - 48
    else if (HexToken > #64) and (HexToken < #71) then { chars A....F }
      Result := Ord(HexToken) - 65 + 10;
  end;
begin
  Result := 0;
  AHex := Ansiuppercase(Trim(AHex));
  if AHex = '' then Exit;
  for I := 1 to Length(AHex) do
  Result := Result + HexCharToInt(AHex[I]) * Ncf(16, Length(AHex) - I);
end;

function CheckEmail(email:String):Boolean;
begin
  Result:=False;

  if (pos('@',email)>1) and (pos('.',email)>(pos('@',email)+1)) then
  begin
    Result:=True;
  end
  else
  begin
    Result:=False;
  end;


end;

function checkBankCardNo(cardNo:String):Boolean;
var
  oddsum:Integer;
  evensum:Integer;
  allsum:Integer;
  cardNoLength:Integer;
  lastNum:Integer;
  I:Integer;
  tmpVal:Integer;
begin
  Result:=False;

  {$IFDEF NZ}
  Result:=True;
  {$ELSE}
  cardNo:=Trim(cardNo);

  oddsum := 0;     //奇数求和
  evensum := 0;    //偶数求和
  allsum := 0;
  cardNoLength := Length(cardNo);

  if TryStrToInt(cardNo[High(cardNo)],lastNum) then
  begin

      cardNo := Copy(cardNo,1,cardNoLength-1);
      for I := cardNoLength-1 downto 1 do
      begin
          tmpVal:=StrToInt(cardNo[I-1+Low(cardNo)]);
          if (cardNoLength mod 2 =1 ) then
          begin
              if((I mod 2) = 0) then
              begin
                tmpVal := tmpVal*2;
                  if(tmpVal>=10) then
                      tmpVal := tmpVal-9;
                  evensum := evensum+tmpVal;
              end
              else
              begin
                  oddsum := oddsum+tmpVal;
              end;
          end
          else
          begin
              if ((i mod 2) = 1) then
              begin
                  tmpVal := tmpVal*2;
                  if(tmpVal>=10) then
                      tmpVal := tmpVal-9;
                  evensum := evensum+tmpVal;
              end
              else
              begin
                  oddsum := oddsum+tmpVal;
              end;
          end;
      end;


      allsum := oddsum + evensum;
      allsum := allsum + lastNum;
      if((allsum mod 10) = 0) then
          Result:= True
      else
          Result:= False;

  end;

  {$ENDIF}

end;

function HideMobPhone( num:string ):String;
begin
  result:=Copy(num,1,3)+'****'+Copy(num,8,4);
end;

function HideBankCardNumber( num:string ):String;
var
  I: Integer;
begin
  Result:=num;
  for I := Low(num) to High(num)-4 do
  begin
    Result[I]:='*';
  end;
end;


function IsMobPhone( num:string ):boolean;
//const
//  cChinaMobile: string // 移动号码
//    = '(134(?<=134)|135(?<=135)|136(?<=136)|137(?<=137)|138(?<=138)|139(?<=139)'
//    + '|147(?<=147)|150(?<=150)|151(?<=151)|152(?<=152)|157(?<=157)|158(?<=158)'
//    + '|159(?<=159)|182(?<=182)|183(?<=183)|184(?<=184)|187(?<=187)|188(?<=188)'
//    + '|178(?<=178))\d{8}\b';
//  cChinaUnicom: string // 联通号码
//    = '(130(?<=130)|131(?<=131)|132(?<=132)|145(?<=145)|155(?<=155)|156(?<=156)'
//    + '|185(?<=185)|186(?<=186)|176(?<=176))\d{8}\b';
//  cChinaTelecom: string // 电信号码
//    = '(133(?<=133)|153(?<=153)|180(?<=180)|181(?<=181)|189(?<=189)|177(?<=177)'
//    + ')\d{8}\b';
//  cChinaPhone: string // 有效号码
//    = '(13(?<=13)|14(?<=14)|15(?<=15)|17(?<=17)|18(?<=18))\d{9}\b';
var
  I: Integer;
begin
  Result:=False;

  {$IFDEF NZ}
  //022不同公司的号码
  //022 424594
  //022 4245948
  //022 42459483
  //新西兰的手机号，
  //除了公司前缀(022,021,027等三位数），
  //后面位数有六位数的也有七位数的。

  //新西兰的电话号码
  //区号+电话号码,09是奥克兰区
  //09 4782428
  //06 4245948
  if (length(num)<8) or (length(num)>11) then Exit;

  //首位必须是0
  if (copy(num,1,1)<>'0') then Exit;


//  //手机号,第一位必须是2
//  if (copy(num,2,1)<>'2') then Exit;


  for I := Low(num) to High(num) do
  begin
    if Not ((num[I]>='0') and (num[I]<='9')) then
    begin
      Result:=False;
      Break;
    end
    else
    begin
      Result:=True;
    end;
  end;

  {$ELSE}

  //判断座机号码  区号3-4位 号码7-8位  010-1234567   横杠可能有可能没有
  //0开头 区号3位-号码7位  10或11   区号4位-号码8位  12或13

  //判断是否是11位手机号
  if (length(num)<>11)
  //座机号  横杠占一位
  and (length(num)<>10)
  and (length(num)<>12)
  and (length(num)<>13) then Exit;

  //手机号码首位必须是1     座机 010-1234567  11位
  if (length(num)=11) and (Trim(num).IndexOf('-')<0) then
  begin
    if (copy(num,1,1)<>'1') then Exit;
    //第二位是3,4,5,7,8,9
    if (copy(num,2,1)='1')
      or (copy(num,2,1)='2')
      or (copy(num,2,1)='6')
//      or (copy(num,2,1)='9')
      or (copy(num,2,1)='0') then Exit;
  end
  else
  begin
    //座机号码首位必须是0
    if (copy(num,1,1)<>'0') then Exit;
    //有横杠
    if Trim(num).IndexOf('-')>0 then
    begin
      //区号3-4位   总长度 11 或 13位
      if (length(copy(Trim(num),0,Trim(num).IndexOf('-')))<>3)
      and (length(copy(Trim(num),0,Trim(num).IndexOf('-')))<>4) then Exit;

      if (length(num)<>11) and (length(num)<>13) then Exit;
    end
    else
    begin
      //总长度  10 或 12位
      if (length(num)<>10) and (length(num)<>12) then Exit;
    end;
  end;

  for I := Low(num) to High(num) do
  begin
    if (Not ((num[I]>='0') and (num[I]<='9')))
    and (Not (num[I]='-')) then
    begin
      Result:=False;
      Break;
    end
    else
    begin
      Result:=True;
    end;
  end;
  {$ENDIF NZ}
end;

function ValidatePID(const APID: string): string;
  {内部函数,取身份证号校验位,最后一位,对18位有效}
  function GetVerifyBit(sIdentityNum: string): Char;
  var
    nNum: Integer;
  begin
    Result := #0;
    nNum := StrToInt(sIdentityNum[Low(sIdentityNum)-1+1]) * 7 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+2]) * 9 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+3]) * 10 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+4]) * 5 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+5]) * 8 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+6]) * 4 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+7]) * 2 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+8]) * 1 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+9]) * 6 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+10]) * 3 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+11]) * 7 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+12]) * 9 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+13]) * 10 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+14]) * 5 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+15]) * 8 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+16]) * 4 +
            StrToInt(sIdentityNum[Low(sIdentityNum)-1+17]) * 2;


    nNum := nNum mod 11;
    case nNum of
      0: Result := '1';
      1: Result := '0';
      2: Result := 'X';
      3: Result := '9';
      4: Result := '8';
      5: Result := '7';
      6: Result := '6';
      7: Result := '5';
      8: Result := '4';
      9: Result := '3';
      10: Result := '2';
    end;
  end;
var
  L : Integer;
  sCentury : string;
  sYear2Bit : string;
  sMonth : string;
  sDate : string;
  iCentury : Integer;
  iMonth : Integer;
  iDate : Integer;
  CRCFact : string;//18位证号的实际值
  CRCTh : string; //18位证号的理论值
  FebDayAmt: Byte;//2月天数
begin
  L := Length(APID);
  if (L in [15, 18]) = False then
  begin
//     Result := Format('身份证号不是15位或18位(%0:s, 实际位数:%1:d)', [APID, L]);
     Result := '身份证号不是15位或18位!';
     Exit;
  end;
  CRCFact := '';
  if L = 18 then
  begin
     sCentury := Copy(APID, 7, 2);
     iCentury := StrToInt(sCentury);
     if (iCentury in [18..20]) = False then
     begin
//        Result := Format('身份证号码无效:18位证号的年份前两位必须在18-20之间(%0:S)', [sCentury]);
        Result := '身份证号码无效!';
        Exit;
     end;
     sYear2Bit := Copy(APID, 9, 2);
     sMonth := Copy(APID, 11, 2);
     sDate := Copy(APID, 13, 2);
     CRCFact := Copy(APID, 18, 1);
  end else
  begin
     sCentury := '19';
     sYear2Bit := Copy(APID, 7, 2);
     sMonth := Copy(APID, 9, 2);
     sDate := Copy(APID, 11, 2);
  end;
  iMonth := StrToInt(sMonth);
  iDate := StrToInt(sDate);
  if (iMonth in [01..12]) = False then
  begin
//     Result := Format('身份证号码无效:月份必须在01-12之间(%0:s)', [sMonth]);
     Result := '身份证号码无效!';
     Exit;
  end;
  if (iMonth in [1, 3, 5, 7, 8, 10, 12]) then
  begin
     if (iDate in [01..31]) = False then
     begin
//        Result := Format('身份证号码无效:日期无效,不能为零或超出当月最大值(%0:s)', [sDate]);
        Result := '身份证号码无效!';
        Exit;
     end;
  end;
  if (iMonth in [4, 6, 9, 11]) then
  begin
     if (iDate in [01..30]) = False then
     begin
//        Result := Format('身份证号码无效:日期无效,不能为零或超出当月最大值(%0:s)', [sDate]);
        Result := '身份证号码无效!';
        Exit;
     end;
  end;
  if IsLeapYear(StrToInt(sCentury + sYear2Bit)) = True then
  begin
     FebDayAmt := 29;
  end else
  begin
     FebDayAmt := 28;
  end;
  if (iMonth in [2]) then
  begin
     if (iDate in [01..FebDayAmt]) = False then
     begin
//        Result := Format('身份证号码无效:日期无效,不能为零或超出当月最大值(%0:s)', [sDate]);
        Result := '身份证号码无效!';
        Exit;
     end;
  end;
  if CRCFact <> '' then
  begin
     CRCTh := GetVerifyBit(APID);
     if CRCFact <> CRCTh then
     begin
//        Result := Format('身份证号码无效:校验位(第18位)错:(%0:s)', [APID]);
        Result := '身份证号码无效!';
        Exit;
     end;
  end;
end;
end.




