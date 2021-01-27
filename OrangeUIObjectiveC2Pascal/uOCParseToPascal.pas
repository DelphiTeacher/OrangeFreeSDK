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
                   cltSpace,              //�ո�
                   cltNote,               //ע��
                   cltNoUse,              //δʹ��
                   cltImport,             //�������
                   cltEnumBegin,          //ö�ٿ�ʼ
                   cltStructBegin,        //�ṹ�忪ʼ
                   cltTypedefBegin,       //���Ͷ���
                   cltNoteBegin,          //ע�Ϳ�ʼ
                   cltClassPreDeclare,    //��Ԥ����
                   cltClassBegin,         //��������ʼ
                   cltProtocolBegin,      //�ӿ�������ʼ
                   cltAnsiCProcedureBegin,//��׼������ʼ
                   cltConst,              //����
                   cltDefine,             //����
                   cltProperty,           //������
                   cltProcedure,          //�෽��
                   cltEnd                 //��������
                   );




  TOCElementStruct=class
    Owner:TOCElementStruct;


    //OC�������б�
    ObjectiveCCodeLines:TStringList;
    //Delphi�������б�
    ODCodeLines:TStringList;



    NoteLines:TStringList;
    PreDatatypeDeclareStringList:TStringList;

    //��OC�Ĵ���ע�͵��ŵ����ɴ����е�
    procedure CommentObjectiveCCodeLinesToODCodeLines(AODCodeLines:TStringList);
  public
    constructor Create(AOwner:TOCElementStruct);overload;virtual;
    constructor Create();overload;virtual;
    Destructor Destroy;override;
  public
    procedure Clear;virtual;
    //����,����
    procedure ParseOCCodeLine(ACodeLine:String);virtual;
    //����,����
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);virtual;
    //ת��
    function GenerateODCodeLines:TStringList;virtual;
  end;




  //OC�����н���
  TOCCodeLineElementStruct=class(TOCElementStruct)
    //ע��
    Note:String;
    //OC������
    OCCodeLine:String;
    //Delphi������
    ODCodeLine:String;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
  end;



  //ObjectiveC��ͷ�ļ�����
  //#import <UIKit/UIKit.h>
  TOCImportHeaderStruct=class(TOCCodeLineElementStruct)
    //ͷ�ļ�Ŀ¼��
    DirectoryName:String;
    //ͷ�ļ�����
    HeaderFileName:String;
    //�Ƿ����Զ����ͷ�ļ�������ϵͳ��
    IsCustomerHeaderFile:Boolean;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;



  //ObjectiveC����Ԥ����
  //@class SuperPlayerView;
  TOCClassPreDeclareStruct=class(TOCCodeLineElementStruct)
    //����
    OCClassName:String;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;




  //ObjectiveC��������
  TOCNoneStruct=class(TOCCodeLineElementStruct)
  public
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;


  //C���¼��ṹ
  TCEventStruct=class(TOCCodeLineElementStruct)
    //��������������
    ProcedureDataType:String;
    //����������
    ProcedureName:String;
    //�����Ĳ�������
    ParamNames:TStringList;
    //�����Ĳ�����������
    ParamDataTypes:TStringList;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //����
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
    //��ȡ����
    function GetODCodeLine:String;
    function GetTypeName():String;
//    //��ȡʵ��
//    function GetImple:String;
  end;



  //ObjectiveC�����Ͷ���
  TOCTypedefStruct=class(TOCCodeLineElementStruct)
    //Դ����
    SourceDataType:String;
    //Ŀ������
    DestDataType:String;
  public
    
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;


  //ObjectiveC��Э�����ṹ
  TOCProtocolNameStruct=class(TOCCodeLineElementStruct)
    //Э����
    ProtocolName:String;
    //Э��ʵ������
    ProtocolImpleClassName:String;
    //Э���Ƿ�ӵ�г�Ա����
    ProtocolHasPrivateMember:Boolean;
    //Э���Ƿ��һ�������ͽ�����
    ProtocolHasEnd:Boolean;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;



  //ObjectiveC�������ṹ
  TOCClassNameStruct=class(TOCCodeLineElementStruct)
    //����
    _ClassName:String;
    //�ุ��
    ClassParentClassName:String;
    //Э��
    ClassParentProtocols:String;
    //���Ƿ�ӵ�г�Ա����
    ClassHasPrivateMember:Boolean;
    //���Ƿ��һ�������ͽ�����
    ClassHasEnd:Boolean;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;




  //ObjectiveC�ĳ�Ա�����ṹ
  TOCVariableStruct=class(TOCCodeLineElementStruct)
    //������
    VariableName:String;
    //��������
    VariableDataType:String;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;


  //ObjectiveC�ĳ����ṹ
  TOCConstStruct=class(TOCCodeLineElementStruct)
    //��������?
    ConstType:String;
    //������
    ConstName:String;
    //������������
    ConstDataType:String;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
    function GetImple(ALibPath:String):String;
  end;


  //ObjectiveC�ĳ����ṹ
  TOCDefineStruct=class(TOCCodeLineElementStruct)
//    //��������
//    DefineType:String;
    //������
    DefineName:String;
    DefineValue:String;
//    //������������
//    DefineDataType:String;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;




  //ObjectiveC�����Խṹ(��������������)
  TOCPropertyStruct=class(TOCCodeLineElementStruct)
    OwnerName:String;
//    IsAddCdecl:Boolean;

    Imple:TStringList;

    //������
    PropertyName:String;
    //������������
    PropertyDataType:String;
    //�����Ƿ�ֻ��
    PropertyIsReadOnly:Boolean;
    //��������
    PropertyDesciption:String;
    //��ȡ����
    GetterFunctionName:String;
    //���÷���
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

    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;




  //ObjectiveC�ķ����ṹ
  TOCProcedureStruct=class(TOCCodeLineElementStruct)
    OwnerName:String;

    Imple:TStringList;
    //��������(+����-,+���෽��,-�Ƕ��󷽷�)
    ProcedureType:String;
    //��������������
    ProcedureDataType:String;
    //����������
    ProcedureName:String;
    //��һ��������
    FirstParamName:String;
    //��һ����������
    FirstParamDataType:String;
    //�����ķ�������
    OtherProcedureNames:TStringList;
    //�����Ĳ�������
    OtherParamNames:TStringList;
    //�����Ĳ�����������
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
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines: TStrings);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;





  //C�ı�׼�����ṹ
  TCProcedureStruct=class(TOCCodeLineElementStruct)
    //��������(+����-,+���෽��,-�Ƕ��󷽷�)
    ProcedureType:String;
    //��������������
    ProcedureDataType:String;
    //����������
    ProcedureName:String;
    //�����Ĳ�������
    ParamNames:TStringList;
    //�����Ĳ�����������
    ParamDataTypes:TStringList;
    //�����Ƿ����
    AnsiCProcedureHasEnd:Boolean;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //����
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
    //��ȡ����
    function GetODCodeLine:String;
    //��ȡʵ��
    function GetImple:String;
  end;




  //ObjectiveC��ע��
  TOCNoteStruct=class(TOCCodeLineElementStruct)
  public
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;





  //ö��
  TOCEnumStruct=class(TOCCodeLineElementStruct)
    //ö��������
    EnumTypeName:String;
    //ö��ֵ�б�
    EnumValueList:TStringList;
    //ö���Ƿ����
    EnumHasEnd:Boolean;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //����
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;




  //�ṹ��
  TOCStructStruct=class(TOCCodeLineElementStruct)
    //�ṹ������
    StructTypeName:String;
    //�ṹ���Ա�б�
    StructValueList:TStringList;
    //�ṹ���Ա���б�
    OCCodeLineElementStructList:TList;
    //�ṹ���Ƿ����
    StructHasEnd:Boolean;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //����
    procedure ParseOCCodeLine(ACodeLine:String);override;
    //����
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
  end;


  //ObjectiveC��Э��ṹ
  TOCProtocolStruct=class(TOCElementStruct)
    Imple:TStringList;
    //Э�����ṹ
    OCProtocolNameStruct:TOCProtocolNameStruct;
    //Ԫ���б�
    OCCodeLineElementStructList:TList;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //����
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
    function GetImple:TStringList;
  end;





  //ObjectiveC����ṹ
  TOCClassStruct=class(TOCElementStruct)
    
    //�����ṹ
    OCClassNameStruct:TOCClassNameStruct;
    //Ԫ���б�
    OCCodeLineElementStructList:TList;
  public
    constructor Create;override;
    Destructor Destroy;override;
  public
    procedure Clear;override;
    //����
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);override;
    //ת��
    function GenerateODCodeLines:TStringList;override;
    function GetImple:String;
  end;






  TOCHeaderFile=class
    //�������б�
    CodeLines:TStringList;
    //Delphi������
    ODCodeLines:TStringList;
    //�ṹ�б�
    OCElementStructList:TList;
  public
    constructor Create;
    Destructor Destroy;override;
  public
    procedure Clear;
    //����OCͷ�ļ��Ľṹ
    procedure ParseObjectiveCCodeLines(AObjectiveCCodeLines:TStrings);
    //ת����Delphi����
    function GenerateODCodeLines:TStringList;
    //ת���ɵ�Ԫ
    function GetUnitCodeLines(AUnitName:String;AStaticLibName:String;AUnitNamePrefix:String;AUnitNameSuffix:String):TStringList;
  end;












//�����ųɶԵĽ���(void (^)(void))
function FindBracketPairEnd(ABracketBegin,ABracketEnd:Char;ACodeLine:String;APosStartIndex:Integer=1):Integer;
//ȥ������
function RemoveAndFixBracketPair(ADataType:String;AOCElementStruct:TOCElementStruct):String;


//����GUID
function CreateGUIDStr:String;
//ת����������
function ConvertOCTypeToODType(AOCDataType:String;Owner:TOCElementStruct=nil):String;
//ȥ��һ���е�ObjectiveCע����
function RemoveNote(ACodeLine:String;var ANote:String):String;
procedure FixPointerName(var AName:String;var ADataType:String);
function FixDelphiKeywordName(AName:String):String;
//���ObjectiveC�Ĵ���������
function CheckOCCodeLineBeginType(ACodeLine:String):TOCCodeLineBeginType;
//����
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
//ȡ����������,�Ƚϸ���
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



//ȥ��һ���е�ObjectiveCע����
function RemoveNote(ACodeLine:String;var ANote:String):String;
begin
///**
// *�趨��ǰ��ͼ����ʾ��Χ,����ֱ������ϵ��ʾ
// *@param mapRect Ҫ�趨�ĵ�ͼ��Χ����ֱ������ϵ��ʾ
// *@param animate �Ƿ���ö���Ч��
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
    //���䶼��
    Result:='';
    ANote:=ACodeLine;
    Exit;
  end;
end;

//ȥ��һ���е�ObjectiveCע����
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

//ȥ��һ���е�ObjectiveCע����
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
    //��ָ��
    ADataType:=ADataType+'*';
    //ȥ���Ǻ�
    AName:=ReplaceStr(AName,'*','');

//    if AName then

  end;
end;


//'AS_EXTERN API_AVAILABLE(ios(13.0), macos(10.15), tvos(13.0), watchos(6.0))'
//ȡ�������Ľ�������
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

//���ObjectiveC�Ĵ���������
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
    //����
    Result:=cltSpace;
    Exit;
  end;


  //����ע��
  if Copy(ATrimedCodeLine,1,Length('//'))='//' then
  begin
    //ע��
    Result:=cltNote;
    Exit;
  end;




  // /*�Ƿֶ�ע�Ϳ�ʼ,Ҫ�ж��ǲ������ζ���ע��,���������*/���Ǳ�ʾ�Ƕ��ע��
  if (Copy(ATrimedCodeLine,1,Length('/*'))='/*') then
  begin
      if (Pos('*/',ATrimedCodeLine)>0) then
      begin
          Result:=cltNote;
          Exit;
      end
      else
      begin
          //�ֶ�ע�Ϳ�ʼ,Ҫ�ж��ǲ������ζ���ע��
          Result:=cltNoteBegin;
          Exit;
      end;

  end;







  //����ͷ�ļ�
  if Copy(ATrimedCodeLine,1,Length('#import'))='#import' then
  begin
    Result:=cltImport;
    Exit;
  end;




  //����API_AVAILABLE,��Ҫ��ȥAPI_AVAILABLE(****)
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
  //ȥ��__WATCHOS_PROHIBITED
  //ȥ��__TVOS_PROHIBITED






  //����
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




  //����
  if Copy(ATrimedCodeLine,1,Length('typedef'))='typedef' then
  begin
      Result:=cltTypedefBegin;
      //ö��
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

      //�ṹ��
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

  //����
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

  //����
  if Copy(ATrimedCodeLine,1,Length('#define '))='#define ' then
  begin
    Result:=cltDefine;
    Exit;
  end;


  //��
  if Copy(ATrimedCodeLine,1,Length('@interface'))='@interface' then
  begin
    Result:=cltClassBegin;
    Exit;
  end;

  //��Ԥ����
  if Copy(ATrimedCodeLine,1,Length('@class'))='@class' then
  begin
    Result:=cltClassPreDeclare;
    Exit;
  end;


  //Э��
  if Copy(ATrimedCodeLine,1,Length('@protocol'))='@protocol' then
  begin
    Result:=cltProtocolBegin;
    Exit;
  end;

  //OC����
  if (Copy(ATrimedCodeLine,1,Length('+'))='+') or (Copy(ATrimedCodeLine,1,Length('-'))='-') then
  begin
    Result:=cltProcedure;
    Exit;
  end;

  //OC����
  if Copy(ATrimedCodeLine,1,Length('@property'))='@property' then
  begin
    Result:=cltProperty;
    Exit;
  end;


  //���Э����������
  if Copy(ATrimedCodeLine,1,Length('@end'))='@end' then
  begin
    Result:=cltEnd;
    Exit;
  end;




  //�ⲿ����
  //'extern NSString* BDS_ASR_CMD_STOP;'
  if (Pos('(',ATrimedCodeLine)>0)
//    or (Copy(ATrimedCodeLine,1,Length('extern'))='extern')
    then
  begin
    //������,Ӧ���ǹ���
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
//                //��ȡ��������
//  //              ADevideIndex:=Pos(')',ATrimedCodeLine);
//                ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
//                if ADevideIndex>0 then
//                begin
//                  //����������������
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
//                  //����������
//                  ADevideIndex:=Pos(' ',ATrimedCodeLine);
//                  AEndIndex:=Pos(';',ATrimedCodeLine);
//                  if ADevideIndex>0 then
//                  begin
//                    //���в���
//                    AParamName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
//  //                  AOCProcedureStruct.OtherParamNames.Add();
//                    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
//                  end
//                  else if AEndIndex>0 then
//                  begin
//                    //���һ��������
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
  //ð���±�
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
// *���ݵ�ǰ��ͼView�Ĵ��ڴ�С���������region�������ʺϵ�ǰ��ͼ������ʾ��region���������̻ᱣ֤���ĵ㲻�ı�
// *@param region �������ľ�γ�ȷ�Χ
// *@return �������ʺϵ�ǰ��ͼ������ʾ�ľ�γ�ȷ�Χ
// */
//- (BMKCoordinateRegion)regionThatFits:(BMKCoordinateRegion)region;
//
///**
// *�趨��ǰ��ͼ����ʾ��Χ
// *@param region Ҫ�趨�ĵ�ͼ��Χ���þ�γ�ȵķ�ʽ��ʾ
// *@param animated �Ƿ���ö���Ч��
// */
//- (void)setRegion:(BMKCoordinateRegion)region animated:(BOOL)animated;
//@property (nonatomic, strong) id <BMKAnnotation> annotation;

//- (void)addLocalVideo:(NSArray<NSURL *> *)urlArray selected:(BOOL)selected DEPRECATED_MSG_ATTRIBUTE("Use ''addCustomAssetModel:'' instead");

  ATrimedCodeLine:=Trim(ACodeLine);
  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCProcedureStruct.Note);
  if ATrimedCodeLine='' then Exit;
  

  //��������,+,-
  AOCProcedureStruct.ProcedureType:=Copy(ATrimedCodeLine,1,1);
  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,2,MaxInt));


  //��������ֵ
//  ADevideIndex:=Pos(')',ATrimedCodeLine);
  ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    //ȥ����������ֵ������
    ADataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex));
//    ADataType:=ReplaceStr(ADataType,')','');
//    ADataType:=ReplaceStr(ADataType,'(','');
    ADataType:=RemoveAndFixBracketPair(ADataType,AOCProcedureStruct);
    AOCProcedureStruct.ProcedureDataType:=ADataType;
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    GetDataType(ATrimedCodeLine,AOCProcedureStruct.ProcedureDataType,AOCProcedureStruct);


    //��λ��������
    ADevideIndex:=Pos(':',ATrimedCodeLine);
    AEndIndex:=Pos(';',ATrimedCodeLine);
    AOCProcedureStruct.ProcedureHasEnd:=AEndIndex>0;

    if ADevideIndex>0 then
    begin
      //��ȡ��������
      AOCProcedureStruct.ProcedureName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      FixPointerName(AOCProcedureStruct.ProcedureName,AOCProcedureStruct.ProcedureDataType);
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));


      //��ȡ����
//      ADevideIndex:=Pos(')',ATrimedCodeLine);
      ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
      if ADevideIndex>0 then
      begin
          //��һ����������
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
                //ֻ��һ������
                AOCProcedureStruct.FirstParamName:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));
                FixPointerName(AOCProcedureStruct.FirstParamName,AOCProcedureStruct.FirstParamDataType);
          end
          else
          begin
                //�ж������
                AOCProcedureStruct.FirstParamName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
                FixPointerName(AOCProcedureStruct.FirstParamName,AOCProcedureStruct.FirstParamDataType);
                ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

                while Pos(':',ATrimedCodeLine)>0 do
                begin
                    //ȡ������������
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




//                            //��ȡ��������
//                            ExtractOCProcedurePararmList(ATrimedCodeLine,
//                                                        AOCProcedureStruct.OtherParamDataTypes,
//                                                        AOCProcedureStruct.OtherParamNames,
//                                                        AOCProcedureStruct);

              //              ADevideIndex:=Pos(')',ATrimedCodeLine);
                            ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
                            if ADevideIndex>0 then
                            begin
                              //����������������
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


                              //����������
                              ADevideIndex:=Pos(' ',ATrimedCodeLine);
                              AEndIndex:=Pos(';',ATrimedCodeLine);
                              if ADevideIndex>0 then
                              begin
                                //���в���
                                AParamName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
              //                  AOCProcedureStruct.OtherParamNames.Add();
                                ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
                              end
                              else if AEndIndex>0 then
                              begin
                                //���һ��������
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
                            //��Ҫ��
                            Break;
                      end;



                    end;
                end;
          end;
      end;
    end
    else if AEndIndex>0 then
    begin
      //û�в���
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
      //�ж���û����, id <BMKAnnotation>,NSArray<SuperPlayerUrl *>
      //�ж���û��ģ����, id <BMKAnnotation>,NSArray<SuperPlayerUrl *>
      else if (Copy(ATrimedCodeLine,1,1)='<')
              or (Pos('<',ADataType)>0) then
      begin

        //�ж���û����, id <BMKAnnotation>,NSArray<SuperPlayerUrl *>
  //      if (AOCPropertyStruct.PropertyDataType='id') and (ATrimedCodeLine<>'') then
  //      begin
//          ADevideIndex:=Pos('<',ATrimedCodeLine);
//          if ADevideIndex=1 then
//          begin
            ADevideIndex:=Pos('>',ATrimedCodeLine);
            ADataType:=ADataType+ Copy(ATrimedCodeLine,1,ADevideIndex);
            //Ҫ��NSArray<SuperPlayerUrl *>�е�<>ת��Ϊ{}
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
      //�ǲ��Ƿ�������,�������ͺ����һ��(^ ������ )
      else if ANeedCheckIsEvent and (Copy(ATrimedCodeLine,1,1)='(') then
      begin
          //�������void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);
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
                //��ȡ�����б�
                AOCElementStruct.Owner.PreDatatypeDeclareStringList.AddStrings(ACEventStruct.GenerateODCodeLines);
              end
              else if (AOCElementStruct<>nil) then
              begin
                //��ȡ�����б�
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



      //�������������������
      ADevideIndex:=Pos('^',ATrimedCodeLine);
      ADescriptDevideEndIndex:=Pos(')',ATrimedCodeLine);
      if (ADevideIndex>0) and (ADescriptDevideEndIndex>0) then
      begin
        //�������͵Ĳ���
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


          
            //�ֽ������,�����Զ��ŷָ�
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
                  //���в���
    //              ACProcedureStruct.ParamNames.Add(ReplaceStr(
                  AParamName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));//,'*','{*}'));
                  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
                end
                else
                begin
                  //���һ��������
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
  //ð���±�
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
// *�������ĵ�;�������BMKCoordinateRegion
// *@param centerCoordinate ���ĵ�����
// *@param latitudinalMeters γ�ȷ���ľ��뷶Χ����λ����
// *@param longitudinalMeters ���ȷ���ľ��뷶Χ����λ����
// *@return �������ĵ�;�������BMKCoordinateRegion
// */
//UIKIT_EXTERN BMKCoordinateRegion BMKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters);
//
///**
// *����γ������ת��ΪͶӰ���ֱ�ǵ�������
// *@param coordinate ��ת���ľ�γ������
// *@return ת�����ֱ�ǵ�������
// */
//UIKIT_EXTERN BMKMapPoint BMKMapPointForCoordinate(CLLocationCoordinate2D coordinate);
//BMKMapPoint BMKMapPointForCoordinate(CLLocationCoordinate2D coordinate);
//'extern NSString* BDS_ASR_CMD_STOP;'



  ATrimedCodeLine:=Trim(ACodeLine);
  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,ACProcedureStruct.Note);
  if ATrimedCodeLine='' then Exit;


  //ȥ��ʵ����{},�����������Ǵ���
  ASpace1Index:=Pos('{',ATrimedCodeLine);
  if ASpace1Index>0 then
  begin
    ACProcedureStruct.Note:=Copy(ATrimedCodeLine,ASpace1Index,MaxInt)+ACProcedureStruct.Note;
    ATrimedCodeLine:=Copy(ATrimedCodeLine,1,ASpace1Index-1);
  end;


  ASpace1Index:=Pos(' ',ATrimedCodeLine);
  //��һ���˺ܶ�ո�
  ASpace2Index:=PosEx(' ',ATrimedCodeLine,ASpace1Index+1);
//  ADevideIndex:=Pos(')',ATrimedCodeLine);
  //������ʼ,����û�в���
  ADevideIndex:=FindBracketPairEnd('(',')',ATrimedCodeLine);
  if ADevideIndex=-1 then
  begin
    //û�в���,ȡ���һ���ֺ�
    ADevideIndex:=Length(ATrimedCodeLine);
  end;

  if (ASpace2Index<>-1) and (ASpace2Index<ADevideIndex) then
  begin
    //�з������� UIKIT_EXTERN
    //��������
    ACProcedureStruct.ProcedureType:=Copy(ATrimedCodeLine,1,ASpace1Index-1);
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ASpace1Index+1,MaxInt));
  end
  else
  begin
    //û�з�������
  end;



  ADevideIndex:=Pos(' ',ATrimedCodeLine);
  //��������ֵ
  if ADevideIndex>0 then
  begin
        //ȥ����������ֵ������
        AParamDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
        AParamDataType:=ReplaceStr(AParamDataType,')','');
        AParamDataType:=ReplaceStr(AParamDataType,'(','');
        ACProcedureStruct.ProcedureDataType:=AParamDataType;
        ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
        GetDataType(ATrimedCodeLine,ACProcedureStruct.ProcedureDataType,ACProcedureStruct);




        //��λ��������
        ADevideIndex:=Pos('(',ATrimedCodeLine);
//        AEndIndex:=Pos(');',ATrimedCodeLine);
        AEndIndex:=Pos(';',ATrimedCodeLine);
        ACProcedureStruct.AnsiCProcedureHasEnd:=AEndIndex>0;


        if ADevideIndex>0 then
        begin

        
          //��ȡ��������
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
//            //�ֽ������,�����Զ��ŷָ�
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
//                  //���в���
//    //              ACProcedureStruct.ParamNames.Add(ReplaceStr(
//                  AParamName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));//,'*','{*}'));
//                  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
//                end
//                else
//                begin
//                  //���һ��������
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
              //û�в���
              ACProcedureStruct.ProcedureName:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));
              FixPointerName(ACProcedureStruct.ProcedureName,ACProcedureStruct.ProcedureDataType);
        //      ACProcedureStruct.ProcedureName:=ReplaceStr(ACProcedureStruct.ProcedureName,'*','{*}');
        end;
  end;
end;


procedure ExtractOCImportHeader(ACodeLine:String;AOCImportHeaderStruct:TOCImportHeaderStruct);
var
  //ð���±�
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

  //ͷ�ļ���
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

  //ȡ��·����ͷ�ļ���
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


  //ȥ��.h
  AOCImportHeaderStruct.HeaderFileName:=Trim(AOCImportHeaderStruct.HeaderFileName);
  AOCImportHeaderStruct.HeaderFileName:=Copy(AOCImportHeaderStruct.HeaderFileName,1,Length(AOCImportHeaderStruct.HeaderFileName)-2);
  AOCImportHeaderStruct.HeaderFileName:=ReplaceStr(AOCImportHeaderStruct.HeaderFileName,'+','_');


end;


procedure ExtractOCEnum(ACodeLine:String;AOCEnumStruct:TOCEnumStruct);
var
  //ð���±�
  ADevideIndex:Integer;
  ADevideEndIndex:Integer;
  //�������±�
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

  //�ԷֺŽ���
  ADevideEndIndex:=Pos(';',ATrimedCodeLine);
  ABigBeginIndex:=Pos('{',ATrimedCodeLine);
  ABigEndIndex:=Pos('}',ATrimedCodeLine);

  //�ж�һ���Ƿ����
  AOCEnumStruct.EnumHasEnd:=ADevideEndIndex>0;

  if AOCEnumStruct.EnumHasEnd then
  begin
    AOCEnumStruct.EnumTypeName:=Trim(Copy(ATrimedCodeLine,ABigEndIndex+1,ADevideEndIndex-ABigEndIndex-1));
    AOCEnumStruct.EnumValueList.Add(Copy(ATrimedCodeLine,ABigBeginIndex+1,ABigEndIndex-ABigBeginIndex-1));
  end
  else
  begin
    //û�н���,ʣ�µ���Ϊ����һ��
    if (ABigBeginIndex>0) and (Trim(Copy(ATrimedCodeLine,ABigBeginIndex+1,MaxInt))<>'') then
    begin
        AOCEnumStruct.EnumValueList.Add(Copy(ATrimedCodeLine,ABigBeginIndex+1,MaxInt));
    end
    else
    begin
        //�ж���û������
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
//    BMK_COORDTYPE_GPS = 0, ///GPS�豸�ɼ���ԭʼGPS����
//    BMK_COORDTYPE_COMMON,  ///google��ͼ��soso��ͼ��aliyun��ͼ��mapabc��ͼ��amap��ͼ��������
//} BMK_COORD_TYPE;
//enum {
//    BMKMapTypeStandard   = 1,               ///< ��׼��ͼ
//    BMKMapTypeSatellite  = 2,               ///< ���ǵ�ͼ
//};
//typedef NSUInteger BMKMapType;


end;

procedure ExtractOCStruct(ACodeLine:String;AOCStructStruct:TOCStructStruct);
var
  //ð���±�
  ADevideIndex:Integer;
  ADevideEndIndex:Integer;
  //�������±�
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


  //�ԷֺŽ���
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
    //û�н���
    if (ABigBeginIndex>0) and (Trim(Copy(ATrimedCodeLine,ABigBeginIndex+1,MaxInt))<>'') then
    begin
      AOCStructStruct.StructValueList.Add(Copy(ATrimedCodeLine,ABigBeginIndex+1,MaxInt));
    end;
  end;


/////��ʾһ����γ�������
//typedef struct {
//	int latitudeE6;		///< γ�ȣ�����1e6֮���ֵ
//	int longitudeE6;	///< ���ȣ�����1e6֮���ֵ
//} BMKGeoPoint;

end;

procedure ExtractOCTypedef(ACodeLine:String;AOCTypedefStruct:TOCTypedefStruct);
var
  //ð���±�
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
//        //��������
//        //typedef void (^ getAllAlbumListBlock)(NSMutableArray<HXAlbumModel *> * _Nullable albums);
//
//          //�������void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);
//
//
//
//          AOCTypedefStruct.FCEventStruct:=TCEventStruct.Create;
//
//          AOCTypedefStruct.FCEventStruct.ParseOCCodeLine(AOCTypedefStruct.SourceDataType+' '+ATrimedCodeLine);
////          if (AOCTypedefStruct.Owner<>nil)  then
////          begin
////            //��ȡ�����б�
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
        //��ͨ����
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
  //ð���±�
  ADevideIndex:Integer;
  //Բ�����±�
  ACircleIndex:Integer;
  //�������±�
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
  //'@interface BMKMapView : UIView',��ʾ�̳�
  ADevideIndex:=Pos(':',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    //����
    AOCClassNameStruct._ClassName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

    ACircleIndex:=Pos('(',ATrimedCodeLine);
    ABigIndex:=Pos('{',ATrimedCodeLine);
    AEndIndex:=Pos(';',ATrimedCodeLine);
    AOCClassNameStruct.ClassHasPrivateMember:=ABigIndex>0;
    //���Ƿ�ֻ���������
    AOCClassNameStruct.ClassHasEnd:=AEndIndex>0;


    if (ACircleIndex=0) and (ABigIndex=0) and (AEndIndex=0) then
    begin
      //������
      AOCClassNameStruct.ClassParentClassName:=Trim(ATrimedCodeLine);
    end;

    if (ACircleIndex>0) then
    begin
      //(Э��,���߸���)
      AOCClassNameStruct.ClassParentClassName:=Trim(Copy(ATrimedCodeLine,1,ACircleIndex-1));
    end
    else if (ABigIndex>0) then
    begin
      //{�ڲ���Ա
      AOCClassNameStruct.ClassParentClassName:=Trim(Copy(ATrimedCodeLine,1,ABigIndex-1));
    end
    else if (AEndIndex>0) then
    begin
      //����������
      AOCClassNameStruct.ClassParentClassName:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));
    end;

    //ȥ��Э��<>
    ADevideIndex:=Pos('<',AOCClassNameStruct.ClassParentClassName);
    if ADevideIndex>0 then
    begin
      AOCClassNameStruct.ClassParentProtocols:=Trim(Copy(AOCClassNameStruct.ClassParentClassName,ADevideIndex,MaxInt));
      AOCClassNameStruct.ClassParentClassName:=Trim(Copy(AOCClassNameStruct.ClassParentClassName,1,ADevideIndex-1));
    end;
    
  end
  else
  begin
    //'BMKMapView (LocationViewAPI)',��ʾʵ��
    ADevideIndex:=Pos('(',ATrimedCodeLine);
    if ADevideIndex>0 then
    begin
      //����
      AOCClassNameStruct._ClassName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

      ACircleIndex:=Pos(')',ATrimedCodeLine);
      ABigIndex:=Pos('{',ATrimedCodeLine);
      AEndIndex:=Pos(';',ATrimedCodeLine);
      AOCClassNameStruct.ClassHasPrivateMember:=ABigIndex>0;
      //���Ƿ�ֻ���������
      AOCClassNameStruct.ClassHasEnd:=AEndIndex>0;


      if (ACircleIndex=0) and (ABigIndex=0) and (AEndIndex=0) then
      begin
        //��Э
        AOCClassNameStruct.ClassParentProtocols:=Trim(ATrimedCodeLine);
      end;

      if (ACircleIndex>0) then
      begin
        //(Э��,���߸���)
        AOCClassNameStruct.ClassParentProtocols:=Trim(Copy(ATrimedCodeLine,1,ACircleIndex-1));
      end
      else if (ABigIndex>0) then
      begin
        //{�ڲ���Ա
        AOCClassNameStruct.ClassParentProtocols:=Trim(Copy(ATrimedCodeLine,1,ABigIndex-1));
      end
      else if (AEndIndex>0) then
      begin
        //����������
        AOCClassNameStruct.ClassParentProtocols:=Trim(Copy(ATrimedCodeLine,1,AEndIndex-1));
      end;

//      //ȥ��Э��<>
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
  //ð���±�
  ADevideIndex:Integer;
  //Բ�����±�
  ACircleIndex:Integer;
//  //�������±�
//  ABigIndex:Integer;
  AEndIndex:Integer;
  ATrimedCodeLine:String;
begin
  AOCProtocolNameStruct.Clear;
  AOCProtocolNameStruct.OCCodeLine:=ACodeLine;
  AOCProtocolNameStruct.ObjectiveCCodeLines.Add(ACodeLine);


//@protocol BMKMapViewDelegate;

///�״�delegate
//@protocol BMKRadarManagerDelegate <NSObject>
//@optional
//@end



  ATrimedCodeLine:=Trim(ACodeLine);

  ATrimedCodeLine:=RemoveNote(ATrimedCodeLine,AOCProtocolNameStruct.Note);
  if ATrimedCodeLine='' then Exit;


  //ȥ��protocol
  ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,Length('@protocol')+1,MaxInt));
  AEndIndex:=Pos(';',ATrimedCodeLine);
  //����зֺţ���ʾֻ��һ��Э������
  AOCProtocolNameStruct.ProtocolHasEnd:=AEndIndex>0;

  //Э���ʵ����
  ADevideIndex:=Pos('<',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    //Э������
    AOCProtocolNameStruct.ProtocolName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));


    ACircleIndex:=Pos('>',ATrimedCodeLine);
    if (ACircleIndex<=0) then
    begin
      //���ʵ����û�н��,��ô��һ��ʣ�µĶ���ʵ������
      //@protocol BMKRadarManagerDelegate <NSObject
      //>
      AOCProtocolNameStruct.ProtocolImpleClassName:=Trim(ATrimedCodeLine);
    end
    else
    begin
      //ʵ�������
      //@protocol BMKRadarManagerDelegate <NSObject>
      AOCProtocolNameStruct.ProtocolImpleClassName:=Trim(Copy(ATrimedCodeLine,1,ACircleIndex-1));
      ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ACircleIndex+1,MaxInt));
    end;

  end
  else
  begin
    //Э������
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
  //ð���±�
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

/////��עview��������.
//@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
/////�趨��ͼ�Ƿ���ʵ3D¥��Ч��
//@property(nonatomic, getter=isBuildingsEnabled) BOOL buildingsEnabled;
//@property (nonatomic, strong) id <BMKAnnotation> annotation;
//@property (nonatomic, getter=isDraggable) BOOL draggable __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2);
//@property (nonatomic, strong) NSArray<SuperPlayerUrl *> *multiVideoURLs;

  ADescriptDevideBeginIndex:=Pos('(',ATrimedCodeLine);
  ADescriptDevideEndIndex:=Pos(')',ATrimedCodeLine);



  //��������������,(nonatomic, strong)
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
            //ȥ������ķֺ�
            if Pos(':',AOCPropertyStruct.SetterFunctionName)>0 then
            begin
              AOCPropertyStruct.SetterFunctionName:=Copy(AOCPropertyStruct.SetterFunctionName,1,Length(AOCPropertyStruct.SetterFunctionName)-1);
            end;

          end;
        end;
        APropertyDesciptionList.Free;
  end;



  //��������,float��
  //@property (copy, nonatomic) void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);
  //�������void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);
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


      
      //�ǲ��Ƿ�������,�������ͺ����һ��(^ ������ )
      if (Copy(AOCPropertyStruct.PropertyDataType,1,1)='T')
        and (Copy(AOCPropertyStruct.PropertyDataType,Length(AOCPropertyStruct.PropertyDataType)-4,5)='Event') then
      begin
          //�������void (^ previewRespondsToLongPress)(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController);


          ATrimedCodeLine:=Copy(AOCPropertyStruct.PropertyDataType,2,Length(AOCPropertyStruct.PropertyDataType)-6)+';';


      end
      else
      //�ж���û��ģ����, id <BMKAnnotation>,NSArray<SuperPlayerUrl *>
      if Pos('<',AOCPropertyStruct.PropertyDataType)=0 then
      begin

          //ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));

      end
      else
      begin
          ADevideIndex:=Pos('<',AOCPropertyStruct.PropertyDataType);

        //�ж���û����, id <BMKAnnotation>,NSArray<SuperPlayerUrl *>
  //      if (AOCPropertyStruct.PropertyDataType='id') and (ATrimedCodeLine<>'') then
  //      begin
//          ADevideIndex:=Pos('<',ATrimedCodeLine);
//          if ADevideIndex=1 then
//          begin
            ADevideIndex:=Pos('>',ATrimedCodeLine);
            AOCPropertyStruct.PropertyDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex));
            //Ҫ��NSArray<SuperPlayerUrl *>�е�<>ת��Ϊ{}
            AOCPropertyStruct.PropertyDataType:=ReplaceStr(AOCPropertyStruct.PropertyDataType,'<','{');
            AOCPropertyStruct.PropertyDataType:=ReplaceStr(AOCPropertyStruct.PropertyDataType,'>','}');

            ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
            GetDataType(ATrimedCodeLine,AOCPropertyStruct.PropertyDataType,AOCPropertyStruct);
//          end;
  //      end;


      end;
  end;



  // BOOL draggable __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2);
  //��������
  ADevideIndex:=Pos(' ',ATrimedCodeLine);
  if (ADevideIndex>0) then
  begin
//    if (ADevideIndex>0) then
//    begin
      AOCPropertyStruct.PropertyName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      //ȥ�����͵��Ǻ�
      FixPointerName(AOCPropertyStruct.PropertyName,AOCPropertyStruct.PropertyDataType);
  //    AOCPropertyStruct.PropertyName:=ReplaceStr(AOCPropertyStruct.PropertyName,'*','{*}');

  //    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
//    end;

  end;


  //�����������һֱΪ��,��ôʣ�µľ�����������
  if AOCPropertyStruct.PropertyName='' then
  begin
    ADevideIndex:=Pos(';',ATrimedCodeLine);

    if (ADevideIndex>0) then
    begin
      AOCPropertyStruct.PropertyName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
      //ȥ�����͵��Ǻ�
      FixPointerName(AOCPropertyStruct.PropertyName,AOCPropertyStruct.PropertyDataType);
  //    AOCPropertyStruct.PropertyName:=ReplaceStr(AOCPropertyStruct.PropertyName,'*','{*}');

  //    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    end;
  end
  else
  begin
    //__OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2)
    //��ȥ

  end;



end;


procedure ExtractOCVariable(ACodeLine:String;AOCVariableStruct:TOCVariableStruct);
var
  //ð���±�
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


//    BMKMapPoint origin; ///< ��Ļ���ϵ��Ӧ��ֱ�ǵ�������
  //��������
  ADevideIndex:=Pos(' ',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    AOCVariableStruct.VariableDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    GetDataType(ATrimedCodeLine,AOCVariableStruct.VariableDataType,AOCVariableStruct);
  end;

  //��������
  ADevideIndex:=Pos(';',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    AOCVariableStruct.VariableName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    //ȥ�����͵��Ǻ�
    AOCVariableStruct.VariableName:=ReplaceStr(AOCVariableStruct.VariableName,'*','');//'{*}');
    FixPointerName(AOCVariableStruct.VariableName,AOCVariableStruct.VariableDataType);
//    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
  end;

end;




procedure ExtractOCConst(ACodeLine:String;AOCConstStruct:TOCConstStruct);
var
  //ð���±�
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
      //��һ���˺ܶ�ո�
    //  ASpace2Index:=PosEx(' ',ATrimedCodeLine,ASpace1Index+1);
    //  ADevideIndex:=Pos(')',ATrimedCodeLine);
      if ASpace1Index>0 then//(ASpace2Index<>-1) and (ASpace2Index<ADevideIndex) then
      begin
        //�з������� UIKIT_EXTERN
        //��������
        AOCConstStruct.ConstType:=Trim(Copy(ATrimedCodeLine,1,ASpace1Index-1));
        ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ASpace1Index+Length('const '),MaxInt));
    //  end
    //  else
    //  begin
    //    //û�з�������
      end;
  end;






///// ����ͶӰ������緶Χ��С���뾭γ�ȣ�-85��180��ͶӰ�������ֵ��Ӧ
//UIKIT_EXTERN const BMKMapSize BMKMapSizeWorld;
///// ����ͶӰ���������η�Χ
//UIKIT_EXTERN const BMKMapRect BMKMapRectWorld;
///// �յ�ֱ���������
//UIKIT_EXTERN const BMKMapRect BMKMapRectNull;


  //��������
  ADevideIndex:=Pos(' ',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    AOCConstStruct.ConstDataType:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ADevideIndex+1,MaxInt));
    GetDataType(ATrimedCodeLine,AOCConstStruct.ConstDataType,AOCConstStruct);
  end;



  //��������
  ADevideIndex:=Pos(';',ATrimedCodeLine);
  if ADevideIndex>0 then
  begin
    AOCConstStruct.ConstName:=Trim(Copy(ATrimedCodeLine,1,ADevideIndex-1));
    //ȥ�����͵��Ǻ�
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
  //��һ���˺ܶ�ո�
//  ASpace2Index:=PosEx(' ',ATrimedCodeLine,ASpace1Index+1);
//  ADevideIndex:=Pos(')',ATrimedCodeLine);
  if ASpace1Index>0 then//(ASpace2Index<>-1) and (ASpace2Index<ADevideIndex) then
  begin
    //������
    AOCDefineStruct.DefineName:=Trim(Copy(ATrimedCodeLine,1,ASpace1Index-1));
    ATrimedCodeLine:=Trim(Copy(ATrimedCodeLine,ASpace1Index,MaxInt));
  end;


  //ֵ
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

  //�����ʮ������0x,ת��Delphi��$
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
    //�жϸ����������Ƿ��Ƿ�������
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

//�����ųɶԵĽ���
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
//  �Ա�ȥ�����һ��*
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
  

  //ȥ�����һ��*
  //����NSString*��ת��Delphi�е���NSString
  HasStar:=False;
  if Copy(Result,Length(Result),1)='*' then
  begin
    HasStar:=True;
    Result:=Trim(Copy(Result,1,Length(Result)-1));
  end;



  //ת����Delphi����������
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
    //��Ҫ������������
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
    //��Ҫ������������
    if ParsedPointerDataTypes.IndexOf(Result)=-1 then
    begin
      ParsedPointerDataTypes.Add(Result);
    end;
  end;


  if HasStar then
  begin
      //NSArray,NSString������Ҫ
      if (Result='NSDictionary') then
      begin
        Result:='P'+Result;
        //��Ҫ������������
        if ParsedPointerDataTypes.IndexOf(Result)=-1 then
        begin
          ParsedPointerDataTypes.Add(Result);
        end;
      end;

//    Result:=Result+'{*}';
  end;


  //NSArray<HXPhotoModel *>
  //ת����NSArray{<HXPhotoModel *>}
  //��ģ����,��һ�Լ�����
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

  //�����ķ�������
  OtherProcedureNames:=TStringList.Create;
  //�����Ĳ�������
  OtherParamNames:=TStringList.Create;
  //�����Ĳ�����������
  OtherParamDataTypes:=TStringList.Create;

end;

destructor TOCProcedureStruct.Destroy;
begin
  Imple.Free;

  //�����ķ�������
  OtherProcedureNames.Free;
  //�����Ĳ�������
  OtherParamNames.Free;
  //�����Ĳ�����������
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
  //��������ֵ
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
//    //��һ������
//    Result:=Result+FirstParamName+':'+ConvertOCTypeToODType(FirstParamDataType);
//    //���������б�
//    for I := 0 to OtherParamNames.Count-1 do
//    begin
//      Result:=Result+';';
//      Result:=Result+OtherParamNames[I]+':'+ConvertOCTypeToODType(OtherParamDataTypes[I]);
//    end;
//  end;
//  Result:=Result+')';

  //��������ֵ
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
  //����ֵ��������
  if ProcedureDataType='void' then
  begin
    //����procedure
    Result:='procedure ';
  end
  else
  begin
    //����function
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
      //�ж������,������ǰ��Ҫ��[MethodName]
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
      //�ж�һ���Ƿ��ǹؼ���
      if DelphiKeywords.IndexOf(LowerCase(ProcedureName))<>-1 then
      begin
        ODCodeLines.Add('[MethodName('''+ProcedureName+':'+''')]');
      end;
    end;




    AComposeFunctionName:='';
    //����ע�͵�
//    AComposeFunctionName:='{'+ProcedureType+'} ';

    //����ֵ��������
    //����procedure
    AComposeFunctionName:=AComposeFunctionName+GetMethodType;



    //������
    AComposeFunctionName:=AComposeFunctionName+FixDelphiKeywordName(GetProcedureName);


    if FirstParamDataType<>'' then
    begin
      //��һ������
      AComposeFunctionName:=AComposeFunctionName+GetDeclareParamsStr;
    end;

    //��������ֵ
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
    //��һ������
    Result:=Result+FixDelphiKeywordName(FirstParamName)+':'+ConvertOCTypeToODType(FirstParamDataType);
    //���������б�
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

  //���Ӷ���
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
  //Ҫע�͵�
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


              //�ӿ�,����
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




              //�¼���������
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




              //ʵ��
              ODCodeLines.Add('T'+OCProtocolNameStruct.ProtocolName+'=class(TOCLocal,'+OCProtocolNameStruct.ProtocolName+')'+OCProtocolNameStruct.Note);
              ODCodeLines.Add('public');
              ODCodeLines.Add(Const_Tab_Char+'constructor Create;');
              ODCodeLines.Add(Const_Tab_Char+'destructor Destroy;override;');
              ODCodeLines.Add('public');
              //�¼���Ա
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





              //������
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

      //û�е���ͷ
      ANewLineBeginType:=CheckOCCodeLineBeginType(AObjectiveCCodeLines[I]);

      //�������Ա
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
            //ע�ͽ���
            ACodeLine:=ReplaceStr(ACodeLine,'*/','}');
            AStructCodeLines.Add(ACodeLine);
          end
          else
          begin
            AStructCodeLines.Add(ACodeLine);
            //ע��û�н���
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
            //Э��û��һ�оͽ���
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


          //���󷽷�
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








          //�෽��
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





      
          //��������
          ODCodeLines.Add('T'+OCClassNameStruct._ClassName+'=class(TOCGenericImport<'+OCClassNameStruct._ClassName+'Class,'+OCClassNameStruct._ClassName+'>)');
          ODCodeLines.Add('end;');




          //������
          ODCodeLines.Add('');
          ODCodeLines.Add('');
          ODCodeLines.Add('');
          ODCodeLines.Add('');




          AODCodeLines.Free;
    end;

    Result:=Inherited;

  end;

//  //���Ե��¼�������������
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

      //û�е���ͷ
      ANewLineBeginType:=CheckOCCodeLineBeginType(AObjectiveCCodeLines[I]);

      //�������Ա
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
            //ע�ͽ���
            ACodeLine:=ReplaceStr(ACodeLine,'*/','}');
            AStructCodeLines.Add(ACodeLine);
          end
          else
          begin
            AStructCodeLines.Add(ACodeLine);
            //ע��û�н���
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
            //�����Ա
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
            //Э��û��һ�оͽ���
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
  //�����Ĳ�������
  ParamNames:=TStringList.Create;
  //�����Ĳ�����������
  ParamDataTypes:=TStringList.Create;

end;

destructor TCProcedureStruct.Destroy;
begin
  //�����Ĳ�������
  ParamNames.Free;
  //�����Ĳ�����������
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
  //����ע�͵�
  Result:='{'+ProcedureType+'} ';
  //����ֵ��������
  if ProcedureDataType='void' then
  begin
    //����procedure
    Result:=Result+'procedure ';
  end
  else
  begin
    //����function
    Result:=Result+'function ';
  end;


  //������
  Result:=Result+ProcedureName+'(';

  //���������б�
  for I := 0 to ParamNames.Count-1 do
  begin
    if I>0 then
    begin
      Result:=Result+';';
    end;
    Result:=Result+FixDelphiKeywordName(ParamNames[I])+':'+ConvertOCTypeToODType(ParamDataTypes[I]);
  end;
  Result:=Result+')';

  //��������ֵ
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
//    //����ע�͵�
//    AComposeFunctionName:='{'+ProcedureType+'} ';
//    //����ֵ��������
//    if ProcedureDataType='void' then
//    begin
//      //����procedure
//      AComposeFunctionName:=AComposeFunctionName+'procedure ';
//    end
//    else
//    begin
//      //����function
//      AComposeFunctionName:=AComposeFunctionName+'function ';
//    end;
//
//
//    //������
//    AComposeFunctionName:=AComposeFunctionName+ProcedureName+'(';
//
//    //���������б�
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
//    //��������ֵ
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

  //ȥ��������{}
  //���Ӷ���
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
    //���Ի�ȡ����
    //�ж�һ���Ƿ��ǹؼ���
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

    //�ж�һ���Ƿ��ǹؼ���
    if DelphiKeywords.IndexOf(LowerCase(AComposeFunctionName))<>-1 then
    begin
      ODCodeLines.Add('[MethodName('''+AComposeFunctionName+':'+''')]');
    end;

    //�������÷���
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
  //��������ֵ
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
//    //��һ������
//    Result:=Result+FirstParamName+':'+ConvertOCTypeToODType(FirstParamDataType);
//    //���������б�
//    for I := 0 to OtherParamNames.Count-1 do
//    begin
//      Result:=Result+';';
//      Result:=Result+OtherParamNames[I]+':'+ConvertOCTypeToODType(OtherParamDataTypes[I]);
//    end;
//  end;
//  Result:=Result+')';

  //��������ֵ
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
  //����ֵ��������
//  if ProcedureDataType='void' then
//  begin
//    //����procedure
//    Result:='procedure ';
//  end
//  else
//  begin
    //����function
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
//    //��һ������
//    Result:=Result+FixDelphiKeywordName(PropertyName)+':'+ConvertOCTypeToODType(PropertyDataType);
//    //���������б�
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
  //��������ֵ
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
//    //��һ������
//    Result:=Result+PropertyName+':'+ConvertOCTypeToODType(PropertyDataType);
//    //���������б�
//    for I := 0 to OtherParamNames.Count-1 do
//    begin
//      Result:=Result+';';
//      Result:=Result+OtherParamNames[I]+':'+ConvertOCTypeToODType(OtherParamDataTypes[I]);
//    end;
//  end;
//  Result:=Result+')';

//  //��������ֵ
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
  //����ֵ��������
//  if ProcedureDataType='void' then
//  begin
    //����procedure
    Result:='procedure ';
//  end
//  else
//  begin
//    //����function
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
    //��һ������
    Result:=Result+FixDelphiKeywordName(PropertyName)+':'+ConvertOCTypeToODType(PropertyDataType);
//    //���������б�
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

      //���Ի�ȡ����
      //�ж�һ���Ƿ��ǹؼ���
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
      //      /** �븸��ͼ����ƫ������ */    ->    ///** �븸��ͼ����ƫ������ */
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
  //�����Ĳ�������
  ParamNames:=TStringList.Create;
  //�����Ĳ�����������
  ParamDataTypes:=TStringList.Create;

end;

destructor TCEventStruct.Destroy;
begin
  //�����Ĳ�������
  ParamNames.Free;
  //�����Ĳ�����������
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
  //����ֵ��������
  if ProcedureDataType='void' then
  begin
    //����procedure
    Result:=Result+'procedure ';
  end
  else
  begin
    //����function
    Result:=Result+'function ';
  end;


  //������
  Result:=Result+'(';

  //���������б�
  for I := 0 to ParamNames.Count-1 do
  begin
    if I>0 then
    begin
      Result:=Result+';';
    end;
    Result:=Result+FixDelphiKeywordName(ParamNames[I])+':'+ConvertOCTypeToODType(ParamDataTypes[I]);
  end;
  Result:=Result+')';

  //��������ֵ
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
//    //����ע�͵�
//    AComposeFunctionName:='{'+ProcedureType+'} ';
//    //����ֵ��������
//    if ProcedureDataType='void' then
//    begin
//      //����procedure
//      AComposeFunctionName:=AComposeFunctionName+'procedure ';
//    end
//    else
//    begin
//      //����function
//      AComposeFunctionName:=AComposeFunctionName+'function ';
//    end;
//
//
//    //������
//    AComposeFunctionName:=AComposeFunctionName+ProcedureName+'(';
//
//    //���������б�
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
//    //��������ֵ
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

  //ȥ��������{}
  //���Ӷ���
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
  //�������б�
  CodeLines:=TStringList.Create;
  //Delphi������
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

    //�������import��Ԫ
    if HasImportHeader then
    begin
      //����ͷ�ļ�֮ǰ��ע���ȷ�����ǰ��
      for I := 0 to ImportHeaderIndex-1 do
      begin
        if Not (TOCElementStruct(Self.OCElementStructList[I]) is TOCImportHeaderStruct) then
        begin
          ODCodeLines.AddStrings(TOCElementStruct(Self.OCElementStructList[I]).GenerateODCodeLines);
        end;
      end;
    end;






    //��Ԫ��
    ODCodeLines.Add('unit '+UnitNamePrefix+AUnitName+UnitNameBackfix+';');
    ODCodeLines.Add('');



    //���õ�Ԫ
    ODCodeLines.Add('interface');
    ODCodeLines.Add('');
    ODCodeLines.Add('{$IFDEF IOS}');
    ODCodeLines.Add('uses');
    //�����Զ���ĵ�Ԫ
    for I := ImportHeaderIndex to Self.OCElementStructList.Count-1 do
    begin
      if TOCElementStruct(Self.OCElementStructList[I]) is TOCImportHeaderStruct then
      begin
        ODCodeLines.AddStrings(TOCElementStruct(Self.OCElementStructList[I]).GenerateODCodeLines);
      end;
    end;



    //��ӳ��õĵ�Ԫ
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





    //����
    //�ж��Ƿ���ҪType
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
          //��Ҫ������
          AODCodeLines.AddStrings(TOCElementStruct(Self.OCElementStructList[I]).PreDatatypeDeclareStringList);
          AODCodeLines.AddStrings(TOCElementStruct(Self.OCElementStructList[I]).GenerateODCodeLines);
          for J := 0 to AODCodeLines.Count-1 do
          begin
            AODCodeLines[J]:=Const_Tab_Char+AODCodeLines[J];
          end;
          ODCodeLines.AddStrings(AODCodeLines);
      end;
    end;



    //��������
    AODCodeLines.Free;
    ODCodeLines.Add('{$ENDIF}');
    ODCodeLines.Add('');







    //ʵ��
    ODCodeLines.Add('implementation');
    ODCodeLines.Add('');
    ODCodeLines.Add('{$IFDEF IOS}');

    //ʵ�ֺ���,��������
    for I := ImportHeaderIndex to Self.OCElementStructList.Count-1 do
    begin
      if (TOCElementStruct(Self.OCElementStructList[I]) is TCProcedureStruct) then
      begin
        ODCodeLines.Add(TCProcedureStruct(Self.OCElementStructList[I]).GetImple);
      end;
    end;
    ODCodeLines.Add('');


    {wn}
    //ʵ����
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




    //ʵ�ֵ�������
    for I := ImportHeaderIndex to Self.OCElementStructList.Count-1 do
    begin
      if (TOCElementStruct(Self.OCElementStructList[I]) is TOCConstStruct)
        and (TOCConstStruct(Self.OCElementStructList[I]).ConstType='extern') then
      begin
        ODCodeLines.Add(TOCConstStruct(Self.OCElementStructList[I]).GetImple(AStaticLibName));
      end;
    end;
    ODCodeLines.Add('');


    //ʵ��Э��
    for I := ImportHeaderIndex to Self.OCElementStructList.Count-1 do
    begin
      if (TOCElementStruct(Self.OCElementStructList[I]) is TOCProtocolStruct) then
      begin
        ODCodeLines.AddStrings(TOCProtocolStruct(Self.OCElementStructList[I]).GetImple);
      end;
    end;
    ODCodeLines.Add('');





    //�����������͵�ָ��
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




      //�������Ա
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
            //��Ԫ����
            AOCElementStruct:=TOCImportHeaderStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltClassPreDeclare:
        begin
            //��Ԥ����
            AOCElementStruct:=TOCClassPreDeclareStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);
        end;
        cltEnumBegin:
        begin
            //ö��
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
            //ö��
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
            //���Ͷ���
            AOCElementStruct:=TOCTypedefStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);

        end;
        cltConst:
        begin
            //����
            AOCElementStruct:=TOCConstStruct.Create;
            AOCElementStruct.ParseOCCodeLine(AObjectiveCCodeLines[I]);
            Self.OCElementStructList.Add(AOCElementStruct);

        end;
        cltDefine:
        begin
            //����
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
              //ע�ͽ���
              ACodeLine:=ReplaceStr(ACodeLine,'*/','}');
              AStructCodeLines.Add(ACodeLine);
            end
            else
            begin
              AStructCodeLines.Add(ACodeLine);
              //ע��û�н���
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
              //Э��û��һ�оͽ���
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
              //Э��û��һ�оͽ���
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
              //Э��û��һ�оͽ���
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
  //�������б�
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
      //����API_AVAILABLE,��Ҫ��ȥ
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

    //���Ի�ȡ����
    //�ж�һ���Ƿ��ǹؼ���
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

        //���Ի�ȡ����
        //�ж�һ���Ƿ��ǹؼ���
        //������ͬ����ĸ��ȡ��ö������
        //����:
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


        //�����һ�����ż���ע��
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

          //��0xֱ��ת��Ϊ$
//          ACodeLine:=ReplaceStr(ACodeLine,'= 0x','= $');
//          ACodeLine:=ReplaceStr(ACodeLine,'=0x','=$');
          ACodeLine:=ReplaceStr(ACodeLine,'0x','$');

          //<<ת��Ϊshl
          ACodeLine:=ReplaceStr(ACodeLine,'<<',' shl ');

          //>>ת��Ϊshr
          ACodeLine:=ReplaceStr(ACodeLine,'>>',' shr ');

          //&ת��Ϊand
          ACodeLine:=ReplaceStr(ACodeLine,'&',' and ');

          //|ת��Ϊand
          ACodeLine:=ReplaceStr(ACodeLine,'|',' or ');

          ODCodeLines.Add(ACodeLine);
        end;


        ODCodeLines.Add(')'+';');




        //��ΪOC�ĺ������治�ܴ�ö������,ֻ����Integer�����
        ODCodeLines.Add(EnumTypeName+'='+'Integer;');


        //������
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
    //    BMK_COORDTYPE_GPS = 0, ///GPS�豸�ɼ���ԭʼGPS����
    //    BMK_COORDTYPE_COMMON,  ///google��ͼ��soso��ͼ��aliyun��ͼ��mapabc��ͼ��amap��ͼ��������
    //} BMK_COORD_TYPE;


    //typedef NS_ENUM(NSInteger, CNContactType)
    //{
    //    CNContactTypePerson,
    //    CNContactTypeOrganization,
    //} NS_ENUM_AVAILABLE(10_11, 9_0);

    //typedef enum TVoiceRecognitionClientErrorCode
    //{
    //    EVRClientErrorCodeRecoderException = (EVRClientErrorDomainRecord << 16) | (0x0000FFFF & 1),                // ¼���豸�쳣
    //    EVRClientErrorCodeRecoderNoPermission = (EVRClientErrorDomainRecord << 16) | (0x0000FFFF & 2),             // ��¼��Ȩ��
    //    EVRClientErrorCodeRecoderUnAvailable = (EVRClientErrorDomainRecord << 16) | (0x0000FFFF & 3),              // ¼���豸������
    //    EVRClientErrorCodeInterruption = (EVRClientErrorDomainRecord << 16) | (0x0000FFFF & 4),                    // ¼���ж�
    //
    //    EVRClientErrorCodeVADException = (EVRClientErrorDomainVAD << 16) | (0x0000FFFF & 1),                       // ǰ�˿��쳣
    //    EVRClientErrorCodeNoSpeech = (EVRClientErrorDomainVAD << 16) | (0x0000FFFF & 2),                           // �û�δ˵��
    //    EVRClientErrorCodeShort = (EVRClientErrorDomainVAD << 16) | (0x0000FFFF & 3),                              // �û�˵������̫��
    //
    //    EVRClientErrorCodeDecoderExceptioin = (EVRClientErrorDomainOnline << 16) | (0x0000FFFF & 1),               // ����ʶ�������쳣
    //    EVRClientErrorCodeDecoderNetworkUnavailable = (EVRClientErrorDomainOnline << 16) | (0x0000FFFF & 2),       // ���粻����
    //    EVRClientErrorCodeDecoderTokenFailed = (EVRClientErrorDomainOnline << 16) | (0x0000FFFF & 3),              // ��ȡtokenʧ��
    //    EVRClientErrorCodeDecoderResolveUrlFailed = (EVRClientErrorDomainOnline << 16) | (0x0000FFFF & 4),         // ����urlʧ��
    //    EVRClientErrorCodeLocalTimeout = (EVRClientErrorDomainLocalNetwork << 16) | (0x0000FFFF & 1),              // ����ʱ
    //
    //    EVRClientErrorCodeServerParamError = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3001),            // Э���������
    //    EVRClientErrorCodeServerRecognError = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3002),           // ʶ����̳���
    //    EVRClientErrorCodeServerNoFindResult = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3003),          // û���ҵ�ƥ����
    //    EVRClientErrorCodeServerAppNameUnknownError = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3004),   // AppnameUnkown����
    //    EVRClientErrorCodeServerSpeechQualityProblem = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3005),  // ����������ʶ��Ҫ��
    //    EVRClientErrorCodeServerSpeechTooLong = (EVRClientErrorDomainServer << 16) | (0x0000FFFF & -3006),         // ��������
    //
    //    EVRClientErrorCodeCommonBusy = (EVRClientErrorDomainCommom << 16) | (0x0000FFFF & 1),                      // ʶ����æ
    //    EVRClientErrorCodeCommonPropertyListInvalid = (EVRClientErrorDomainCommom << 16) | (0x0000FFFF & 2),       // ������������
    //    EVRClientErrorCodeCommonEnqueueError = (EVRClientErrorDomainCommom << 16) | (0x0000FFFF & 3)               // ��������enqueueʧ��
    //} TVoiceRecognitionClientErrorCode;



    //û�е���ͷ
    ANewLineBeginType:=CheckOCCodeLineBeginType(AObjectiveCCodeLines[I]);
    case ANewLineBeginType of
        cltNoUse,cltNote:
        begin
          EnumValueList.Add('//'+AObjectiveCCodeLines[I]);
        end;
        cltNoteBegin:
        begin

            EnumValueList.Add('//'+AObjectiveCCodeLines[I]);
            //ע��û�н���
            repeat
              Inc(I);


              EnumValueList.Add('//'+AObjectiveCCodeLines[I]);
            until (Pos('*/',AObjectiveCCodeLines[I])>0) or (I >=AObjectiveCCodeLines.Count-1);

        end
        else
        begin
            if (Pos(';',RemoveNote(AObjectiveCCodeLines[I],ANote))>0) then
            begin

                //ö�ٽ�����
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
                //��һ��ע��,Ҫȥ��
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





    //������
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
/////���Σ���ֱ�ǵ��������ʾ
//typedef struct {
//    BMKMapPoint origin; ///< ��Ļ���ϵ��Ӧ��ֱ�ǵ�������
//    BMKMapSize size;	///< ���귶Χ
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
