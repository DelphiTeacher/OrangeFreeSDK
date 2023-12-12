unit ListItemStyleListFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

//  CommonImageDataMoudle,
  EasyServiceCommonMaterialDataMoudle,

  uTimerTask,
//  uManager,
  uLang,


  uOpenClientCommon,
  uFuncCommon,
  uBaseList,
  uSkinItems,
  uRestInterfaceCall,
  uOpenCommon,
//  uConst,
  uOpenUISetting,
  uFrameContext,

  WaitingFrame,
  MessageBoxFrame,
  uSkinListBoxType,

  uUIFunction,
  XSuperObject,
  XSuperJson,
  uBaseHttpControl,
  ListItemStyleFrame_DefaultSelected,


  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
  uSkinFireMonkeyScrollControl, uSkinFireMonkeyCustomList,
  uSkinFireMonkeyVirtualList, uSkinFireMonkeyListBox, uSkinFireMonkeyLabel,
  uSkinFireMonkeyImage, uSkinFireMonkeyItemDesignerPanel,
  uSkinFireMonkeyNotifyNumberIcon, uDrawPicture, uSkinImageList,
  uSkinNotifyNumberIconType, uSkinLabelType, uSkinImageType,
  uSkinItemDesignerPanelType, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinButtonType, uSkinPanelType, uDrawCanvas;

type
  TFrameListItemStyleList = class(TFrame)
    pnlToolBar: TSkinFMXPanel;
    btnReturn: TSkinFMXButton;
    lvData: TSkinFMXListBox;
    procedure lvDataPullDownRefresh(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure lvDataClickItem(AItem: TSkinItem);
  private
    procedure GetListItemStyleListExecute(ATimerTask:TObject);
    procedure GetListItemStyleListExecuteEnd(ATimerTask:TObject);
  private
    FSelectedDetail:String;
    //��ȡҳ��ṹ������
    FProgramTemplateUrl:String;
//    FDataJson:ISuperObject;
    procedure OnReturnFromNoticeListFrame(Frame:TFrame);
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    procedure Load(AProgramTemplateUrl:String;
                  ASelectedDetail:String);
    { Public declarations }
  end;

var
  GlobalListItemStyleListFrame:TFrameListItemStyleList;


//function GetNoticeIconIndex(notice_classify_caption:String;notice_classify_name:String=''):Integer;

implementation

{$R *.fmx}
//uses
////  NoticeListFrame,
//  MainFrame,
//  MainForm,
//  NoticeListFrame;



//function GetNoticeIconIndex(notice_classify_caption:String;notice_classify_name:String=''):Integer;
//var
//  ADrawPicture:TDrawPicture;
//begin
//  Result:=0;
//
//  //��ͳ,д��,�����±�
//  if dmCommonImageDataMoudle.imgListNoticeIcon.PictureList[0].ImageName='' then
//  begin
//      if Pos('ϵͳ����',notice_classify_caption)>0 then
//      begin
//        Result:=1;
//      end;
//      if Pos('������Ϣ',notice_classify_caption)>0 then
//      begin
//        Result:=2;
//      end;
//      if Pos('�˺���Ϣ',notice_classify_caption)>0 then
//      begin
//        Result:=3;
//      end;
//      if Pos('����',notice_classify_caption)>0 then
//      begin
//        Result:=4;
//      end;
//      if Pos('վ����',notice_classify_caption)>0 then
//      begin
//        Result:=5;
//      end;
//  end
//  else
//  begin
//
//      //���µ�,����name
//      ADrawPicture:=
//        dmCommonImageDataMoudle.imgListNoticeIcon.PictureList.ItemsByName[notice_classify_name];
//      if ADrawPicture<>nil then
//      begin
//        Result:=dmCommonImageDataMoudle.imgListNoticeIcon.PictureList.IndexOf(ADrawPicture);
//      end;
//
//  end;
//end;

{ TFrameNotice }

procedure TFrameListItemStyleList.btnReturnClick(Sender: TObject);
begin
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;


  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self);
end;

constructor TFrameListItemStyleList.Create(AOwner: TComponent);
//var
//  I:Integer;
//  AListItemStyleNameList:TStringList;
//  AListItemStyleCaptionList:TStringList;
//  AListBoxItem:TSkinListBoxItem;
begin
  inherited;


//  FListItemStyleList:=TListItemStyleList.Create;
//  Self.lvData.Prop.Items.Clear(True);
//
//  Self.lvData.Prop.SkinImageList:=dmCommonImageDataMoudle.imgListNoticeIcon;


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);



//  AListItemStyleNameList:=TStringList.Create;
//  AListItemStyleCaptionList:=TStringList.Create;
  Self.lvData.Prop.Items.BeginUpdate;
  try
//    AListItemStyleNameList.CommaText:=GlobalListItemStyleNameListStr;
//    AListItemStyleCaptionList.CommaText:=GlobalListItemStyleCaptionListStr;
    Self.lvData.Prop.Items.Clear;

//    for I := 0 to AListItemStyleNameList.Count-1 do
//    begin
//
//    end;


  finally
//    FreeAndNil(AListItemStyleNameList);
//    FreeAndNil(AListItemStyleCaptionList);
    Self.lvData.Prop.Items.EndUpdate;
  end;




end;

destructor TFrameListItemStyleList.Destroy;
begin
//  FreeAndNil(FListItemStyleList);
  inherited;
end;

procedure TFrameListItemStyleList.GetListItemStyleListExecute(ATimerTask: TObject);
//var
//  ACode:Integer;
//  ADesc:String;
begin
  //����
  TTimerTask(ATimerTask).TaskTag:=1;
  try


//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI('',
//                                                    nil,
//                                                    CenterInterfaceUrl,
//                                                    ['appid',
//                                                    'user_fid',
//                                                    'key'],
//                                                    [AppID,
//                                                    GlobalManager.User.fid,
//                                                    GlobalManager.User.key],
//                                                    GlobalRestAPISignType,
//                                                    GlobalRestAPIAppSecret
//                                                    );



//    //���س���ģ������й��ܺ�ҳ��
//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI(
//                                                  'get_record_list',
//                                                  nil,
//                                                  CenterInterfaceUrl+'tablecommonrest/',
//                                                  ['appid',
//                                                  'user_fid',
//                                                  'key',
//                                                  'rest_name',
//                                                  'pageindex',
//                                                  'pagesize',
//                                                  'where_key_json',
//                            //                      'where_sql',
//                                                  'order_by'
//                                                  ],
//                                                  [
//                                                  Const_OpenPlatform_AppID,
//                                                  '',
//                                                  '',
//                                                  'page_no_function',
//                                                  1,
//                                                  MaxInt,
//                                                  GetWhereConditions(['program_template_name'],
//                                                                    [FProgramTemplateUrl]),
//                            //                      ' AND (program_template_name='+QuotedStr(AProgramTemplateUrl)+' OR '+'page_program_template_name='+QuotedStr(AProgramTemplateUrl)+') ',
//                                                  'orderno ASC,createtime ASC'
//                                                  ],
//                          //                        ACode,
//                          //                        ADesc,
//                          //                        FDataJson,
//                                                  GlobalRestAPISignType,
//                                                  GlobalRestAPIAppSecret);



    //���س���ģ������й��ܺ�ҳ��
    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI(
                                                  'pages.json',
                                                  nil,
                                                  FProgramTemplateUrl,
                                                  [
                                                  ],
                                                  [
                                                  ],
                                                  GlobalRestAPISignType,
                                                  GlobalRestAPIAppSecret);



    if TTimerTask(ATimerTask).TaskDesc<>'' then
    begin
      TTimerTask(ATimerTask).TaskTag:=0;
    end;

  except
    on E:Exception do
    begin
      //�쳣
      TTimerTask(ATimerTask).TaskDesc:=E.Message;
    end;
  end;
end;

procedure TFrameListItemStyleList.GetListItemStyleListExecuteEnd(ATimerTask: TObject);
var
  I:Integer;
  ASuperObject:ISuperObject;
  APageJson:ISuperObject;
//  AListItemStyleList:TListItemStyleList;
  AListBoxItem:TSkinListBoxItem;
begin

  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin


//          AListItemStyleList:=TListItemStyleList.Create(ooReference);
//          AListItemStyleList.ParseFromJsonArray(TListItemStyle,ASuperObject.O['Data'].A['ListItemStyle']);
          Self.lvData.Prop.Items.BeginUpdate;
          try
              Self.lvData.Prop.Items.Clear(True);

              AListBoxItem:=Self.lvData.Prop.Items.Add;
              AListBoxItem.Caption:='Ĭ��';
              AListBoxItem.Detail:='';


//              for I := 0 to ASuperObject.O['Data'].A['RecordList'].Length-1 do
              for I := 0 to ASuperObject.A['pages'].Length-1 do
              begin
                APageJson:=ASuperObject.A['pages'].O[I];


//                FListItemStyleList.Add(AListItemStyleList[I]);


                AListBoxItem:=Self.lvData.Prop.Items.Add;
//                AListBoxItem.Data:=AListItemStyleList[I];
                AListBoxItem.Caption:=APageJson.S['caption'];
                AListBoxItem.Detail:=APageJson.S['name'];




////                if AListItemStyleList[I].notice_classify_name='�˺���Ϣ' then
////                begin
////                  AListBoxItem.Detail:='�й��˺ŵ���˵ȵ�֪ͨ';
////                end;
////                if AListItemStyleList[I].notice_classify_name='������Ϣ' then
////                begin
////                  AListBoxItem.Detail:='������˽��֪ͨ��';
////                end;
////                if AListItemStyleList[I].notice_classify_name='ϵͳ����' then
////                begin
////                  AListBoxItem.Detail:='ϵͳƽ̨��֪ͨ�����磺����';
////                end;
////                if AListItemStyleList[I].notice_classify_name='������Ϣ' then
////                begin
////                  AListBoxItem.Detail:='�Զ���������֪ͨ';
////                end;
////                if AListItemStyleList[I].notice_classify_name='վ����' then
////                begin
////                  AListBoxItem.Detail:='�ڲ�֪ͨ';
////                end;
//                AListBoxItem.Detail1:=IntToStr(AListItemStyleList[I].notice_classify_unread_count);
//                AListBoxItem.Icon.ImageIndex:=GetNoticeIconIndex(AListItemStyleList[I].notice_classify_caption,
//                        AListItemStyleList[I].notice_classify);




              end;

              if Self.lvData.Prop.Items.FindItemByDetail(FSelectedDetail)<>nil then
              begin
                Self.lvData.Prop.Items.FindItemByDetail(FSelectedDetail).Selected:=True;
              end;

          finally
            Self.lvData.Prop.Items.EndUpdate();
            //FreeAndNil(AListItemStyleList);
          end;


//      end
//      else
//      begin
//        //��ȡʧ��
//        ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
//      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //�����쳣
      ShowMessageBoxFrame(Self,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
    end;
  finally
    HideWaitingFrame;
    Self.lvData.Prop.StopPullDownRefresh('ˢ�³ɹ�!',600);
  end;

end;

procedure TFrameListItemStyleList.lvDataClickItem(AItem: TSkinItem);
//var
//  AListItemStyle:TListItemStyle;
begin
//  AListItemStyle:=AItem.Data;
//
//  HideFrame;//(CurrentFrame,hfcttBeforeShowFrame);
//  //��ʾ��Ϣ�б�
//  ShowFrame(TFrame(GlobalNoticeListFrame),TFrameNoticeList,frmMain,nil,nil,OnReturnFromNoticeListFrame,Application);
//
//
//  GlobalNoticeListFrame.Load(AListItemStyle);

  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self);

end;

procedure TFrameListItemStyleList.lvDataPullDownRefresh(Sender: TObject);
begin
  uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             GetListItemStyleListExecute,
                                             GetListItemStyleListExecuteEnd,
                                             'GetListItemStyleList');
end;

procedure TFrameListItemStyleList.Load(AProgramTemplateUrl:String;
                                        ASelectedDetail:String);
begin
//  if GlobalListItemStyleNameListStr='' then
//  begin
    FSelectedDetail:=ASelectedDetail;

    FProgramTemplateUrl:=AProgramTemplateUrl;
    Self.lvData.Prop.StartPullDownRefresh;

//  end
//  else
//  begin
//
//  end;
end;

procedure TFrameListItemStyleList.OnReturnFromNoticeListFrame(Frame: TFrame);
begin
//  if GlobalIsNoticeListChanged then
//  begin
//    GlobalIsNoticeListChanged:=False;
//
//    Self.lvData.Prop.StartPullDownRefresh;
//    //ˢ��δ��֪ͨ��
//    frmMain.GetUserNoticeUnReadCount;
//  end;

end;

end.

