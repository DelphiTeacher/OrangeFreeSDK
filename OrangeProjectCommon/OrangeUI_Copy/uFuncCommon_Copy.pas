//convert pas to utf8 by ¥
/// <summary>
///   <para>
///     公共函数
///   </para>
///   <para>
///     Public function
///   </para>
/// </summary>
unit uFuncCommon_Copy;

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


//不能引用FMX.等单元,不然在Android服务中不能使用会卡死
//可以在Android服务中使用
uses
  Classes,
  Types,
  StrUtils,
  Math,
  RTLConsts,

  XMLDoc,
  XMLIntf,

  {$IFDEF MSWINDOWS}
  Windows,
  {$ENDIF}
  {$IFDEF ANDROID}
  Androidapi.IOUtils,
  Androidapi.Helpers,
  Androidapi.JNI.Util,
  {$ENDIF}
  {$IFDEF _MACOS}
  Macapi.Mach,
  {$ENDIF}
  {$IFDEF IOS}
  FMX.Helpers.iOS,
  {$ENDIF}


  DateUtils,
  SysUtils;





const
  //缩略图的前缀
  Const_ThumbPrefix='thumb_';


const
//<<<<<<< .mine
  //双精度比较误差,必须是0.001啊,因为金额中通常是保留两位小位的,如果会导致0.02,0.03是相等的
  Precision:Double=0.001;
//||||||| .r11335
//  //双精度比较误差
//  Precision:Double=0.01;
//=======
//  //2019-03-06改成300*300
////  MaxWidth = 500 ;
////  MaxHigth = 500 ;
//  MaxWidth = 300 ;
//  MaxHigth = 300 ;
//
//
//const
//  //双精度比较误差
//  Precision:Double=0.01;
//>>>>>>> .r11835

type
  TVariantDynArray=array of Variant;
  TStringDynArray=array of String;





/// <summary>
///   <para>
///     增加引用
///   </para>
///   <para>
///     Add refrence
///   </para>
/// </summary>
procedure ObjAddRef(Obj:TObject);

/// <summary>
///   <para>
///     减少引用
///   </para>
///   <para>
///     Reduce refrence
///   </para>
/// </summary>
procedure ObjRelease(Obj:TObject);

//释放
//释放
{$IF CompilerVersion<=33.0}
procedure FreeAndNil(var Obj);
{$ELSE}
procedure FreeAndNil(const [ref] Obj:TObject);
{$IFEND}




/// <summary>
///   标准日期格式转换
///   <para>
///     Standard date convert
///   </para>
/// </summary>
function StandardDateToStr(Const ADateTime:TDateTime):String;
function StdDateToStr(Const ADateTime:TDateTime):String;
/// <summary>
///   标准日期格式转换
///    <para>
///     Standard date convert
///   </para>
/// </summary>
function StandardStrToDateTime(Const Str:String):TDateTime;
function StdStrToDateTime(Const Str:String):TDateTime;

function StandardStrToDate(Const Str:String):TDateTime;
function StdStrToDate(Const Str:String):TDateTime;

//'2018-08-30 14:26:44'转换成'2018-08-30'
function StdStrToDateStr(Const Str:String):String;
/// <summary>
///   标准日期格式转换
///     <para>
///     Standard date convert
///   </para>
/// </summary>
function StandardDateTimeToStr(Const ADateTime:TDateTime):String;
function StdDateTimeToStr(Const ADateTime:TDateTime):String;



/// <summary>
///   <para>
///     获取CPU时间
///   </para>
///   <para>
///     Get tick time of CPU
///   </para>
/// </summary>
function UIGetTickCount: LongWord;



/// <summary>
///   <para>
///     创建GUID字符串
///   </para>
///   <para>
///     Create GUID string
///   </para>
/// </summary>
function CreateGUIDString:String;
/// <summary>
///   <para>
///     创建GUID字符串(带分隔符-)
///   </para>
///   <para>
///     Create GUID string
///   </para>
/// </summary>
function CreateGUIDStringHasDevide:String;



//Double类型比较
function BiggerDouble(A,B:Double):Boolean;
function SmallerDouble(A,B:Double):Boolean;
function BiggerEqualDouble(A,B:Double):Boolean;
function SmallerEqualDouble(A,B:Double):Boolean;
function IsSameDouble(A,B:Double):Boolean;
function IsNotSameDouble(A,B:Double):Boolean;
function EqualDouble(A,B:Double):Boolean;
function NotEqualDouble(A,B:Double):Boolean;
function LowStr(AStr:String):Integer;
function HighStr(AStr:String):Integer;

//将点分字符串转换为数组
function GetStringArray(ACommaText:String):TStringDynArray;
function GetStringListArray(AStringList:TStringList):TStringDynArray;
//获取字符串列表Name的数组
function GetStringListNameArray(AStringList:TStringList):TStringDynArray;
//获取字符串列表Value的数组
function GetStringListValueArray(AStringList:TStringList):TStringDynArray;
//释放绑在StringList中的对象
procedure FreeStringListObjects(AStringList:TStringList);


function FindInArray(AStr:String;AArray:Array of String):Integer;
procedure CopyStringArray(var ASrcArray,ADestArray:Array of String);
procedure CopyVariantArray(var ASrcArray,ADestArray:Array of Variant);
function AddStrToArray(AArray:Array of String;AStr:String):TStringDynArray;
function AddValueToArray(AValues:Array of Variant;AValue:Variant):TVariantDynArray;
//procedure AddStrToArray(var AArray:TStringDynArray;AStr:String);//:TStringDynArray;
//procedure AddValueToArray(var AValues:TVariantDynArray;AValue:Variant);//:TVariantDynArray;
function ConvertToStringDynArray(AArray:Array of String):TStringDynArray;
function ConvertToVariantDynArray(AVariants:Array of Variant):TVariantDynArray;
//function ConvertToStringArray(AArray:Array of String):Array of String;
//function ConvertToVariantArray(AVariants:Array of Variant):TVariantDynArray;


function SaveStringToFile(AString:String;AFilePath:String{$IF CompilerVersion >= 21.0};AEncoding:TEncoding{$IFEND}):Boolean;
function GetStringFromFile(AFilePath:String{$IF CompilerVersion >= 21.0};AEncoding:TEncoding{$IFEND}):String;
{$IF CompilerVersion >= 30.0}
//比2007高的版本
function GetStringFromTextFile(AFilePath:String):String;
{$IFEND}



//生成验证码,四位
function GenerateCaptcha:String;
function GenerateCaptcha_5:String;
function GenerateCaptcha_6:String;

function GetRandStr(len : Integer;
                    lowercase : Boolean = True;
                    num : Boolean = True;
                    uppercase : Boolean = False) : string;
//获取系统
function GetOS:String;


//秒
//将北京时间转换成UTC的时间戳
function timeIntervalSince1970(Const ADateTime:TDateTime):Int64;
function timeMillionSecondsIntervalSince1970(Const ADateTime:TDateTime):Int64;
//将UTC时间戳转换成北京时间
function timeSince1970Interval(Const AInterval:Int64):TDateTime;
function timeSince1970MillionSecondsInterval(Const AMillionSecondsInterval:Int64):TDateTime;
function GetTimeHowLong(ADateTime:TDateTime):String;

//function SystemNow:TDateTime;
//function GetSystemTimeStamp:Int64;



function GetThumbFilePrefix(const AIsThumb:Boolean): String;


//字符串下标从0开始
function NewDelphiSubString(AStr:String;AIndex_StartWith0:Integer;ALength:Integer):String;
function NewDelphiStringIndexOfName(ASubStr,AStr:String):Integer;overload;
function NewDelphiStringIndexOf(ASubStr,AStr:String):Boolean;overload;


//隐藏手机号码(中国的手机号码,国外的不一样)
function HideMobPhone( num:string ):String;
//隐藏银行卡号
function HideBankCardNumber( num:string ):String;
//检测银行卡号是否合法
function checkBankCardNo(cardNo:String):Boolean;


{$IF CompilerVersion >= 30.0}
//比D2007高的版本
//是否是合法的手机号码(中国的手机号码,新西兰的手机号码,02+6到8位数字))
function IsMobPhone( num:string ):boolean;
//是否是虚拟手机号
function IsVirtualMobPhone( num:string ):boolean;

//是否是合法的身份证号码(中国的身份证号码,国外的不一样)
function ValidatePID(const APID: string): string;
{$IFEND}



//邮箱是否合法
function CheckEmail(email:String):Boolean;

//'$000000' 转 0
Function HexToInt(AHex:String):Integer;

function IsPadDevice:Boolean;

//设置聊天时间显示
function SettingChatTime(ADateTime:TDateTime;AIsRecentChat:Boolean):String;
function GetUniqueAndroidStartActivityForRequestCode(ARequestName:String;ABaseIndex:Integer=1000):Integer;

function IsVideoFile(AFilePath:String):Boolean;

function ExtractFileNameNoExt(AFilePath:String):String;



//根据节点名找到最后一个节点下标,
//用于布署文件时,添加子节点在此节点下面
function FindLastChildXMLNodeIndex(ANodeName:String;
                                    AXMLNode: IXMLNode):Integer;overload;
function FindChildXMLNode(ANodeName:String;
                               AXMLNode: IXMLNode):Integer;
function FindChildXMLNodeIndex(ANodeName:String;
                               ANodeText:String;
                               AXMLNode: IXMLNode):Integer;
function FindChildXMLNodeIndexByAttr(ANodeAttrName:String;
                               ANodeAttrValue:String;
                               AXMLNode: IXMLNode):Integer;
function FindKeyValueNode(ADictNode: IXMLNode;AKey:String):IXMLNode;
//根据节点的name来判断是否存在
function FindSameAndroidResourceNode(AXMLNode: IXMLNode;ANeedFindXMLNode:IXMLNode): IXMLNode;
//复制子节点
procedure CopyXMLNode(ASrcNode:IXMLNode;ADestNode:IXMLNode);



var
  GlobalStandardFmtSettings: TFormatSettings;

  AndroidStartActivityForRequestCodes:TStringList;



implementation


function FindLastChildXMLNodeIndex(ANodeName: String;AXMLNode: IXMLNode): Integer;
var
  I: Integer;
begin
  Result:=-1;

  for I := 0 to AXMLNode.ChildNodes.Count-1 do
  begin
      if (AXMLNode.ChildNodes[I].NodeName=ANodeName) then
      begin
          Result:=I;
      end;
  end;

end;

function FindChildXMLNodeIndex(ANodeName:String;
                               ANodeText:String;
                               AXMLNode: IXMLNode):Integer;
var
  I: Integer;
begin
  Result:=-1;

  for I := 0 to AXMLNode.ChildNodes.Count-1 do
  begin
      if (AXMLNode.ChildNodes[I].NodeName=ANodeName)
        and (AXMLNode.ChildNodes[I].Text=ANodeText) then
      begin
          Result:=I;
          Break;
      end;
  end;
end;

function FindChildXMLNode(ANodeName:String;
                               AXMLNode: IXMLNode):Integer;
var
  I: Integer;
begin
  Result:=-1;

  for I := 0 to AXMLNode.ChildNodes.Count-1 do
  begin
      if (AXMLNode.ChildNodes[I].NodeName=ANodeName) then
      begin
          Result:=I;
          Break;
      end;
  end;
end;

function FindChildXMLNodeIndexByAttr(ANodeAttrName:String;
                                     ANodeAttrValue:String;
                                     AXMLNode: IXMLNode):Integer;
var
  I: Integer;
begin
  Result:=-1;

  for I := 0 to AXMLNode.ChildNodes.Count-1 do
  begin
      if AXMLNode.ChildNodes[I].HasAttribute(ANodeAttrName)
        and
        (AXMLNode.ChildNodes[I].Attributes[ANodeAttrName]=ANodeAttrValue) then
      begin
          Result:=I;
          Break;
      end;
  end;
end;

function FindKeyValueNode(ADictNode: IXMLNode;AKey:String):IXMLNode;
var
  AFindNodeIndex:Integer;
begin
  Result:=nil;

  AFindNodeIndex:=FindChildXMLNodeIndex('key',AKey,ADictNode);
  if (AFindNodeIndex<>-1) and (AFindNodeIndex+1<ADictNode.ChildNodes.Count) then
  begin
      Result:=ADictNode.ChildNodes[AFindNodeIndex+1];
  end;
end;

procedure CopyXMLNode(ASrcNode:IXMLNode;ADestNode:IXMLNode);
var
  I: Integer;
  AChildNode:IXMLNode;
begin
  if ASrcNode.IsTextElement then
  begin
    ADestNode.Text:=ASrcNode.Text;
  end
  else
  begin
      //只复制子节点
      for I := 0 to ASrcNode.ChildNodes.Count-1 do
      begin
        AChildNode:=ADestNode.AddChild(ASrcNode.ChildNodes[I].NodeName);
        if ASrcNode.ChildNodes[I].IsTextElement then
        begin
          AChildNode.Text:=ASrcNode.ChildNodes[I].Text;
        end
        else
        begin
          CopyXMLNode(ASrcNode.ChildNodes[I],AChildNode);
        end;
      end;
  end;
end;

function FindSameAndroidResourceNode(AXMLNode: IXMLNode;ANeedFindXMLNode:IXMLNode): IXMLNode;
var
  I:Integer;
begin
  Result:=nil;

  for I := 0 to AXMLNode.ChildNodes.Count-1 do
  begin
      if (AXMLNode.ChildNodes[I].NodeName=ANeedFindXMLNode.NodeName)

        //values.xml
        and (
              ANeedFindXMLNode.HasAttribute('name')
              and AXMLNode.ChildNodes[I].HasAttribute('name')
              and (AXMLNode.ChildNodes[I].Attributes['name']=ANeedFindXMLNode.Attributes['name'])
              )
       then
      begin
          Result:=AXMLNode.ChildNodes[I];
          Break;
      end;
  end;



//  if AXMLNode=nil then
//  begin
//      //不存在此名称的
//      //直接复制
//      Exit;
//  end
//  else
//  begin
//      //存在重名的,但是Attribute可能不一样
//      if ANeedFindXMLNode.HasAttribute('name')
//        and (FindSameNameButDiffAttrNode(ANeedFindXMLNode.NodeName,
//                                      'name',
//                                      ANeedFindXMLNode.Attributes['name'],
//                                      AXMLNode)=nil)
//                                      then
//      begin
//        //不相同,复制
//        ADestXMLNode.ChildNodes.Add(AXMLNode);
//      end;
//
//
//  end;

end;



function ExtractFileNameNoExt(AFilePath:String):String;
var
  AConfigFileExt:String;
begin
  Result:=ExtractFileName(AFilePath);
  AConfigFileExt:=ExtractFileExt(Result);
  Result:=Copy(Result,1,Length(Result)-Length(AConfigFileExt));
end;

function IsVideoFile(AFilePath:String):Boolean;
var
  AFileExt:String;
begin
  Result:=False;
  AFileExt:=LowerCase(ExtractFileExt(AFilePath));
  if AFileExt='.mp4' then
  begin
    Result:=True;
  end;
end;


function GetUniqueAndroidStartActivityForRequestCode(ARequestName:String;ABaseIndex:Integer):Integer;
var
  AIndex:Integer;
begin

  AIndex:=AndroidStartActivityForRequestCodes.IndexOf(ARequestName);
  if AIndex<>-1 then
  begin
    //存在
    Result:=StrToInt(AndroidStartActivityForRequestCodes[AIndex+1]);
    Exit;
  end;

  Result:=ABaseIndex;
  if AndroidStartActivityForRequestCodes.Count>0 then
  begin
    Result:=StrToInt(AndroidStartActivityForRequestCodes[AndroidStartActivityForRequestCodes.Count-1]);
  end;
  Result:=Result+1;
  AndroidStartActivityForRequestCodes.Add(ARequestName);
  AndroidStartActivityForRequestCodes.Add(IntToStr(Result));
end;


{$IF CompilerVersion < 21.0}
//D7,D2007
function High(AStr:String):Integer;
begin
  Result:=Length(AStr);
end;
function Low(AStr:String):Integer;
begin
  Result:=1;
end;
{$IFEND}

function SettingChatTime(ADateTime:TDateTime;AIsRecentChat:Boolean):String;
var
  ADay:TDateTime;
  Week:Integer;
begin

  Week:=0;
  ADay:=Now();
  if IsSameDay(ADateTime,ADay) then
  begin
    Result:=FormatDateTime('HH:MM',ADateTime);
  end
  else if (ADateTime<Trunc(ADay)) and (ADateTime>=Trunc(ADay)-1) then
  begin
    if AIsRecentChat=True then
    begin
      Result:='昨天';
    end
    else
    begin
      Result:='昨天'+'  '+FormatDateTime('HH:MM',ADateTime);
    end;
  end
  else if (ADateTime<Trunc(ADay)-1) and (ADateTime>=Trunc(ADay)-2) then
  begin
    Week:=DayOfWeek(ADateTime);
    if AIsRecentChat=True then
    begin
      case Week of
        2:Result:='周一';
        3:Result:='周二';
        4:Result:='周三';
        5:Result:='周四';
        6:Result:='周五';
        7:Result:='周六';
        1:Result:='周日';
      end;
    end
    else
    begin
      case Week of
        2:Result:='星期一'+' '+FormatDateTime('HH:MM',ADateTime);
        3:Result:='星期二'+' '+FormatDateTime('HH:MM',ADateTime);
        4:Result:='星期三'+' '+FormatDateTime('HH:MM',ADateTime);
        5:Result:='星期四'+' '+FormatDateTime('HH:MM',ADateTime);
        6:Result:='星期五'+' '+FormatDateTime('HH:MM',ADateTime);
        7:Result:='星期六'+' '+FormatDateTime('HH:MM',ADateTime);
        1:Result:='星期天'+' '+FormatDateTime('HH:MM',ADateTime);
      end;
    end;

  end
  else
  begin
    if AIsRecentChat=True then
    begin
      Result:=FormatDateTime('MM-DD',ADateTime);
    end
    else
    begin
      Result:=FormatDateTime('MM-DD',ADateTime)+'  '+FormatDateTime('HH:MM',ADateTime);
    end;
  end;

end;


{$IFDEF ANDROID}
function GetScreenInches: Single;
var
  x,y: Double;
  dm: JDisplayMetrics;
begin
  Result := 3;
  dm := GetJDisplayMetrics;
  if dm = nil then exit;
  x := dm.widthPixels;
  y := dm.heightPixels;
//  x := System.Math.Power(x / dm.xdpi, 2);
//  y := System.Math.Power(y / dm.ydpi, 2);
//  Result := Sqrt(x + y);
  Result := Sqrt((x * x / dm.xdpi / dm.xdpi) + (y * y / dm.ydpi / dm.ydpi));
end;
{$ENDIF}



function IsPadDevice:Boolean;
begin
//  Result:=False;
  Result:=True;
  {$IFDEF MSWINDOWS}

  {$ENDIF}
  {$IFDEF ANDROID}
  Result:=GetScreenInches>6;
  {$ENDIF}
  {$IFDEF IOS}
  Result:=FMX.Helpers.iOS.IsPad;
  {$ENDIF}
end;


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

  {$IF DEFINED(NZ) OR DEFINED(VCL)}
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

  {$IFEND}

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
  {$IFNDEF VCL}
  for I := Low(num) to High(num)-4 do
  begin
    Result[I]:='*';
  end;
  {$ENDIF}
end;

{$IF CompilerVersion >= 30.0}

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



      if (length(num)=11) and (Trim(num).IndexOf('-')<0) then
      begin
          //手机号码首位必须是1     座机 010-1234567  11位
          if (copy(num,1,1)<>'1') then Exit;


          //第二位必须是3,4,5,6,7,8,9
          //也就是支持13******,14******,15*****,16*****,17******,18******,19*****
          if (copy(num,2,1)='1')
            or (copy(num,2,1)='2')
            or (copy(num,2,1)='0') then
          begin
            Exit;
          end;


          //* [虚拟运营商]: 170[1700/1701/1702(电信)、
          //1703/1705/1706(移动)、
          //1704/1707/1708/1709(联通)]、
          //171（联通）
//          if (num.Substring(0,3)='170')
//             or (num.Substring(0,3)='171')
//            then
//          begin
//            //不支持虚拟运营商
//            Exit;
//          end;



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

function IsVirtualMobPhone( num:string ):boolean;
begin
  Result:=False;


  //* [虚拟运营商]: 170[1700/1701/1702(电信)、
  //1703/1705/1706(移动)、
  //1704/1707/1708/1709(联通)]、
  //171（联通）
  if (num.Substring(0,3)='170')
     or (num.Substring(0,3)='171')
    then
  begin
    //不支持虚拟运营商
    Result:=True;
    Exit;
  end;

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
{$IFEND}


function GetThumbFilePrefix(const AIsThumb:Boolean): String;
begin
  Result:='';
  if AIsThumb then Result:=Const_ThumbPrefix;
end;

function NewDelphiSubString(AStr:String;AIndex_StartWith0:Integer;ALength:Integer):String;
begin
  Result:={$IF CompilerVersion >= 30.0}AStr.Substring(AIndex_StartWith0,ALength){$ELSE}Copy(AStr,AIndex_StartWith0+1,ALength){$IFEND};
end;

function NewDelphiStringIndexOfName(ASubStr,AStr:String):Integer;
begin
  Result:={$IF CompilerVersion >= 30.0}AStr.IndexOf(ASubStr){$ELSE}Pos(ASubStr,AStr){$IFEND};
end;

function NewDelphiStringIndexOf(ASubStr,AStr:String):Boolean;
begin
  Result:={$IF CompilerVersion >= 30.0}AStr.IndexOf(ASubStr)<>-1{$ELSE}Pos(ASubStr,AStr)>0{$IFEND};
end;

function GetTimeHowLong(ADateTime:TDateTime):String;
var
  ADay:TDateTime;
begin
  ADay:=Now();
  if MinutesBetween(ADateTime,ADay)<1 then
  begin
    Result:='刚刚';
  end
  else if MinutesBetween(ADateTime,ADay)<60 then
  begin
    Result:=IntToStr(MinutesBetween(ADateTime,ADay))+'分钟前';
  end
  else
  begin
    if (1<=HoursBetween(ADateTime,ADay)) and (HoursBetween(ADateTime,ADay)<24)  then
    begin
      Result:=IntToStr(HoursBetween(ADateTime,ADay))+'小时前';
    end
    else
    begin
      Result:=IntToStr(DaysBetween(ADateTime,ADay))+'天前';
    end;
  end;
end;

//function SystemNow:TDateTime;
////var
////  SysTime:TSystemTime;
//begin
//  //GetTimeZoneInformation();
//  Result:=TTimeZone.Local.ToUniversalTime(Now);
////  GetSystemTime(SysTime);
////  Result:=SystemTimeToDateTime(SysTime);
//end;
//
//function GetSystemTimeStamp:Int64;
////var
////  SysTime:TSystemTime;
//begin
////  GetSystemTime(SysTime);
//  Result:=DateUtils.MilliSecondsBetween(
//                  TTimeZone.Local.ToUniversalTime(Now),
//                  StandardStrToDateTime('1970-1-1'));
//end;



function timeIntervalSince1970(Const ADateTime:TDateTime):Int64;
begin
  //TTimeZone.Local.UtcOffset.Hours
  //TTimeZone.Local.ToUniversalTime(now)
//  DateUtils.MinutesBetween()
  Result:=DateUtils.SecondsBetween(
                StandardStrToDateTime('1970-01-01 00:00:00'),
                ADateTime)
                //+8时区
                {$IF CompilerVersion >= 30.0}
//                -8*60*60
                //比D2007高的版本
                -TTimeZone.Local.UtcOffset.Hours*60*60
                {$IFEND}
                ;
end;

function timeMillionSecondsIntervalSince1970(Const ADateTime:TDateTime):Int64;
begin
  //TTimeZone.Local.UtcOffset.Hours
  //TTimeZone.Local.ToUniversalTime(now)
//  DateUtils.MinutesBetween()
  Result:=DateUtils.MilliSecondsBetween(
                StandardStrToDateTime('1970-01-01 00:00:00'),
                ADateTime)
                //+8时区
                {$IF CompilerVersion >= 30.0}
                //比D2007高的版本
//                -8*60*60
                -TTimeZone.Local.UtcOffset.Hours*60*60*1000
                {$IFEND}
                ;
end;

function timeSince1970Interval(Const AInterval:Int64):TDateTime;
begin
  //+8时区
  Result:=(AInterval{$IF CompilerVersion >= 30.0}+TTimeZone.Local.UtcOffset.Hours*60*60{$IFEND})//秒
          /(24*60*60)
          +StandardStrToDateTime('1970-01-01 00:00:00');
end;

function timeSince1970MillionSecondsInterval(Const AMillionSecondsInterval:Int64):TDateTime;
begin
  //+8时区
  Result:=(AMillionSecondsInterval/1000{$IF CompilerVersion >= 30.0}+TTimeZone.Local.UtcOffset.Hours*60*60{$IFEND})//秒
          /(24*60*60)
          +StandardStrToDateTime('1970-01-01 00:00:00');
end;



function GetOS:String;
begin
  {$IF CompilerVersion >= 30.0}
  //比2007高的版本
  case TOSVersion.Platform of
    pfWindows:
    begin
      Result:='Windows';
    end;
    pfMacOS:
    begin
      Result:='MacOS';
    end;
    pfiOS:
    begin
      Result:='IOS';
    end;
    pfAndroid:
    begin
      Result:='Android';
    end;
    pfWinRT:
    begin
      Result:='WinRT';
    end;
    pfLinux:
    begin
      Result:='Linux';
    end;
  end;
  {$ELSE}
  Result:='Windows';
  {$IFEND}
end;


function GetRandStr(len : Integer;
                    lowercase : Boolean = True;
                    num : Boolean = True;
                    uppercase : Boolean = False) : string;
const
  upperStr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  lowerStr = 'abcdefghijklmnopqrstuvwxyz';
  numStr = '0123456789';
var
  sourceStr : string;
  i : Integer;
begin
  sourceStr := '';
  Result := '';
  if uppercase = True then
    sourceStr := sourceStr + upperStr;
  if lowercase = True then
    sourceStr := sourceStr + lowerStr;
  if num = True then
    sourceStr := sourceStr + numStr;
  if (sourceStr = '') or (len<1) then
    exit;

  Randomize;
  for i:=1 to len do
  begin
    Result := Result + sourceStr[Random(Length(sourceStr)-1)+1];
  end;
end;



function GenerateCaptcha:String;
begin
  Result:=IntToStr(Math.RandomRange(0,9))
           +IntToStr(Math.RandomRange(0,9))
           +IntToStr(Math.RandomRange(0,9))
           +IntToStr(Math.RandomRange(0,9))
           ;
end;

function GenerateCaptcha_5:String;
begin
  Result:=IntToStr(Math.RandomRange(0,9))
           +IntToStr(Math.RandomRange(0,9))
           +IntToStr(Math.RandomRange(0,9))
           +IntToStr(Math.RandomRange(0,9))
           +IntToStr(Math.RandomRange(0,9))
           ;
end;


function GenerateCaptcha_6:String;
begin
  Randomize;
  Result:=IntToStr(Math.RandomRange(0,10));
  Randomize;
  Result:=Result+IntToStr(Math.RandomRange(0,10));
  Randomize;
  Result:=Result+IntToStr(Math.RandomRange(0,10));
  Randomize;
  Result:=Result+IntToStr(Math.RandomRange(0,10));
  Randomize;
  Result:=Result+IntToStr(Math.RandomRange(0,10));
  Randomize;
  Result:=Result+IntToStr(Math.RandomRange(0,10));
end;



type
  TTextFormat=(tfAnsi,tfUnicode,tfUnicodeBigEndian,tfUtf8);

const
  TextFormatFlag:array[tfAnsi..tfUtf8] of word=($0000,$FFFE,$FEFF,$EFBB);

{$IF CompilerVersion >= 30.0}
//比2007高的版本
//获取文本文件的编码
function GetTextFileEncoding(const AFileName: string): TEncoding;
var
  w: Word;
  b: Byte;
begin
  With TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone) do
  try
    Read(w,2);
    //因为是以Word数据类型读取，故高低字节互换
    w:=(w AND $FF00) SHR 8 OR (w AND $00FF) SHL 8;
    if w = TextFormatFlag[tfUnicode] then
      Result := TEncoding.Unicode
    else if w = TextFormatFlag[tfUnicodeBigEndian] then
      Result:= TEncoding.BigEndianUnicode
    else if w = TextFormatFlag[tfUtf8] then
      Result := TEncoding.UTF8
    else
      Result := TEncoding.ANSI;
  finally
    Free;
  end;

end;

function GetStringFromTextFile(AFilePath:String):String;
var
  AStringList:TStringList;
begin
  Result:='';
  if FileExists(AFilePath) then
  begin

    AStringList:=TStringList.Create;
    try
      AStringList.LoadFromFile(AFilePath,GetTextFileEncoding(AFilePath));
      Result:=AStringList.Text;
    finally
      FreeAndNil(AStringList);
    end;
  end;
end;
{$IFEND}


function SaveStringToFile(AString:String;AFilePath:String{$IF CompilerVersion >= 21.0};AEncoding:TEncoding{$IFEND}):Boolean;
var
  AStringStream:TStringStream;
begin
  Result:=False;
  AStringStream:=TStringStream.Create(AString{$IF CompilerVersion >= 21.0},AEncoding{$IFEND});
  try
    AStringStream.Position:=0;
    ForceDirectories(ExtractFilePath(AFilePath));
    {$IF CompilerVersion >= 21.0}
    AStringStream.SaveToFile(AFilePath);
    {$IFEND}
    Result:=True;
  finally
    FreeAndNil(AStringStream);
  end;
end;

function GetStringFromFile(AFilePath:String{$IF CompilerVersion >= 21.0};AEncoding:TEncoding{$IFEND}):String;
var
  AStringStream:TStringStream;
begin
  Result:='';
  if FileExists(AFilePath) then
  begin


      AStringStream:=TStringStream.Create(''{$IF CompilerVersion >= 21.0},AEncoding{$IFEND});
      try
        {$IF CompilerVersion >= 21.0}
        AStringStream.LoadFromFile(AFilePath);
        {$IFEND}
        AStringStream.Position:=0;
        Result:=AStringStream.DataString;
      finally
        FreeAndNil(AStringStream);
      end;
  end;

end;

function AddStrToArray(AArray:Array of String;AStr:String):TStringDynArray;
//procedure AddStrToArray(var AArray:TStringDynArray;AStr:String);//:TStringDynArray;
var
  ANewArray:TStringDynArray;
begin
  SetLength(ANewArray,Length(AArray)+1);

  CopyStringArray(AArray,ANewArray);

  ANewArray[Length(ANewArray)-1]:=AStr;

//  SetLength(AArray,Length(ANewArray));
//  CopyStringArray(ANewArray,AArray);

  Result:=ANewArray;
end;

//procedure AddValueToArray(var AValues:TVariantDynArray;AValue:Variant);//:TVariantDynArray;
function AddValueToArray(AValues:Array of Variant;AValue:Variant):TVariantDynArray;
var
  ANewArray:TVariantDynArray;
begin
  SetLength(ANewArray,Length(AValues)+1);

  CopyVariantArray(AValues,ANewArray);

  ANewArray[Length(ANewArray)-1]:=AValue;

//  SetLength(AValues,Length(ANewArray));
//  CopyVariantArray(ANewArray,AValues);

  Result:=ANewArray;
end;

procedure CopyStringArray(var ASrcArray,ADestArray:Array of String);
var
  I: Integer;
begin
  for I := 0 to Length(ASrcArray)-1 do
  begin
    ADestArray[I]:=ASrcArray[I];
  end;
end;

procedure CopyVariantArray(var ASrcArray,ADestArray:Array of Variant);
var
  I: Integer;
begin
  for I := 0 to Length(ASrcArray)-1 do
  begin
    ADestArray[I]:=ASrcArray[I];
  end;
end;

function FindInArray(AStr:String;AArray:Array of String):Integer;
var
  I: Integer;
begin
  Result:=-1;
  for I := 0 to Length(AArray)-1 do
  begin
    if AStr=AArray[I] then
    begin
      Result:=I;
      Exit;
    end;
  end;
end;

function ConvertToStringDynArray(AArray:Array of String):TStringDynArray;
var
  I: Integer;
begin
  SetLength(Result,Length(AArray));
  for I := 0 to Length(AArray)-1 do
  begin
    Result[I]:=AArray[I];
  end;
end;

function ConvertToVariantDynArray(AVariants:Array of Variant):TVariantDynArray;
var
  I: Integer;
begin
  SetLength(Result,Length(AVariants));
  for I := 0 to Length(AVariants)-1 do
  begin
    Result[I]:=AVariants[I];
  end;
end;

procedure FreeStringListObjects(AStringList:TStringList);
var
  I: Integer;
  AObject:TObject;
begin
  for I := 0 to AStringList.Count-1 do
  begin
    AObject:=AStringList.Objects[I];
    FreeAndNil(AObject);
  end;
  AStringList.Clear;
end;

function GetStringListArray(AStringList:TStringList):TStringDynArray;
var
  I: Integer;
begin
  SetLength(Result,AStringList.Count);
  for I := 0 to AStringList.Count-1 do
  begin
    Result[I]:=AStringList[I];
  end;
end;

function GetStringListNameArray(AStringList:TStringList):TStringDynArray;
var
  I: Integer;
begin
  SetLength(Result,AStringList.Count);
  for I := 0 to AStringList.Count-1 do
  begin
    Result[I]:=AStringList.Names[I];
  end;
end;

function GetStringListValueArray(AStringList:TStringList):TStringDynArray;
var
  I: Integer;
begin
  SetLength(Result,AStringList.Count);
  for I := 0 to AStringList.Count-1 do
  begin
    Result[I]:=AStringList.Values[AStringList.Names[I]];
  end;
end;

function GetStringArray(ACommaText:String):TStringDynArray;
var
  AStringList:TStringList;
  I: Integer;
begin
  SetLength(Result,0);
  AStringList:=TStringList.Create;
  try
    AStringList.CommaText:=ACommaText;
    SetLength(Result,AStringList.Count);
    for I := 0 to AStringList.Count-1 do
    begin
      Result[I]:=AStringList[I];
    end;
  finally
    FreeAndNil(AStringList);
  end;
end;


function LowStr(AStr:String):Integer;
begin
  {$IFDEF VCL}
    Result:=1;
  {$ELSE}
    Result:=Low(AStr);
  {$ENDIF}
end;

function HighStr(AStr:String):Integer;
begin
  {$IFDEF VCL}
    Result:=Length(AStr);
  {$ELSE}
    Result:=High(AStr);
  {$ENDIF}
end;



function SmallerDouble(A,B:Double):Boolean;
begin
  //比它小
  Result:=(A-B<-Precision);
end;

function BiggerDouble(A,B:Double):Boolean;
begin
  //比它大
  Result:=(A-B>Precision);
end;

function SmallerEqualDouble(A,B:Double):Boolean;
begin
  //比它小
  Result:=(A-B<=Precision) or (ABS(A-B)<=Precision);
end;

function BiggerEqualDouble(A,B:Double):Boolean;
begin
  //比它大
  Result:=(A-B>=Precision) or (ABS(A-B)<=Precision);
end;

function IsSameDouble(A,B:Double):Boolean;
begin
  //相同
  Result:=ABS(A-B)<Precision;
end;

function IsNotSameDouble(A,B:Double):Boolean;
begin
  //不相同
  Result:=ABS(A-B)>Precision;
end;

function EqualDouble(A,B:Double):Boolean;
begin
  //相同
  Result:=ABS(A-B)<Precision;
end;

function NotEqualDouble(A,B:Double):Boolean;
begin
  //不相同
  Result:=ABS(A-B)>Precision;
end;

function CreateGUIDString:String;
var
  guid:TGUID;
begin
  CreateGUID(guid);
  Result:=GUIDToString(guid);

//  Result:=ReplaceStr(Result,'{','');
//  Result:=ReplaceStr(Result,'}','');
//  Result:=ReplaceStr(Result,'-','');

  //D7
  Result:=StringReplace(Result,'{','', [rfReplaceAll]);
  Result:=StringReplace(Result,'}','', [rfReplaceAll]);
  Result:=StringReplace(Result,'-','', [rfReplaceAll]);

end;

function CreateGUIDStringHasDevide:String;
var
  guid:TGUID;
begin
  CreateGUID(guid);
  Result:=GUIDToString(guid);


//  Result:=ReplaceStr(Result,'{','');
//  Result:=ReplaceStr(Result,'}','');

  //D7
  Result:=StringReplace(Result,'{','', [rfReplaceAll]);
  Result:=StringReplace(Result,'}','', [rfReplaceAll]);


end;

function StdDateTimeToStr(Const ADateTime:TDateTime):String;
begin
  Result:=StandardDateTimeToStr(ADateTime);
end;

function StandardDateTimeToStr(Const ADateTime:TDateTime):String;
begin
  Result:=DateTimeToStr(ADateTime,GlobalStandardFmtSettings);
end;

function StdDateToStr(Const ADateTime:TDateTime):String;
begin
  Result:=StandardDateToStr(ADateTime);
end;

function StandardDateToStr(Const ADateTime:TDateTime):String;
begin
  Result:=FormatDateTime('YYYY-MM-DD',ADateTime);
end;

function StdStrToDateTime(Const Str:String):TDateTime;
begin
  Result:=StandardStrToDateTime(Str);
end;

function StandardStrToDateTime(Const Str:String):TDateTime;
begin
  if Str='' then
  begin
    Result:=0;
  end
  else
  begin
    Result:=StrToDateTime(Str,GlobalStandardFmtSettings);
  end;
end;

function StdStrToDateStr(Const Str:String):String;
var
  ADateTime:TDateTime;
begin
  ADateTime:=StdStrToDate(Str);
  Result:=StdDateToStr(ADateTime);
end;

function StdStrToDate(Const Str:String):TDateTime;
begin
  Result:=StandardStrToDate(Str);
end;

function StandardStrToDate(Const Str:String):TDateTime;
begin
  if Str='' then
  begin
    Result:=0;
  end
  else
  begin
    Result:=StrToDate(Str,GlobalStandardFmtSettings);
  end;
end;

function UIGetTickCount: LongWord;
begin
  {$IFDEF FMX}
  Result:=TThread.GetTickCount;
  {$ENDIF}
  {$IFDEF VCL}
  Result:=GetTickCount;
  {$ENDIF}
end;

procedure ObjAddRef(Obj:TObject);
begin
  {$IF CompilerVersion<=33.0}
    {$IFDEF IOS}
    Obj.__ObjAddRef;
    {$ENDIF}
    {$IFDEF ANDROID}
    Obj.__ObjAddRef;
    {$ENDIF}
  {$IFEND}
end;

procedure ObjRelease(Obj:TObject);
begin
  {$IF CompilerVersion<=33.0}
    {$IFDEF IOS}
    Obj.__ObjRelease;
    {$ENDIF}
    {$IFDEF ANDROID}
    Obj.__ObjRelease;
    {$ENDIF}
  {$IFEND}
end;


{$IF CompilerVersion<=33.0}
procedure FreeAndNil(var Obj);
begin
  Sysutils.FreeAndNil(Obj);
end;
{$ELSE}
procedure FreeAndNil(const [ref] Obj:TObject);
begin
  Sysutils.FreeAndNil(Obj);
end;
{$IFEND}



initialization
  GlobalStandardFmtSettings.ShortDateFormat:='yyyy-MM-dd';
  GlobalStandardFmtSettings.DateSeparator:='-';
  GlobalStandardFmtSettings.LongTimeFormat:='hh:mm:ss';
  GlobalStandardFmtSettings.TimeSeparator:=':';

  AndroidStartActivityForRequestCodes:=TStringList.Create;

finalization
  FreeAndNil(AndroidStartActivityForRequestCodes);




end.







