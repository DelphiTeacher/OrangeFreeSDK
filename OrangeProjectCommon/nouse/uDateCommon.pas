                                                                     /// <summary>
///   <para>
///     ��������
///   </para>
///   <para>
///     Public function
///   </para>
/// </summary>
unit uDateCommon;

interface

//uses
//  Classes,
//  System.Types,
//  StrUtils,
//  Math,
////  Winapi.Windows,
//  DateUtils,
//  SysUtils;
//
//
//
//
//
//
//
///// <summary>
/////   ��׼���ڸ�ʽת��
/////   <para>
/////     Standard date convert
/////   </para>
///// </summary>
//function StandardDateToStr(Const ADateTime:TDateTime):String;
///// <summary>
/////   ��׼���ڸ�ʽת��
/////    <para>
/////     Standard date convert
/////   </para>
///// </summary>
//function StandardStrToDateTime(Const Str:String):TDateTime;
///// <summary>
/////   ��׼���ڸ�ʽת��
/////     <para>
/////     Standard date convert
/////   </para>
///// </summary>
//function StandardDateTimeToStr(Const ADateTime:TDateTime):String;
//
//function timeIntervalSince1970(Const ADateTime:TDateTime):Int64;
//function timeSince1970Interval(Const AInterval:Int64):TDateTime;
//function timeSince1970MillionSecondsInterval(Const AMillionSecondsInterval:Int64):TDateTime;
//function GetTimeHowLong(ADateTime:TDateTime):String;
//
////function SystemNow:TDateTime;
////function GetSystemTimeStamp:Int64;

implementation


//
//function GetTimeHowLong(ADateTime:TDateTime):String;
//var
//  ADay:TDateTime;
//begin
//  ADay:=Now();
//  if MinutesBetween(ADateTime,ADay)<1 then
//  begin
//    Result:='�ո�';
//  end
//  else if MinutesBetween(ADateTime,ADay)<60 then
//  begin
//    Result:=IntToStr(MinutesBetween(ADateTime,ADay))+'����ǰ';
//  end
//  else
//  begin
//    if (1<=HoursBetween(ADateTime,ADay)) and (HoursBetween(ADateTime,ADay)<24)  then
//    begin
//      Result:=IntToStr(HoursBetween(ADateTime,ADay))+'Сʱǰ';
//    end
//    else
//    begin
//      Result:=IntToStr(DaysBetween(ADateTime,ADay))+'��ǰ';
//    end;
//  end;
//end;
//
////function SystemNow:TDateTime;
//////var
//////  SysTime:TSystemTime;
////begin
////  //GetTimeZoneInformation();
////  Result:=TTimeZone.Local.ToUniversalTime(Now);
//////  GetSystemTime(SysTime);
//////  Result:=SystemTimeToDateTime(SysTime);
////end;
////
////function GetSystemTimeStamp:Int64;
//////var
//////  SysTime:TSystemTime;
////begin
//////  GetSystemTime(SysTime);
////  Result:=DateUtils.MilliSecondsBetween(
////                  TTimeZone.Local.ToUniversalTime(Now),
////                  StandardStrToDateTime('1970-1-1'));
////end;
//
//



//var
//  GlobalStandardFmtSettings: TFormatSettings;
//
//function timeIntervalSince1970(Const ADateTime:TDateTime):Int64;
//begin
////  DateUtils.MinutesBetween()
//  Result:=DateUtils.SecondsBetween(
//                StandardStrToDateTime('1970-01-01 00:00:00'),
//                ADateTime)
//                //+8ʱ��
//                -8*60*60
//end;
//
//function timeSince1970Interval(Const AInterval:Int64):TDateTime;
//begin
//  //+8ʱ��
//  Result:=(AInterval+8*60*60)//��
//          /(24*60*60)
//          +StandardStrToDateTime('1970-01-01 00:00:00');
//end;
//
//function timeSince1970MillionSecondsInterval(Const AMillionSecondsInterval:Int64):TDateTime;
//begin
//  //+8ʱ��
//  Result:=(AMillionSecondsInterval/1000+8*60*60)//��
//          /(24*60*60)
//          +StandardStrToDateTime('1970-01-01 00:00:00');
//end;
//
//
//
//function StandardDateTimeToStr(Const ADateTime:TDateTime):String;
//begin
//  Result:=DateTimeToStr(ADateTime,GlobalStandardFmtSettings);
//end;
//
//function StandardDateToStr(Const ADateTime:TDateTime):String;
//begin
//  Result:=FormatDateTime('YYYY-MM-DD',ADateTime);
//end;
//
//function StandardStrToDateTime(Const Str:String):TDateTime;
//begin
//  if Str='' then
//  begin
//    Result:=0;
//  end
//  else
//  begin
//    Result:=StrToDateTime(Str,GlobalStandardFmtSettings);
//  end;
//end;
//
//
//
//
//initialization
//  GlobalStandardFmtSettings.ShortDateFormat:='yyyy-MM-dd';
//  GlobalStandardFmtSettings.DateSeparator:='-';
//  GlobalStandardFmtSettings.LongTimeFormat:='hh:mm:ss';
//  GlobalStandardFmtSettings.TimeSeparator:=':';
//


end.




