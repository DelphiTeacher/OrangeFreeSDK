unit uOCParseToPascal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  StrUtils;

const
  Const_Tab_Char=#9;

type
  TOCCodeLineBeginType=(cltNone,
                   cltSpace,              //空格
                   cltNote,               //注释
                   cltNoUse,              //未使用
                   cltImport,             //引入语句
                   cltEnumBegin,          //枚举开始
                   cltStructBegin,        //结构体开始
                   cltTypedefBegin,       //类型定义
                   cltNoteBegin,          //注释开始
                   cltClassPreDeclare,    //类预声明
                   cltClassBegin,         //类声明开始
                   cltProtocolBegin,      //接口声明开始
                   cltAnsiCProcedureBegin,//标准方法开始
                   cltConst,              //常量
                   cltDefine,             //常量
                   cltProperty,           //类属性
                   cltProcedure,          //类方法
                   cltEnd                 //声明结束
                   );




  TOCElementStruct=class
    Owner:TOCElementStruct;


    //OC代码行列表
    ObjectiveCCodeLines:TStringList;
    //Delphi代码行列表
    ODCodeLines:TStringList;



    NoteLines:TStringList;
    PreDatatypeDeclareStringList:TStringList;

    //将OC的代码注释掉放到生成代码中的
    procedure CommentObjectiveCCodeLinesToODCodeLines(AODCodeLines:TStringList);
  public
    constructor Create(AOwner:TOCElementStruct);overload;virtual;
    constructor Create();overload;virtual;
    Destructor Destroy;override;
  public
    procedure Clear;virtual;
    //解析,单行
    procedure ParseOCCodeLine(ACodeLine:String);virtual;
    //解析,多行
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);virtual;
    //转换
    function GenerateODCodeLines:TStringList;virtual;
  end;




  //OC代码行解析
  TOCCodeLineElementStruct=class(TOCElementStruct)
    //注释
    Note:String;
    //OC代码行
    OCCodeLine:String;
    //Delphi代码行
    ODCodeLine:String;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
  end;



  //ObjectiveC的头文件声明
  //#import <UIKit/UIKit.h>
  TOCImportHeaderStruct=class(TOCCodeLineElementStruct)
    //头文件目录名
    DirectoryName:String;
    //头文件名称
    HeaderFileName:String;
    //是否是自定义的头文件，不是系统的
    IsCustomerHeaderFile:Boolean;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;



  //ObjectiveC的类预声明
  //@class SuperPlayerView;
  TOCClassPreDeclareStruct=class(TOCCodeLineElementStruct)
    //类名
    OCClassName:String;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;




  //ObjectiveC的无用行
  TOCNoneStruct=class(TOCCodeLineElementStruct)
  public
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;


  //C的事件结构
  TCEventStruct=class(TOCCodeLineElementStruct)
    //方法的数据类型
    ProcedureDataType:String;
    //方法的名称
    ProcedureName:String;
    //其他的参数名称
    ParamNames:TStringList;
    //其他的参数数据类型
    ParamDataTypes:TStringList;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //解析
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
    //获取单行
    function GetODCodeLine:String;
    function GetTypeName():String;
//    //获取实现
//    function GetImple:String;
  end;



  //ObjectiveC的类型定义
  TOCTypedefStruct=class(TOCCodeLineElementStruct)
    //源类型
    SourceDataType:String;
    //目标类型
    DestDataType:String;
  public
    
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;


  //ObjectiveC的协议名结构
  TOCProtocolNameStruct=class(TOCCodeLineElementStruct)
    //协议名
    ProtocolName:String;
    //协议实现类名
    ProtocolImpleClassName:String;
    //协议是否拥有成员函数
    ProtocolHasPrivateMember:Boolean;
    //协议是否就一行声明就结束了
    ProtocolHasEnd:Boolean;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;



  //ObjectiveC的类名结构
  TOCClassNameStruct=class(TOCCodeLineElementStruct)
    //类名
    _ClassName:String;
    //类父名
    ClassParentClassName:String;
    //协议
    ClassParentProtocols:String;
    //类是否拥有成员函数
    ClassHasPrivateMember:Boolean;
    //类是否就一行声明就结束了
    ClassHasEnd:Boolean;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;




  //ObjectiveC的成员变量结构
  TOCVariableStruct=class(TOCCodeLineElementStruct)
    //变量名
    VariableName:String;
    //变量类型
    VariableDataType:String;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;


  //ObjectiveC的常量结构
  TOCConstStruct=class(TOCCodeLineElementStruct)
    //常量类型?
    ConstType:String;
    //常量名
    ConstName:String;
    //常量数据类型
    ConstDataType:String;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
    function GetImple(ALibPath:String):String;
  end;


  //ObjectiveC的常量结构
  TOCDefineStruct=class(TOCCodeLineElementStruct)
//    //常量类型
//    DefineType:String;
    //常量名
    DefineName:String;
    DefineValue:String;
//    //常量数据类型
//    DefineDataType:String;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;




  //ObjectiveC的属性结构(它包含两个方法)
  TOCPropertyStruct=class(TOCCodeLineElementStruct)
    OwnerName:String;
//    IsAddCdecl:Boolean;

    Imple:TStringList;

    //属性名
    PropertyName:String;
    //属性数据类型
    PropertyDataType:String;
    //属性是否只读
    PropertyIsReadOnly:Boolean;
    //属性描述
    PropertyDesciption:String;
    //获取方法
    GetterFunctionName:String;
    //设置方法
    SetterFunctionName:String;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;

    function GetProcedureName_Set:String;
    function GetDeclareEventMember_Set:String;
    function GetDeclareEventDataType_Set:String;
    function GetDeclareParamsStr_Set:String;
    function GetMethodType_Set:String;
    function GetMethodDataType_Set:String;
    function GetParamListStr_Set:String;
//    function GetImple_Set:TStringList;


    function GetProcedureName_Get:String;
    function GetDeclareEventMember_Get:String;
    function GetDeclareEventDataType_Get:String;
    function GetDeclareParamsStr_Get:String;
    function GetMethodType_Get:String;
    function GetMethodDataType_Get:String;
    function GetParamListStr_Get:String;


    function GetImple:TStringList;

    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;




  //ObjectiveC的方法结构
  TOCProcedureStruct=class(TOCCodeLineElementStruct)
    OwnerName:String;

    Imple:TStringList;
    //方法类型(+还是-,+是类方法,-是对象方法)
    ProcedureType:String;
    //方法的数据类型
    ProcedureDataType:String;
    //方法的名称
    ProcedureName:String;
    //第一个参数名
    FirstParamName:String;
    //第一个参数类型
    FirstParamDataType:String;
    //其他的方法名称
    OtherProcedureNames:TStringList;
    //其他的参数名称
    OtherParamNames:TStringList;
    //其他的参数数据类型
    OtherParamDataTypes:TStringList;

    ProcedureHasEnd:Boolean;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    function GetProcedureName:String;
    function GetDeclareEventMember:String;
    function GetDeclareEventDataType:String;
    function GetDeclareParamsStr:String;
    function GetMethodType:String;
    function GetMethodDataType:String;
    function GetParamListStr:String;
    function GetImple:TStringList;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;





  //C的标准方法结构
  TCProcedureStruct=class(TOCCodeLineElementStruct)
    //方法类型(+还是-,+是类方法,-是对象方法)
    ProcedureType:String;
    //方法的数据类型
    ProcedureDataType:String;
    //方法的名称
    ProcedureName:String;
    //其他的参数名称
    ParamNames:TStringList;
    //其他的参数数据类型
    ParamDataTypes:TStringList;
    //过程是否结束
    AnsiCProcedureHasEnd:Boolean;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //解析
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
    //获取单行
    function GetODCodeLine:String;
    //获取实现
    function GetImple:String;
  end;




  //ObjectiveC的注释
  TOCNoteStruct=class(TOCCodeLineElementStruct)
  public
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;





  //枚举
  TOCEnumStruct=class(TOCCodeLineElementStruct)
    //枚举类型名
    EnumTypeName:String;
    //枚举值列表
    EnumValueList:TStringList;
    //枚举是否结束
    EnumHasEnd:Boolean;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //解析
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;




  //结构体
  TOCStructStruct=class(TOCCodeLineElementStruct)
    //结构体名称
    StructTypeName:String;
    //结构体成员列表
    StructValueList:TStringList;
    //结构体成员行列表
    OCCodeLineElementStructList:TList;
    //结构体是否结束
    StructHasEnd:Boolean;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //解析
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //解析
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
  end;


  //ObjectiveC的协议结构
  TOCProtocolStruct=class(TOCElementStruct)
    Imple:TStringList;
    //协议名结构
    OCProtocolNameStruct:TOCProtocolNameStruct;
    //元素列表
    OCCodeLineElementStructList:TList;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //解析
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
    function GetImple:TStringList;
  end;





  //ObjectiveC的类结构
  TOCClassStruct=class(TOCElementStruct)
    
    //类名结构
    OCClassNameStruct:TOCClassNameStruct;
    //元素列表
    OCCodeLineElementStructList:TList;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //解析
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //转换
    function GenerateODCodeLines:TStringList;override;
    function GetImple:String;
  end;






  TOCHeaderFile=class
    //代码行列表
    CodeLines:TStringList;
    //Delphi代码行
    ODCodeLines:TStringList;
    //结构列表
    OCElementStructList:TList;
  public
    constructor Create;
    Destructor Destroy;override;
  public
    procedure Clear;
    //解析OC头文件的结构
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);
    //转换成Delphi代码
    function GenerateODCodeLines:TStringList;
    //转换成单元
    function GetUnitCodeLines(AUnitName:String;AStaticLibName:String;AUnitNamePrefix:String;AUnitNameSuffix:String):TStringList;
  end;












//找括号成对的结束(void (^)(void))
function FindBracketPairEnd(ABracketBegin,ABracketEnd:Char;ACodeLine:String;APosStartIndex:Integer=1):Integer;
//去掉括号
function RemoveAndFixBracketPair(ADataType:String;AOCElementStruct:TOCElementStruct):String;


//生成GUID
function CreateGUIDStr:String;
//转换数据类型
function ConvertOCTypeToODType(AOCDataType:String;Owner:TOCElementStruct=nil):String;
//去掉一行中的ObjectiveC注释行
function RemoveNote(ACodeLine:String;var ANote:String):String;
procedure FixPointerName(var AName:String;var ADataType:String);
function FixDelphiKeywordName(AName:String):String;
//检查ObjectiveC的代码行类型
function CheckOCCodeLineBeginType(ACodeLine:String):TOCCodeLineBeginType;
//解析
//procedure ExtractOCProcedurePararmList(ATrimedCodeLine:String;
//                                      AParamNames:TStringList;
//                                      AParamDataTypes:TStringList;AOCElementStruct:TOCElementStruct);
procedure ExtractOCProcedure(ACodeLine:String;AOCProcedureStruct:TOCProcedureStruct);
procedure ExtractCProcedurePararmList(ATrimedCodeLine:String;
                                      AParamNames:TStringList;
                                      AParamDataTypes:TStringList;AOCElementStruct:TOCElementStruct);
procedure ExtractCProcedure(ACodeLine:String;ACProcedureStruct:TCProcedureStruct);
procedure ExtractCEvent(ACodeLine:String;ACEventStruct:TCEventStruct);
procedure ExtractOCProtocolName(ACodeLine:String;AOCProtocolNameStruct:TOCProtocolNameStruct);
procedure ExtractOCProperty(ACodeLine:String;AOCPropertyStruct:TOCPropertyStruct);
procedure ExtractOCVariable(ACodeLine:String;AOCVariableStruct:TOCVariableStruct);
procedure ExtractOCConst(ACodeLine:String;AOCConstStruct:TOCConstStruct);
procedure ExtractOCDefine(ACodeLine:String;AOCDefineStruct:TOCDefineStruct);
procedure ExtractOCClassName(ACodeLine:String;AOCClassNameStruct:TOCClassNameStruct);
procedure ExtractOCImportHeader(ACodeLine:String;AOCImportHeaderStruct:TOCImportHeaderStruct);
procedure ExtractOCTypedef(ACodeLine:String;AOCTypedefStruct:TOCTypedefStruct);
procedure ExtractOCEnum(ACodeLine:String;AOCEnumStruct:TOCEnumStruct);
procedure ExtractOCStruct(ACodeLine:String;AOCStructStruct:TOCStructStruct);
//取出数据类型,比较复杂
procedure GetDataType(var ATrimedCodeLine:String;
                      var ADataType:String;
                      AOCElementStruct:TOCElementStruct;
                      ANeedCheckIsEvent:Boolean=True);



var
  StaticLibraryName:String;
  UnitNamePrefix:String;
  UnitNameBackfix:String;
  ParsedAllDataTypes:TStringList;
  ParsedPointerDataTypes:TStringList;
  DelphiKeywords:TStringList;

  UnkownEnumIndex:Integer;


implementation



//去掉一行中的ObjectiveC注释行
function RemoveNote(ACodeLine:String;var ANote:String):String;
begin
///**
// *设定当前地图的显示范围,采用直角坐标系表示
// *@param mapRect 要设定的地图范围，用直角坐标系表示
// *@param animate 是否采用动画效果
// */
  ANote:='';
  Result:=ACodeLine;
  if Pos('//',ACodeLine)>0 then
  begin
    ANote:=Copy(ACodeLine,Pos('//',ACodeLine),MaxInt);
    Result:=Copy(ACodeLine,1,Pos('//',ACodeLine)-1);
    Exit;
  end;
  if Pos('/*',ACodeLine)>0 then
  begin
    ANote:=Copy(ACodeLine,Pos('/*',ACodeLine),MaxInt);
    Result:=Copy(ACodeLine,1,Pos('/*',ACodeLine)-1);
    Exit;
  end
  else
  begin
    if Pos('*/',ACodeLine)>0 then
    begin
      ANote:=ACodeLine;
      Result:='';
      Exit;
    end;
  end;
  if Pos('*',Trim(ACodeLine))=1 then
  begin
    //整句都是
    Result:='';
    ANote:=ACodeLine;
    Exit;
  end;
end;

//去掉一行中的ObjectiveC注释行
function FixNote(ACodeLine:String):String;
begin
  Result:=ACodeLine;
  if Pos('/*',ACodeLine)>0 then
  begin
    Result:=Copy(ACodeLine,1,Pos('/*',ACodeLine)-1)
            +'//'+' '+Copy(ACodeLine,Pos('/*',ACodeLine),MaxInt);
    Exit;
  end;
end;

//去掉一行中的ObjectiveC注释行
function RemoveNoteOnly(ACodeLine:String):String;
var
  ANote:String;
begin
  Result:=RemoveNote(ACodeLine,ANote);
end;

function FixDelphiKeywordName(AName:String):String;
begin
  Result:=AName;
  if DelphiKeywords.IndexOf(LowerCase(AName))<>-1 then
  begin
    Result:='_'+AName;
  end;
end;

procedure FixPointerName(var AName:String;var ADataType:String);
begin
  if Pos('*',AName)>0 then
  begin
    //是指针
    ADataType:=ADataType+'*';
    //去掉星号
    AName:=ReplaceStr(AName,'*','');

//    if AName then

  end;
end;


//'AS_EXTERN API_AVAILABLE(ios(13.0), macos(10.15), tvos(13.0), watchos(6.0))'
//取出最外层的结束括号
function GetOuterestEndSign(ACodeLine:String;AStartIndex:Integer):Integer;
var
  AStack:Integer;
begin
  Result:=-1;
  AStack:=0;
  if PosEx('(',ACodeLine)>0 then
  begin
    while AStartIndex<=Length(ACodeLine) do
    begin
      if ACodeLine[AStartIndex]='(' then
      begin
        Inc(AStack);
      end;
      if ACodeLine[AStartIndex]=')' then
      begin
        Dec(AStack);

        if AStack=0 then
        begin
          Result:=AStartIndex;
          Exit;
        end;

      end;

      Inc(AStartIndex);

    end;

  end;

end;

//检查ObjectiveC的代码行类型
function CheckOCCodeLineBeginType(ACodeLine:String):TOCCodeLineBeginType;
var
  AStartIndex: Integer;
  AEndIndex:Integer;
  ATrimedCodeLine:String;
begin
  Result:=cltNone;

  ATrimedCodeLine:=Trim(ACodeLine);


  if ATrimedCodeLine='' then
  begin
    //空行
    Result:=cltSpace;
    Exit;
  end;


  //单行注释
  if Copy(ATrimedCodeLine,1,Length('//'))='//' then
  begin
    //注释
    Result:=cltNote;
    Exit;
  end;




  // /*是分段注释开始,要判断是不是整段都是注释,如果不存在*/，那表示是多段注释
  if (Copy(ATrimedCodeLine,1,Length('/*'))='/*') then
  begin
      if (Pos('*/',ATrimedCodeLine)>0) then
      begin
          Result:=cltNote;
          Exit;
      end
      else
      begin
          //分段注释开始,要判断是不是整段都是注释
          Result:=cltNoteBegin;
          Exit;
      end;

  end;







  //引用头文件
  if Copy(ATrimedCodeLine,1,Length('#import'))='#import' then
  begin
    Result:=cltImport;
    Exit;
  end;




  //存在API_AVAILABLE,那要抽去API_AVAILABLE(****)
  //'AS_EXTERN API_AVAILABLE(ios(13.0), macos(10.15), tvos(13.0), watchos(6.0))'
  //AS_EXTERN ASAuthorizationScope const ASAuthorizationScopeFullName API_AVAILABLE(ios(13.0), macos(10.15), tvos(13.0), watchos(6.0));
  if Pos('API_AVAILABLE',ATrimedCodeLine)>0 then
  begin
    AStartIndex:=Pos('API_AVAILABLE',ATrimedCodeLine);
    AEndIndex:=GetOuterestEndSign(ATrimedCodeLine,AStartIndex);
    if AEndIndex<>-1 then
    begin
      ATrimedCodeLine:=Copy(ATrimedCodeLine,1,AStartIndex-1)+Copy(ATrimedCodeLine,AEndIndex+1,MaxInt);
    end;
  end;




  //'AVF_EXPORT NSString *const AVCaptureDeviceWasConnectedNotification  __WATCHOS_PROHIBITED __TVOS_PROHIBITED;'
  //去掉__WATCHOS_PROHIBITED
  //去掉__TVOS_PROHIBITED






  //无用
  if (Copy(ATrimedCodeLine,1,Length('@optional'))='@optional')
    or (Copy(ATrimedCodeLine,1,Length('@required'))='@required')
    or (Copy(ATrimedCodeLine,1,Length('#pragma'))='#pragma')
    or (Copy(ATrimedCodeLine,1,Length('#'))='#') and (Copy(ATrimedCodeLine,1,Length('#define'))<>'#define')
    or (Copy(ATrimedCodeLine,1,Length('SWIFT_PROTOCOL'))='SWIFT_PROTOCOL')
    or (Copy(ATrimedCodeLine,1,Length('SWIFT_CLASS'))='SWIFT_CLASS')
    or (Copy(ATrimedCodeLine,1,Length('NS_CLASS_AVAILABLE_IOS'))='NS_CLASS_AVAILABLE_IOS')
    or (Copy(ATrimedCodeLine,1,Length('NS_AVAILABLE_IOS'))='NS_AVAILABLE_IOS')
    or (Copy(ATrimedCodeLine,1,Length('NS_CLASS_AVAILABLE'))='NS_CLASS_AVAILABLE')
    or (Copy(ATrimedCodeLine,1,Length('AS_EXTERN'))='AS_EXTERN')

    //API_AVAILABLE
    //  'NS_CLASS_AVAILABLE_IOS(9_0)'
    //'AS_EXTERN API_AVAILABLE(ios(13.0), macos(10.15), tvos(13.0), watchos(6.0))'
    then
  begin
    Result:=cltNoUse;
    Exit;
  end;






  ATrimedCodeLine:=RemoveNoteOnly(ATrimedCodeLine);




  //声明
  if Copy(ATrimedCodeLine,1,Length('typedef'))='typedef' then
  begin
      Result:=cltTypedefBegin;
      //枚举
      if Copy(ATrimedCodeLine,1,Length('typedef enum'))='typedef enum' then
      begin
        Result:=cltEnumBegin;
        Exit;
      end;
      if Copy(ATrimedCodeLine,1,Length('typedef NS_ENUM'))='typedef NS_ENUM' then
      begin
        Result:=cltEnumBegin;
        Exit;
      end;

      //结构体
      if Copy(ATrimedCodeLine,1,Length('typedef struct'))='typedef struct' then
      begin
        Result:=cltStructBegin;
        Exit;
      end;
      Exit;
  end;
  if Copy(ATrimedCodeLine,1,Length('enum '))='enum ' then
  begin
    Result:=cltEnumBegin;
    Exit;
  end;
  if Copy(ATrimedCodeLine,1,Length('struct '))='struct ' then
  begin
    Result:=cltStructBegin;
    Exit;
  end;

  //常量
  if Copy(ATrimedCodeLine,1,Length('const '))='const ' then
  begin
    Result:=cltConst;
    Exit;
  end;
  if Copy(ATrimedCodeLine,1,Length('extern '))='extern ' then
  begin
    Result:=cltConst;
    Exit;
  end;
  if Pos(' const ',ATrimedCodeLine)>0 then
  begin
    Result:=cltConst;
    Exit;
  end;

  //常量
  if Copy(ATrimedCodeLine,1,Length('#define '))='#define ' then
  begin
    Result:=cltDefine;
    Exit;
  end;


  //类
  if Copy(ATrimedCodeLine,1,Length('@interface'))='@interface' then
  begin
    Result:=cltClassBegin;
    Exit;
  end;

  //类预声明
  if Copy(ATrimedCodeLine,1,Length('@class'))='@class' then
  begin
    Result:=cltClassPreDeclare;
    Exit;
  end;


  //协议
  if Copy(ATrimedCodeLine,1,Length('@protocol'))='@protocol' then
  begin
    Result:=cltProtocolBegin;
    Exit;
  end;

  //OC过程
  if (Copy(ATrimedCodeLine,1,Length('+'))='+') or (Copy(ATrimedCodeLine,1,Length('-'))='-') then
  begin
    Result:=cltProcedure;
    Exit;
  end;

  //OC属性
  if Copy(ATrimedCodeLine,1,Length('@property'))='@property' then
  begin
    Result:=cltProperty;
    Exit;
  end;


  //类或协议声明结束
  if Copy(ATrimedCodeLine,1,Length('@end'))='@end' then
  begin
    Result:=cltEnd;
    Exit;
  end;




  //外部方法
  //'extern NSString* BDS_ASR_CMD_STOP;'
  if (Pos('(',ATrimedCodeLine)>0)
//    or (Copy(ATrimedCodeLine,1,Length('extern'))='extern')
    then
  begin
    //有括号,应该是过程
    Result:=cltAnsiCProcedureBegin;
    Exit;
  end;

end;

//procedure ExtractOCProcedurePararmList(ATrimedCodeLine:String;
//                                      AParamNames:TStringList;
//                                      AParamDataTypes:TStringList;
//                                      AOCElementStruct:TOCElementStruct);
//var
//  ADevideIndex:Integer;
//  ADataType:String;
//  AEndIndex:Integer;
//  AParamName:String;
//begin
//
//
//                //获取其他参数
//  //              ADevideIndex:=Pos(')',ATrimedCodeLine);
//                ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
//                if ADevideIndex>0 then
//                begin
//                  //其他参数数据类型
//                  ADataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex));
//  //                ADataType:=ReplaceStr(ADataType,')','');
//  //                ADataType:=ReplaceStr(ADataType,'(','');
//                  ADataType:=RemoveAndFixBracketPair(ADataType,AOCElementStruct);
//  //                AOCProcedureStruct.OtherParamDataTypes.Add(ReplaceStr(
//  //                                      ReplaceStr(
//  //                                          ,
//  //                                        '(','')
//  //                                      ,'(',''));
//                  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
//
//
//                  //其他参数名
//                  ADevideIndex:=Pos(' ',ATrimedCodeLine);
//                  AEndIndex:=Pos(';',ATrimedCodeLine);
//                  if ADevideIndex>0 then
//                  begin
//                    //还有参数
//                    AParamName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
//  //                  AOCProcedureStruct.OtherParamNames.Add();
//                    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
//                  end
//                  else if AEndIndex>0 then
//                  begin
//                    //最后一个参数了
//  //                  AOCProcedureStruct.OtherParamNames.Add(
//                    AParamName:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));//);
//                    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,AEndIndex+1,MaxInt));
//                  end;
//                  FixPointerName(AParamName,ADataType);
//                  AParamDataTypes.Add(ADataType);
//                  AParamNames.Add(AParamName);
//
//                end;
//
//end;


procedure ExtractOCProcedure(ACodeLine:String;AOCProcedureStruct:TOCProcedureStruct);
var
  //冒号下标
  ADevideIndex:Integer;
  AEndIndex:Integer;
  ADataType:String;
  AParamName:String;
  ATrimedCodeLine:String;
  ACEventStruct:TCEventStruct;
begin
  AOCProcedureStruct.Clear;
  AOCProcedureStruct.OCCodeLine:=ACodeLine;
  AOCProcedureStruct.ObjectiveCCodeLines.Add(ACodeLine);


///**
// *根据当前地图View的窗口大小调整传入的region，返回适合当前地图窗口显示的region，调整过程会保证中心点不改变
// *@param region 待调整的经纬度范围
// *@return 调整后适合当前地图窗口显示的经纬度范围
// */
//- (BMKCoordinateRegion)regionThatFits:(BMKCoordinateRegion)region;
//
///**
// *设定当前地图的显示范围
// *@param region 要设定的地图范围，用经纬度的方式表示
// *@param animated 是否采用动画效果
// */
//- (void)setRegion:(BMKCoordinateRegion)region animated:(BOOL)animated;
//@property (nonatomic, strong) id <BMKAnnotation> annotation;

//- (void)addLocalVideo:(NSArray<NSURL *> *)urlArray selected:(BOOL)selected DEPRECATED_MSG_ATTRIBUTE("Use ''addCustomAssetModel:'' instead");

  ATrimedCodeLine:=Trim(ACodeLine);
  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCProcedureStruct.Note);
  if ATrimedCodeLine='' then Exit;
  

  //方法类型,+,-
  AOCProcedureStruct.ProcedureType:=Copy(ATrimedCodeLine,1,1);
  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,2,MaxInt));


  //方法返回值
//  ADevideIndex:=Pos(')',ATrimedCodeLine);
  ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    //去掉方法返回值的括号
    ADataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex));
//    ADataType:=ReplaceStr(ADataType,')','');
//    ADataType:=ReplaceStr(ADataType,'(','');
    ADataType:=RemoveAndFixBracketPair(ADataType,AOCProcedureStruct);
    AOCProcedureStruct.ProcedureDataType:=ADataType;
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    GetDataType(ATrimedCodeLine,AOCProcedureStruct.ProcedureDataType,AOCProcedureStruct);


    //定位方法名称
    ADevideIndex:=Pos(':',ATrimedCodeLine);
    AEndIndex:=Pos(';',ATrimedCodeLine);
    AOCProcedureStruct.ProcedureHasEnd:=AEndIndex>0;

    if ADevideIndex>0 then
    begin
      //获取方法名称
      AOCProcedureStruct.ProcedureName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      FixPointerName(AOCProcedureStruct.ProcedureName,AOCProcedureStruct.ProcedureDataType);
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));


      //获取参数
//      ADevideIndex:=Pos(')',ATrimedCodeLine);
      ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
      if ADevideIndex>0 then
      begin
          //第一个参数类型
          //(void (^)(NSString *totalBytes, NSUInteger totalDataLengths))
          ADataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex));
  //        ADataType:=ReplaceStr(ADataType,')','');
  //        ADataType:=ReplaceStr(ADataType,'(','');
          ADataType:=RemoveAndFixBracketPair(ADataType,AOCProcedureStruct);


          //NSArray<NSURL *> *
          AOCProcedureStruct.FirstParamDataType:=ADataType;
          ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
          GetDataType(ATrimedCodeLine,AOCProcedureStruct.FirstParamDataType,AOCProcedureStruct);


          ADevideIndex:=Pos(' ',ATrimedCodeLine);
          AEndIndex:=Pos(';',ATrimedCodeLine);
          if ADevideIndex<=0 then
          begin
                //只有一个参数
                AOCProcedureStruct.FirstParamName:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));
                FixPointerName(AOCProcedureStruct.FirstParamName,AOCProcedureStruct.FirstParamDataType);
          end
          else
          begin
                //有多个参数
                AOCProcedureStruct.FirstParamName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
                FixPointerName(AOCProcedureStruct.FirstParamName,AOCProcedureStruct.FirstParamDataType);
                ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

                while Pos(':',ATrimedCodeLine)>0 do
                begin
                    //取出其他方法名
                    ADevideIndex:=Pos(':',ATrimedCodeLine);
                    if ADevideIndex>0 then
                    begin

                      //'DEPRECATED_MSG_ATTRIBUTE("Use ''addCustomAssetModel:'' instead");'
                      if Copy(ATrimedCodeLine,1,Length('DEPRECATED_MSG_ATTRIBUTE'))<>'DEPRECATED_MSG_ATTRIBUTE' then
                      begin

                            AOCProcedureStruct.OtherProcedureNames.Add(
                              ReplaceStr(Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1)),'*','')//'{*}')
                              );
                            ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));




//                            //获取其他参数
//                            ExtractOCProcedurePararmList(ATrimedCodeLine,
//                                                        AOCProcedureStruct.OtherParamDataTypes,
//                                                        AOCProcedureStruct.OtherParamNames,
//                                                        AOCProcedureStruct);

              //              ADevideIndex:=Pos(')',ATrimedCodeLine);
                            ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
                            if ADevideIndex>0 then
                            begin
                              //其他参数数据类型
                              ADataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex));
              //                ADataType:=ReplaceStr(ADataType,')','');
              //                ADataType:=ReplaceStr(ADataType,'(','');
                              ADataType:=RemoveAndFixBracketPair(ADataType,AOCProcedureStruct);
              //                AOCProcedureStruct.OtherParamDataTypes.Add(ReplaceStr(
              //                                      ReplaceStr(
              //                                          ,
              //                                        '(','')
              //                                      ,'(',''));
                              ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));


                              //其他参数名
                              ADevideIndex:=Pos(' ',ATrimedCodeLine);
                              AEndIndex:=Pos(';',ATrimedCodeLine);
                              if ADevideIndex>0 then
                              begin
                                //还有参数
                                AParamName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
              //                  AOCProcedureStruct.OtherParamNames.Add();
                                ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
                              end
                              else if AEndIndex>0 then
                              begin
                                //最后一个参数了
              //                  AOCProcedureStruct.OtherParamNames.Add(
                                AParamName:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));//);
                                ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,AEndIndex+1,MaxInt));
                              end;
                              FixPointerName(AParamName,ADataType);
                              AOCProcedureStruct.OtherParamDataTypes.Add(ADataType);
                              AOCProcedureStruct.OtherParamNames.Add(AParamName);

                            end;

                      end
                      else
                      begin
                            //不要了
                            Break;
                      end;



                    end;
                end;
          end;
      end;
    end
    else if AEndIndex>0 then
    begin
      //没有参数
      AOCProcedureStruct.ProcedureName:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));
      FixPointerName(AOCProcedureStruct.ProcedureName,AOCProcedureStruct.ProcedureDataType);
    end;
  end;
end;

procedure GetDataType(var ATrimedCodeLine:String;
                      var ADataType:String;
                      AOCElementStruct:TOCElementStruct;
                      ANeedCheckIsEvent:Boolean=True);
var
  ADevideIndex:Integer;
  ACEventStruct:TCEventStruct;
  ATempLine:String;
begin

  while (ATrimedCodeLine<>'') do
  begin
      if Copy(ATrimedCodeLine,1,1)='*' then
      begin
        ADataType:=ADataType+'*';
        ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,2,MaxInt));
      end
      //判断有没有类, id <BMKAnnotation>,NSArray<SuperPlayerUrl *>
      //判断有没有模板类, id <BMKAnnotation>,NSArray<SuperPlayerUrl *>
      else if (Copy(ATrimedCodeLine,1,1)='<')
              or (Pos('<',ADataType)>0) then
      begin

        //判断有没有类, id <BMKAnnotation>,NSArray<SuperPlayerUrl *>
  //      if (AOCPropertyStruct.PropertyDataType='id') and (ATrimedCodeLine<>'') then
  //      begin
//          ADevideIndex:=Pos('<',ATrimedCodeLine);
//          if ADevideIndex=1 then
//          begin
            ADevideIndex:=Pos('>',ATrimedCodeLine);
            ADataType:=ADataType+ Copy(ATrimedCodeLine,1,ADevideIndex);
            //要将NSArray<SuperPlayerUrl *>中的<>转换为{}
            ADataType:=ReplaceStr(ADataType,'<','{');
            ADataType:=ReplaceStr(ADataType,'>','}');

            ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
//          end;
  //      end;

      end
      else if (Copy(ATrimedCodeLine,1,Length('_Nullable'))='_Nullable') then
      begin
          ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,Length('_Nullable')+1,MaxInt));
      end
      else if (ADataType='IBOutlet')
              or (ADataType='IBInspectable') then
      begin

          ADevideIndex:=Pos(' ',ATrimedCodeLine);
          if ADevideIndex>0 then
          begin
              ADataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
              ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
          end;

      end
      else if (Copy(ATrimedCodeLine,1,Length('__nullable'))='__nullable') then
      begin
          ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,Length('__nullable')+1,MaxInt));
      end
      //是不是方法类型,数据类型后面跟一个(^ 方法名 )
      else if ANeedCheckIsEvent and (Copy(ATrimedCodeLine,1,1)='(') then
      begin
          //特殊情况void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);
          ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine,2);
          if ADevideIndex>0 then
          begin

              ATempLine:=Copy(ATrimedCodeLine,1,ADevideIndex);
              ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));


              ACEventStruct:=TCEventStruct.Create;
              ACEventStruct.ParseOCCodeLine(ADataType+' '+ATempLine);
              if (AOCElementStruct<>nil)
                and (AOCElementStruct.Owner<>nil) then
              begin
                //获取参数列表
                AOCElementStruct.Owner.PreDatatypeDeclareStringList.AddStrings(ACEventStruct.GenerateODCodeLines);
              end
              else if (AOCElementStruct<>nil) then
              begin
                //获取参数列表
                AOCElementStruct.PreDatatypeDeclareStringList.AddStrings(ACEventStruct.GenerateODCodeLines);
              end;
              ADataType:=ACEventStruct.GetTypeName;
              //AOCPropertyStruct.NoteLines.Add('//'+ACEventStruct.GetODCodeLine);

              ACEventStruct.Free;


          end
          else
          begin
            Break;
          end;

      end
      else
      begin
        Break;
      end;
    
  end;

end;

procedure ExtractCEvent(ACodeLine:String;ACEventStruct:TCEventStruct);
var
  I:Integer;
  ANote:String;
  ATrimedCodeLine:String;
  ADevideIndex:Integer;
//  ADescriptDevideBeginIndex:Integer;
  ADescriptDevideEndIndex:Integer;
  ADataType:String;
begin

  ATrimedCodeLine:=Trim(ACodeLine);
  
  //'void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);
  ADevideIndex:=Pos(' ',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin


      ACEventStruct.ProcedureDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
      GetDataType(ATrimedCodeLine,ACEventStruct.ProcedureDataType,ACEventStruct,False);
      //void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);



      //括号里面的是属性名称
      ADevideIndex:=Pos('^',ATrimedCodeLine);
      ADescriptDevideEndIndex:=Pos(')',ATrimedCodeLine);
      if (ADevideIndex>0) and (ADescriptDevideEndIndex>0) then
      begin
        //方法类型的参数
        ACEventStruct.ProcedureName:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,(ADescriptDevideEndIndex-ADevideIndex-1)));
        ACEventStruct.ProcedureName:=ReplaceStr(ACEventStruct.ProcedureName,'_Nullable','');




        ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADescriptDevideEndIndex+1,MaxInt));

        ExtractCProcedurePararmList(ATrimedCodeLine,
                                      ACEventStruct.ParamNames,
                                      ACEventStruct.ParamDataTypes,
                                      ACEventStruct);


        if ACEventStruct.ProcedureName='' then
        begin
          if ACEventStruct.ParamDataTypes.Count>0 then
          begin
              for I := 0 to ACEventStruct.ParamDataTypes.Count-1 do
              begin
                ADataType:=ACEventStruct.ParamDataTypes[I];
//                ADataType:=ReplaceStr(ADataType,'*','_');
//                ADataType:=ReplaceStr(ADataType,'<','_');
//                ADataType:=ReplaceStr(ADataType,'>','_');
                ADataType:=ConvertOCTypeToODType(ADataType,nil);
                ADevideIndex:=Pos('{',ADataType);
                if ADevideIndex>0 then
                begin
                  ADescriptDevideEndIndex:=Pos('}',ADataType);

                  ADataType:=Copy(ADataType,1,ADevideIndex-1)
                              +Copy(ADataType,ADescriptDevideEndIndex+1,MaxInt);
                end;

                ACEventStruct.ProcedureName:=ACEventStruct.ProcedureName+ADataType+'_';
              end;
          end
          else
          begin
            ACEventStruct.ProcedureName:='Void';
          end;
        end;

      end;

      
  end;

end;

procedure ExtractCProcedurePararmList(ATrimedCodeLine:String;
                                      AParamNames:TStringList;
                                      AParamDataTypes:TStringList;AOCElementStruct:TOCElementStruct);
var
  ADevideIndex:Integer;
  AParamDataType:String;
  AParamName:String;
begin
    //      ADevideIndex:=Pos(')',ATrimedCodeLine);
          //(void)
          ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
          if ADevideIndex>0 then
          begin


          
            //分解出参数,参数以逗号分隔
            ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,2,ADevideIndex-2));

            repeat
              ADevideIndex:=Pos(' ',ATrimedCodeLine);
              if ADevideIndex>0 then
              begin
                AParamDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex));
    //            AParamDataType:=ReplaceStr(AParamDataType,')','');
    //            AParamDataType:=ReplaceStr(AParamDataType,'(','');
                //AParamDataType:=RemoveAndFixBracketPair(AParamDataType);
    //            ACProcedureStruct.ParamDataTypes.Add(AParamDataType);
                ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
                GetDataType(ATrimedCodeLine,AParamDataType,AOCElementStruct);


                
                ADevideIndex:=Pos(',',ATrimedCodeLine);
                if ADevideIndex>0 then
                begin
                  //还有参数
    //              ACProcedureStruct.ParamNames.Add(ReplaceStr(
                  AParamName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));//,'*','{*}'));
                  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
                end
                else
                begin
                  //最后一个参数了
    //              ACProcedureStruct.ParamNames.Add(ReplaceStr(
                  AParamName:=Trim(Copy(ATrimedCodeLine,1,MaxInt));//,'*','{*}'));
                end;
                FixPointerName(AParamName,AParamDataType);
                AParamNames.Add(AParamName);
                AParamDataTypes.Add(AParamDataType) ;

              end
              else
              begin
//                AParamNames.Add('');
//                AParamDataTypes.Add(ATrimedCodeLine) ;
              end;
            until Pos(' ',ATrimedCodeLine)<=0;


          end;

end;

procedure ExtractCProcedure(ACodeLine:String;ACProcedureStruct:TCProcedureStruct);
var
  //冒号下标
  ADevideIndex:Integer;
  AEndIndex:Integer;
  ATrimedCodeLine:String;
  ASpace1Index:Integer;
  ASpace2Index:Integer;
  AParamName:String;
  AParamDataType:String;
begin
  ACProcedureStruct.Clear;
  ACProcedureStruct.OCCodeLine:=ACodeLine;
  ACProcedureStruct.ObjectiveCCodeLines.Add(ACodeLine);

///**
// *根据中心点和距离生成BMKCoordinateRegion
// *@param centerCoordinate 中心点坐标
// *@param latitudinalMeters 纬度方向的距离范围，单位：米
// *@param longitudinalMeters 经度方向的距离范围，单位：米
// *@return 根据中心点和距离生成BMKCoordinateRegion
// */
//UIKIT_EXTERN BMKCoordinateRegion BMKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters);
//
///**
// *将经纬度坐标转换为投影后的直角地理坐标
// *@param coordinate 待转换的经纬度坐标
// *@return 转换后的直角地理坐标
// */
//UIKIT_EXTERN BMKMapPoint BMKMapPointForCoordinate(CLLocationCoordinate2D coordinate);
//BMKMapPoint BMKMapPointForCoordinate(CLLocationCoordinate2D coordinate);
//'extern NSString* BDS_ASR_CMD_STOP;'



  ATrimedCodeLine:=Trim(ACodeLine);
  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,ACProcedureStruct.Note);
  if ATrimedCodeLine='' then Exit;


  //去掉实现体{},大括号里面是代码
  ASpace1Index:=Pos('{',ATrimedCodeLine);
  if ASpace1Index>0 then
  begin
    ACProcedureStruct.Note:=Copy(ATrimedCodeLine,ASpace1Index,MaxInt)+ACProcedureStruct.Note;
    ATrimedCodeLine:=Copy(ATrimedCodeLine,1,ASpace1Index-1);
  end;


  ASpace1Index:=Pos(' ',ATrimedCodeLine);
  //万一空了很多空格
  ASpace2Index:=PosEx(' ',ATrimedCodeLine,ASpace1Index+1);
//  ADevideIndex:=Pos(')',ATrimedCodeLine);
  //参数开始,或者没有参数
  ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
  if ADevideIndex=-1 then
  begin
    //没有参数,取最后一个分号
    ADevideIndex:=Length(ATrimedCodeLine);
  end;

  if (ASpace2Index<>-1) and (ASpace2Index<ADevideIndex) then
  begin
    //有方法类型 UIKIT_EXTERN
    //方法类型
    ACProcedureStruct.ProcedureType:=Copy(ATrimedCodeLine,1,ASpace1Index-1);
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ASpace1Index+1,MaxInt));
  end
  else
  begin
    //没有方法类型
  end;



  ADevideIndex:=Pos(' ',ATrimedCodeLine);
  //方法返回值
  if ADevideIndex>0 then
  begin
        //去掉方法返回值的括号
        AParamDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
        AParamDataType:=ReplaceStr(AParamDataType,')','');
        AParamDataType:=ReplaceStr(AParamDataType,'(','');
        ACProcedureStruct.ProcedureDataType:=AParamDataType;
        ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
        GetDataType(ATrimedCodeLine,ACProcedureStruct.ProcedureDataType,ACProcedureStruct);




        //定位方法名称
        ADevideIndex:=Pos('(',ATrimedCodeLine);
//        AEndIndex:=Pos(');',ATrimedCodeLine);
        AEndIndex:=Pos(';',ATrimedCodeLine);
        ACProcedureStruct.AnsiCProcedureHasEnd:=AEndIndex>0;


        if ADevideIndex>0 then
        begin

        
          //获取方法名称
          ACProcedureStruct.ProcedureName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
          FixPointerName(ACProcedureStruct.ProcedureName,ACProcedureStruct.ProcedureDataType);
    //      ACProcedureStruct.ProcedureName:=ReplaceStr(ACProcedureStruct.ProcedureName,'*','{*}');
          ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));


          ExtractCProcedurePararmList(ATrimedCodeLine,ACProcedureStruct.ParamNames,ACProcedureStruct.ParamDataTypes,ACProcedureStruct);

          
//    //      ADevideIndex:=Pos(')',ATrimedCodeLine);
//          ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
//          if ADevideIndex>0 then
//          begin
//
//
//          
//            //分解出参数,参数以逗号分隔
//            ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
//
//            repeat
//              ADevideIndex:=Pos(' ',ATrimedCodeLine);
//              if ADevideIndex>0 then
//              begin
//                AParamDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex));
//    //            AParamDataType:=ReplaceStr(AParamDataType,')','');
//    //            AParamDataType:=ReplaceStr(AParamDataType,'(','');
//                AParamDataType:=RemoveAndFixBracketPair(AParamDataType);
//    //            ACProcedureStruct.ParamDataTypes.Add(AParamDataType);
//                ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
//
//                ADevideIndex:=Pos(',',ATrimedCodeLine);
//                if ADevideIndex>0 then
//                begin
//                  //还有参数
//    //              ACProcedureStruct.ParamNames.Add(ReplaceStr(
//                  AParamName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));//,'*','{*}'));
//                  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
//                end
//                else
//                begin
//                  //最后一个参数了
//    //              ACProcedureStruct.ParamNames.Add(ReplaceStr(
//                  AParamName:=Trim(Copy(ATrimedCodeLine,1,MaxInt));//,'*','{*}'));
//                end;
//                FixPointerName(AParamName,AParamDataType);
//                ACProcedureStruct.ParamNames.Add(AParamName);
//                ACProcedureStruct.ParamDataTypes.Add(AParamDataType) ;
//
//              end;
//            until Pos(' ',ATrimedCodeLine)<=0;
//
//
//
//            
//          end;

          
        end
        else if AEndIndex>0 then
        begin
              //没有参数
              ACProcedureStruct.ProcedureName:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));
              FixPointerName(ACProcedureStruct.ProcedureName,ACProcedureStruct.ProcedureDataType);
        //      ACProcedureStruct.ProcedureName:=ReplaceStr(ACProcedureStruct.ProcedureName,'*','{*}');
        end;
  end;
end;


procedure ExtractOCImportHeader(ACodeLine:String;AOCImportHeaderStruct:TOCImportHeaderStruct);
var
  //冒号下标
  ADevideIndex:Integer;
  ADevideEndIndex:Integer;
  ATrimedCodeLine:String;
  I: Integer;
begin
  AOCImportHeaderStruct.Clear;
  AOCImportHeaderStruct.OCCodeLine:=ACodeLine;
  AOCImportHeaderStruct.ObjectiveCCodeLines.Add(ACodeLine);

  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCImportHeaderStruct.Note);
  if ATrimedCodeLine='' then Exit;
  
//#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>
//#import "BMKUserLocation.h"

  //头文件名
  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,Length('#import')+1,MaxInt));
  ADevideIndex:=Pos('"',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    AOCImportHeaderStruct.IsCustomerHeaderFile:=True;
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

    ADevideIndex:=Pos('"',ATrimedCodeLine);
    if ADevideIndex>0 then
    begin
      AOCImportHeaderStruct.HeaderFileName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    end;
  end;

  ADevideIndex:=Pos('<',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    AOCImportHeaderStruct.IsCustomerHeaderFile:=False;
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

    ADevideIndex:=Pos('>',ATrimedCodeLine);
    if ADevideIndex>0 then
    begin
      AOCImportHeaderStruct.HeaderFileName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    end;
  end;

  //取出路径和头文件名
  ADevideEndIndex:=0;
  for I := Length(AOCImportHeaderStruct.HeaderFileName) downto 1 do
  begin
    if AOCImportHeaderStruct.HeaderFileName[I]='/' then
    begin
      AOCImportHeaderStruct.DirectoryName:=Copy(AOCImportHeaderStruct.HeaderFileName,1,I-1);
      AOCImportHeaderStruct.HeaderFileName:=Copy(AOCImportHeaderStruct.HeaderFileName,I+1,MaxInt);
      Break;
    end;
  end;


  //去掉.h
  AOCImportHeaderStruct.HeaderFileName:=Trim(AOCImportHeaderStruct.HeaderFileName);
  AOCImportHeaderStruct.HeaderFileName:=Copy(AOCImportHeaderStruct.HeaderFileName,1,Length(AOCImportHeaderStruct.HeaderFileName)-2);
  AOCImportHeaderStruct.HeaderFileName:=ReplaceStr(AOCImportHeaderStruct.HeaderFileName,'+','_');


end;


procedure ExtractOCEnum(ACodeLine:String;AOCEnumStruct:TOCEnumStruct);
var
  //冒号下标
  ADevideIndex:Integer;
  ADevideEndIndex:Integer;
  //大括号下标
  ABigBeginIndex:Integer;
  ABigEndIndex:Integer;
  ATrimedCodeLine:String;
  I: Integer;
  ASignIndex:Integer;
  AEnumIndex:Integer;
begin
  AOCEnumStruct.Clear;


  AOCEnumStruct.OCCodeLine:=ACodeLine;


  AOCEnumStruct.ObjectiveCCodeLines.Add(ACodeLine);


  //typedef enum TVoiceRecognitionClientErrorCode
  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCEnumStruct.Note);
  if ATrimedCodeLine='' then Exit;

  //以分号结束
  ADevideEndIndex:=Pos(';',ATrimedCodeLine);
  ABigBeginIndex:=Pos('{',ATrimedCodeLine);
  ABigEndIndex:=Pos('}',ATrimedCodeLine);

  //判断一行是否结束
  AOCEnumStruct.EnumHasEnd:=ADevideEndIndex>0;

  if AOCEnumStruct.EnumHasEnd then
  begin
    AOCEnumStruct.EnumTypeName:=Trim(Copy(ATrimedCodeLine,ABigEndIndex+1,ADevideEndIndex-ABigEndIndex-1));
    AOCEnumStruct.EnumValueList.Add(Copy(ATrimedCodeLine,ABigBeginIndex+1,ABigEndIndex-ABigBeginIndex-1));
  end
  else
  begin
    //没有结束,剩下的做为单独一行
    if (ABigBeginIndex>0) and (Trim(Copy(ATrimedCodeLine,ABigBeginIndex+1,MaxInt))<>'') then
    begin
        AOCEnumStruct.EnumValueList.Add(Copy(ATrimedCodeLine,ABigBeginIndex+1,MaxInt));
    end
    else
    begin
        //判断有没有括号
        ADevideEndIndex:=Pos(',',ATrimedCodeLine);
        ABigBeginIndex:=Pos('(',ATrimedCodeLine);
        ABigEndIndex:=Pos(')',ATrimedCodeLine);
        ASignIndex:=Pos(':',ATrimedCodeLine);
        AEnumIndex:=Pos('enum',ATrimedCodeLine);


        if (ABigBeginIndex>0) and (ABigEndIndex>0) then
        begin
          AOCEnumStruct.EnumValueList.Add('//'+Copy(ATrimedCodeLine,ABigBeginIndex,MaxInt));
          AOCEnumStruct.EnumTypeName:=Trim(Copy(ATrimedCodeLine,ADevideEndIndex+1,ABigEndIndex-ADevideEndIndex-1));
        end
        else if ASignIndex>0 then
        begin
          AOCEnumStruct.EnumTypeName:=Trim(Copy(ATrimedCodeLine,AEnumIndex+Length('enum')+1,ASignIndex-AEnumIndex-Length('enum')-1));
        end;



    end;
  end;

//'enum Epos2ErrorStatus : int {'


//typedef enum
//{
//    BMK_COORDTYPE_GPS = 0, ///GPS设备采集的原始GPS坐标
//    BMK_COORDTYPE_COMMON,  ///google地图、soso地图、aliyun地图、mapabc地图和amap地图所用坐标
//} BMK_COORD_TYPE;
//enum {
//    BMKMapTypeStandard   = 1,               ///< 标准地图
//    BMKMapTypeSatellite  = 2,               ///< 卫星地图
//};
//typedef NSUInteger BMKMapType;


end;

procedure ExtractOCStruct(ACodeLine:String;AOCStructStruct:TOCStructStruct);
var
  //冒号下标
  ADevideIndex:Integer;
  ADevideEndIndex:Integer;
  //大括号下标
  ABigBeginIndex:Integer;
  ABigEndIndex:Integer;
  ATrimedCodeLine:String;
  I: Integer;
begin
  AOCStructStruct.Clear;
  AOCStructStruct.OCCodeLine:=ACodeLine;
  AOCStructStruct.ObjectiveCCodeLines.Add(ACodeLine);

  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCStructStruct.Note);
  if ATrimedCodeLine='' then Exit;


  //以分号结束
  ADevideEndIndex:=Pos(';',ATrimedCodeLine);
  ABigBeginIndex:=Pos('{',ATrimedCodeLine);
  ABigEndIndex:=Pos('}',ATrimedCodeLine);

  AOCStructStruct.StructHasEnd:=ADevideEndIndex>0;

  if AOCStructStruct.StructHasEnd then
  begin
    AOCStructStruct.StructTypeName:=Trim(Copy(ATrimedCodeLine,ABigEndIndex+1,ADevideEndIndex-ABigEndIndex-1));
    AOCStructStruct.StructValueList.Add(Copy(ATrimedCodeLine,ABigBeginIndex+1,ABigEndIndex-ABigBeginIndex-1));
  end
  else
  begin
    //没有结束
    if (ABigBeginIndex>0) and (Trim(Copy(ATrimedCodeLine,ABigBeginIndex+1,MaxInt))<>'') then
    begin
      AOCStructStruct.StructValueList.Add(Copy(ATrimedCodeLine,ABigBeginIndex+1,MaxInt));
    end;
  end;


/////表示一个经纬度坐标点
//typedef struct {
//	int latitudeE6;		///< 纬度，乘以1e6之后的值
//	int longitudeE6;	///< 经度，乘以1e6之后的值
//} BMKGeoPoint;

end;

procedure ExtractOCTypedef(ACodeLine:String;AOCTypedefStruct:TOCTypedefStruct);
var
  //冒号下标
  ADevideIndex:Integer;
  ADevideEndIndex:Integer;
  ATrimedCodeLine:String;
  I: Integer;
begin
  AOCTypedefStruct.Clear;
  AOCTypedefStruct.OCCodeLine:=ACodeLine;
  AOCTypedefStruct.ObjectiveCCodeLines.Add(ACodeLine);

  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCTypedefStruct.Note);
  AOCTypedefStruct.Note:='//'+ACodeLine+#13#10
                          +AOCTypedefStruct.Note;
  if ATrimedCodeLine='' then Exit;



  //typedef NSUInteger BMKMapType;
  //typedef void(^SGQRCodeObtainScanResultBlock)(SGQRCodeObtain *obtain, NSString *result);
  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,Length('typedef')+1,MaxInt));
  ADevideIndex:=0;
  if Copy(ATrimedCodeLine,1,5)='void(' then
  begin
    ADevideIndex:=4+1;
    AOCTypedefStruct.SourceDataType:=Copy(ATrimedCodeLine,1,ADevideIndex-1);
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex,MaxInt));
  end
  else
  begin
    ADevideIndex:=Pos(' ',ATrimedCodeLine);
    if ADevideIndex>0 then
    begin
      AOCTypedefStruct.SourceDataType:=Copy(ATrimedCodeLine,1,ADevideIndex-1);
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    end;
  end;

  if ADevideIndex>0 then
  begin
    GetDataType(ATrimedCodeLine,AOCTypedefStruct.SourceDataType,AOCTypedefStruct);

    
//    if Copy(ATrimedCodeLine,1,1)='(' then
//    begin
//        //方法类型
//        //typedef void (^ getAllAlbumListBlock)(NSMutableArray<HXAlbumModel *> * _Nullable albums);
//
//          //特殊情况void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);
//
//
//
//          AOCTypedefStruct.FCEventStruct:=TCEventStruct.Create;
//
//          AOCTypedefStruct.FCEventStruct.ParseOCCodeLine(AOCTypedefStruct.SourceDataType+' '+ATrimedCodeLine);
////          if (AOCTypedefStruct.Owner<>nil)  then
////          begin
////            //获取参数列表
////            TOCClassStruct(AOCPropertyStruct.Owner).PreDatatypeDeclareStringList.AddStrings(ACEventStruct.GenerateODCodeLines);
////          end;
////          AOCPropertyStruct.PropertyDataType:=ACEventStruct.GetTypeName;
////          AOCPropertyStruct.NoteLines.Add('//'+ACEventStruct.GetODCodeLine);
////
////          ATrimedCodeLine:=ACEventStruct.ProcedureName+';';
//
//
//
//    end
//    else
//    begin
        //普通类型
        //typedef NSUInteger BMKMapType;
        ADevideIndex:=Pos(';',ATrimedCodeLine);
        if ADevideIndex>1 then
        begin
          AOCTypedefStruct.DestDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
          ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
          GetDataType(ATrimedCodeLine,AOCTypedefStruct.DestDataType,AOCTypedefStruct);
        end;
//    end;

    
  end;




end;

procedure ExtractOCClassName(ACodeLine:String;AOCClassNameStruct:TOCClassNameStruct);
var
  //冒号下标
  ADevideIndex:Integer;
  //圆括号下标
  ACircleIndex:Integer;
  //大括号下标
  ABigIndex:Integer;
  AEndIndex:Integer;
  ATrimedCodeLine:String;
begin
  AOCClassNameStruct.Clear;
  AOCClassNameStruct.OCCodeLine:=ACodeLine;
  AOCClassNameStruct.ObjectiveCCodeLines.Add(ACodeLine);

  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCClassNameStruct.Note);
  if ATrimedCodeLine='' then Exit;


  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,Length('@interface')+1,MaxInt));
  //'@interface BMKMapView : UIView',表示继承
  ADevideIndex:=Pos(':',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    //类名
    AOCClassNameStruct._ClassName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

    ACircleIndex:=Pos('(',ATrimedCodeLine);
    ABigIndex:=Pos('{',ATrimedCodeLine);
    AEndIndex:=Pos(';',ATrimedCodeLine);
    AOCClassNameStruct.ClassHasPrivateMember:=ABigIndex>0;
    //类是否只有声明语句
    AOCClassNameStruct.ClassHasEnd:=AEndIndex>0;


    if (ACircleIndex=0) and (ABigIndex=0) and (AEndIndex=0) then
    begin
      //父类名
      AOCClassNameStruct.ClassParentClassName:=Trim(ATrimedCodeLine);
    end;

    if (ACircleIndex>0) then
    begin
      //(协议,或者父类)
      AOCClassNameStruct.ClassParentClassName:=Trim(Copy(ATrimedCodeLine,1,ACircleIndex-1));
    end
    else if (ABigIndex>0) then
    begin
      //{内部成员
      AOCClassNameStruct.ClassParentClassName:=Trim(Copy(ATrimedCodeLine,1,ABigIndex-1));
    end
    else if (AEndIndex>0) then
    begin
      //声明结束了
      AOCClassNameStruct.ClassParentClassName:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));
    end;

    //去掉协议<>
    ADevideIndex:=Pos('<',AOCClassNameStruct.ClassParentClassName);
    if ADevideIndex>0 then
    begin
      AOCClassNameStruct.ClassParentProtocols:=Trim(Copy(AOCClassNameStruct.ClassParentClassName,ADevideIndex,MaxInt));
      AOCClassNameStruct.ClassParentClassName:=Trim(Copy(AOCClassNameStruct.ClassParentClassName,1,ADevideIndex-1));
    end;
    
  end
  else
  begin
    //'BMKMapView (LocationViewAPI)',表示实现
    ADevideIndex:=Pos('(',ATrimedCodeLine);
    if ADevideIndex>0 then
    begin
      //类名
      AOCClassNameStruct._ClassName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

      ACircleIndex:=Pos(')',ATrimedCodeLine);
      ABigIndex:=Pos('{',ATrimedCodeLine);
      AEndIndex:=Pos(';',ATrimedCodeLine);
      AOCClassNameStruct.ClassHasPrivateMember:=ABigIndex>0;
      //类是否只有声明语句
      AOCClassNameStruct.ClassHasEnd:=AEndIndex>0;


      if (ACircleIndex=0) and (ABigIndex=0) and (AEndIndex=0) then
      begin
        //父协
        AOCClassNameStruct.ClassParentProtocols:=Trim(ATrimedCodeLine);
      end;

      if (ACircleIndex>0) then
      begin
        //(协议,或者父类)
        AOCClassNameStruct.ClassParentProtocols:=Trim(Copy(ATrimedCodeLine,1,ACircleIndex-1));
      end
      else if (ABigIndex>0) then
      begin
        //{内部成员
        AOCClassNameStruct.ClassParentProtocols:=Trim(Copy(ATrimedCodeLine,1,ABigIndex-1));
      end
      else if (AEndIndex>0) then
      begin
        //声明结束了
        AOCClassNameStruct.ClassParentProtocols:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));
      end;

//      //去掉协议<>
//      ADevideIndex:=Pos('<',AOCClassNameStruct.ClassParentClassName);
//      if ADevideIndex>0 then
//      begin
//        AOCClassNameStruct.ClassParentProtocols:=Trim(Copy(AOCClassNameStruct.ClassParentClassName,ADevideIndex,MaxInt));
//        AOCClassNameStruct.ClassParentClassName:=Trim(Copy(AOCClassNameStruct.ClassParentClassName,1,ADevideIndex-1));
//      end;

    end;
  end;
end;


procedure ExtractOCProtocolName(ACodeLine:String;AOCProtocolNameStruct:TOCProtocolNameStruct);
var
  //冒号下标
  ADevideIndex:Integer;
  //圆括号下标
  ACircleIndex:Integer;
//  //大括号下标
//  ABigIndex:Integer;
  AEndIndex:Integer;
  ATrimedCodeLine:String;
begin
  AOCProtocolNameStruct.Clear;
  AOCProtocolNameStruct.OCCodeLine:=ACodeLine;
  AOCProtocolNameStruct.ObjectiveCCodeLines.Add(ACodeLine);


//@protocol BMKMapViewDelegate;

///雷达delegate
//@protocol BMKRadarManagerDelegate <NSObject>
//@optional
//@end



  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCProtocolNameStruct.Note);
  if ATrimedCodeLine='' then Exit;


  //去掉protocol
  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,Length('@protocol')+1,MaxInt));
  AEndIndex:=Pos(';',ATrimedCodeLine);
  //如果有分号，表示只有一个协议名称
  AOCProtocolNameStruct.ProtocolHasEnd:=AEndIndex>0;

  //协议的实现类
  ADevideIndex:=Pos('<',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    //协议名称
    AOCProtocolNameStruct.ProtocolName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));


    ACircleIndex:=Pos('>',ATrimedCodeLine);
    if (ACircleIndex<=0) then
    begin
      //如果实现类没有结果,那么这一行剩下的都是实现类名
      //@protocol BMKRadarManagerDelegate <NSObject
      //>
      AOCProtocolNameStruct.ProtocolImpleClassName:=Trim(ATrimedCodeLine);
    end
    else
    begin
      //实现类结束
      //@protocol BMKRadarManagerDelegate <NSObject>
      AOCProtocolNameStruct.ProtocolImpleClassName:=Trim(Copy(ATrimedCodeLine,1,ACircleIndex-1));
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ACircleIndex+1,MaxInt));
    end;

  end
  else
  begin
    //协议名称
    if AEndIndex=0 then
    begin
      AOCProtocolNameStruct.ProtocolName:=Trim(Copy(ATrimedCodeLine,1,MaxInt));
    end
    else
    begin
      AOCProtocolNameStruct.ProtocolName:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));
    end;

  end;
end;


procedure ExtractOCProperty(ACodeLine:String;AOCPropertyStruct:TOCPropertyStruct);
var
  //冒号下标
  I: Integer;
  ADevideIndex:Integer;
  ADescriptDevideBeginIndex:Integer;
  ADescriptDevideEndIndex:Integer;
  ATrimedCodeLine:String;
  APropertyDesciptionList:TStringList;
//  ACEventStruct:TCEventStruct;
begin
  AOCPropertyStruct.Clear;
  AOCPropertyStruct.OCCodeLine:=ACodeLine;
  AOCPropertyStruct.ObjectiveCCodeLines.Add(ACodeLine);

  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCPropertyStruct.Note);
  if ATrimedCodeLine='' then Exit;


  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,Length('@property')+1,MaxInt));

/////标注view中心坐标.
//@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
/////设定地图是否现实3D楼块效果
//@property(nonatomic, getter=isBuildingsEnabled) BOOL buildingsEnabled;
//@property (nonatomic, strong) id <BMKAnnotation> annotation;
//@property (nonatomic, getter=isDraggable) BOOL draggable __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2);
//@property (nonatomic, strong) NSArray<SuperPlayerUrl *> *multiVideoURLs;

  ADescriptDevideBeginIndex:=Pos('(',ATrimedCodeLine);
  ADescriptDevideEndIndex:=Pos(')',ATrimedCodeLine);



  //存在属性描述符,(nonatomic, strong)
  if (ADescriptDevideBeginIndex>0) and (ADescriptDevideEndIndex>0) then
  begin
        AOCPropertyStruct.PropertyDesciption:=Trim(Copy(ATrimedCodeLine,ADescriptDevideBeginIndex+1,ADescriptDevideEndIndex-ADescriptDevideBeginIndex-1));
        ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADescriptDevideEndIndex+1,MaxInt));

        APropertyDesciptionList:=TStringList.Create;
        APropertyDesciptionList.CommaText:=AOCPropertyStruct.PropertyDesciption;
        for I := 0 to APropertyDesciptionList.Count-1 do
        begin
          if Trim(APropertyDesciptionList[I])='readonly' then
          begin
            AOCPropertyStruct.PropertyIsReadOnly:=True;
          end;
          if Copy(Trim(APropertyDesciptionList[I]),1,Length('getter='))='getter=' then
          begin
            AOCPropertyStruct.GetterFunctionName:=Copy(Trim(APropertyDesciptionList[I]),Length('getter=')+1,MaxInt);
          end;
          if Copy(Trim(APropertyDesciptionList[I]),1,Length('setter='))='setter=' then
          begin
            //@property (nonatomic, assign, setter=setFullScreen:) BOOL isFullScreen;
            AOCPropertyStruct.SetterFunctionName:=Copy(Trim(APropertyDesciptionList[I]),Length('setter=')+1,MaxInt);
            //去掉后面的分号
            if Pos(':',AOCPropertyStruct.SetterFunctionName)>0 then
            begin
              AOCPropertyStruct.SetterFunctionName:=Copy(AOCPropertyStruct.SetterFunctionName,1,Length(AOCPropertyStruct.SetterFunctionName)-1);
            end;

          end;
        end;
        APropertyDesciptionList.Free;
  end;



  //数据类型,float等
  //@property (copy, nonatomic) void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);
  //特殊情况void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);
  //@property (nonatomic, copy) void(^splashBegan)(void);
  ADevideIndex:=Pos('(^',ATrimedCodeLine);
  if ADevideIndex=0 then
  begin
    ADevideIndex:=Pos(' ',ATrimedCodeLine);
  end;
  if ADevideIndex>0 then
  begin


      //'NSArray<SuperPlayerUrl'
      AOCPropertyStruct.PropertyDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      if Pos('(^',ATrimedCodeLine)=0 then
      begin
        ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
      end
      else
      begin
        ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex,MaxInt));
      end;


      GetDataType(ATrimedCodeLine,AOCPropertyStruct.PropertyDataType,AOCPropertyStruct);


      
      //是不是方法类型,数据类型后面跟一个(^ 方法名 )
      if (Copy(AOCPropertyStruct.PropertyDataType,1,1)='T')
        and (Copy(AOCPropertyStruct.PropertyDataType,Length(AOCPropertyStruct.PropertyDataType)-4,5)='Event') then
      begin
          //特殊情况void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);


          ATrimedCodeLine:=Copy(AOCPropertyStruct.PropertyDataType,2,Length(AOCPropertyStruct.PropertyDataType)-6)+';';


      end
      else
      //判断有没有模板类, id <BMKAnnotation>,NSArray<SuperPlayerUrl *>
      if Pos('<',AOCPropertyStruct.PropertyDataType)=0 then
      begin

          //ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

      end
      else
      begin
          ADevideIndex:=Pos('<',AOCPropertyStruct.PropertyDataType);

        //判断有没有类, id <BMKAnnotation>,NSArray<SuperPlayerUrl *>
  //      if (AOCPropertyStruct.PropertyDataType='id') and (ATrimedCodeLine<>'') then
  //      begin
//          ADevideIndex:=Pos('<',ATrimedCodeLine);
//          if ADevideIndex=1 then
//          begin
            ADevideIndex:=Pos('>',ATrimedCodeLine);
            AOCPropertyStruct.PropertyDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex));
            //要将NSArray<SuperPlayerUrl *>中的<>转换为{}
            AOCPropertyStruct.PropertyDataType:=ReplaceStr(AOCPropertyStruct.PropertyDataType,'<','{');
            AOCPropertyStruct.PropertyDataType:=ReplaceStr(AOCPropertyStruct.PropertyDataType,'>','}');

            ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
            GetDataType(ATrimedCodeLine,AOCPropertyStruct.PropertyDataType,AOCPropertyStruct);
//          end;
  //      end;


      end;
  end;



  // BOOL draggable __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2);
  //属性名称
  ADevideIndex:=Pos(' ',ATrimedCodeLine);
  if (ADevideIndex>0) then
  begin
//    if (ADevideIndex>0) then
//    begin
      AOCPropertyStruct.PropertyName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      //去掉类型的星号
      FixPointerName(AOCPropertyStruct.PropertyName,AOCPropertyStruct.PropertyDataType);
  //    AOCPropertyStruct.PropertyName:=ReplaceStr(AOCPropertyStruct.PropertyName,'*','{*}');

  //    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
//    end;

  end;


  //如果属性名称一直为空,那么剩下的就是属性名称
  if AOCPropertyStruct.PropertyName='' then
  begin
    ADevideIndex:=Pos(';',ATrimedCodeLine);

    if (ADevideIndex>0) then
    begin
      AOCPropertyStruct.PropertyName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      //去掉类型的星号
      FixPointerName(AOCPropertyStruct.PropertyName,AOCPropertyStruct.PropertyDataType);
  //    AOCPropertyStruct.PropertyName:=ReplaceStr(AOCPropertyStruct.PropertyName,'*','{*}');

  //    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    end;
  end
  else
  begin
    //__OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2)
    //舍去

  end;



end;


procedure ExtractOCVariable(ACodeLine:String;AOCVariableStruct:TOCVariableStruct);
var
  //冒号下标
  I: Integer;
  ADevideIndex:Integer;
  ADescriptDevideBeginIndex:Integer;
  ADescriptDevideEndIndex:Integer;
  ATrimedCodeLine:String;
//  AVariableDesciptionList:TStringList;
begin
  AOCVariableStruct.Clear;
  AOCVariableStruct.OCCodeLine:=ACodeLine;
  AOCVariableStruct.ObjectiveCCodeLines.Add(ACodeLine);

  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCVariableStruct.Note);
  if ATrimedCodeLine='' then Exit;


//    BMKMapPoint origin; ///< 屏幕左上点对应的直角地理坐标
  //数据类型
  ADevideIndex:=Pos(' ',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    AOCVariableStruct.VariableDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    GetDataType(ATrimedCodeLine,AOCVariableStruct.VariableDataType,AOCVariableStruct);
  end;

  //属性名称
  ADevideIndex:=Pos(';',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    AOCVariableStruct.VariableName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    //去掉类型的星号
    AOCVariableStruct.VariableName:=ReplaceStr(AOCVariableStruct.VariableName,'*','');//'{*}');
    FixPointerName(AOCVariableStruct.VariableName,AOCVariableStruct.VariableDataType);
//    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
  end;

end;




procedure ExtractOCConst(ACodeLine:String;AOCConstStruct:TOCConstStruct);
var
  //冒号下标
  I: Integer;
  ADevideIndex:Integer;
  ADescriptDevideBeginIndex:Integer;
  ADescriptDevideEndIndex:Integer;
  ATrimedCodeLine:String;
  AConstDesciptionList:TStringList;
  ASpace1Index:Integer;
//  ASpace2Index:Integer;
begin
  AOCConstStruct.Clear;
  AOCConstStruct.OCCodeLine:=ACodeLine;
  AOCConstStruct.ObjectiveCCodeLines.Add(ACodeLine);

  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCConstStruct.Note);
  if ATrimedCodeLine='' then Exit;




  ASpace1Index:=Pos('extern ',ATrimedCodeLine);
  if ASpace1Index>0 then
  begin
    AOCConstStruct.ConstType:='extern';
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ASpace1Index+Length('extern '),MaxInt));
  end;


  ASpace1Index:=Pos('const ',ATrimedCodeLine);
  if ASpace1Index>0 then
  begin
      //万一空了很多空格
    //  ASpace2Index:=PosEx(' ',ATrimedCodeLine,ASpace1Index+1);
    //  ADevideIndex:=Pos(')',ATrimedCodeLine);
      if ASpace1Index>0 then//(ASpace2Index<>-1) and (ASpace2Index<ADevideIndex) then
      begin
        //有方法类型 UIKIT_EXTERN
        //方法类型
        AOCConstStruct.ConstType:=Trim(Copy(ATrimedCodeLine,1,ASpace1Index-1));
        ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ASpace1Index+Length('const '),MaxInt));
    //  end
    //  else
    //  begin
    //    //没有方法类型
      end;
  end;






///// 经过投影后的世界范围大小，与经纬度（-85，180）投影后的坐标值对应
//UIKIT_EXTERN const BMKMapSize BMKMapSizeWorld;
///// 经过投影后的世界矩形范围
//UIKIT_EXTERN const BMKMapRect BMKMapRectWorld;
///// 空的直角坐标矩形
//UIKIT_EXTERN const BMKMapRect BMKMapRectNull;


  //数据类型
  ADevideIndex:=Pos(' ',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    AOCConstStruct.ConstDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    GetDataType(ATrimedCodeLine,AOCConstStruct.ConstDataType,AOCConstStruct);
  end;



  //属性名称
  ADevideIndex:=Pos(';',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    AOCConstStruct.ConstName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    //去掉类型的星号
    //AOCConstStruct.ConstName:=ReplaceStr(AOCConstStruct.ConstName,'*','{*}');
    FixPointerName(AOCConstStruct.ConstName,AOCConstStruct.ConstDataType);
  end;



end;




procedure ExtractOCDefine(ACodeLine:String;AOCDefineStruct:TOCDefineStruct);
var
  I: Integer;
  ADevideIndex:Integer;
  ATrimedCodeLine:String;
  ASpace1Index:Integer;
begin

//#define EPOS2_FALSE (0)


  AOCDefineStruct.Clear;
  AOCDefineStruct.OCCodeLine:=ACodeLine;
  AOCDefineStruct.ObjectiveCCodeLines.Add(ACodeLine);

  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCDefineStruct.Note);
  if ATrimedCodeLine='' then Exit;


  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,Length('#define '),MaxInt));

  ASpace1Index:=Pos(' ',ATrimedCodeLine);
  //万一空了很多空格
//  ASpace2Index:=PosEx(' ',ATrimedCodeLine,ASpace1Index+1);
//  ADevideIndex:=Pos(')',ATrimedCodeLine);
  if ASpace1Index>0 then//(ASpace2Index<>-1) and (ASpace2Index<ADevideIndex) then
  begin
    //常量名
    AOCDefineStruct.DefineName:=Trim(Copy(ATrimedCodeLine,1,ASpace1Index-1));
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ASpace1Index,MaxInt));
  end;


  //值
  ADevideIndex:=Pos('(',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

    ADevideIndex:=Pos(')',ATrimedCodeLine);
    if ADevideIndex>0 then
    begin
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    end;
  end;

  AOCDefineStruct.DefineValue:=ATrimedCodeLine;

  //如果是十六进制0x,转成Delphi的$
  if Copy(ATrimedCodeLine,1,2)='0x' then
  begin
    AOCDefineStruct.DefineValue:='$'+Copy(ATrimedCodeLine,3,MaxInt);
  end;



  AOCDefineStruct.Note:=AOCDefineStruct.Note+' //'+ACodeLine;


end;

function RemoveAndFixBracketPair(ADataType:String;AOCElementStruct:TOCElementStruct):String;
var
  ACEventStruct:TCEventStruct;
begin
  Result:=Copy(ADataType,2,Length(ADataType)-2);

  if Pos('(^',ADataType)>0 then
  begin
    //判断该数据类型是否是方法类型
    //GetDataType(ADataType,ADataType,AOCProcedureStruct);
    ACEventStruct:=TCEventStruct.Create;
    ACEventStruct.ParseOCCodeLine(Result);
    if AOCElementStruct.Owner<>nil then
    begin
      AOCElementStruct.Owner.PreDatatypeDeclareStringList.Add(ACEventStruct.GetODCodeLine);
    end
    else
    begin
      AOCElementStruct.PreDatatypeDeclareStringList.Add(ACEventStruct.GetODCodeLine);
    end;
    Result:=ACEventStruct.GetTypeName();
    ACEventStruct.Free;
  end;

end;

//找括号成对的结束
function FindBracketPairEnd(ABracketBegin,ABracketEnd:Char;ACodeLine:String;APosStartIndex:Integer=1):Integer;
var
  I: Integer;
  StartIndex:Integer;
  BracketCount:Integer;
begin
  Result:=-1;

  StartIndex:=PosEx(ABracketBegin,ACodeLine,APosStartIndex);
  if StartIndex<>-1 then
  begin
    BracketCount:=1;
    for I := StartIndex+1 to Length(ACodeLine) do
    begin
      if ACodeLine[I]=ABracketBegin then
      begin
        BracketCount:=BracketCount+1;
      end;
      if ACodeLine[I]=ABracketEnd then
      begin
        BracketCount:=BracketCount-1;
        if BracketCount=0 then
        begin
          Result:=I;
          Break;
        end;
      end;
    end;
  end;
end;

function CreateGUIDStr:String;
var
  guid:TGUID;
begin
  CreateGUID(guid);
  Result:=GUIDToString(guid);
end;

function ConvertOCTypeToODType(AOCDataType:String;Owner:TOCElementStruct):String;
var
  ADevideBeginIndex:Integer;
  ADevideEndIndex:Integer;
  HasStar:Boolean;
  HasAngle:Boolean;
begin
  Result:=AOCDataType;


  //NSString * _Nonnull
//  Result:=ReplaceStr(Result,' * _Nonnull','{ * _Nonnull}');
//  Result:=ReplaceStr(Result,' * _Nullable','{ * _Nullable}');
//  Result:=ReplaceStr(Result,' * _Nullable','{ * _Nullable}');
//  NSString * _Nonnull  ->  {_Nonnull} NSString * 
//  以便去掉最后一个*
  if Pos('_Nonnull',Result)>0 then
  begin
    Result:=ReplaceStr(Result,'_Nonnull','');
    Result:='{_Nonnull}'+Result;
  end;
  if Pos('_Nullable',Result)>0 then
  begin
    Result:=ReplaceStr(Result,'_Nullable','');
    Result:='{_Nullable}'+Result;
  end;
  if Pos('nullable',Result)>0 then
  begin
    Result:=ReplaceStr(Result,'nullable','');
    Result:='{nullable}'+Result;
  end;
  Result:=Trim(Result);
  

  //去掉最后一个*
  //比如NSString*，转成Delphi中的是NSString
  HasStar:=False;
  if Copy(Result,Length(Result),1)='*' then
  begin
    HasStar:=True;
    Result:=Trim(Copy(Result,1,Length(Result)-1));
  end;



  //转换成Delphi的数据类型
  if Result='int' then
  begin
    Result:='Integer';
  end;
  if Result='BOOL' then
  begin
    Result:='Boolean';
  end;
  if Result='bool' then
  begin
    Result:='Boolean';
  end;
  if Result='float' then
  begin
    Result:='single';
  end;
  if Result='uint8_t' then
  begin
    Result:='Byte';
  end;
  if Result='int32_t' then
  begin
    Result:='Integer';
  end;
  if Result='long long' then
  begin
    Result:='Int64';
  end;



  if (Result='instancetype') and (Owner<>nil) then
  begin
    if (Owner is TOCProcedureStruct) and (TOCProcedureStruct(Owner).Owner<>nil) then
    begin
      Result:=TOCClassStruct(TOCProcedureStruct(Owner).Owner).OCClassNameStruct._ClassName;
    end;
  end;



  if ParsedAllDataTypes.IndexOf(Result)=-1 then
  begin
    ParsedAllDataTypes.Add(Result);
  end;


  //id<
  if (copy(Result,1,Length('id<'))='id<') or (copy(Result,1,Length('id '))='id ') then
  begin
    ADevideBeginIndex:=Pos('<',AOCDataType);
    ADevideEndIndex:=Pos('>',AOCDataType);
    Result:=Trim(Copy(AOCDataType,ADevideBeginIndex+1,ADevideEndIndex-ADevideBeginIndex-1));

    Result:='P'+Result;
    //需要添加这个声明了
    if ParsedPointerDataTypes.IndexOf(Result)=-1 then
    begin
      ParsedPointerDataTypes.Add(Result);
    end;

    Result:=Result+'{id<'+Copy(Result,2,MaxInt)+'>}';
  end;


  //Class
  if SameText(Result,'Class') then
  begin
    Result:='P'+Result;
    //需要添加这个声明了
    if ParsedPointerDataTypes.IndexOf(Result)=-1 then
    begin
      ParsedPointerDataTypes.Add(Result);
    end;
  end;


  if HasStar then
  begin
      //NSArray,NSString都不需要
      if (Result='NSDictionary') then
      begin
        Result:='P'+Result;
        //需要添加这个声明了
        if ParsedPointerDataTypes.IndexOf(Result)=-1 then
        begin
          ParsedPointerDataTypes.Add(Result);
        end;
      end;

//    Result:=Result+'{*}';
  end;


  //NSArray<HXPhotoModel *>
  //转换成NSArray{<HXPhotoModel *>}
  //是模板类,有一对尖括号
  if (Pos('<',Result)>0) and (Pos('>',Result)>0) then
  begin
//    ADevideBeginIndex:=Pos('<',Result);
//    ADevideEndIndex:=Pos('>',Result);
    Result:=ReplaceStr(Result,'<','{<');
    Result:=ReplaceStr(Result,'>','>}');
  end;



end;

{ TOCProcedureStruct }

procedure TOCProcedureStruct.Clear;
begin
  Inherited;

  Imple.Clear;

  ProcedureHasEnd:=False;
  
  ProcedureType:='';
  ProcedureDataType:='';
  ProcedureName:='';
  FirstParamName:='';
  FirstParamDataType:='';
  OtherProcedureNames.Clear;
  OtherParamNames.Clear;
  OtherParamDataTypes.Clear;

end;

constructor TOCProcedureStruct.Create;
begin
  inherited;
//  IsAddCdecl:=True;
  Imple:=TStringList.Create;

  //其他的方法名称
  OtherProcedureNames:=TStringList.Create;
  //其他的参数名称
  OtherParamNames:=TStringList.Create;
  //其他的参数数据类型
  OtherParamDataTypes:=TStringList.Create;

end;

destructor TOCProcedureStruct.Destroy;
begin
  Imple.Free;

  //其他的方法名称
  OtherProcedureNames.Free;
  //其他的参数名称
  OtherParamNames.Free;
  //其他的参数数据类型
  OtherParamDataTypes.Free;

  inherited;
end;

function TOCProcedureStruct.GetDeclareEventDataType: String;
var
  I:Integer;
begin
//  TOnmapViewviewForOverlayEvent=function(mapView:BMKMapView;overlay:Pointer):BMKOverlayView of object;//cdecl;
//  TOnmapviewForAnnotationEvent=function(annotation:Pointer):BMKAnnotationView of object;//;cdecl;
  //
  Result:='T'+'On'+Self.GetProcedureName+'=';
  //方法返回值
  if ProcedureDataType='void' then
  begin
    Result:=Result+'procedure';
  end
  else
  begin
    Result:=Result+'function';
  end;
  Result:=Result+Self.GetDeclareParamsStr;//+'(';
//
//  if FirstParamDataType<>'' then
//  begin
//    //第一个参数
//    Result:=Result+FirstParamName+':'+ConvertOCTypeToODType(FirstParamDataType);
//    //其他参数列表
//    for I := 0 to OtherParamNames.Count-1 do
//    begin
//      Result:=Result+';';
//      Result:=Result+OtherParamNames[I]+':'+ConvertOCTypeToODType(OtherParamDataTypes[I]);
//    end;
//  end;
//  Result:=Result+')';

  //方法返回值
  if ProcedureDataType='void' then
  begin
  end
  else
  begin
    Result:=Result+':'+ConvertOCTypeToODType(ProcedureDataType);
  end;

  Result:=Result+' of object;';

end;

function TOCProcedureStruct.GetDeclareEventMember: String;
begin
  //OnmapViewviewForOverlayEvent:TOnmapViewviewForOverlayEvent;
  Result:='On'+Self.GetProcedureName+':'+'T'+'On'+Self.GetProcedureName+';';
end;

function TOCProcedureStruct.GetImple: TStringList;
begin
  if Imple.Count=0 then
  begin
    Imple.Add(GetMethodType+' '+'T'+OwnerName+'.'+Self.GetProcedureName+Self.GetDeclareParamsStr+GetMethodDataType);
    Imple.Add('begin');
    Imple.Add(Const_Tab_Char+'if Assigned('+'On'+Self.GetProcedureName+') then');
    Imple.Add(Const_Tab_Char+'begin');

    if ProcedureDataType='void' then
    begin
      Imple.Add(Const_Tab_Char+Const_Tab_Char+'On'+Self.GetProcedureName+'('+GetParamListStr+');');
    end
    else
    begin
      Imple.Add(Const_Tab_Char+Const_Tab_Char+'Result:=On'+Self.GetProcedureName+'('+GetParamListStr+');');
    end;

    Imple.Add(Const_Tab_Char+'end;');
    Imple.Add('end;');
  end;
  Result:=Imple;
end;

function TOCProcedureStruct.GetMethodDataType: String;
begin
  if ProcedureDataType='void' then
  begin
    Result:=';';
  end
  else
  begin
    Result:=':'+ConvertOCTypeToODType(ProcedureDataType,Self)+';';
  end;



end;

function TOCProcedureStruct.GetMethodType: String;
begin
  //返回值数据类型
  if ProcedureDataType='void' then
  begin
    //过程procedure
    Result:='procedure ';
  end
  else
  begin
    //函数function
    Result:='function ';
  end;
end;

function TOCProcedureStruct.GenerateODCodeLines: TStringList;
var
  I:Integer;
  AComposeFunctionName:String;
begin
  if (ODCodeLine<>'') or (ProcedureName='') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;


    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);


    AComposeFunctionName:='';
    if OtherProcedureNames.Count>0 then
    begin
      //有多个参数,代码行前面要加[MethodName]
      AComposeFunctionName:='';
      for I := 0 to OtherProcedureNames.Count-1 do
      begin
        AComposeFunctionName:=AComposeFunctionName+OtherProcedureNames[I]+':';
      end;
      AComposeFunctionName:='[MethodName('''+ProcedureName+':'+AComposeFunctionName+''')]';
      ODCodeLines.Add(AComposeFunctionName);
    end
    else
    begin
      //判断一下是否是关键字
      if DelphiKeywords.IndexOf(LowerCase(ProcedureName))<>-1 then
      begin
        ODCodeLines.Add('[MethodName('''+ProcedureName+':'+''')]');
      end;
    end;




    AComposeFunctionName:='';
    //类型注释掉
//    AComposeFunctionName:='{'+ProcedureType+'} ';

    //返回值数据类型
    //过程procedure
    AComposeFunctionName:=AComposeFunctionName+GetMethodType;



    //方法名
    AComposeFunctionName:=AComposeFunctionName+FixDelphiKeywordName(GetProcedureName);


    if FirstParamDataType<>'' then
    begin
      //第一个参数
      AComposeFunctionName:=AComposeFunctionName+GetDeclareParamsStr;
    end;

    //方法返回值
    AComposeFunctionName:=AComposeFunctionName+GetMethodDataType;


    AComposeFunctionName:=AComposeFunctionName+'cdecl;';

    ODCodeLines.Add(AComposeFunctionName);


    Result:=Inherited;

    ODCodeLine:=ODCodeLines.CommaText;
  end;

  ODCodeLines.Add('');
end;

function TOCProcedureStruct.GetDeclareParamsStr: String;
var
  I:Integer;
begin
//  TOnmapViewviewForOverlayEvent=function(mapView:BMKMapView;overlay:Pointer):BMKOverlayView of object;//cdecl;
//  TOnmapviewForAnnotationEvent=function(annotation:Pointer):BMKAnnotationView of object;//;cdecl;


  Result:='(';

  if FirstParamDataType<>'' then
  begin
    //第一个参数
    Result:=Result+FixDelphiKeywordName(FirstParamName)+':'+ConvertOCTypeToODType(FirstParamDataType);
    //其他参数列表
    for I := 0 to OtherParamNames.Count-1 do
    begin
      Result:=Result+';';
      Result:=Result+FixDelphiKeywordName(OtherParamNames[I])+':'+ConvertOCTypeToODType(OtherParamDataTypes[I]);
    end;
  end;
  Result:=Result+')';

end;

function TOCProcedureStruct.GetParamListStr: String;
var
  I: Integer;
begin
  Result:='';
  if FirstParamName<>'' then
  begin
    Result:=FixDelphiKeywordName(Self.FirstParamName);
    if Self.OtherParamNames.Count>0 then
    begin
      for I := 0 to OtherParamNames.Count-1 do
      begin
        Result:=Result+','+FixDelphiKeywordName(OtherParamNames[I]);
      end;
    end;
  end;
end;

function TOCProcedureStruct.GetProcedureName: String;
var
  I:Integer;
begin
  Result:=Self.ProcedureName;
  for I := 0 to OtherProcedureNames.Count-1 do
  begin
    Result:=Result+OtherProcedureNames[I];
  end;
end;

procedure TOCProcedureStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractOCProcedure(ACodeLine,Self);
end;

procedure TOCProcedureStruct.ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);
var
  ACodeLine:String;
  I: Integer;  
  ANote:String;
begin
  inherited;

  //连接断行
  ACodeLine:='';
  for I := 0 to AObjectiveCCodeLines.Count-1 do
  begin
    ACodeLine:=ACodeLine+' '+RemoveNote(AObjectiveCCodeLines[I],ANote);
    Note:=Note+ANote;
  end;
  ParseOCCodeLine(ACodeLine);

end;

{ TOCCodeLineElementStruct }

procedure TOCCodeLineElementStruct.Clear;
begin
  //要注释掉
//  Inherited;

  Note:='';
  ODCodeLine:='';
  OCCodeLine:='';
end;

procedure TOCCodeLineElementStruct.ParseOCCodeLine(ACodeLine: String);
begin
  Clear;
  OCCodeLine:=ACodeLine;
  ObjectiveCCodeLines.Add(ACodeLine);
end;

{ TOCProtocolStruct }

procedure TOCProtocolStruct.Clear;
var
  I: Integer;
begin
  inherited;
//  CodeLines.Clear;
//  ODCodeLines.Clear;
  OCProtocolNameStruct.Clear;
  for I := 0 to OCCodeLineElementStructList.Count-1 do
  begin
    TObject(OCCodeLineElementStructList[I]).Free;
  end;
  OCCodeLineElementStructList.Clear;
end;

constructor TOCProtocolStruct.Create;
begin
  inherited;
  Imple:=TStringList.Create;
//  IsAddCdecl:=True;

  OCProtocolNameStruct:=TOCProtocolNameStruct.Create;
  OCCodeLineElementStructList:=TList.Create;

end;

destructor TOCProtocolStruct.Destroy;
begin
  Clear;

  Imple.Free;
  OCProtocolNameStruct.Free;
  OCCodeLineElementStructList.Free;
  inherited;
end;

function TOCProtocolStruct.GetImple: TStringList;
var
  I: Integer;
begin
  if not Self.OCProtocolNameStruct.ProtocolHasEnd and (Imple.Count=0) then
  begin
    Imple.Add('{ T'+Self.OCProtocolNameStruct.ProtocolName+' }');
    Imple.Add('');
    Imple.Add('constructor T'+Self.OCProtocolNameStruct.ProtocolName+'.Create;');
    Imple.Add('begin');
    Imple.Add(Const_Tab_Char+'Inherited Create;');
    Imple.Add('end;');
    Imple.Add('');
    Imple.Add('destructor T'+Self.OCProtocolNameStruct.ProtocolName+'.Destroy;');
    Imple.Add('begin');
    Imple.Add(Const_Tab_Char+'Inherited;');
    Imple.Add('end;');
    Imple.Add('');

    for I := 0 to Self.OCCodeLineElementStructList.Count-1 do
    begin
      if TOCElementStruct(OCCodeLineElementStructList[I]) is TOCProcedureStruct then
      begin
        TOCProcedureStruct(OCCodeLineElementStructList[I]).OwnerName:=Self.OCProtocolNameStruct.ProtocolName;
        Imple.AddStrings(TOCProcedureStruct(OCCodeLineElementStructList[I]).GetImple);
        Imple.Add('');
      end;
      if TOCElementStruct(OCCodeLineElementStructList[I]) is TOCPropertyStruct then
      begin
        TOCPropertyStruct(OCCodeLineElementStructList[I]).OwnerName:=Self.OCProtocolNameStruct.ProtocolName;
        Imple.AddStrings(TOCPropertyStruct(OCCodeLineElementStructList[I]).GetImple);
        Imple.Add('');
      end;
    end;
    Imple.Add('');
  end;
  Result:=Imple;
end;

function TOCProtocolStruct.GenerateODCodeLines: TStringList;
var
  I,J: Integer;
  AODCodeLines:TStringList;
begin

  if (Self.ODCodeLines.Count>0) or (Self.OCProtocolNameStruct.ProtocolName='') then
  begin
    Result:=Inherited;
  end
  else
  begin
        AODCodeLines:=TStringList.Create;

        ODCodeLines.Clear;


//        CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);



        if OCProtocolNameStruct.ProtocolHasEnd then
        begin
              ODCodeLines.Add('//'+OCProtocolNameStruct.OCCodeLine);
        end
        else
        begin


              //接口,声明
              OCProtocolNameStruct.CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);
              ODCodeLines.Add(OCProtocolNameStruct.ProtocolName+'=interface(IObjectiveC)'+OCProtocolNameStruct.Note);


              ODCodeLines.Add(Const_Tab_Char+'['''+CreateGUIDStr+''']');



              for I := 0 to Self.OCCodeLineElementStructList.Count-1 do
              begin
        //        if TOCElementStruct(OCCodeLineElementStructList[I]) is TOCProcedureStruct then
        //        begin
        //          TOCProcedureStruct(OCCodeLineElementStructList[I]).IsAddCdecl:=True;
        //        end;
                AODCodeLines.Assign(TOCElementStruct(OCCodeLineElementStructList[I]).GenerateODCodeLines);
                for J := 0 to AODCodeLines.Count-1 do
                begin
                  AODCodeLines[J]:=Const_Tab_Char+AODCodeLines[J];
                end;
                ODCodeLines.AddStrings(AODCodeLines);
              end;
              ODCodeLines.Add('end;');
              ODCodeLines.Add('');




              //事件类型声明
              for I := 0 to Self.OCCodeLineElementStructList.Count-1 do
              begin
                if TOCElementStruct(OCCodeLineElementStructList[I]) is TOCProcedureStruct then
                begin
                  ODCodeLines.Add(TOCProcedureStruct(OCCodeLineElementStructList[I]).GetDeclareEventDataType);
                end;
                if TOCElementStruct(OCCodeLineElementStructList[I]) is TOCPropertyStruct then
                begin
                  ODCodeLines.Add(TOCPropertyStruct(OCCodeLineElementStructList[I]).GetDeclareEventDataType_Get);
                  ODCodeLines.Add(TOCPropertyStruct(OCCodeLineElementStructList[I]).GetDeclareEventDataType_Set);
                end;
              end;
              ODCodeLines.Add('');




              //实现
              ODCodeLines.Add('T'+OCProtocolNameStruct.ProtocolName+'=class(TOCLocal,'+OCProtocolNameStruct.ProtocolName+')'+OCProtocolNameStruct.Note);
              ODCodeLines.Add('public');
              ODCodeLines.Add(Const_Tab_Char+'constructor Create;');
              ODCodeLines.Add(Const_Tab_Char+'destructor Destroy;override;');
              ODCodeLines.Add('public');
              //事件成员
              for I := 0 to Self.OCCodeLineElementStructList.Count-1 do
              begin
                if TOCElementStruct(OCCodeLineElementStructList[I]) is TOCProcedureStruct then
                begin
                  ODCodeLines.Add(Const_Tab_Char+TOCProcedureStruct(OCCodeLineElementStructList[I]).GetDeclareEventMember);
                end;
                if TOCElementStruct(OCCodeLineElementStructList[I]) is TOCPropertyStruct then
                begin
                  ODCodeLines.Add(Const_Tab_Char+TOCPropertyStruct(OCCodeLineElementStructList[I]).GetDeclareEventMember_Get);
                  ODCodeLines.Add(Const_Tab_Char+TOCPropertyStruct(OCCodeLineElementStructList[I]).GetDeclareEventMember_Set);
                end;
              end;
              ODCodeLines.Add('');
              for I := 0 to Self.OCCodeLineElementStructList.Count-1 do
              begin
                AODCodeLines.Assign(TOCElementStruct(OCCodeLineElementStructList[I]).GenerateODCodeLines);
                for J := 0 to AODCodeLines.Count-1 do
                begin
                  AODCodeLines[J]:=Const_Tab_Char+AODCodeLines[J];
                end;
                ODCodeLines.AddStrings(AODCodeLines);
              end;
              ODCodeLines.Add('end;');
              ODCodeLines.Add('');





              //加入间隔
              ODCodeLines.Add('');
              ODCodeLines.Add('');
              ODCodeLines.Add('');
              ODCodeLines.Add('');





              AODCodeLines.Free;
        end;

        Result:=Inherited;

  end;
end;

procedure TOCProtocolStruct.ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);
var
  I:Integer;
  ANote:String;
  ACodeLine:String;
  AStructCodeLines:TStringList;
  AOCElementStruct:TOCElementStruct;

  ANewLineBeginType:TOCCodeLineBeginType;
begin

  Inherited;


  AStructCodeLines:=TStringList.Create;

  I:=0;
  while I <AObjectiveCCodeLines.Count do
  begin

      //没有到类头
      ANewLineBeginType:=CheckOCCodeLineBeginType(AObjectiveCCodeLines[I]);

      //不是类成员
      case ANewLineBeginType of
        cltNone,cltSpace:
        begin
          AOCElementStruct:=TOCNoneStruct.Create;
          AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltNoUse:
        begin
          AOCElementStruct:=TOCNoteStruct.Create;
          AOCElementStruct.ParseOCCodeLine('//'+AObjectiveCCodeLines[I]);
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltNote:
        begin
          AOCElementStruct:=TOCNoteStruct.Create;
          AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltNoteBegin:
        begin
          AStructCodeLines.Clear;
          ACodeLine:=ReplaceStr(AObjectiveCCodeLines[I],'/*','{');
          if Pos('*/',ACodeLine)>0 then
          begin
            //注释结束
            ACodeLine:=ReplaceStr(ACodeLine,'*/','}');
            AStructCodeLines.Add(ACodeLine);
          end
          else
          begin
            AStructCodeLines.Add(ACodeLine);
            //注释没有结束
            repeat
              Inc(I);
              if Pos('*/',AObjectiveCCodeLines[I])>0 then
              begin
                ACodeLine:=ReplaceStr(AObjectiveCCodeLines[I],'*/','}');
                AStructCodeLines.Add(ACodeLine);
              end
              else
              begin
                AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              end;
            until (Pos('*/',AObjectiveCCodeLines[I])>0) or (I >=AObjectiveCCodeLines.Count);
          end;

          AOCElementStruct:=TOCNoteStruct.Create;
          AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltProtocolBegin:
        begin
          Self.OCProtocolNameStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
        end;
        cltProperty:
        begin
          AOCElementStruct:=TOCPropertyStruct.Create;
          AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltProcedure:
        begin
          AOCElementStruct:=TOCProcedureStruct.Create;
//          TOCProcedureStruct(AOCElementStruct).OwnerName:=Self.OCProtocolNameStruct.ProtocolName;
//          AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
//          Self.OCCodeLineElementStructList.Add(AOCElementStruct);

          TOCProcedureStruct(AOCElementStruct).ParseOCCodeLine(AObjectiveCCodeLines[I]);
          
          if Not TOCProcedureStruct(AOCElementStruct).ProcedureHasEnd then
          begin
            //协议没有一行就结束
            AStructCodeLines.Clear;
            AStructCodeLines.Add(AObjectiveCCodeLines[I]);
            repeat
              Inc(I);
              AStructCodeLines.Add(AObjectiveCCodeLines[I]);
            until (Pos(';',AObjectiveCCodeLines[I])>0) or (I >=AObjectiveCCodeLines.Count);
            AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
//            AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
          end;
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltEnd:
        begin
          //
        end;

      end;

      Inc(I);
  end;

  AStructCodeLines.Free;


end;

{ TOCClassStruct }

procedure TOCClassStruct.Clear;
var
  I: Integer;
begin
  inherited;
  OCClassNameStruct.Clear;
  for I := 0 to OCCodeLineElementStructList.Count-1 do
  begin
    TObject(OCCodeLineElementStructList[I]).Free;
  end;
  OCCodeLineElementStructList.Clear;

end;

constructor TOCClassStruct.Create;
begin
  inherited;
  OCClassNameStruct:=TOCClassNameStruct.Create;
  OCCodeLineElementStructList:=TList.Create;
end;

destructor TOCClassStruct.Destroy;
begin
  Clear;
  OCClassNameStruct.Free;
  OCCodeLineElementStructList.Free;
  inherited;
end;

function TOCClassStruct.GetImple: String;
begin
  if not Self.OCClassNameStruct.ClassHasEnd then
  begin
//  function BMKMapView_FakeLoader : BMKMapView; cdecl; external {$I BaiduMapDylibName.inc} name 'OBJC_CLASS_$_BMKMapView';
  Result:='function '+Self.OCClassNameStruct._ClassName+'_FakeLoader : '+Self.OCClassNameStruct._ClassName+'; cdecl; external '
        +StaticLibraryName+' name ''OBJC_CLASS_$_'+Self.OCClassNameStruct._ClassName+''';';
  end;
end;

function TOCClassStruct.GenerateODCodeLines: TStringList;
var
  I,J: Integer;
  AODCodeLines:TStringList;
begin

  if (Self.ODCodeLines.Count>0) or (Self.OCClassNameStruct._ClassName='') then
  begin
    Result:=Inherited;
  end
  else
  begin


    AODCodeLines:=TStringList.Create;
    ODCodeLines.Clear;


//    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);


    if OCClassNameStruct.ClassHasEnd then
    begin
      ODCodeLines.Add('//'+OCClassNameStruct.OCCodeLine);
    end
    else
    begin


          //对象方法
          OCClassNameStruct.CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);
          ODCodeLines.Add(OCClassNameStruct._ClassName+'=interface('+OCClassNameStruct.ClassParentClassName+')'+'//'+OCClassNameStruct.ClassParentProtocols+OCClassNameStruct.Note);
          ODCodeLines.Add('['''+CreateGUIDStr+''']');



          for I := 0 to Self.OCCodeLineElementStructList.Count-1 do
          begin
            if TObject(OCCodeLineElementStructList[I]) is TOCProcedureStruct then
            begin
              if TOCProcedureStruct(OCCodeLineElementStructList[I]).ProcedureType='-' then
              begin
                AODCodeLines.Assign(TOCElementStruct(OCCodeLineElementStructList[I]).GenerateODCodeLines);
                for J := 0 to AODCodeLines.Count-1 do
                begin
                  AODCodeLines[J]:=Const_Tab_Char+AODCodeLines[J];
                end;
                ODCodeLines.AddStrings(AODCodeLines);
              end;
            end
            else
            if TObject(OCCodeLineElementStructList[I]) is TOCVariableStruct then
            begin
              ODCodeLines.Add(Const_Tab_Char+'//'+TOCProcedureStruct(OCCodeLineElementStructList[I]).GenerateODCodeLines.CommaText);
            end
            else
            begin
              AODCodeLines.Assign(TOCElementStruct(OCCodeLineElementStructList[I]).GenerateODCodeLines);
              for J := 0 to AODCodeLines.Count-1 do
              begin
                AODCodeLines[J]:=Const_Tab_Char+AODCodeLines[J];
              end;
              ODCodeLines.AddStrings(AODCodeLines);
            end;
          end;
          ODCodeLines.Add('end;');
          ODCodeLines.Add('');








          //类方法
          ODCodeLines.Add(OCClassNameStruct._ClassName+'Class'+'=interface('+Self.OCClassNameStruct.ClassParentClassName+'Class'+')'+'//'+OCClassNameStruct.ClassParentProtocols);
          ODCodeLines.Add('['''+CreateGUIDStr+''']');
          for I := 0 to Self.OCCodeLineElementStructList.Count-1 do
          begin
            if TObject(OCCodeLineElementStructList[I]) is TOCProcedureStruct then
            begin
              if TOCProcedureStruct(OCCodeLineElementStructList[I]).ProcedureType='+' then
              begin

                AODCodeLines.Assign(TOCElementStruct(OCCodeLineElementStructList[I]).GenerateODCodeLines);
                for J := 0 to AODCodeLines.Count-1 do
                begin
                  AODCodeLines[J]:=Const_Tab_Char+AODCodeLines[J];
                end;
                ODCodeLines.AddStrings(AODCodeLines);

              end;
            end;
          end;
          ODCodeLines.Add('end;');
          ODCodeLines.Add('');





      
          //对象引入
          ODCodeLines.Add('T'+OCClassNameStruct._ClassName+'=class(TOCGenericImport<'+OCClassNameStruct._ClassName+'Class,'+OCClassNameStruct._ClassName+'>)');
          ODCodeLines.Add('end;');




          //加入间隔
          ODCodeLines.Add('');
          ODCodeLines.Add('');
          ODCodeLines.Add('');
          ODCodeLines.Add('');




          AODCodeLines.Free;
    end;

    Result:=Inherited;

  end;

//  //属性的事件数据类型声明
//  for I := 0 to PreDatatypeDeclareStringList.Count-1 do
//  begin
//    Result.Insert(I,PreDatatypeDeclareStringList[I]);
//  end;
end;

procedure TOCClassStruct.ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);
var
  I:Integer;
  ANote:String;
  ACodeLine:String;
  AStructCodeLines:TStringList;
  AOCElementStruct:TOCElementStruct;

  ANewLineBeginType:TOCCodeLineBeginType;
begin

  Inherited;


  AStructCodeLines:=TStringList.Create;

  I:=0;
  while I <AObjectiveCCodeLines.Count do
  begin

      //没有到类头
      ANewLineBeginType:=CheckOCCodeLineBeginType(AObjectiveCCodeLines[I]);

      //不是类成员
      case ANewLineBeginType of
        cltNone,cltSpace:
        begin
          AOCElementStruct:=TOCNoneStruct.Create;
          AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltNoUse:
        begin
          AOCElementStruct:=TOCNoteStruct.Create;
          AOCElementStruct.ParseOCCodeLine('//'+AObjectiveCCodeLines[I]);
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltNote:
        begin
          AOCElementStruct:=TOCNoteStruct.Create;
          AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltNoteBegin:
        begin
          AStructCodeLines.Clear;
          ACodeLine:=ReplaceStr(AObjectiveCCodeLines[I],'/*','{');
          if Pos('*/',ACodeLine)>0 then
          begin
            //注释结束
            ACodeLine:=ReplaceStr(ACodeLine,'*/','}');
            AStructCodeLines.Add(ACodeLine);
          end
          else
          begin
            AStructCodeLines.Add(ACodeLine);
            //注释没有结束
            repeat
              Inc(I);
              if Pos('*/',AObjectiveCCodeLines[I])>0 then
              begin
                ACodeLine:=ReplaceStr(AObjectiveCCodeLines[I],'*/','}');
                AStructCodeLines.Add(ACodeLine);
              end
              else
              begin
                AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              end;
            until (Pos('*/',AObjectiveCCodeLines[I])>0) or (I >=AObjectiveCCodeLines.Count);
          end;

          AOCElementStruct:=TOCNoteStruct.Create;
          AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltClassBegin:
        begin
          Self.OCClassNameStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
          if OCClassNameStruct.ClassHasPrivateMember then
          begin
            //有类成员
            Repeat
              Inc(I);
              if (Pos('}',RemoveNote(AObjectiveCCodeLines[I],ANote))>0) then
              begin
              end
              else
              begin
                AOCElementStruct:=TOCVariableStruct.Create;
                AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
                Self.OCCodeLineElementStructList.Add(AOCElementStruct);

              end;

            Until (Pos('}',RemoveNote(AObjectiveCCodeLines[I],ANote))>0) or (I>=AObjectiveCCodeLines.Count);
          end;
        end;
        cltProperty:
        begin
          AOCElementStruct:=TOCPropertyStruct.Create;
          AOCElementStruct.Owner:=Self;
          AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltProcedure:
        begin
          AOCElementStruct:=TOCProcedureStruct.Create(Self);

          TOCProcedureStruct(AOCElementStruct).ParseOCCodeLine(AObjectiveCCodeLines[I]);
          
          if Not TOCProcedureStruct(AOCElementStruct).ProcedureHasEnd then
          begin
            //协议没有一行就结束
            AStructCodeLines.Clear;
            AStructCodeLines.Add(AObjectiveCCodeLines[I]);
            repeat
              Inc(I);
              AStructCodeLines.Add(AObjectiveCCodeLines[I]);
            until (Pos(';',AObjectiveCCodeLines[I])>0) or (I >=AObjectiveCCodeLines.Count);
            AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
//            AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
          end;
          Self.OCCodeLineElementStructList.Add(AOCElementStruct);
        end;
        cltEnd:
        begin
          //
        end;

      end;

      Inc(I);
  end;

  AStructCodeLines.Free;
end;



{ TCProcedureStruct }

procedure TCProcedureStruct.Clear;
begin
  Inherited;

  AnsiCProcedureHasEnd:=False;
  ProcedureType:='';
  ProcedureDataType:='';
  ProcedureName:='';
//  FirstParamName:='';
//  FirstParamDataType:='';
//  ProcedureNames.Clear;
  ParamNames.Clear;
  ParamDataTypes.Clear;

//  Note:='';
end;

constructor TCProcedureStruct.Create;
begin
  inherited;
  //其他的参数名称
  ParamNames:=TStringList.Create;
  //其他的参数数据类型
  ParamDataTypes:=TStringList.Create;

end;

destructor TCProcedureStruct.Destroy;
begin
  //其他的参数名称
  ParamNames.Free;
  //其他的参数数据类型
  ParamDataTypes.Free;

  inherited;
end;

function TCProcedureStruct.GetImple: String;
begin
//  function BMKMetersBetweenMapPoints(a:BMKMapPoint;b:BMKMapPoint):CLLocationDistance;cdecl;external {$I BaiduMapDylibName.inc} name _PU + 'BMKMetersBetweenMapPoints';
  Result:=GetODCodeLine+'external '+StaticLibraryName+' name _PU + '''+Self.ProcedureName+'''';


//function AVSpeechUtteranceMinimumSpeechRate: Single;
//begin
//  Result := CocoaFloatConst(libAVFoundation, 'AVSpeechUtteranceMinimumSpeechRate');
//end;
//function AVSpeechUtteranceMaximumSpeechRate: Single;
//begin
//  Result := CocoaFloatConst(libAVFoundation, 'AVSpeechUtteranceMaximumSpeechRate');
//end;
//function AVSpeechUtteranceDefaultSpeechRate: Single;
//begin
//  Result := CocoaFloatConst(libAVFoundation, 'AVSpeechUtteranceDefaultSpeechRate');
//end;

end;

function TCProcedureStruct.GetODCodeLine: String;
var
  I:Integer;
begin

  Result:='';
  //类型注释掉
  Result:='{'+ProcedureType+'} ';
  //返回值数据类型
  if ProcedureDataType='void' then
  begin
    //过程procedure
    Result:=Result+'procedure ';
  end
  else
  begin
    //函数function
    Result:=Result+'function ';
  end;


  //方法名
  Result:=Result+ProcedureName+'(';

  //其他参数列表
  for I := 0 to ParamNames.Count-1 do
  begin
    if I>0 then
    begin
      Result:=Result+';';
    end;
    Result:=Result+FixDelphiKeywordName(ParamNames[I])+':'+ConvertOCTypeToODType(ParamDataTypes[I]);
  end;
  Result:=Result+')';

  //方法返回值
  if ProcedureDataType='void' then
  begin
    Result:=Result+';';
  end
  else
  begin
    Result:=Result+':'+ConvertOCTypeToODType(ProcedureDataType)+';';
  end;
  Result:=Result+'cdecl;';

end;

function TCProcedureStruct.GenerateODCodeLines: TStringList;
//var
//  I:Integer;
//  AComposeFunctionName:String;
begin
  if (ODCodeLine<>'') or (ProcedureName='') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;


    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);

//    AComposeFunctionName:='';
//    //类型注释掉
//    AComposeFunctionName:='{'+ProcedureType+'} ';
//    //返回值数据类型
//    if ProcedureDataType='void' then
//    begin
//      //过程procedure
//      AComposeFunctionName:=AComposeFunctionName+'procedure ';
//    end
//    else
//    begin
//      //函数function
//      AComposeFunctionName:=AComposeFunctionName+'function ';
//    end;
//
//
//    //方法名
//    AComposeFunctionName:=AComposeFunctionName+ProcedureName+'(';
//
//    //其他参数列表
//    for I := 0 to ParamNames.Count-1 do
//    begin
//      if I>0 then
//      begin
//        AComposeFunctionName:=AComposeFunctionName+';';
//      end;
//      AComposeFunctionName:=AComposeFunctionName+ParamNames[I]+':'+ConvertOCTypeToODType(ParamDataTypes[I]);
//    end;
//    AComposeFunctionName:=AComposeFunctionName+')';
//
//    //方法返回值
//    if ProcedureDataType='void' then
//    begin
//      AComposeFunctionName:=AComposeFunctionName+';';
//    end
//    else
//    begin
//      AComposeFunctionName:=AComposeFunctionName+':'+ConvertOCTypeToODType(ProcedureDataType)+';';
//    end;
//    AComposeFunctionName:=AComposeFunctionName+'cdecl;';

    
    ODCodeLines.Add(GetODCodeLine);//AComposeFunctionName);

    Result:=Inherited;

    ODCodeLine:=ODCodeLines.CommaText;
  end;
end;

procedure TCProcedureStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractCProcedure(ACodeLine,Self);
end;

procedure TCProcedureStruct.ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);
var
  ACodeLine:String;
  I: Integer;
  ANote:String;
begin
  inherited;

  //去掉大括号{}
  //连接断行
  ACodeLine:='';
  for I := 0 to AObjectiveCCodeLines.Count-1 do
  begin
    ACodeLine:=ACodeLine+' '+RemoveNote(AObjectiveCCodeLines[I],ANote);
    Note:=Note+ANote;
  end;
  ParseOCCodeLine(ACodeLine);

end;


{ TOCProtocolNameStruct }

procedure TOCProtocolNameStruct.Clear;
begin
  inherited;
  ProtocolName:='';
  ProtocolImpleClassName:='';
  ProtocolHasPrivateMember:=False;
  ProtocolHasEnd:=False;

end;

function TOCProtocolNameStruct.GenerateODCodeLines: TStringList;
begin
  if (ODCodeLine<>'') or (ProtocolName='') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;

    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);

//    if ProtocolHasEnd then
//    begin
//      ODCodeLines.Add('//'+OCCodeLine);
//    end
//    else
//    begin
//      if ProtocolHasPrivateMember then
//      begin
//        Note:='//{'+Note;
//      end;
//      ODCodeLines.Add(ProtocolName+'=interface(IObjectiveC)'+Note);
//      ODCodeLines.Add('['''+CreateGUIDStr+''']');
//    end;




    Result:=Inherited;

    ODCodeLine:=ODCodeLines.CommaText;
  end;
end;

procedure TOCProtocolNameStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractOCProtocolName(ACodeLine,Self);
end;



{ TOCClassNameStruct }

procedure TOCClassNameStruct.Clear;
begin
  inherited;
  _ClassName:='';
  ClassParentClassName:='';
  ClassParentProtocols:='';
  ClassHasPrivateMember:=False;
  ClassHasEnd:=False;

end;

function TOCClassNameStruct.GenerateODCodeLines: TStringList;
begin
  if (ODCodeLine<>'') or (_ClassName='') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;


    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);


//    ODCodeLines.Add(_ClassName+'Class'+'=interface('+ClassParentClassName+'Class'+')');
//    ODCodeLines.Add('['''+CreateGUIDStr+''']');
//    ODCodeLines.Add('end;');
//    ODCodeLines.Add('');
//
//    ODCodeLines.Add(_ClassName+'=interface('+ClassParentClassName+')'+Note);
//    ODCodeLines.Add('['''+CreateGUIDStr+''']');
//    if ClassHasEnd then
//    begin
//      ODCodeLines.Add('end;');
//      ODCodeLines.Add('T'+_ClassName+'=class(TOCGenericImport<'+_ClassName+'Class,'+_ClassName+'>)');
//      ODCodeLines.Add('end;');
//    end;

    Result:=Inherited;

    ODCodeLine:=ODCodeLines.CommaText;
  end;

end;

procedure TOCClassNameStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractOCClassName(ACodeLine,Self);
end;



{ TOCPropertyStruct }

procedure TOCPropertyStruct.Clear;
begin
  inherited;
  PropertyName:='';
  PropertyDataType:='';
  PropertyIsReadOnly:=False;
  PropertyDesciption:='';
  GetterFunctionName:='';
  SetterFunctionName:='';
  Imple.Clear;
  


end;

function TOCPropertyStruct.GenerateODCodeLines: TStringList;
var
  AComposeFunctionName:String;
  I: Integer;
begin
  if (ODCodeLine<>'') or (PropertyName='') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;

    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);


    AComposeFunctionName:=PropertyName;
    if GetterFunctionName<>'' then
    begin
      AComposeFunctionName:=GetterFunctionName;
    end;
    //属性获取方法
    //判断一下是否是关键字
    if DelphiKeywords.IndexOf(LowerCase(AComposeFunctionName))<>-1 then
    begin
      ODCodeLines.Add('[MethodName('''+AComposeFunctionName+':'+''')]');
    end;
    ODCodeLines.Add('function '+FixDelphiKeywordName(AComposeFunctionName)+':'+ConvertOCTypeToODType(PropertyDataType)+';cdecl;'+Note);


    AComposeFunctionName:='set'+UpperCase(Copy(PropertyName,1,1))+Copy(PropertyName,2,MaxInt);
    if SetterFunctionName<>'' then
    begin
      AComposeFunctionName:=SetterFunctionName;
    end;

    //判断一下是否是关键字
    if DelphiKeywords.IndexOf(LowerCase(AComposeFunctionName))<>-1 then
    begin
      ODCodeLines.Add('[MethodName('''+AComposeFunctionName+':'+''')]');
    end;

    //属性设置方法
    ODCodeLines.Add('procedure '
                            +AComposeFunctionName
                            +'('+FixDelphiKeywordName(PropertyName)+':'+ConvertOCTypeToODType(PropertyDataType)+')'+';cdecl;'+Note);





    Result:=Inherited;

    ODCodeLine:=ODCodeLines.CommaText;
  end;

end;

procedure TOCPropertyStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractOCProperty(ACodeLine,Self);
end;

constructor TOCPropertyStruct.Create;
begin
  inherited;
  Imple:=TStringList.Create;
//  Imple:=TStringList.Create;

end;

destructor TOCPropertyStruct.Destroy;
begin
  Imple.Free;
//  Imple.Free;

  inherited;
end;

function TOCPropertyStruct.GetDeclareEventDataType_Get: String;
var
  I:Integer;
begin
//  TOnmapViewviewForOverlayEvent=function(mapView:BMKMapView;overlay:Pointer):BMKOverlayView of object;//cdecl;
//  TOnmapviewForAnnotationEvent=function(annotation:Pointer):BMKAnnotationView of object;//;cdecl;
  //
  Result:='T'+'On'+Self.GetProcedureName_Get+'=';
  //方法返回值
//  if ProcedureDataType='void' then
//  begin
//    Result:=Result+'procedure';
//  end
//  else
//  begin
    Result:=Result+'function';
//  end;
  Result:=Result+Self.GetDeclareParamsStr_Get;//+'(';
//
//  if FirstParamDataType<>'' then
//  begin
//    //第一个参数
//    Result:=Result+FirstParamName+':'+ConvertOCTypeToODType(FirstParamDataType);
//    //其他参数列表
//    for I := 0 to OtherParamNames.Count-1 do
//    begin
//      Result:=Result+';';
//      Result:=Result+OtherParamNames[I]+':'+ConvertOCTypeToODType(OtherParamDataTypes[I]);
//    end;
//  end;
//  Result:=Result+')';

  //方法返回值
//  if ProcedureDataType='void' then
//  begin
//  end
//  else
//  begin
    Result:=Result+':'+ConvertOCTypeToODType(PropertyDataType);
//  end;

  Result:=Result+' of object;';

end;

function TOCPropertyStruct.GetDeclareEventMember_Get: String;
begin
  //OnmapViewviewForOverlayEvent:TOnmapViewviewForOverlayEvent;
  Result:='On'+Self.GetProcedureName_Get+':'+'T'+'On'+Self.GetProcedureName_Get+';';
end;

//function TOCPropertyStruct.GetImple_Get: TStringList;
//begin
//  if Imple.Count=0 then
//  begin
//  end;
//  Result:=Imple;
//end;

function TOCPropertyStruct.GetMethodDataType_Get: String;
begin
//  if ProcedureDataType='void' then
//  begin
//    Result:=';';
//  end
//  else
//  begin
    Result:=':'+ConvertOCTypeToODType(PropertyDataType)+';';
//  end;
end;

function TOCPropertyStruct.GetMethodType_Get: String;
begin
  //返回值数据类型
//  if ProcedureDataType='void' then
//  begin
//    //过程procedure
//    Result:='procedure ';
//  end
//  else
//  begin
    //函数function
    Result:='function ';
//  end;
end;

function TOCPropertyStruct.GetDeclareParamsStr_Get: String;
//var
//  I:Integer;
begin
//  TOnmapViewviewForOverlayEvent=function(mapView:BMKMapView;overlay:Pointer):BMKOverlayView of object;//cdecl;
//  TOnmapviewForAnnotationEvent=function(annotation:Pointer):BMKAnnotationView of object;//;cdecl;
  //
  Result:='(';

//  if FirstParamDataType<>'' then
//  begin
//    //第一个参数
//    Result:=Result+FixDelphiKeywordName(PropertyName)+':'+ConvertOCTypeToODType(PropertyDataType);
//    //其他参数列表
//    for I := 0 to OtherParamNames.Count-1 do
//    begin
//      Result:=Result+';';
//      Result:=Result+FixDelphiKeywordName(OtherParamNames[I])+':'+ConvertOCTypeToODType(OtherParamDataTypes[I]);
//    end;
//  end;
  Result:=Result+')';

end;

function TOCPropertyStruct.GetParamListStr_Get: String;
//var
//  I: Integer;
begin
  Result:='';
//  if FirstParamName<>'' then
//  begin
//    Result:=FixDelphiKeywordName(Self.FirstParamName);
//    if Self.OtherParamNames.Count>0 then
//    begin
//      for I := 0 to OtherParamNames.Count-1 do
//      begin
//        Result:=Result+','+FixDelphiKeywordName(OtherParamNames[I]);
//      end;
//    end;
//  end;
end;

function TOCPropertyStruct.GetProcedureName_Get: String;
//var
//  I:Integer;
begin
  Result:=Self.PropertyName;
//  for I := 0 to OtherProcedureNames.Count-1 do
//  begin
//    Result:=Result+OtherProcedureNames[I];
//  end;
end;



function TOCPropertyStruct.GetDeclareEventDataType_Set: String;
var
  I:Integer;
begin
//  TOnmapViewviewForOverlayEvent=function(mapView:BMKMapView;overlay:Pointer):BMKOverlayView of object;//cdecl;
//  TOnmapviewForAnnotationEvent=function(annotation:Pointer):BMKAnnotationView of object;//;cdecl;
  //
  Result:='T'+'On'+Self.GetProcedureName_Set+'=';
  //方法返回值
//  if ProcedureDataType='void' then
//  begin
    Result:=Result+'procedure';
//  end
//  else
//  begin
//    Result:=Result+'function';
//  end;
  Result:=Result+Self.GetDeclareParamsStr_Set;//+'(';
//
//  if FirstParamDataType<>'' then
//  begin
//    //第一个参数
//    Result:=Result+PropertyName+':'+ConvertOCTypeToODType(PropertyDataType);
//    //其他参数列表
//    for I := 0 to OtherParamNames.Count-1 do
//    begin
//      Result:=Result+';';
//      Result:=Result+OtherParamNames[I]+':'+ConvertOCTypeToODType(OtherParamDataTypes[I]);
//    end;
//  end;
//  Result:=Result+')';

//  //方法返回值
//  if ProcedureDataType='void' then
//  begin
//  end
//  else
//  begin
//    Result:=Result+':'+ConvertOCTypeToODType(PropertyDataType);
//  end;

  Result:=Result+' of object;';

end;

function TOCPropertyStruct.GetDeclareEventMember_Set: String;
begin
  //OnmapViewviewForOverlayEvent:TOnmapViewviewForOverlayEvent;
  Result:='On'+Self.GetProcedureName_Set+':'+'T'+'On'+Self.GetProcedureName_Set+';';
end;

function TOCPropertyStruct.GetImple: TStringList;
begin
  if Imple.Count=0 then
  begin
    Imple.Add(GetMethodType_Set+' '+'T'+OwnerName+'.'+Self.GetProcedureName_Set+Self.GetDeclareParamsStr_Set+GetMethodDataType_Set);
    Imple.Add('begin');
    Imple.Add(Const_Tab_Char+'if Assigned('+'On'+Self.GetProcedureName_Set+') then');
    Imple.Add(Const_Tab_Char+'begin');

//    if ProcedureDataType_Set='void' then
//    begin
//      Imple.Add(Const_Tab_Char+Const_Tab_Char+'On'+Self.GetProcedureName+'('+GetParamListStr+');');
//    end
//    else
//    begin
      Imple.Add(Const_Tab_Char+Const_Tab_Char+'On'+Self.GetProcedureName_Set+'('+GetParamListStr_Set+');');
//    end;

    Imple.Add(Const_Tab_Char+'end;');
    Imple.Add('end;');

    Imple.Add('');


    Imple.Add(GetMethodType_Get+' '+'T'+OwnerName+'.'+Self.GetProcedureName_Get+Self.GetDeclareParamsStr_Get+GetMethodDataType_Get);
    Imple.Add('begin');
    Imple.Add(Const_Tab_Char+'if Assigned('+'On'+Self.GetProcedureName_Get+') then');
    Imple.Add(Const_Tab_Char+'begin');

//    if ProcedureDataType_Get='void' then
//    begin
//      Imple.Add(Const_Tab_Char+Const_Tab_Char+'On'+Self.GetProcedureName+'('+GetParamListStr+');');
//    end
//    else
//    begin
      Imple.Add(Const_Tab_Char+Const_Tab_Char+'Result:=On'+Self.GetProcedureName_Get+'('+GetParamListStr_Get+');');
//    end;

    Imple.Add(Const_Tab_Char+'end;');
    Imple.Add('end;');


  end;
  Result:=Imple;
end;

function TOCPropertyStruct.GetMethodDataType_Set: String;
begin
//  if ProcedureDataType='void' then
//  begin
    Result:=';';
//  end
//  else
//  begin
//    Result:=':'+ConvertOCTypeToODType(PropertyDataType)+';';
//  end;
end;

function TOCPropertyStruct.GetMethodType_Set: String;
begin
  //返回值数据类型
//  if ProcedureDataType='void' then
//  begin
    //过程procedure
    Result:='procedure ';
//  end
//  else
//  begin
//    //函数function
//    Result:='function ';
//  end;
end;

function TOCPropertyStruct.GetDeclareParamsStr_Set: String;
//var
//  I:Integer;
begin
//  TOnmapViewviewForOverlayEvent=function(mapView:BMKMapView;overlay:Pointer):BMKOverlayView of object;//cdecl;
//  TOnmapviewForAnnotationEvent=function(annotation:Pointer):BMKAnnotationView of object;//;cdecl;
  //
  Result:='(';

//  if FirstParamDataType<>'' then
//  begin
    //第一个参数
    Result:=Result+FixDelphiKeywordName(PropertyName)+':'+ConvertOCTypeToODType(PropertyDataType);
//    //其他参数列表
//    for I := 0 to OtherParamNames.Count-1 do
//    begin
//      Result:=Result+';';
//      Result:=Result+FixDelphiKeywordName(OtherParamNames[I])+':'+ConvertOCTypeToODType(OtherParamDataTypes[I]);
//    end;
//  end;
  Result:=Result+')';

end;

function TOCPropertyStruct.GetParamListStr_Set: String;
//var
//  I: Integer;
begin
  Result:='';
//  if FirstParamName<>'' then
//  begin
    Result:=FixDelphiKeywordName(Self.PropertyName);
//    if Self.OtherParamNames.Count>0 then
//    begin
//      for I := 0 to OtherParamNames.Count-1 do
//      begin
//        Result:=Result+','+FixDelphiKeywordName(OtherParamNames[I]);
//      end;
//    end;
//  end;
end;

function TOCPropertyStruct.GetProcedureName_Set: String;
//var
//  I:Integer;
begin
  Result:='set'+Self.PropertyName;
//  for I := 0 to OtherProcedureNames.Count-1 do
//  begin
//    Result:=Result+OtherProcedureNames[I];
//  end;
end;



{ TOCVariableStruct }

procedure TOCVariableStruct.Clear;
begin
  inherited;
  VariableName:='';
  VariableDataType:='';
//  VariableIsReadOnly:=False;
//  VariableDesciption:='';
//  GetterFunctionName:='';
//  SetterFunctionName:='';

end;

function TOCVariableStruct.GenerateODCodeLines: TStringList;
begin
  if (ODCodeLine<>'') or (VariableName='') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;


    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);



    ODCodeLines.Add(VariableName+':'+ConvertOCTypeToODType(VariableDataType)+';'+Note);

    Result:=Inherited;

    ODCodeLine:=ODCodeLines.CommaText;
  end;

end;

procedure TOCVariableStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractOCVariable(ACodeLine,Self);
end;


{ TOCConstStruct }

procedure TOCConstStruct.Clear;
begin
  inherited;
  ConstType:='';
  ConstName:='';
  ConstDataType:='';

end;

function TOCConstStruct.GenerateODCodeLines: TStringList;
begin
  if (ODCodeLine<>'') or (ConstName='') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;

    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);


    if ConstType='extern' then
    begin
      ODCodeLines.Add(//'{'+Self.ConstType+'}'+
                        'function '+ConstName+':'
//                        +'Pointer;'//
                        +ConvertOCTypeToODType(ConstDataType)+';'
                        +Note);
    end
    else
    begin
      ODCodeLines.Add(//'{'+Self.ConstType+'}'+
                        ConstName+'='+ConvertOCTypeToODType(ConstDataType)+';'+Note);
    end;


    Result:=Inherited;

    ODCodeLine:=ODCodeLines.CommaText;
  end;

end;

function TOCConstStruct.GetImple(ALibPath:String): String;
begin
  Result:='';

//function BDS_WAKEUP_NAME: NSString;
//begin
//  Result := CocoaNSStringConst({$I FrameworkDylibPath_BaiduASR.inc}, 'BDS_WAKEUP_NAME');
//end;

  if ConstType='extern' then
  begin
    Result:=//'{'+Self.ConstType+'}'+
                      'function '+ConstName+':'
//                        +'Pointer;'//
                      +ConvertOCTypeToODType(ConstDataType)+';'+#13#10
            +'begin'+#13#10;

    Result:=Result+Const_Tab_Char+'Result:=Cocoa'+ConvertOCTypeToODType(ConstDataType)+'Const('+ALibPath+', '''+ConstName+''');'+#13#10;


    Result:=Result+'end;'+#13#10;
  end;

end;

procedure TOCConstStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractOCConst(ACodeLine,Self);
end;



{ TOCDefineStruct }

procedure TOCDefineStruct.Clear;
begin
  inherited;
//  DefineType:='';
  DefineName:='';
  DefineValue:='';
//  DefineDataType:='';

end;

function TOCDefineStruct.GenerateODCodeLines: TStringList;
begin
  if (ODCodeLine<>'') or (DefineName='') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;


    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);

    ODCodeLines.Add(' const '+DefineName+'='+DefineValue+';'+Note);

    Result:=Inherited;

    ODCodeLine:=ODCodeLines.CommaText;
  end;

end;

procedure TOCDefineStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractOCDefine(ACodeLine,Self);
end;



{ TOCImportHeaderStruct }

procedure TOCImportHeaderStruct.Clear;
begin
  inherited;
  DirectoryName:='';
  HeaderFileName:='';
  IsCustomerHeaderFile:=False;

end;

function TOCImportHeaderStruct.GenerateODCodeLines: TStringList;
var
  I: Integer;
begin
  if (ODCodeLine<>'') or (HeaderFileName='') then
  begin
      Result:=Inherited;
  end
  else
  begin
      ODCodeLines.Clear;


      CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);

      //属性获取方法
      //判断一下是否是关键字
      if Self.HeaderFileName<>'CLLocation' then
      begin
          if Self.IsCustomerHeaderFile then
          begin
            ODCodeLines.Add(UnitNamePrefix+Self.HeaderFileName+UnitNameBackfix+',');
          end
          else
          begin
            ODCodeLines.Add('iOSapi.'+Self.HeaderFileName+',');
          end;
      end
      else
      begin
          ODCodeLines.Add('');
      end;


      for I := 0 to ODCodeLines.Count-1 do
      begin
        ODCodeLines[I]:=Const_Tab_Char+ODCodeLines[I];
      end;

      Result:=Inherited;

      ODCodeLine:=ODCodeLines.CommaText;
  end;

end;

procedure TOCImportHeaderStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractOCImportHeader(ACodeLine,Self);
end;

{ TOCNoteStruct }

function TOCNoteStruct.GenerateODCodeLines: TStringList;
var
  I: Integer;
begin
  if (ODCodeLine<>'') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;

//    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);


    if ObjectiveCCodeLines.Count>0 then
    begin
      //      /** 与父视图中心偏差坐标 */    ->    ///** 与父视图中心偏差坐标 */
      ODCodeLines.Assign(ObjectiveCCodeLines);
      for I := 0 to ODCodeLines.Count-1 do
      begin
        ODCodeLines[I]:='//'+ODCodeLines[I];
      end;
    end
    else
    begin
      ODCodeLines.Add('//'+OCCodeLine);
    end;

    Result:=Inherited;
    ODCodeLine:='//'+Self.OCCodeLine;
  end;

end;

{ TOCNoneStruct }


function TOCNoneStruct.GenerateODCodeLines: TStringList;
begin
  if (ODCodeLines.Count>0) then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;
    ODCodeLine:=Self.OCCodeLine;


//    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);



    if OCCodeLine<>'' then
    begin
      ODCodeLine:='//'+Self.OCCodeLine;
    end;
    ODCodeLines.Add(ODCodeLine);

    Result:=Inherited;


  end;
end;






{ TCEventStruct }

procedure TCEventStruct.Clear;
begin
  Inherited;

  ProcedureDataType:='';
  ProcedureName:='';
//  FirstParamName:='';
//  FirstParamDataType:='';
//  ProcedureNames.Clear;
  ParamNames.Clear;
  ParamDataTypes.Clear;

//  Note:='';
end;

constructor TCEventStruct.Create;
begin
  inherited;
  //其他的参数名称
  ParamNames:=TStringList.Create;
  //其他的参数数据类型
  ParamDataTypes:=TStringList.Create;

end;

destructor TCEventStruct.Destroy;
begin
  //其他的参数名称
  ParamNames.Free;
  //其他的参数数据类型
  ParamDataTypes.Free;

  inherited;
end;

//function TCEventStruct.GetImple: String;
//begin
////  function BMKMetersBetweenMapPoints(a:BMKMapPoint;b:BMKMapPoint):CLLocationDistance;cdecl;external {$I BaiduMapDylibName.inc} name _PU + 'BMKMetersBetweenMapPoints';
////  Result:=GetODCodeLine+'external '+StaticLibraryName+' name _PU + '''+Self.ProcedureName+'''';
//
//
////function AVSpeechUtteranceMinimumSpeechRate: Single;
////begin
////  Result := CocoaFloatConst(libAVFoundation, 'AVSpeechUtteranceMinimumSpeechRate');
////end;
////function AVSpeechUtteranceMaximumSpeechRate: Single;
////begin
////  Result := CocoaFloatConst(libAVFoundation, 'AVSpeechUtteranceMaximumSpeechRate');
////end;
////function AVSpeechUtteranceDefaultSpeechRate: Single;
////begin
////  Result := CocoaFloatConst(libAVFoundation, 'AVSpeechUtteranceDefaultSpeechRate');
////end;
//
//end;

function TCEventStruct.GetODCodeLine: String;
var
  I:Integer;
begin

  Result:='';
  Result:='T'+ProcedureName+'Event=';
  //返回值数据类型
  if ProcedureDataType='void' then
  begin
    //过程procedure
    Result:=Result+'procedure ';
  end
  else
  begin
    //函数function
    Result:=Result+'function ';
  end;


  //方法名
  Result:=Result+'(';

  //其他参数列表
  for I := 0 to ParamNames.Count-1 do
  begin
    if I>0 then
    begin
      Result:=Result+';';
    end;
    Result:=Result+FixDelphiKeywordName(ParamNames[I])+':'+ConvertOCTypeToODType(ParamDataTypes[I]);
  end;
  Result:=Result+')';

  //方法返回值
  if ProcedureDataType='void' then
  begin
    Result:=Result+'';
  end
  else
  begin
    Result:=Result+':'+ConvertOCTypeToODType(ProcedureDataType)+'';
  end;
  Result:=Result+' of object;';

end;

function TCEventStruct.GetTypeName(): String;
begin
  if ProcedureName<>'' then
  begin
    Result:='T'+Self.ProcedureName+'Event';
    Exit;
  end;
end;

function TCEventStruct.GenerateODCodeLines: TStringList;
//var
//  I:Integer;
//  AComposeFunctionName:String;
begin
  if (ODCodeLine<>'') or (ProcedureName='') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;


    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);

//    AComposeFunctionName:='';
//    //类型注释掉
//    AComposeFunctionName:='{'+ProcedureType+'} ';
//    //返回值数据类型
//    if ProcedureDataType='void' then
//    begin
//      //过程procedure
//      AComposeFunctionName:=AComposeFunctionName+'procedure ';
//    end
//    else
//    begin
//      //函数function
//      AComposeFunctionName:=AComposeFunctionName+'function ';
//    end;
//
//
//    //方法名
//    AComposeFunctionName:=AComposeFunctionName+ProcedureName+'(';
//
//    //其他参数列表
//    for I := 0 to ParamNames.Count-1 do
//    begin
//      if I>0 then
//      begin
//        AComposeFunctionName:=AComposeFunctionName+';';
//      end;
//      AComposeFunctionName:=AComposeFunctionName+ParamNames[I]+':'+ConvertOCTypeToODType(ParamDataTypes[I]);
//    end;
//    AComposeFunctionName:=AComposeFunctionName+')';
//
//    //方法返回值
//    if ProcedureDataType='void' then
//    begin
//      AComposeFunctionName:=AComposeFunctionName+';';
//    end
//    else
//    begin
//      AComposeFunctionName:=AComposeFunctionName+':'+ConvertOCTypeToODType(ProcedureDataType)+';';
//    end;
//    AComposeFunctionName:=AComposeFunctionName+'cdecl;';
    ODCodeLines.Add(GetODCodeLine);//AComposeFunctionName);

    Result:=Inherited;

    ODCodeLine:=ODCodeLines.CommaText;
  end;
end;

procedure TCEventStruct.ParseOCCodeLine(ACodeLine: String);
begin
  //void (^didSelectRowBlock)(HXAlbumModel *model);
  ExtractCEvent(ACodeLine,Self);
end;

procedure TCEventStruct.ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);
var
  ACodeLine:String;
  I: Integer;
  ANote:String;
begin
  inherited;

  //去掉大括号{}
  //连接断行
  ACodeLine:='';
  for I := 0 to AObjectiveCCodeLines.Count-1 do
  begin
    ACodeLine:=ACodeLine+' '+RemoveNote(AObjectiveCCodeLines[I],ANote);
    Note:=Note+ANote;
  end;
  ParseOCCodeLine(ACodeLine);

end;

{ TOCHeaderFile }

procedure TOCHeaderFile.Clear;
var
  I: Integer;
begin
  CodeLines.Clear;
  ODCodeLines.Clear;
  for I := 0 to OCElementStructList.Count-1 do
  begin
    TObject(OCElementStructList[I]).Free;
  end;
  OCElementStructList.Clear;
end;

constructor TOCHeaderFile.Create;
begin
  //代码行列表
  CodeLines:=TStringList.Create;
  //Delphi代码行
  ODCodeLines:=TStringList.Create;
  OCElementStructList:=TList.Create;

end;

destructor TOCHeaderFile.Destroy;
begin
  Clear;
  CodeLines.Free;
  ODCodeLines.Free;
  OCElementStructList.Free;
  inherited;
end;

function TOCHeaderFile.GenerateODCodeLines: TStringList;
var
  I:Integer;
begin
  if ODCodeLines.Count=0 then
  begin
    ODCodeLines.Add('');

    for I := 0 to Self.OCElementStructList.Count-1 do
    begin
      ODCodeLines.AddStrings(TOCElementStruct(Self.OCElementStructList[I]).GenerateODCodeLines);
    end;

  end;
  Result:=ODCodeLines;
end;

function TOCHeaderFile.GetUnitCodeLines(AUnitName:String;AStaticLibName:String;AUnitNamePrefix:String;AUnitNameSuffix:String): TStringList;
var
  I,J:Integer;
  TypeIndex:Integer;
  HasImportHeader:Boolean;
  ImportHeaderIndex:Integer;
  AODCodeLines:TStringList;
//  AUnitNameList:TStringList;
begin
  StaticLibraryName:=AStaticLibName;
  UnitNamePrefix:=AUnitNamePrefix;
  UnitNameBackfix:=AUnitNameSuffix;

  if ODCodeLines.Count=0 then
  begin
    HasImportHeader:=False;
    ImportHeaderIndex:=0;
    for I := 0 to Self.OCElementStructList.Count-1 do
    begin
      if TOCElementStruct(Self.OCElementStructList[I]) is TOCImportHeaderStruct then
      begin
        HasImportHeader:=True;
        Break;
      end;
      Inc(ImportHeaderIndex);
    end;

    if Not HasImportHeader then
    begin 
      ImportHeaderIndex:=0;
    end;

    //如果存在import单元
    if HasImportHeader then
    begin
      //引入头文件之前的注释先放在最前面
      for I := 0 to ImportHeaderIndex-1 do
      begin
        if Not (TOCElementStruct(Self.OCElementStructList[I]) is TOCImportHeaderStruct) then
        begin
          ODCodeLines.AddStrings(TOCElementStruct(Self.OCElementStructList[I]).GenerateODCodeLines);
        end;
      end;
    end;






    //单元名
    ODCodeLines.Add('unit '+UnitNamePrefix+AUnitName+UnitNameBackfix+';');
    ODCodeLines.Add('');



    //引用单元
    ODCodeLines.Add('interface');
    ODCodeLines.Add('');
    ODCodeLines.Add('{$IFDEF IOS}');
    ODCodeLines.Add('uses');
    //引用自定义的单元
    for I := ImportHeaderIndex to Self.OCElementStructList.Count-1 do
    begin
      if TOCElementStruct(Self.OCElementStructList[I]) is TOCImportHeaderStruct then
      begin
        ODCodeLines.AddStrings(TOCElementStruct(Self.OCElementStructList[I]).GenerateODCodeLines);
      end;
    end;



    //添加常用的单元
    if ODCodeLines.IndexOf(Const_Tab_Char+'MacApi.ObjectiveC,')=-1 then ODCodeLines.Add(Const_Tab_Char+'MacApi.ObjectiveC,');
    if ODCodeLines.IndexOf(Const_Tab_Char+'iOSApi.CocoaTypes,')=-1 then ODCodeLines.Add(Const_Tab_Char+'iOSApi.CocoaTypes,');
    if ODCodeLines.IndexOf(Const_Tab_Char+'iOSApi.CoreGraphics,')=-1 then ODCodeLines.Add(Const_Tab_Char+'iOSApi.CoreGraphics,');
    if ODCodeLines.IndexOf(Const_Tab_Char+'iOSApi.UIKit,')=-1 then ODCodeLines.Add(Const_Tab_Char+'iOSApi.UIKit,');
    if ODCodeLines.IndexOf(Const_Tab_Char+'iOSApi.OpenGLES,')=-1 then ODCodeLines.Add(Const_Tab_Char+'iOSApi.OpenGLES,');
    if ODCodeLines.IndexOf(Const_Tab_Char+'iOSApi.Foundation,')=-1 then ODCodeLines.Add(Const_Tab_Char+'iOSApi.Foundation,');
    if ODCodeLines.IndexOf(Const_Tab_Char+'iOSApi.CoreLocation,')=-1 then ODCodeLines.Add(Const_Tab_Char+'iOSApi.CoreLocation,');
    if ODCodeLines.IndexOf(Const_Tab_Char+'MacApi.ObjCRuntime,')=-1 then ODCodeLines.Add(Const_Tab_Char+'Macapi.ObjCRuntime,');
    ODCodeLines.Add(Const_Tab_Char+'SysUtils,Types,FMX.Types,Classes;');
    ODCodeLines.Add('');





    //声明
    //判断是否需要Type
    ODCodeLines.Add('type');
    TypeIndex:=ODCodeLines.Count;

    AODCodeLines:=TStringList.Create;
    for I := ImportHeaderIndex to Self.OCElementStructList.Count-1 do
    begin
      if Not (TOCElementStruct(Self.OCElementStructList[I]) is TOCImportHeaderStruct)
//        and not (TOCElementStruct(Self.OCElementStructList[I]) is TCProcedureStruct)
        then
      begin
          AODCodeLines.Clear;
          //需要加缩进
          AODCodeLines.AddStrings(TOCElementStruct(Self.OCElementStructList[I]).PreDatatypeDeclareStringList);
          AODCodeLines.AddStrings(TOCElementStruct(Self.OCElementStructList[I]).GenerateODCodeLines);
          for J := 0 to AODCodeLines.Count-1 do
          begin
            AODCodeLines[J]:=Const_Tab_Char+AODCodeLines[J];
          end;
          ODCodeLines.AddStrings(AODCodeLines);
      end;
    end;



    //声明结束
    AODCodeLines.Free;
    ODCodeLines.Add('{$ENDIF}');
    ODCodeLines.Add('');







    //实现
    ODCodeLines.Add('implementation');
    ODCodeLines.Add('');
    ODCodeLines.Add('{$IFDEF IOS}');

    //实现函数,导出函数
    for I := ImportHeaderIndex to Self.OCElementStructList.Count-1 do
    begin
      if (TOCElementStruct(Self.OCElementStructList[I]) is TCProcedureStruct) then
      begin
        ODCodeLines.Add(TCProcedureStruct(Self.OCElementStructList[I]).GetImple);
      end;
    end;
    ODCodeLines.Add('');


    {wn}
    //实现类
    ODCodeLines.Add('{$O-}');
    for I := ImportHeaderIndex to Self.OCElementStructList.Count-1 do
    begin
      if (TOCElementStruct(Self.OCElementStructList[I]) is TOCClassStruct) then
      begin
        ODCodeLines.Add(TOCClassStruct(Self.OCElementStructList[I]).GetImple);
      end;
    end;
    ODCodeLines.Add('{$O+}');
    ODCodeLines.Add('');




    //实现导出常量
    for I := ImportHeaderIndex to Self.OCElementStructList.Count-1 do
    begin
      if (TOCElementStruct(Self.OCElementStructList[I]) is TOCConstStruct)
        and (TOCConstStruct(Self.OCElementStructList[I]).ConstType='extern') then
      begin
        ODCodeLines.Add(TOCConstStruct(Self.OCElementStructList[I]).GetImple(AStaticLibName));
      end;
    end;
    ODCodeLines.Add('');


    //实现协议
    for I := ImportHeaderIndex to Self.OCElementStructList.Count-1 do
    begin
      if (TOCElementStruct(Self.OCElementStructList[I]) is TOCProtocolStruct) then
      begin
        ODCodeLines.AddStrings(TOCProtocolStruct(Self.OCElementStructList[I]).GetImple);
      end;
    end;
    ODCodeLines.Add('');





    //声明数据类型的指针
    ODCodeLines.Insert(TypeIndex,Const_Tab_Char+'//declare pointer');Inc(TypeIndex);
    ODCodeLines.Insert(TypeIndex,Const_Tab_Char+'id=Pointer;');Inc(TypeIndex);
    for I := 0 to ParsedPointerDataTypes.Count-1 do
    begin
      ODCodeLines.Insert(TypeIndex,Const_Tab_Char
                      +ParsedPointerDataTypes[I]+'='+'Pointer;'
                      +'//'+ParsedPointerDataTypes[I]+'='+'Pointer of '+Copy(ParsedPointerDataTypes[I],2,MaxInt)+';'
                      +' ILocalObject('+Copy(ParsedPointerDataTypes[I],2,MaxInt)+').GetObjectID');
      Inc(TypeIndex);
    end;
    ODCodeLines.Insert(TypeIndex,'');Inc(TypeIndex);


    ODCodeLines.Add('{$ENDIF}');
    ODCodeLines.Add('');
    ODCodeLines.Add('end.');
    ODCodeLines.Add('');

  end;


  Result:=ODCodeLines;
end;

procedure TOCHeaderFile.ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);
var
  I:Integer;
  ANote:String;
  ACodeLine:String;
  AStructCodeLines:TStringList;
  AOCElementStruct:TOCElementStruct;
  ANewLineBeginType:TOCCodeLineBeginType;
begin
  ParsedAllDataTypes.Clear;
  ParsedPointerDataTypes.Clear;


  Clear;

  Self.CodeLines.Assign(AObjectiveCCodeLines);

  AStructCodeLines:=TStringList.Create;

  I:=0;
  while I <AObjectiveCCodeLines.Count do
  begin

      ANewLineBeginType:=CheckOCCodeLineBeginType(AObjectiveCCodeLines[I]);




      //不是类成员
      case ANewLineBeginType of
        cltNone,cltSpace:
        begin
            AOCElementStruct:=TOCNoneStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltNoUse:
        begin
            AOCElementStruct:=TOCNoteStruct.Create;
            AOCElementStruct.ParseOCCodeLine('//'+AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltNote:
        begin
            AOCElementStruct:=TOCNoteStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltImport:
        begin
            //单元引用
            AOCElementStruct:=TOCImportHeaderStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltClassPreDeclare:
        begin
            //类预声明
            AOCElementStruct:=TOCClassPreDeclareStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltEnumBegin:
        begin
            //枚举
            AOCElementStruct:=TOCEnumStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            if Not TOCEnumStruct(AOCElementStruct).EnumHasEnd then
            begin
              AStructCodeLines.Clear;
              AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              repeat
                Inc(I);
                AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              until (Pos(';',RemoveNote(AObjectiveCCodeLines[I],ANote))>0) or (I >=AObjectiveCCodeLines.Count);
              AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
            end;
            Self.OCElementStructList.Add(AOCElementStruct);

        end;
        cltStructBegin:
        begin
            //枚举
            AOCElementStruct:=TOCStructStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            if Not TOCStructStruct(AOCElementStruct).StructHasEnd then
            begin
              AStructCodeLines.Clear;
              AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              repeat
                Inc(I);
                AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              until (Pos('}',RemoveNote(AObjectiveCCodeLines[I],ANote))>0) or (I >=AObjectiveCCodeLines.Count);
              AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
            end;
            Self.OCElementStructList.Add(AOCElementStruct);

        end;
        cltTypedefBegin:
        begin
            //类型定义
            AOCElementStruct:=TOCTypedefStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);

        end;
        cltConst:
        begin
            //常量
            AOCElementStruct:=TOCConstStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);

        end;
        cltDefine:
        begin
            //常量
            AOCElementStruct:=TOCDefineStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltNoteBegin:
        begin
            AStructCodeLines.Clear;
            ACodeLine:=ReplaceStr(AObjectiveCCodeLines[I],'/*','{');
            if Pos('*/',ACodeLine)>0 then
            begin
              //注释结束
              ACodeLine:=ReplaceStr(ACodeLine,'*/','}');
              AStructCodeLines.Add(ACodeLine);
            end
            else
            begin
              AStructCodeLines.Add(ACodeLine);
              //注释没有结束
              repeat
                Inc(I);
                if Pos('*/',AObjectiveCCodeLines[I])>0 then
                begin
                  ACodeLine:=ReplaceStr(AObjectiveCCodeLines[I],'*/','}');
                  AStructCodeLines.Add(ACodeLine);
                end
                else
                begin
                  AStructCodeLines.Add(AObjectiveCCodeLines[I]);
                end;
              until (Pos('*/',AObjectiveCCodeLines[I])>0) or (I >=AObjectiveCCodeLines.Count);
            end;

            AOCElementStruct:=TOCNoteStruct.Create;
            AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltClassBegin:
        begin
            AOCElementStruct:=TOCClassStruct.Create;
            TOCClassStruct(AOCElementStruct).OCClassNameStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            if Not TOCClassStruct(AOCElementStruct).OCClassNameStruct.ClassHasEnd then
            begin
              //协议没有一行就结束
              AStructCodeLines.Clear;
              AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              repeat
                Inc(I);
                AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              until (Copy(Trim(AObjectiveCCodeLines[I]),1,Length('@end'))='@end') or (I >=AObjectiveCCodeLines.Count);
              AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
            end;
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltProtocolBegin:
        begin
            AOCElementStruct:=TOCProtocolStruct.Create;
            TOCProtocolStruct(AOCElementStruct).OCProtocolNameStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            if Not TOCProtocolStruct(AOCElementStruct).OCProtocolNameStruct.ProtocolHasEnd then
            begin
              //协议没有一行就结束
              AStructCodeLines.Clear;
              AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              repeat
                Inc(I);
                AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              until (Copy(Trim(AObjectiveCCodeLines[I]),1,Length('@end'))='@end') or (I >=AObjectiveCCodeLines.Count);
              AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
            end;
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltAnsiCProcedureBegin:
        begin
            AOCElementStruct:=TCProcedureStruct.Create;
            TCProcedureStruct(AOCElementStruct).ParseOCCodeLine(AObjectiveCCodeLines[I]);
            if Not TCProcedureStruct(AOCElementStruct).AnsiCProcedureHasEnd then
            begin
              //协议没有一行就结束
              AStructCodeLines.Clear;
              AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              repeat
                Inc(I);
                AStructCodeLines.Add(AObjectiveCCodeLines[I]);
              until (Pos(');',AObjectiveCCodeLines[I])>0) or (Pos('}',AObjectiveCCodeLines[I])>0) or (I >=AObjectiveCCodeLines.Count);
              AOCElementStruct.ParseObjectiveCCodeLines(AStructCodeLines);
            end;
            Self.OCElementStructList.Add(AOCElementStruct);

        end;
        cltProperty:
        begin
            AOCElementStruct:=TOCPropertyStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltProcedure:
        begin
            AOCElementStruct:=TOCProcedureStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltEnd:
        begin
            AOCElementStruct:=TOCNoteStruct.Create;
            AOCElementStruct.ParseOCCodeLine('//'+AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;

      end;

      Inc(I);
  end;

  AStructCodeLines.Free;
end;

{ TOCElementStruct }

procedure TOCElementStruct.Clear;
begin
  ODCodeLines.Clear;
  ObjectiveCCodeLines.Clear;
  PreDatatypeDeclareStringList.Clear;

end;

constructor TOCElementStruct.Create(AOwner:TOCElementStruct);
begin

  Owner:=AOwner;

  Create;

end;

procedure TOCElementStruct.CommentObjectiveCCodeLinesToODCodeLines(AODCodeLines:TStringList);
  function AddComment(AStr:String):String;
  var
    I: Integer;
  begin
    Result:=AStr;

    for I := 1 to Length(AStr) do
    begin
      if AStr[I]<>' ' then
      begin
        Result:=Copy(AStr,1,I-1)+'//'+Copy(AStr,I,MaxInt);
        Break;
      end;
    end;
  end;
var
  I: Integer;
begin
  for I := 0 to ObjectiveCCodeLines.Count-1 do
  begin
    AODCodeLines.Add(AddComment(ObjectiveCCodeLines[I]));
  end;
end;

constructor TOCElementStruct.Create;
begin
  ODCodeLines:=TStringList.Create;
  //代码行列表
  ObjectiveCCodeLines:=TStringList.Create;
  NoteLines:=TStringList.Create;
  PreDatatypeDeclareStringList:=TStringList.Create;

end;

destructor TOCElementStruct.Destroy;
begin
  ODCodeLines.Free;
  ObjectiveCCodeLines.Free;
  NoteLines.Free;
  PreDatatypeDeclareStringList.Free;
  inherited;
end;

function TOCElementStruct.GenerateODCodeLines: TStringList;
begin
  Result:=ODCodeLines;
end;

procedure TOCElementStruct.ParseOCCodeLine(ACodeLine: String);
begin
end;

procedure TOCElementStruct.ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);
var
  I: Integer;
  AStartIndex:Integer;
  AEndIndex:Integer;
  ATrimedCodeLine:String;
begin
  Clear;

  Self.ObjectiveCCodeLines.Assign(AObjectiveCCodeLines);


  for I := 0 to AObjectiveCCodeLines.Count-1 do
  begin

//typedef NS_ENUM(NSInteger, ASAuthorizationAppleIDButtonType)
{
    ASAuthorizationAppleIDButtonTypeSignIn,
    ASAuthorizationAppleIDButtonTypeContinue,

    ASAuthorizationAppleIDButtonTypeSignUp API_AVAILABLE(ios(13.2), macos(10.15.1), tvos(13.1)) API_UNAVAILABLE(watchos),

    ASAuthorizationAppleIDButtonTypeDefault = ASAuthorizationAppleIDButtonTypeSignIn,
}
//NS_SWIFT_NAME(ASAuthorizationAppleIDButton.ButtonType) API_AVAILABLE(ios(13.0), macos(10.15), tvos(13.0)) API_UNAVAILABLE(watchos);


      NoteLines.Add('');

      ATrimedCodeLine:=AObjectiveCCodeLines[I];
      //存在API_AVAILABLE,那要抽去
      //'AS_EXTERN API_AVAILABLE(ios(13.0), macos(10.15), tvos(13.0), watchos(6.0))'
      //AS_EXTERN ASAuthorizationScope const ASAuthorizationScopeFullName API_AVAILABLE(ios(13.0), macos(10.15), tvos(13.0), watchos(6.0));
      if Pos('API_AVAILABLE',ATrimedCodeLine)>0 then
      begin
          AStartIndex:=Pos('API_AVAILABLE',ATrimedCodeLine);
          AEndIndex:=GetOuterestEndSign(ATrimedCodeLine,AStartIndex);
          if AEndIndex<>-1 then
          begin
            AObjectiveCCodeLines[I]:=Copy(ATrimedCodeLine,1,AStartIndex-1)+Copy(ATrimedCodeLine,AEndIndex+1,MaxInt);
            NoteLines[I]:=NoteLines[I]
                          +'//'+Copy(ATrimedCodeLine,AStartIndex,AEndIndex-AStartIndex+1);
          end;
      end;


      //API_UNAVAILABLE
      ATrimedCodeLine:=AObjectiveCCodeLines[I];
      if Pos('API_UNAVAILABLE',ATrimedCodeLine)>0 then
      begin
          AStartIndex:=Pos('API_UNAVAILABLE',ATrimedCodeLine);
          AEndIndex:=GetOuterestEndSign(ATrimedCodeLine,AStartIndex);
          if AEndIndex<>-1 then
          begin
            AObjectiveCCodeLines[I]:=Copy(ATrimedCodeLine,1,AStartIndex-1)+Copy(ATrimedCodeLine,AEndIndex+1,MaxInt);
            NoteLines[I]:=NoteLines[I]
                          +'//'+Copy(ATrimedCodeLine,AStartIndex,AEndIndex-AStartIndex+1);
          end;
      end;


      //NS_SWIFT_NAME
      ATrimedCodeLine:=AObjectiveCCodeLines[I];
      if Pos('NS_SWIFT_NAME',ATrimedCodeLine)>0 then
      begin
          AStartIndex:=Pos('NS_SWIFT_NAME',ATrimedCodeLine);
          AEndIndex:=GetOuterestEndSign(ATrimedCodeLine,AStartIndex);
          if AEndIndex<>-1 then
          begin
            AObjectiveCCodeLines[I]:=Copy(ATrimedCodeLine,1,AStartIndex-1)+Copy(ATrimedCodeLine,AEndIndex+1,MaxInt);
            NoteLines[I]:=NoteLines[I]
                          +'//'+Copy(ATrimedCodeLine,AStartIndex,AEndIndex-AStartIndex+1);
          end;
      end;


      //NS_UNAVAILABLE
      ATrimedCodeLine:=AObjectiveCCodeLines[I];
      if Pos('NS_UNAVAILABLE',ATrimedCodeLine)>0 then
      begin
        AObjectiveCCodeLines[I]:=ReplaceStr(AObjectiveCCodeLines[I],'NS_UNAVAILABLE','{NS_UNAVAILABLE}');
      end;


  end;


end;

{ TOCTypedefStruct }

procedure TOCTypedefStruct.Clear;
begin
  inherited;
  SourceDataType:='';
  DestDataType:='';

end;

function TOCTypedefStruct.GenerateODCodeLines: TStringList;
begin
  if (ODCodeLine<>'') or (Self.SourceDataType='') then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;


    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);

    //属性获取方法
    //判断一下是否是关键字
//    if Self.DestDataType<>'' then
//    begin

      if DestDataType<>'' then
      begin
        ODCodeLines.Add(DestDataType+'='+SourceDataType+';');
      end;

      
//    end
//    else
//    begin
//      ODCodeLines.Add('iOSapi.'+Self.HeaderFileName+',');
//    end;

    Result:=Inherited;

    ODCodeLine:=ODCodeLines.CommaText;


    ODCodeLines.Insert(0,Note);
  end;
end;

procedure TOCTypedefStruct.ParseOCCodeLine(ACodeLine: String);
begin
//  typedef NSUInteger BMKMapType;
  ExtractOCTypedef(ACodeLine,Self);
end;

{ TOCEnumStruct }

procedure TOCEnumStruct.Clear;
begin
  EnumValueList.Clear;
  EnumTypeName:='';
  inherited;
end;

constructor TOCEnumStruct.Create;
begin
  inherited;
  EnumValueList:=TStringList.Create;
//  EnumNoteList:=TStringList.Create;
end;

destructor TOCEnumStruct.Destroy;
begin
  EnumValueList.Free;
  inherited;
end;

function TOCEnumStruct.GenerateODCodeLines: TStringList;
var
  I: Integer;
  ASameIndex:Integer;
  ACodeLine:String;
begin

  if (ODCodeLine<>'') or (Self.EnumValueList.Count=0) then
  begin
      Result:=Inherited;
  end
  else
  begin
        ODCodeLines.Clear;


        CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);

        //属性获取方法
        //判断一下是否是关键字
        //根据相同的字母获取出枚举名称
        //比如:
    //    typedef NS_ENUM(NSInteger, XYErrorCode)
    //    {
    //        XYErrorCode_OK = 0,
    //        XYErrorCode_Unknown = 1,
    //    };

        if EnumTypeName='' then
        begin
          if Self.EnumValueList.Count>1 then
          begin
            ASameIndex:=0;
            for I := 1 to Length(EnumValueList[0]) do
            begin
              if Copy(EnumValueList[0],1,I)=Copy(EnumValueList[1],1,I) then
              begin
                Inc(ASameIndex);
              end
              else
              begin
                Break;
              end;
            end;
          end;
          if (ASameIndex>1) then
          begin
            EnumTypeName:=Trim(Copy(EnumValueList[0],1,ASameIndex));
            if Length(EnumTypeName)<2 then
            begin
              EnumTypeName:='';
            end;
          end;

        end;





        if EnumTypeName<>'' then
        begin
          ODCodeLines.Add(EnumTypeName+'_'+'='+'(');
        end
        else
        begin
          ODCodeLines.Add('Enum_Unknow_'+IntToStr(UnkownEnumIndex)+'='+'(');
          Inc(UnkownEnumIndex);
        end;


        //给最后一个逗号加上注释
        for I := Self.EnumValueList.Count-1 downto 0 do
        begin
          if Trim(RemoveNoteOnly(EnumValueList[I]))<>'' then
          begin
            ASameIndex:=Pos(',',RemoveNoteOnly(EnumValueList[I]));
            if ASameIndex>0 then
            begin
              EnumValueList[I]:=Copy(EnumValueList[I],1,ASameIndex-1)
                            +'//'
                            +Copy(EnumValueList[I],ASameIndex,MaxInt)
                            ;
            end;
            Break;
          end;
        end;


        for I := 0 to Self.EnumValueList.Count-1 do
        begin
          ACodeLine:=EnumValueList[I];

          //将0x直接转换为$
//          ACodeLine:=ReplaceStr(ACodeLine,'= 0x','= $');
//          ACodeLine:=ReplaceStr(ACodeLine,'=0x','=$');
          ACodeLine:=ReplaceStr(ACodeLine,'0x','$');

          //<<转换为shl
          ACodeLine:=ReplaceStr(ACodeLine,'<<',' shl ');

          //>>转换为shr
          ACodeLine:=ReplaceStr(ACodeLine,'>>',' shr ');

          //&转换为and
          ACodeLine:=ReplaceStr(ACodeLine,'&',' and ');

          //|转换为and
          ACodeLine:=ReplaceStr(ACodeLine,'|',' or ');

          ODCodeLines.Add(ACodeLine);
        end;


        ODCodeLines.Add(')'+';');




        //因为OC的函数里面不能传枚举类型,只能用Integer来替代
        ODCodeLines.Add(EnumTypeName+'='+'Integer;');


        //加入间隔
        ODCodeLines.Add('');
        ODCodeLines.Add('');
        ODCodeLines.Add('');
        ODCodeLines.Add('');



        Result:=Inherited;

        ODCodeLine:=ODCodeLines.CommaText;
  end;

end;

procedure TOCEnumStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractOCEnum(ACodeLine,Self);
end;

procedure TOCEnumStruct.ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);
var
  I: Integer;
  ANote:String;
  ACodeLine:String;
  ADevideIndex:Integer;
  ATempEnumTypeName:String;
  ANewLineBeginType:TOCCodeLineBeginType;
begin
  Inherited;
  ExtractOCEnum(AObjectiveCCodeLines[0],Self);

  I:=1;
  while I < AObjectiveCCodeLines.Count do
  begin
    //{
    //    BMK_COORDTYPE_GPS = 0, ///GPS设备采集的原始GPS坐标
    //    BMK_COORDTYPE_COMMON,  ///google地图、soso地图、aliyun地图、mapabc地图和amap地图所用坐标
    //} BMK_COORD_TYPE;


    //typedef NS_ENUM(NSInteger, CNContactType)
    //{
    //    CNContactTypePerson,
    //    CNContactTypeOrganization,
    //} NS_ENUM_AVAILABLE(10_11, 9_0);

    //typedef enum TVoiceRecognitionClientErrorCode
    //{
    //    EVRClientErrorCodeRecoderException = (EVRClientErrorDomainRecord << 16) | (0x0000FFFF & 1),                // 录音设备异常
    //    EVRClientErrorCodeRecoderNoPermission = (EVRClientErrorDomainRecord << 16) | (0x0000FFFF & 2),             // 无录音权限
    //    EVRClientErrorCodeRecoderUnAvailable = (EVRClientErrorDomainRecord << 16) | (0x0000FFFF & 3),              // 录音设备不可用
    //    EVRClientErrorCodeInterruption = (EVRClientErrorDomainRecord << 16) | (0x0000FFFF & 4),                    // 录音中断
    //
    //    EVRClientErrorCodeVADException = (EVRClientErrorDomainVAD << 16) | (0x0000FFFF & 1),                       // 前端库异常
    //    EVRClientErrorCodeNoSpeech = (EVRClientErrorDomainVAD << 16) | (0x0000FFFF & 2),                           // 用户未说话
    //    EVRClientErrorCodeShort = (EVRClientErrorDomainVAD << 16) | (0x0000FFFF & 3),                              // 用户说话声音太短
    //
    //    EVRClientErrorCodeDecoderExceptioin = (EVRClientErrorDomainOnline << 16) | (0x0000FFFF & 1),               // 在线识别引擎异常
    //    EVRClientErrorCodeDecoderNetworkUnavailable = (EVRClientErrorDomainOnline << 16) | (0x0000FFFF & 2),       // 网络不可用
    //    EVRClientErrorCodeDecoderTokenFailed = (EVRClientErrorDomainOnline << 16) | (0x0000FFFF & 3),              // 获取token失败
    //    EVRClientErrorCodeDecoderResolveUrlFailed = (EVRClientErrorDomainOnline << 16) | (0x0000FFFF & 4),         // 解析url失败
    //    EVRClientErrorCodeLocalTimeout = (EVRClientErrorDomainLocalNetwork << 16) | (0x0000FFFF & 1),              // 请求超时
    //
    //    EVRClientErrorCodeServerParamError = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3001),            // 协议参数错误
    //    EVRClientErrorCodeServerRecognError = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3002),           // 识别过程出错
    //    EVRClientErrorCodeServerNoFindResult = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3003),          // 没有找到匹配结果
    //    EVRClientErrorCodeServerAppNameUnknownError = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3004),   // AppnameUnkown错误
    //    EVRClientErrorCodeServerSpeechQualityProblem = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3005),  // 声音不符合识别要求
    //    EVRClientErrorCodeServerSpeechTooLong = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3006),         // 语音过长
    //
    //    EVRClientErrorCodeCommonBusy = (EVRClientErrorDomainCommom << 16) | (0x0000FFFF & 1),                      // 识别器忙
    //    EVRClientErrorCodeCommonPropertyListInvalid = (EVRClientErrorDomainCommom << 16) | (0x0000FFFF & 2),       // 垂类设置有误
    //    EVRClientErrorCodeCommonEnqueueError = (EVRClientErrorDomainCommom << 16) | (0x0000FFFF & 3)               // 语音数据enqueue失败
    //} TVoiceRecognitionClientErrorCode;



    //没有到类头
    ANewLineBeginType:=CheckOCCodeLineBeginType(AObjectiveCCodeLines[I]);
    case ANewLineBeginType of
        cltNoUse,cltNote:
        begin
          EnumValueList.Add('//'+AObjectiveCCodeLines[I]);
        end;
        cltNoteBegin:
        begin

            EnumValueList.Add('//'+AObjectiveCCodeLines[I]);
            //注释没有结束
            repeat
              Inc(I);


              EnumValueList.Add('//'+AObjectiveCCodeLines[I]);
            until (Pos('*/',AObjectiveCCodeLines[I])>0) or (I >=AObjectiveCCodeLines.Count-1);

        end
        else
        begin
            if (Pos(';',RemoveNote(AObjectiveCCodeLines[I],ANote))>0) then
            begin

                //枚举结束了
                ATempEnumTypeName:=RemoveNote(AObjectiveCCodeLines[I],ANote);
                ADevideIndex:=Pos(';',ATempEnumTypeName);
                ATempEnumTypeName:=Trim(Copy(ATempEnumTypeName,1,ADevideIndex-1));
                ADevideIndex:=Pos('}',ATempEnumTypeName);
                if ADevideIndex>0 then
                begin
                  ATempEnumTypeName:=Trim(Copy(ATempEnumTypeName,ADevideIndex+1,MaxInt));
                end;
                if ATempEnumTypeName<>'' then
                begin

                  if (Copy(ATempEnumTypeName,1,Length('NS_ENUM_AVAILABLE'))='NS_ENUM_AVAILABLE') then
                  begin

                  end
                  else
                  begin
                    EnumTypeName:=ATempEnumTypeName;
                  end;
                end;

            end
            else
            begin
              if (Trim(AObjectiveCCodeLines[I])<>'')
                and (Copy(Trim(AObjectiveCCodeLines[I]),1,1)<>'{') then
              begin
                //万一有注释,要去掉
                Self.EnumValueList.Add( FixNote(AObjectiveCCodeLines[I]) );
              end;
            end;
        end;
    end;
    Inc(I);
  end;

end;




{ TOCStructStruct }

procedure TOCStructStruct.Clear;
var
  I:Integer;
begin
  StructValueList.Clear;
  StructTypeName:='';

  for I := 0 to OCCodeLineElementStructList.Count-1 do
  begin
    TObject(OCCodeLineElementStructList[I]).Free;
  end;
  OCCodeLineElementStructList.Clear;

  inherited;
end;

constructor TOCStructStruct.Create;
begin
  inherited;
  StructValueList:=TStringList.Create;
  OCCodeLineElementStructList:=TList.Create;

end;

destructor TOCStructStruct.Destroy;
begin
  OCCodeLineElementStructList.Free;
  StructValueList.Free;
  inherited;
end;

function TOCStructStruct.GenerateODCodeLines: TStringList;
var
  I: Integer;
//  ACodeLine:Integer;
//  ASameIndex:Integer;
begin

  if (ODCodeLine<>'') or (Self.StructValueList.Count=0) then
  begin
    Result:=Inherited;
  end
  else
  begin
    ODCodeLines.Clear;


    CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);


    ODCodeLines.Add(StructTypeName+'='+'record');

    for I := 0 to Self.OCCodeLineElementStructList.Count-1 do
    begin
      if TOCCodeLineElementStruct(OCCodeLineElementStructList[I]).GenerateODCodeLines.Count>0 then
      begin
        ODCodeLines.Add( Const_Tab_Char
            +TOCCodeLineElementStruct(OCCodeLineElementStructList[I]).GenerateODCodeLines[0]
            );
      end;
    end;

    ODCodeLines.Add('end;');




//  PBMKMapPoint=^BMKMapPoint;
//  BMKMapPointArray=array of BMKMapPoint;
//  PBMKMapPointArray=^BMKMapPointArray;
    ODCodeLines.Add('P'+StructTypeName+'='+'^'+StructTypeName+';');
    ODCodeLines.Add(StructTypeName+'Array='+'array of '+StructTypeName+';');
    ODCodeLines.Add('P'+StructTypeName+'Array='+'^'+StructTypeName+'Array;');





    //加入间隔
    ODCodeLines.Add('');
    ODCodeLines.Add('');
    ODCodeLines.Add('');
    ODCodeLines.Add('');




    Result:=Inherited;



    ODCodeLine:=ODCodeLines.CommaText;
  end;

end;

procedure TOCStructStruct.ParseOCCodeLine(ACodeLine: String);
begin
  ExtractOCStruct(ACodeLine,Self);
end;

procedure TOCStructStruct.ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);
var
  I: Integer;
  ANote:String;
  ADevideIndex:Integer;
  AOCElementStruct:TOCElementStruct;
begin
  Inherited;
  ExtractOCStruct(AObjectiveCCodeLines[0],Self);
  for I := 1 to AObjectiveCCodeLines.Count-1 do
  begin
/////矩形，用直角地理坐标表示
//typedef struct {
//    BMKMapPoint origin; ///< 屏幕左上点对应的直角地理坐标
//    BMKMapSize size;	///< 坐标范围
//} BMKMapRect;
    if (Pos('}',RemoveNote(AObjectiveCCodeLines[I],ANote))>0) then
    begin
      StructTypeName:=RemoveNote(AObjectiveCCodeLines[I],ANote);
      ADevideIndex:=Pos(';',StructTypeName);
      StructTypeName:=Trim(Copy(StructTypeName,1,ADevideIndex-1));
      ADevideIndex:=Pos('}',StructTypeName);
      if ADevideIndex>0 then
      begin
        Self.StructTypeName:=Trim(Copy(StructTypeName,ADevideIndex+1,MaxInt));
      end;
    end
    else
    begin
      Self.StructValueList.Add(AObjectiveCCodeLines[I]);
    end;
  end;

  for I := 0 to StructValueList.Count-1 do
  begin
    AOCElementStruct:=TOCVariableStruct.Create;
    AOCElementStruct.ParseOCCodeLine(StructValueList[I]);
    Self.OCCodeLineElementStructList.Add(AOCElementStruct);
  end;


end;


{ TOCClassPreDeclareStruct }

procedure TOCClassPreDeclareStruct.Clear;
begin
  inherited;
  OCClassName:='';
end;

function TOCClassPreDeclareStruct.GenerateODCodeLines: TStringList;
var
  I: Integer;
  AClassNames:TStringList;
begin
  if (ODCodeLine<>'') or (ClassName='') then
  begin
      Result:=Inherited;
  end
  else
  begin
      ODCodeLines.Clear;


      CommentObjectiveCCodeLinesToODCodeLines(ODCodeLines);


      if OCClassName<>'' then
      begin
          AClassNames:=TStringList.Create;
          AClassNames.CommaText:=OCClassName;
          for I := 0 to AClassNames.Count-1 do
          begin
//            ODCodeLines.Add(AClassNames[I]+'=interface;');
            ODCodeLines.Add(AClassNames[I]+'=Pointer;');
          end;
          AClassNames.Free;
      end;
      Result:=Inherited;

      ODCodeLine:=ODCodeLines.CommaText;

  end;
end;

procedure TOCClassPreDeclareStruct.ParseOCCodeLine(ACodeLine: String);
var
  AIndex:Integer;
begin
  inherited;

  //@class SuperPlayerView;
  //@class HXPhotoModel, HXAlbumModel, HXPhotoManager;
  ACodeLine:=Trim(ACodeLine);

  ACodeLine:=Trim(Copy(ACodeLine,Length('@class')+1,MaxInt));

  AIndex:=Pos(';',ACodeLine);
  if AIndex>0 then
  begin
    OCClassName:=Trim(Copy(ACodeLine,1,AIndex-1));
  end;


end;



initialization
  ParsedAllDataTypes:=TStringList.Create;
  ParsedPointerDataTypes:=TStringList.Create;
  DelphiKeywords:=TStringList.Create;
  DelphiKeywords.CommaText:='type,class,interface,unit,implementation,property,function,procedure,begin,end,'
        +'finalization,if,while,repeat,until,for,mod,div,const,array,to,message,object';

  StaticLibraryName:='{$I BaiduMapDylibName.inc}';
  UnitNamePrefix:='';
  UnitNameBackfix:='_iOSApi';



finalization
  ParsedAllDataTypes.Free;
  ParsedPointerDataTypes.Free;
  DelphiKeywords.Free;


end.
