unit UnitOrangeUIJava2PasFixer;

//By [��]DelphiTeacher(452330643)

interface

uses
  System.Classes;

procedure ConvertFix(AOriginCodes: TStrings;
      const AutoCommentBadInterface, AutoMoveParentInterfaceToFront,
      IsAutoAddDefineANDROID, IAutoAddRegisterTypes: Boolean);

implementation

uses
  System.Contnrs,
  System.StrUtils,
  System.SysUtils;

function IsBadInterfaceName(AInterfaceName:String):Boolean;
var
  AEndIndex:Integer;
  AInterfaceNameSuffix:String;
begin
  Result:=False;
  if Length(AInterfaceName)=2 then  //JA,JB
  begin
    Result:=True;
  end
  else if Length(AInterfaceName)=3 then  //JAA,JBA
  begin
    Result:=True;
  end
  else if Pos('_',AInterfaceName)=3 then  //JA_a,JB_1
  begin
    Result:=True;
  end
  else
  begin

    //JLocationClientOption_1 = interface;
    AEndIndex:=Pos('_',AInterfaceName,1);
    while Pos('_',AInterfaceName,AEndIndex+1)>0 do
    begin
      AEndIndex:=Pos('_',AInterfaceName,AEndIndex+1);
    end;
    if AEndIndex>0 then
    begin
      AInterfaceNameSuffix:=Copy(AInterfaceName,AEndIndex+1,MaxInt);
      if (AInterfaceNameSuffix>='a') and (AInterfaceNameSuffix<='z')
        or (AInterfaceNameSuffix>='1') and (AInterfaceNameSuffix<='9') then
      begin
        Result:=True;
      end;
    end;

  end;

end;

type
  TJavaInterfaceType=class
  public
    InterfaceName:String;
    ParentName:String;
    CodeLines:TStringList;
    IsBadInterface:Boolean;
  public
    constructor Create;
    destructor Destroy;override;
  end;

{ TJavaInterfaceType }

constructor TJavaInterfaceType.Create;
begin
  CodeLines:=TStringList.Create;

end;

destructor TJavaInterfaceType.Destroy;
begin
  FreeAndNil(CodeLines);
  inherited;
end;

procedure ConvertFix(AOriginCodes: TStrings;
      const AutoCommentBadInterface, AutoMoveParentInterfaceToFront,
      IsAutoAddDefineANDROID, IAutoAddRegisterTypes: Boolean);
var
  I,J: Integer;
  ACodeLine:String;
  AStartIndex:Integer;
  AEndIndex:Integer;
  AInterfaceName:String;
  AInterfaceParentName:String;
  AIsInterfaceOneLineEnd:Boolean;
  AIsBadInterface:Boolean;
  AInterfaceNameSuffix:String;

  memConverted:TStringList;
  //�Ѿ��������������б�,�����ж�������û��������
  ADeclaredTypes:TStringList;

  //��Ԫ��ʼ�Ĵ���
  AUnitBeginCodes:TStringList;
  //�Ƿ��ǵ�Ԫ��ʼ�Ĳ���
  AIsUnitBegin:Boolean;

  AJavaInterfaceTypeList:TList;
  AJavaInterfaceType:TJavaInterfaceType;
  AParentJavaInterfaceType:TJavaInterfaceType;
  AIsFoundParent:Boolean;
  //fix by flying wang.
  TempStr,
  UnitName: string;
begin
  if AOriginCodes = nil then exit;
  if (not AutoCommentBadInterface) and (not AutoMoveParentInterfaceToFront) then exit;



  UnitName := 'YourUitName';



  memConverted:=TStringList.Create;
  AJavaInterfaceTypeList:=TList.Create;
  AUnitBeginCodes:=TStringList.Create;
  ADeclaredTypes:=TStringList.Create;
  try
    AIsUnitBegin:=True;
    I:=0;
    while I < AOriginCodes.Count do
    begin
      ACodeLine:=Trim(AOriginCodes[I]);
      AIsBadInterface:=False;


      //�����ǰ�ǵ�Ԫ��ʼ�Ĳ���,����ֱ�����,������
      if AIsUnitBegin then
      begin
        AUnitBeginCodes.Add(AOriginCodes[I]);
      end;



      if (Pos('unit ', ACodeLine) <> 0) and (RightStr(Trim(ACodeLine), 1) = ';') then
      begin
        UnitName := Trim(ACodeLine.Replace(';', '', [rfReplaceAll, rfIgnoreCase]).Replace('unit ', '', [rfReplaceAll, rfIgnoreCase]));
      end;



      //�ǽӿ�����
      AStartIndex:=Pos(' = interface',ACodeLine);
      AIsInterfaceOneLineEnd:=Pos(' = interface;',ACodeLine)>0;


      if (AStartIndex>0) then
      begin
          //�пո�
          //�ж��ǽӿڻ���������
          //JListPreloader = interface(JObject)
          AInterfaceName:=Copy(ACodeLine,1,AStartIndex-1);
          AInterfaceParentName:='';
          if Copy(AInterfaceName,Length(AInterfaceName)-5+1,5)='Class' then
          begin
            //JListPreloaderClass = interface(JObjectClass)
            AInterfaceName:=Copy(AInterfaceName,1,Length(AInterfaceName)-5);
            AInterfaceParentName:=Copy(ACodeLine,
                                        AStartIndex+Length(' = interface')+1,
                                        Length(ACodeLine)-AStartIndex-Length(' = interface')-1);
            //JObjectClass)
            AEndIndex:=Pos(')',AInterfaceParentName);
            //JObjectClass
            AInterfaceParentName:=Copy(AInterfaceParentName,1,AEndIndex-1);
            //JObject
            AInterfaceParentName:=Copy(AInterfaceParentName,1,Length(AInterfaceParentName)-5);

              if AIsUnitBegin then
              begin
                if AUnitBeginCodes.Count>0 then
                begin
                  AUnitBeginCodes.Delete(AUnitBeginCodes.Count-1);
                end;
                AIsUnitBegin:=False;
              end;
          end;



          //��J��ʼ
          if Copy(AInterfaceName,1,1)='J' then
          begin
                  //�Ƿ��ǻ�����������,Ja,Jb,Jc��
                  AIsBadInterface:= AutoCommentBadInterface and IsBadInterfaceName(AInterfaceName);



                  if AIsInterfaceOneLineEnd then
                  begin
                      //���нӿ�Ԥ������ֱ��ע�;�����
                      if AIsBadInterface then
                      begin
                        AUnitBeginCodes[AUnitBeginCodes.Count-1]:='//'+AUnitBeginCodes[AUnitBeginCodes.Count-1];
                      end;
                  end
                  else
                  begin
                      //���ǵ��е�Ԥ����


                      //��������
                      AJavaInterfaceType:=TJavaInterfaceType.Create;
                      AJavaInterfaceTypeList.Add(AJavaInterfaceType);

                      AJavaInterfaceType.InterfaceName:=AInterfaceName;
                      AJavaInterfaceType.ParentName:=AInterfaceParentName;
                      AJavaInterfaceType.IsBadInterface:=AIsBadInterface;

                      if (I-1>0) and (Pos('[JavaSignature',AOriginCodes[I-1])>0) then
                      begin
  //                      AOriginCodes[I-1]:='//'+AOriginCodes[I-1];
                        AJavaInterfaceType.CodeLines.Add(AOriginCodes[I-1]);
                      end;
                      AJavaInterfaceType.CodeLines.Add(AOriginCodes[I]);


                      //���нӿ�
                      repeat
                        Inc(I);
                        ACodeLine:=Trim(AOriginCodes[I]);
  //                      AOriginCodes[I]:='//'+AOriginCodes[I];
                        AJavaInterfaceType.CodeLines.Add(AOriginCodes[I]);

  //                    until ACodeLine='end;';
                        //��������
                      //  TJListPreloader = class(TJavaGenericImport<JListPreloaderClass, JListPreloader>) end;
                      until Copy(ACodeLine,1,Length(AInterfaceName)+1)='T'+AInterfaceName;


                  end;

          end;

      end;

      Inc(I);
    end;



    if AutoMoveParentInterfaceToFront then
    begin
      //��������˳���������
      I:=0;
      while I<=AJavaInterfaceTypeList.Count-2 do
      begin
          //�ҵ����е���������
          AJavaInterfaceType:=TJavaInterfaceType(AJavaInterfaceTypeList[I]);

          ADeclaredTypes.Add(AJavaInterfaceType.InterfaceName);

          if AJavaInterfaceType.ParentName<>'JObject' then
          begin

              //���಻ΪJObject����Ҫ����
              AIsFoundParent:=False;
              for J := I+1 to AJavaInterfaceTypeList.Count-1 do
              begin
                  AParentJavaInterfaceType:=TJavaInterfaceType(AJavaInterfaceTypeList[J]);
                  if AJavaInterfaceType.ParentName=AParentJavaInterfaceType.InterfaceName then
                  begin
                      AIsFoundParent:=True;
                      Break;
                  end;
              end;
              if AIsFoundParent then
              begin
                //�Ѹ��������Ƶ�Aǰ����
                AJavaInterfaceTypeList.Delete(J);
                AJavaInterfaceTypeList.Insert(I,AParentJavaInterfaceType);

                //�������ĸ���Ҳ����JObject,��ô���໹��Ҫ��������
                if AParentJavaInterfaceType.ParentName<>'JObject' then
                begin
                    //���໹��Ҫ����
                    //�����Ƿ�֮ǰ��������
                    if ADeclaredTypes.IndexOf(AParentJavaInterfaceType.ParentName)<>-1 then
                    begin
                        //�Ѿ�����������,����Ҫ�ٴ���
                    end
                    else
                    begin
                        //����֮ǰû��������,��������,Ҫ���´���
                        I:=I-1;
                    end;
                end;

              end;


          end;

          Inc(I);
      end;
    end;



    memConverted.BeginUpdate;
    try
      memConverted.Assign(AUnitBeginCodes);
      memConverted.Add('');
      memConverted.Add('');
      for I := 0 to AJavaInterfaceTypeList.Count-1 do
      begin
        //�ҵ����е���������
        AJavaInterfaceType:=TJavaInterfaceType(AJavaInterfaceTypeList[I]);
        if AJavaInterfaceType.IsBadInterface then
        begin
          for J := 0 to AJavaInterfaceType.CodeLines.Count-1 do
          begin
            AJavaInterfaceType.CodeLines[J]:=
              '//'+AJavaInterfaceType.CodeLines[J];
          end;
        end;
        memConverted.AddStrings(AJavaInterfaceType.CodeLines);
        memConverted.Add('');
      end;
      memConverted.Add('');
      if IsAutoAddDefineANDROID then
        memConverted.Add('{$ENDIF}');
      memConverted.Add('implementation');
      memConverted.Add('');
      if IAutoAddRegisterTypes then
      begin
        if IsAutoAddDefineANDROID then
          memConverted.Add('{$IFDEF ANDROID}');
        memConverted.Add('procedure RegisterTypes;');
        memConverted.Add('begin');
        for I := 0 to AJavaInterfaceTypeList.Count-1 do
        begin
          //�ҵ����е���������
          AJavaInterfaceType:=TJavaInterfaceType(AJavaInterfaceTypeList[I]);
          TempStr := 'TRegTypes.RegisterType(''' + UnitName + '.' + AJavaInterfaceType.InterfaceName + ''',';
          if AJavaInterfaceType.IsBadInterface then
          begin
            TempStr := '//' + TempStr;
          end;
          TempStr := '  ' + TempStr;
          memConverted.Add(TempStr);
          TempStr :='TypeInfo(' + UnitName + '.' + AJavaInterfaceType.InterfaceName + '))';
          if AJavaInterfaceType.IsBadInterface then
          begin
            TempStr := '//' + TempStr;
          end;
          TempStr := '    ' + TempStr;
          memConverted.Add(TempStr);
        end;
        memConverted.Add('end;');
        memConverted.Add('');
        if IsAutoAddDefineANDROID then
          memConverted.Add('{$ENDIF}');
      end;
      memConverted.Add('end.');
    finally
      memConverted.EndUpdate;
    end;

    AOriginCodes.Clear;
    AOriginCodes.Assign(memConverted);

  finally
    while AJavaInterfaceTypeList.Count <> 0 do
    begin
      AJavaInterfaceType := TJavaInterfaceType(AJavaInterfaceTypeList[AJavaInterfaceTypeList.Count - 1]);
      AJavaInterfaceTypeList.Remove(AJavaInterfaceType);
      FreeAndNil(AJavaInterfaceType);
    end;
    ADeclaredTypes.Free;
    AJavaInterfaceTypeList.Free;
    memConverted.Free;
    AUnitBeginCodes.Free;
  end;
end;

end.
