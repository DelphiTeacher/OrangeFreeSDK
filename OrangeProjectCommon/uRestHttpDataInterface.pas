unit uRestHttpDataInterface;

interface


uses
  Classes,
  uFuncCommon,
  uOpenClientCommon,


  {$IF CompilerVersion <= 21.0} // D2010֮ǰ
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

  uBaseLog,
  uDatasetToJson,
  uRestInterfaceCall,
  uDataInterface;

type


  //ͨ�ýӿڿ�ܵ�Rest�ӿ�
  TTableCommonRestHttpDataInterface=class(TDataInterface)
  public
    FInterfaceUrl:String;
    FKey:String;
    //�Ƿ�ʹ��Ĭ�ϵ�uOpenClientCommon�е�InterfaceUrl
    FIsUseDefaultInterfaceUrl:Boolean;
    function GetAppID(ALoadDataSetting:TLoadDataSetting):String;overload;virtual;
    function GetAppID(ASaveDataSetting:TSaveDataSetting):String;overload;virtual;
    function GetUserFID:String;virtual;
    function GetKey:String;virtual;
    function GetInterfaceUrl:String;

    //��json�м���
    function CustomLoadFromJson(ASuperObject:ISuperObject):Boolean;override;

    //��ȡ�ֶ��б�
    function GetFieldList(AAppID:String;
                          var ADesc:String;
                          var ADataJson:ISuperObject
                           ):Boolean;override;
    //��ȡ��¼�б�
    function GetDataList(
                           ALoadDataSetting:TLoadDataSetting;
                           ADataIntfResult:TDataIntfResult
                           ):Boolean;override;
    //��ȡ��¼
    function GetDataDetail(
                       ALoadDataSetting:TLoadDataSetting;
                       ADataIntfResult:TDataIntfResult
                       ):Boolean;override;
    //�����¼
    function SaveData(ASaveDataSetting:TSaveDataSetting;
                      ADataIntfResult:TDataIntfResult):Boolean;override;
    //�����¼�б�
    function SaveDataList(
                          //Ҫ���������
                          ASaveDataSetting:TSaveDataSetting;
                          ARecordList:ISuperArray;
                          //ԭ����
    //                      ALoadDataIntfResult:TDataIntfResult;
                          ADataIntfResult:TDataIntfResult):Boolean;override;

    //�����¼�б�
    function AddDataList(ASaveDataSetting:TSaveDataSetting;
                      ARecordList:ISuperArray;
                      ADataIntfResult:TDataIntfResult):Boolean;override;


    //ɾ����¼,ɾ��ALoadDataIntfResult������ȡ�ļ�¼
    function DelData(ALoadDataSetting: TLoadDataSetting;
                      ALoadDataIntfResult:TDataIntfResult;
                      ADataIntfResult:TDataIntfResult):Boolean;override;
//  public
//    constructor Create;virtual;
  end;


  {$IFDEF OPEN_PLATFORM_SERVER}
    //�ڿ���ƽ̨�������ʹ��
  {$ELSE}
    //�ڿͻ�����ʹ��
  TDefaultTableCommonRestHttpDataInterface=class(TTableCommonRestHttpDataInterface)
  public
    function GetUserFID:String;override;
    function GetKey:String;override;
    constructor Create;override;
  end;
  {$ENDIF}



  //Http��Rest�ӿ�
  TRestHttpDataInterface=class(TDataInterface)
  public

    //����http://www.orangeui.cn:10000/usercenter/
    InterfaceUrl:String;

    //��json�м���
    function CustomLoadFromJson(ASuperObject:ISuperObject):Boolean;override;

    //����Json����ĸ�ʽ,[{����1},{},{},{}]
    {name,value}
    //����appid,user_fid,key,........
//    FLoadParams:ISuperArray;

    //��ȡ��¼�б�
    function GetDataList(
                         ALoadDataSetting:TLoadDataSetting;
                         ADataIntfResult:TDataIntfResult
                         ):Boolean;override;
    //��ȡ��¼
    function GetDataDetail(
                       ALoadDataSetting:TLoadDataSetting;
                       ADataIntfResult:TDataIntfResult
                       ):Boolean;override;
    //�����¼
    function SaveData(ASaveDataSetting:TSaveDataSetting;
                      ADataIntfResult:TDataIntfResult):Boolean;override;
    //�����¼�б�
    function AddDataList(ASaveDataSetting:TSaveDataSetting;
                      ARecordList:ISuperArray;
                      ADataIntfResult:TDataIntfResult):Boolean;override;
    //ɾ����¼,ɾ��ALoadDataIntfResult������ȡ�ļ�¼
    function DelData(ALoadDataSetting: TLoadDataSetting;ALoadDataIntfResult:TDataIntfResult;
                      ADataIntfResult:TDataIntfResult):Boolean;override;
  end;







implementation



{ TTableCommonRestHttpDataInterface }

function TTableCommonRestHttpDataInterface.CustomLoadFromJson(
  ASuperObject: ISuperObject): Boolean;
begin
  FIsUseDefaultInterfaceUrl:=ASuperObject.B['is_use_default_interface_url'];
  FInterfaceUrl:=ASuperObject.S['interface_url'];
end;

function TTableCommonRestHttpDataInterface.DelData(
  ALoadDataSetting: TLoadDataSetting;
//  ADelDataSetting:TDelDataSetting;
//  ALoadDataSetting:TLoadDataSetting;
  ALoadDataIntfResult:TDataIntfResult;
  ADataIntfResult: TDataIntfResult): Boolean;
var
  ACode:Integer;
  AWhereKeyJson:String;
begin
  Result:=False;


  //����ɾ����¼������
  AWhereKeyJson:=GetWhereConditions(['appid','fid'],
                                    [GetAppID(ALoadDataSetting),ALoadDataIntfResult.DataJson.I['fid']]);

  if not SimpleCallAPI('del_record',
                      nil,
                      GetInterfaceUrl+'tablecommonrest/',
                      ['appid',
                      'user_fid',
                      'key',
                      'rest_name',
                      'where_key_json'
                      ],
                      [GetAppID(ALoadDataSetting),
                      GetUserFID,
                      GetKey,
                      Name,
                      AWhereKeyJson
      //                GetWhereConditions(['appid','user_fid','shield_user_fid'],
      //                                    [AppID,GlobalManager.User.fid,FUserFID])
                      ],
                      ACode,
                      ADataIntfResult.Desc,
                      ADataIntfResult.DataJson,
                      GlobalRestAPISignType,
                      GlobalRestAPIAppSecret) then
  begin
    Exit;
  end;


  ADataIntfResult.DataType:=TDataIntfResultType.ldtJson;
  ADataIntfResult.Succ:=(ACode=SUCC);
  Result:=True;

end;

function TTableCommonRestHttpDataInterface.GetAppID(ALoadDataSetting:TLoadDataSetting): String;
begin
//  if ALoadDataSetting<>nil then
//  begin
    Result:=ALoadDataSetting.AppID;
//  end
//  else if ASaveDataSetting<>nil then
//  begin
//    Result:=ASaveDataSetting.AppID;
//  end
//  else
//  begin
//    Result:=uOpenClientCommon.AppID;
//  end;
end;

function TTableCommonRestHttpDataInterface.GetAppID(
  ASaveDataSetting: TSaveDataSetting): String;
begin
    Result:=ASaveDataSetting.AppID;
end;

function TTableCommonRestHttpDataInterface.GetDataDetail(
  ALoadDataSetting: TLoadDataSetting;
  ADataIntfResult: TDataIntfResult): Boolean;
var
  ACode:Integer;
begin
  Result:=False;
  //���س���ģ������й��ܺ�ҳ��
  if not SimpleCallAPI(
                      'get_record',
                      nil,
                      GetInterfaceUrl+'tablecommonrest/',
                      ConvertToStringDynArray(['appid',
                                              'user_fid',
                                              'key',

                                              'rest_name',
                                              'where_key_json'
                                              ]),
                      ConvertToVariantDynArray([
                                                GetAppID(ALoadDataSetting),
                          //                      GlobalMainProgramSetting.AppID,
                                                GetUserFID,
                                                GetKey,
                                                Name,
                                                ALoadDataSetting.WhereKeyJson
                                                ]),
                      ACode,
                      ADataIntfResult.Desc,
                      ADataIntfResult.DataJson,
                                        GlobalRestAPISignType,
                                        GlobalRestAPIAppSecret) then
  begin
    Exit;
  end;


  ADataIntfResult.DataType:=TDataIntfResultType.ldtJson;
  ADataIntfResult.Succ:=(ACode=SUCC);
  Result:=True;

end;

function TTableCommonRestHttpDataInterface.GetDataList(
  ALoadDataSetting: TLoadDataSetting;
  ADataIntfResult: TDataIntfResult): Boolean;
var
  ACode:Integer;
begin
  Result:=False;
  //���س���ģ������й��ܺ�ҳ��
  if not SimpleCallAPI(
                      'get_record_list',
                      nil,
                      GetInterfaceUrl+'tablecommonrest/',
                      ConvertToStringDynArray(['appid',
                                            'user_fid',
                                            'key',
                                            'rest_name',
                                            'pageindex',
                                            'pagesize',
                                            'where_key_json',
                                            'order_by',
                                            'where_sql'
                                            ]),
                      ConvertToVariantDynArray([
                                              GetAppID(ALoadDataSetting),
                        //                      GlobalMainProgramSetting.AppID,
                                              GetUserFID,
                                              GetKey,
                                              Name,
                                              ALoadDataSetting.PageIndex,
                                              ALoadDataSetting.PageSize,
                                              ALoadDataSetting.WhereKeyJson,
                                              ALoadDataSetting.OrderBy,
                                              ALoadDataSetting.CustomWhereSQL
                                              ]),
                      ACode,
                      ADataIntfResult.Desc,
                      ADataIntfResult.DataJson,
                      GlobalRestAPISignType,
                      GlobalRestAPIAppSecret) or (ACode<>SUCC) then
  begin
    Exit;
  end;

  //���浽���ز���



  ADataIntfResult.DataType:=TDataIntfResultType.ldtJson;
  ADataIntfResult.Succ:=(ACode=SUCC);
  Result:=True;
end;

function TTableCommonRestHttpDataInterface.GetFieldList(AAppID:String;var ADesc: String; var ADataJson: ISuperObject): Boolean;
var
  ACode:Integer;
begin
  Result:=False;
  //���س���ģ������й��ܺ�ҳ��
  if not SimpleCallAPI(
                      'get_field_list',
                      nil,
                      GetInterfaceUrl+'tablecommonrest/',
                      ConvertToStringDynArray(['appid',
                                            'user_fid',
                                            'key',
                                            'rest_name'
                                            ]),
                      ConvertToVariantDynArray([
                                              AAppID,
                        //                      GlobalMainProgramSetting.AppID,
                                              GetUserFID,
                                              GetKey,
                                              Name
                                              ]),
                      ACode,
                      ADesc,
                      ADataJson,
                      GlobalRestAPISignType,
                      GlobalRestAPIAppSecret) or (ACode<>SUCC) then
  begin
    Exit;
  end;

  Result:=True;

end;

function TTableCommonRestHttpDataInterface.GetInterfaceUrl: String;
begin
  if FIsUseDefaultInterfaceUrl then
  begin
    Result:=uOpenClientCommon.InterfaceUrl;
  end
  else
  begin
    Result:=Self.FInterfaceUrl;
  end;
end;

function TTableCommonRestHttpDataInterface.GetKey: String;
begin
  Result:=FKey;
end;

function TTableCommonRestHttpDataInterface.GetUserFID: String;
begin
  Result:='';
end;

function TTableCommonRestHttpDataInterface.SaveData(ASaveDataSetting: TSaveDataSetting;ADataIntfResult:TDataIntfResult): Boolean;
var
  ACode:Integer;
begin
  Result:=False;

  ADataIntfResult.DataType:=TDataIntfResultType.ldtJson;

  if ASaveDataSetting.IsAddIfNotExist then
  begin

      //���¼�¼
      if not SimpleCallAPI('save_record_post',
                              nil,
                              GetInterfaceUrl+'tablecommonrest/',
                              ConvertToStringDynArray(['appid',
                                                      'user_fid',
                                                      'key',
                                                      'rest_name',
                                                      'check_exist_field_names']),
                              ConvertToVariantDynArray([GetAppID(ASaveDataSetting),
                                                        GetUserFID,
                                                        GetKey,
                                                        Name,
                                                        ASaveDataSetting.CheckExistFieldNames
                                                        ]),
                              ACode,
                              ADataIntfResult.Desc,
                              ADataIntfResult.DataJson,
                              GlobalRestAPISignType,
                              GlobalRestAPIAppSecret,
                              True,
                              nil,
                              ASaveDataSetting.RecordDataJson.AsJson
                              ) or (ACode<>SUCC)  then
      begin
//        uBaseLog.HandleException(nil,'SaveRecordToServer '+ADesc);
        Exit;
      end;

      Result:=True;


      Exit;
  end;


          //���ӿڱ��浽���ݿ�
          if SaveRecordToServer(GetInterfaceUrl,//GlobalMainProgramSetting.DataIntfServerUrl,//Self.InterfaceUrl,//
                                GetAppID(ASaveDataSetting),
                                GetUserFID,
                                GetKey,
                                Self.Name,
                                ASaveDataSetting.EditingRecordKeyValue,//Self.FDataIntfResult.DataJson.I['fid'],
                                ASaveDataSetting.RecordDataJson,
                                ASaveDataSetting.IsAddedRecord,
                                ADataIntfResult.Desc,
                                ADataIntfResult.DataJson,
                                GlobalRestAPISignType,
                                GlobalRestAPIAppSecret,
                                FHasAppID,
                                Self.FKeyFieldName,
                                ASaveDataSetting.CustomWhereSQL,
                                ASaveDataSetting.CustomWhereKeyJson) then
          begin
            ADataIntfResult.Succ:=True;//(ACode=SUCC);
//              //����ɹ�,Ҫȡ��������¼��fid
//              if AIsAdd then
//              begin
//                FPage.DataInterface.fid:=ADataJson.I['fid'];
//              end;
//              TTimerTask(ATimerTask).TaskTag:=TASK_SUCC;
            Result:=True;
          end
          else
          begin
        //      ShowMessage(ADesc);
            Exit;
          end;

end;



function TTableCommonRestHttpDataInterface.SaveDataList(
  ASaveDataSetting: TSaveDataSetting; ARecordList: ISuperArray;
  ADataIntfResult: TDataIntfResult): Boolean;
var
  ACode:Integer;
  I: Integer;
  ADesc:String;
  ADataJson:ISuperObject;
begin
  Result:=False;

  ADataIntfResult.DataType:=TDataIntfResultType.ldtJson;


  if ASaveDataSetting.IsAddIfNotExist then
  begin

    //���¼�¼
    if not SimpleCallAPI('save_record_list_post',
                            nil,
                            GetInterfaceUrl+'tablecommonrest/',
                            ConvertToStringDynArray(['appid',
                                                    'user_fid',
                                                    'key',
                                                    'rest_name',
                                                    'check_exist_field_names']),
                            ConvertToVariantDynArray([GetAppID(ASaveDataSetting),
                                                      GetUserFID,
                                                      GetKey,
                                                      Name,
                                                      ASaveDataSetting.CheckExistFieldNames
                                                      ]),
                            ACode,
                            ADataIntfResult.Desc,
                            ADataIntfResult.DataJson,
                            GlobalRestAPISignType,
                            GlobalRestAPIAppSecret,
                            True,
                            nil,
                            ARecordList.AsJson
                            ) or (ACode<>SUCC)  then
    begin
      uBaseLog.HandleError(nil,'TTableCommonRestHttpDataInterface.SaveDataList save_record_list_post '+ADataIntfResult.Desc);
      Exit;
    end;
    ADataIntfResult.Succ:=True;//(ACode=SUCC);
    Result:=True;
    Exit;
  end;


  ADataIntfResult.DataJson:=SO();
  for I := 0 to ARecordList.Length-1 do
  begin
          ACode:=FAIL;
          ADesc:='';
          ADataJson:=nil;
          //���ӿڱ��浽���ݿ�
          if SaveRecordToServer(GetInterfaceUrl,//GlobalMainProgramSetting.DataIntfServerUrl,//Self.InterfaceUrl,//
                                GetAppID(ASaveDataSetting),
                                GetUserFID,
                                GetKey,
                                Self.Name,
                                ASaveDataSetting.EditingRecordKeyValue,//Self.FDataIntfResult.DataJson.I['fid'],
                                ARecordList.O[I],//ASaveDataSetting.RecordDataJson,
                                ASaveDataSetting.IsAddedRecord,
                                ADesc,
                                ADataJson,
                                GlobalRestAPISignType,
                                GlobalRestAPIAppSecret,
                                FHasAppID,
                                Self.FKeyFieldName,
                                ASaveDataSetting.CustomWhereSQL,
                                ASaveDataSetting.CustomWhereKeyJson) then
          begin
//            ADataIntfResult.Succ:=True;//(ACode=SUCC);
//              //����ɹ�,Ҫȡ��������¼��fid
//              if AIsAdd then
//              begin
//                FPage.DataInterface.fid:=ADataJson.I['fid'];
//              end;
//              TTimerTask(ATimerTask).TaskTag:=TASK_SUCC;
            ACode:=SUCC;
          end
          else
          begin
        //      ShowMessage(ADesc);
//            Exit;
          end;
          ADataIntfResult.DataJson.A['RecordList'].O[I]:=ReturnJson(ACode,ADesc,ADataJson);
  end;

  ADataIntfResult.Succ:=True;//(ACode=SUCC);
  Result:=True;

end;

function TTableCommonRestHttpDataInterface.AddDataList(
  ASaveDataSetting: TSaveDataSetting;
  ARecordList: ISuperArray;
  ADataIntfResult: TDataIntfResult): Boolean;
var
  ACode:Integer;
begin
  Result:=False;

  ADataIntfResult.DataType:=TDataIntfResultType.ldtJson;


  //������fid,��ʾҪ�����ü�¼
  if not SimpleCallAPI('add_record_list_post_2',
                          nil,
                          GetInterfaceUrl+'tablecommonrest/',
                          ConvertToStringDynArray(
                                                  ['appid',
                                                  'user_fid',
                                                  'key',
                                                  'rest_name'
                                                  ]),
                          ConvertToVariantDynArray([GetAppID(ASaveDataSetting),
                                                    GetUserFID,
                                                    GetKey,
                                                    Self.Name
                                                    ]),
                          ACode,
                          ADataIntfResult.Desc,
                          ADataIntfResult.DataJson,
                          GlobalRestAPISignType,
                          GlobalRestAPIAppSecret,
                          True,
                          nil,
                          ARecordList.AsJson
                          ) or (ACode<>SUCC) then
  begin
    uBaseLog.HandleError(nil,'TTableCommonRestHttpDataInterface.AddDataList add_record_list_post_2 '+ADataIntfResult.Desc);
    Exit;
  end;

  ADataIntfResult.Succ:=True;
  Result:=True;

end;

{ TRestHttpDataInterface }

function TRestHttpDataInterface.AddDataList(ASaveDataSetting: TSaveDataSetting;
  ARecordList: ISuperArray; ADataIntfResult: TDataIntfResult): Boolean;
begin

end;

function TRestHttpDataInterface.CustomLoadFromJson(
  ASuperObject: ISuperObject): Boolean;
begin
  InterfaceUrl:=ASuperObject.S['interface_url'];

end;

function TRestHttpDataInterface.DelData(ALoadDataSetting: TLoadDataSetting;ALoadDataIntfResult,
  ADataIntfResult: TDataIntfResult): Boolean;
begin

end;

function TRestHttpDataInterface.GetDataDetail(
  ALoadDataSetting: TLoadDataSetting;
  ADataIntfResult: TDataIntfResult): Boolean;
begin

end;

//procedure GetParamsArray(AParams:ISuperArray;var ALoadDataParamNames:TStringDynArray;var ALoadDataParamValues:TVariantDynArray);
//begin
//  //���ò����ĳ���
//  SetLength(ALoadDataParamNames,AParams.Length);
//  SetLength(ALoadDataParamValues,AParams.Length);
//
//
//  //{name:appid,value:1012,....}
//  for I := 0 to AParams.Length-1 do
//  begin
//    ALoadDataParamNames[I]:=AParams.O[I].S['name'];
//    ALoadDataParamValues[I]:=AParams.O[I].S['value'];
//  end;
//
//
//
//end;


function TRestHttpDataInterface.GetDataList(ALoadDataSetting: TLoadDataSetting;
  ADataIntfResult: TDataIntfResult): Boolean;
var
  ACode:Integer;
//  //���ز������Ͳ���ֵ
//  ALoadDataParamNames:TStringDynArray;
//  ALoadDataParamValues:TVariantDynArray;
//  I: Integer;
begin
  Result:=False;


//  GetParamsArray(FLoadParams,ALoadDataParamNames,ALoadDataParamValues);

  //���س���ģ������й��ܺ�ҳ��
  if not SimpleCallAPI(
                      Name,
                      nil,
                      InterfaceUrl+ALoadDataSetting.InterfaceName,
//                      ['appid',
//                      'user_fid',
//                      'key',
//                      'rest_name',
//                      'pageindex',
//                      'pagesize',
//                      'where_key_json',
//                      'order_by'
//                      ],
                      ALoadDataSetting.ParamNames,
//                      [
////                      ALoadDataSetting.AppID,
//                      GlobalMainProgramSetting.AppID,
//                      0,
//                      '',
//                      Name,
//                      ALoadDataSetting.PageIndex,
//                      ALoadDataSetting.PageSize,
//                      ALoadDataSetting.WhereKeyJson,
//                      ''//ALoadDataSetting.OrderBy
//                      ],
                      ALoadDataSetting.ParamValues,

                      ACode,
                      ADataIntfResult.Desc,
                      ADataIntfResult.DataJson,

                      GlobalRestAPISignType,
                      GlobalRestAPIAppSecret) then
  begin
    Exit;
  end;

  //���浽���ز���



  ADataIntfResult.DataType:=TDataIntfResultType.ldtJson;
  ADataIntfResult.Succ:=(ACode=SUCC);
  Result:=True;
end;

function TRestHttpDataInterface.SaveData(ASaveDataSetting: TSaveDataSetting;
  ADataIntfResult: TDataIntfResult): Boolean;
begin

end;

  {$IFDEF OPEN_PLATFORM_SERVER}
    //�ڿ���ƽ̨�������ʹ��
  {$ELSE}

{ TDefaultTableCommonRestHttpDataInterface }

constructor TDefaultTableCommonRestHttpDataInterface.Create;
begin
  inherited;
  FIsUseDefaultInterfaceUrl:=True;
end;

function TDefaultTableCommonRestHttpDataInterface.GetKey: String;
begin
  Result:=GlobalBaseManager.User.Key;
end;

function TDefaultTableCommonRestHttpDataInterface.GetUserFID: String;
begin
  Result:=GlobalBaseManager.User.fid;
end;
  {$ENDIF}

initialization
  GlobalDataInterfaceClassRegList.Add('TableCommonRestHttp',TTableCommonRestHttpDataInterface);
  GlobalDataInterfaceClassRegList.Add('RestHttp',TRestHttpDataInterface);



end.
