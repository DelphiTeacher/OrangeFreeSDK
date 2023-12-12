//convert pas to utf8 by
unit uLang;

interface

{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}


{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}



uses
//  {$IFDEF FMX}
//  //��׿�����в�����FMX.***�ĵ�Ԫ����Ȼ�����������ɹ�
////  FMX.Types,
////  FMX.Forms,
////  FMX.Controls,
//  {$ENDIF}

//  {$IFDEF VCL}
//  Controls,
//  {$ENDIF}

  {$IFDEF MSWINDOWS}
    {$IF CompilerVersion >= 30.0}
    Winapi.Windows,
    {$ELSE}
    Windows,
    Forms,
    {$IFEND}
  {$ENDIF}


  Classes,
  SysUtils,
  StrUtils;


const
  IID_ILangProcess:TGUID='{7893099B-0F42-4EFA-81ED-47F2278D9856}';





type
  //�ؼ�Parent����,�Լ��ӿؼ�������,���ڱ����ӿؼ�
//  {$IFDEF VCL}
//    //��VCL��,���ؼ���WinControl,���Է��ӿؼ�������
//    TParentControl=TWinControl;
//    TChildControl=TControl;
//  {$ENDIF}
//  {$IFDEF FMX}
//    TParentControl=TFmxObject;
//    TChildControl=TFmxObject;
//  {$ELSE}
//      {$IFDEF LINUX}
//      TControl=TObject;
//      TParentControl=TObject;
//      TChildControl=TObject;
//      TLang=TObject;
//      {$ENDIF}
//  {$ENDIF}
//
//
//  {$IFDEF MSWINDOWS}
//  {$ENDIF}





  //��������(����,Ӣ��)
  TLangKind=(lkZH,
              lkEN,
              //?
              lkTag);

  //High(TLangKind)+1���Tag
  TLangStrings=array[Low(TLangKind)..High(TLangKind)] of string;


//  {$IFDEF VCL}
  TLang = class//(TFmxObject)
  private
    FLang: string;
    FResources: TStrings;
    FOriginal: TStrings;
    FAutoSelect: Boolean;
    FFileName: string;
    FStoreInForm: Boolean;
    procedure SetLang(const Value: string);
    function GetLangStr(const Index: string): TStrings;
//  protected
//    { vcl }
//    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadResources(Stream: TStream);
    procedure WriteResources(Stream: TStream);
//    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent);// override;
    destructor Destroy; override;
  public
    procedure AddLang(const AName: string);
    procedure LoadFromFile(const AFileName: string);
    procedure SaveToFile(const AFileName: string);
    property Original: TStrings read FOriginal;
    property Resources: TStrings read FResources;
    property LangStr[const Index: string]: TStrings read GetLangStr;
  published
    property AutoSelect: Boolean read FAutoSelect write FAutoSelect default True;
    property FileName: string read FFileName write FFileName;
    property StoreInForm: Boolean read FStoreInForm write FStoreInForm default True;
    property Lang: string read FLang write SetLang;
  end;
//  {$ENDIF}


  TLangKindStringArray=array[Low(TLangKind)..High(TLangKind)] of string;


  ILangProcess=interface
    ['{7893099B-0F42-4EFA-81ED-47F2278D9856}']
    //��¼�����Ե�����
    procedure RecordControlLangIndex(APrefix:String;ALang:TLang;ACurLang:String);
    //����
    procedure TranslateControlLang(APrefix:String;ALang:TLang;ACurLang:String);
  end;







var
  //ԭ�����Դ���-�ѷ���
  LangStrings:array of TLangStrings;
  LangStringsCount:Integer;




var
  //���������
  GlobalLang:TLang;
  //�Ƿ����ö�����
  IsEnableMultiLang:Boolean;


var
  LangKind:TLangKind;



//��ǰ������,����cn,en,jp��,���ڱ��浽
function GlobalCurLang:String;




//ԭ�����Դ���-�ѷ���
procedure RegLangString(const ALangTag:String;const ALangKind:TLangKind;const ALangString:String);overload;
procedure RegLangString(const ALangTag:String;const ALangStrings:Array of String);overload;
function FindLangStringIndex(const ALangTag:String):Integer;
function GetLangString(const ALangTag:String;const ALangKind:TLangKind):String;overload;
function GetLangString(const ALangStrings:Array of String):String;overload;




//�¶����Դ���
//��¼�����Ե�������ALang
procedure RecordLangIndex(ALang:TLang;
                          AIndex:String;
                          ARecLang:String;
                          ARecLangIndexValue:String);
//��ALang��ȡ�����ķ���
function GetLangValue(ALang:TLang;
                      AIndex:String;
                      ACurLang:String):String;
//��¼������������ȡ����,����һ
function RecAndTrans(ALang:TLang;
                      AIndex:String;
                      ARecLang:String;
                      ARecLangIndexValue:String;
                      ATransLang:String):String;

//��¼�������������Ĳ���ȡ����,����һ
function Trans(AIndex:String):String;



{$IFDEF MSWINDOWS}
function GetWindowsLanguage: string;
function GetWindowsLanguage1(LCTYPE: LCTYPE {type of information}): string;
{$ENDIF MSWINDOWS}


implementation


{$IFDEF MSWINDOWS}
function GetWindowsLanguage: string;
var
  WinLanguage: array [0..50] of char;
begin
  VerLanguageName(GetSystemDefaultLangID, WinLanguage, 50);
  Result := StrPas(WinLanguage);
end;

{********************************************************************}
{ another code:
{********************************************************************}

function GetWindowsLanguage1(LCTYPE: LCTYPE {type of information}): string;
var
  Buffer : PChar;
  Size : integer;
begin
  Size := GetLocaleInfo (LOCALE_USER_DEFAULT, LCType, nil, 0);
  GetMem(Buffer, Size);
  try
    GetLocaleInfo (LOCALE_USER_DEFAULT, LCTYPE, Buffer, Size);
    Result := string(Buffer);
  finally
    FreeMem(Buffer);
  end;
end;


//Caption := GetWindowsLanguage1(LOCALE_SABBREVLANGNAME);
//(*
//LOCALE_ILANGUAGE { language id }
//LOCALE_SLANGUAGE { localized name of language }
//LOCALE_SENGLANGUAGE { English name of language }
//LOCALE_SABBREVLANGNAME { abbreviated language name }
//LOCALE_SNATIVELANGNAME { native name of language }
//*)
{$ENDIF MSWINDOWS}


function GetLangString(const ALangStrings:Array of String):String;overload;
begin
  Result:=ALangStrings[0];
  
  if Ord(LangKind)>Length(ALangStrings)-1 then
  begin
    Result:=ALangStrings[Ord(LangKind)];
  end;
end;







function GetLangValue(ALang:TLang;AIndex:String;ACurLang:String):String;
begin
  Result:='';
  {$IFDEF LINUX}
  {$ELSE}
  //��������
  if ALang.Original.IndexOf(AIndex)<>-1 then
  begin
    //��������
    if ALang.Resources.IndexOf(ACurLang)<>-1 then
    begin
      //��ȡ����
      Result:=ALang.LangStr[ACurLang].Values[AIndex];
    end;
  end;
  {$ENDIF}
end;


//��¼�������������Ĳ���ȡ����,����һ
function Trans(AIndex:String):String;
begin
  Result:=AIndex;//
//          RecAndTrans(GlobalLang,
//                      AIndex,
//                      'cn',
//                      AIndex,
//                      GlobalCurLang);
end;


//��¼��������������
function RecAndTrans(
                    ALang:TLang;
                    AIndex:String;
                    ARecLang:String;
                    ARecLangIndexValue:String;
                    ATransLang:String):String;
begin
  if IsEnableMultiLang then
  begin
    RecordLangIndex(ALang,AIndex,ARecLang,ARecLangIndexValue);

    Result:=GetLangValue(ALang,
                         AIndex,
                         ATransLang
                          );
  end;

  if not IsEnableMultiLang or (Result='') then
  begin
    Result:=ARecLangIndexValue;
  end;
end;

procedure RecordLangIndex(ALang:TLang;AIndex:String;ARecLang:String;ARecLangIndexValue:String);
begin
  {$IFDEF MSWINDOWS}
  //����������
  if ALang.Original.IndexOf(AIndex)=-1 then
  begin
    //�������
    ALang.Original.Add(AIndex);

    //����������
    if ALang.Resources.IndexOf(ARecLang)=-1 then
    begin
      //�������
      ALang.AddLang(ARecLang);
    end;

    //��ӷ���
    ALang.LangStr[ARecLang].Values[AIndex]:=ARecLangIndexValue;
  end;
  {$ENDIF}
end;

function FindLangStringIndex(const ALangTag:String):Integer;
var
  I: Integer;
begin
  Result:=-1;
  if ALangTag<>'' then
  begin
    for I := 0 to LangStringsCount-1 do
    begin
      if LangStrings[I][lkTag]=ALangTag then
      begin
        Result:=I;
        Break;
      end;
    end;
  end;
end;

procedure RegLangString(const ALangTag:String;const ALangStrings:Array of String);overload;
begin
  if (ALangTag<>'') then
  begin
    if FindLangStringIndex(ALangTag)=-1 then
    begin
      if LangStringsCount<Length(LangStrings) then
      begin
        LangStrings[LangStringsCount][lkTag]:=ALangTag;
        LangStrings[LangStringsCount][lkZH]:=ALangStrings[0];
        LangStrings[LangStringsCount][lkEN]:=ALangStrings[1];
        LangStringsCount:=LangStringsCount+1;
      end
      else
      begin
      end;

    end;
  end;
end;

procedure RegLangString(const ALangTag:String;const ALangKind:TLangKind;const ALangString:String);
begin
  if (ALangTag<>'') and (Trim(ALangString)<>'') then
  begin
    if FindLangStringIndex(ALangTag)=-1 then
    begin
      if LangStringsCount<Length(LangStrings) then
      begin
        LangStrings[LangStringsCount][lkTag]:=ALangTag;
        LangStrings[LangStringsCount][ALangKind]:=ALangString;
        LangStringsCount:=LangStringsCount+1;
      end
      else
      begin
      end;

    end;
  end;
end;

function GetLangString(const ALangTag:String;const ALangKind:TLangKind):String;
var
  AIndex: Integer;
begin
  if ALangTag<>'' then
  begin
    AIndex:=FindLangStringIndex(ALangTag);
    if AIndex<>-1 then
    begin
      Result:=LangStrings[AIndex][ALangKind];
    end;
  end;
end;

//{$IFDEF VCL}

{ TLang }

function ReadString(S: TStream): string;
var
  L: Integer;
begin
  L := 0;
  S.Read(L, SizeOf(L));
  SetLength(Result, L);
  S.Read(Pointer(Result)^, L * 2);
end;

procedure WriteString(S: TStream; const Value: string);
var
  L: Integer;
begin
  L := Length(Value);
  S.Write(L, SizeOf(L));
  S.Write(Pointer(Value)^, L * 2);
end;

constructor TLang.Create(AOwner: TComponent);
begin
  FOriginal := TStringList.Create;
  FResources := TStringList.Create;
  FAutoSelect := True;
  FStoreInForm := True;
end;

destructor TLang.Destroy;
var
  I: Integer;
  AObject:TObject;
begin
  for I := 0 to FResources.Count - 1 do
  begin
    AObject:=TStrings(FResources.Objects[I]);
    FreeAndNil(AObject);//.DisposeOf;
  end;
  FreeAndNil(FResources);
  FreeAndNil(FOriginal);
  inherited;
end;

//procedure TLang.Loaded;
//var
//  LocaleSvc: IFMXLocaleService;
//begin
//  inherited;
//  if not FFileName.IsEmpty then
//    if FileExists(FFileName) then
//      LoadFromFile(FFileName);
//  if FAutoSelect and TPlatformServices.Current.SupportsPlatformService(IFMXLocaleService, LocaleSvc) then
//    FLang := LocaleSvc.GetCurrentLangID;
//  if FLang <> '' then
//    LoadLangFromStrings(LangStr[FLang]);
//end;
//
//procedure TLang.DefineProperties(Filer: TFiler);
//begin
//  inherited;
//  Filer.DefineBinaryProperty('ResourcesBin', ReadResources, WriteResources, StoreInForm and (FResources.Count > 0));
//end;

procedure TLang.ReadResources(Stream: TStream);
var
  len: Cardinal;
  I: Integer;
  N: string;
  Str: TStrings;
begin
  FOriginal.Text := ReadString(Stream);
  Stream.Read(len, 4);
  for I := 0 to len - 1 do
  begin
    N := ReadString(Stream);
    Str := TStringList.Create;
//    TStringList(Str).Sorted := True;
    TStringList(Str).CaseSensitive := True;
    Str.Text := ReadString(Stream);
    FResources.AddObject(N, Str);
  end;
end;

procedure TLang.WriteResources(Stream: TStream);
var
  len: Cardinal;
  I: Integer;
begin
  WriteString(Stream, FOriginal.Text);
  len := FResources.Count;
  Stream.Write(len, 4);
  for I := 0 to len - 1 do
  begin
    WriteString(Stream, FResources[I]);
    WriteString(Stream, TStrings(FResources.Objects[I]).Text);
  end;
end;

procedure TLang.LoadFromFile(const AFileName: string);
var
  S: TFileStream;
begin
  if FileExists(AFileName) then
  begin
    S := TFileStream.Create(AFileName, fmOpenRead);
    try
      ReadResources(S);
    finally
      S.Free;
    end;
  end;
end;

procedure TLang.SaveToFile(const AFileName: string);
var
  S: TFileStream;
begin
  S := TFileStream.Create(AFileName, fmCreate);
  try
    WriteResources(S);
  finally
    S.Free;
  end;
end;

procedure TLang.AddLang(const AName: string);
var
  Idx: Integer;
  Str: TStrings;
begin
  Idx := FResources.IndexOf(AName);
  if Idx < 0 then
  begin
    Str := TStringList.Create;
//    TStringList(Str).Sorted := True;
    TStringList(Str).CaseSensitive := True;
    FResources.AddObject(AName, Str);
  end;
end;

function TLang.GetLangStr(const Index: string): TStrings;
var
  Idx: Integer;
begin
  Idx := FResources.IndexOf(Index);
  if Idx >= 0 then
    Result := TStrings(FResources.Objects[Idx])
  else
    Result := nil;
end;

procedure TLang.SetLang(const Value: string);
begin
  FLang := Value;
//  if not(csLoading in ComponentState) then
//  begin
//    if FLang = 'en' then
//      ResetLang
//    else
//      LoadLangFromStrings(LangStr[FLang]);
//  end;
end;
//{$ENDIF VCL}

function GlobalCurLang:String;
begin
  case LangKind of
    lkZH:Result:='cn';
    lkEN:Result:='en';
  end;
end;

initialization
  SetLength(LangStrings,2048);


  {$IFDEF LINUX}
  {$ELSE}
  GlobalLang:=TLang.Create(nil);
  {$ENDIF}


//  //��ǰ������
//  GlobalCurLang:='cn';
  //chinese
  LangKind:=TLangKind.lkZH;


  {$IFDEF MSWINDOWS}
  if GetWindowsLanguage<>'����(���壬�й�)' then
  begin
//    //��ǰ������
//    GlobalCurLang:='en';
    //����
    LangKind:=TLangKind.lkEN;
  end;
  {$ENDIF}






finalization
  SetLength(LangStrings,0);
  FreeAndNil(GlobalLang);

end.

