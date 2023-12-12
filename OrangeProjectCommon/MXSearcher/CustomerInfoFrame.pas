unit CustomerInfoFrame;

interface

//{$I MXSearcher.inc}
{$IF CompilerVersion > 21.0}
  {$DEFINE TEST}
{$IFEND}

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, uDrawCanvas, uSkinItems,

  Math,
  uSkinBufferBitmap,
  uGraphicCommon,
  uDrawTextParam,
  PngImage,
  ListItemStyle_IconLeft_CaptionRight,
//  ListItemStyle_MailList,
  uSkinItemDesignerPanelType,
//  uSkinBufferBitmap,
//  uDrawCanvas,
//  XSuperObject,


  {$IF CompilerVersion <= 21.0} // XE or older
    //Delphi2010������XSuperObject
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



  ListItemStyle_CustomerInfo,
  ListItemStyle_CustomerTag,
  ListItemStyle_ContactInfo,
  ListItemStyle_CompanyInfo,
  ListItemStyle_TreeMainMenu_LabelAndArrow,
  ListItemStyle_CaptionDetailItem,
  EasyServiceCommonMaterialDataMoudle_VCL,
  uGDIPlusDrawCanvas,
  uUrlPicture,
  uIdHttpControl,
  uListItemStyleJsonHelper,

  {$IFDEF TEST}
  {$ELSE}
  untHttpClient,
  {$ENDIF}

  uSkinScrollControlType, uSkinCustomListType, uSkinVirtualListType,
  uSkinTreeViewType, uSkinWindowsControl, uSkinButtonType, uDrawPicture,
  uSkinImageList;

type
  TFrameCustomerInfo = class(TFrame)
    SkinWinButton1: TSkinWinButton;
    tvData: TSkinWinTreeView;
    imglistPictures: TSkinImageList;
    procedure tvDataClickItem(AItem: TSkinItem);
    procedure tvDataPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);
  private
    procedure btnTagClick(Sender: TObject);
    procedure btnMemoClick(Sender: TObject);
    procedure lvTagsStopEditingItem(Sender: TObject; AItem: TSkinItem;
      ABindingControl, AEditControl: TControl);
//    procedure LoadData(vDatas: Variant);
    { Private declarations }
  public
    FCustomerInfoListItemStyleFrame:TFrameListItemStyle_CustomerInfo;
//    FCustomerInfoItem:TSkinItem;
    FCustomerOwnerItem:TSkinItem;
    FCompanyInfoItem:TSkinItem;
    FParentItem:TSkinTreeViewItem;
//    FFrameListItemStyle_CustomerInfo:TFrameListItemStyle_CustomerInfo;

    //�ͻ�ID
    FCustID:Integer;
    //���п�ѡ��ı�ǩ
    FTagsJsonStr:String;
    //��ǰѡ��ı�ǩ
    FSelectedTagIDsJsonStr:String;

    OEMLogoName:string;
    procedure SetItemCaptions;
    procedure Clear;
    procedure Load;
    procedure SyncParentItem(AExpanded:Boolean);
//    procedure LoadData(vDatas: Variant);
    constructor Create(AOwner:TComponent);override;
    procedure ClearHead;
    //���±�ǩ
    procedure SyncTags(ATags,ASelectedTagIDs:ISuperArray);
    procedure SyncTags2(ASelectedTagIDsJsonStr:String);
//    //���¶����ĸ߶�
//    procedure SyncCustomerInfoListItemStyleFrameHeight;
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses
  TagLabelManageFrame, uLangRes;

{ TFrameCustomerInfo }

procedure TFrameCustomerInfo.btnMemoClick(Sender: TObject);
begin
  //�༭��ע
  if FCustomerInfoListItemStyleFrame.lvTags.Prop.EditingItem=nil then
  begin
    FCustomerInfoListItemStyleFrame.EditMemo;
    FCustomerInfoListItemStyleFrame.btnMemo.Prop.IsPushed:=True;
    FCustomerInfoListItemStyleFrame.btnMemo.Hint:='���汸ע';
  end
  else
  begin
    FCustomerInfoListItemStyleFrame.lvTags.Prop.StopEditingItem;
    FCustomerInfoListItemStyleFrame.btnMemo.Prop.IsPushed:=False;
    FCustomerInfoListItemStyleFrame.btnMemo.Hint:='��ӱ�ע';
    FCustomerInfoListItemStyleFrame.memMemo.Visible:=False;
  end;
end;

procedure TFrameCustomerInfo.btnTagClick(Sender: TObject);
var
  AData:String;
  AErrorLog:String;
  ATags:ISuperArray;
  ASelectedTagIDs:ISuperArray;
  ATagLabelManageFrame:TFrameTagLabelManage;
begin
  //��Ӳ��Ա�ǩ
  //Ҫ��12����ɫ�����û�ѡ��
  //  GetFMHttpClient.AddLabel('BF001','������','HignQuality','1','����',AData,AErrorLog);
  //  GetFMHttpClient.AddLabel('BF001','�й��ͻ�','China','2','����',AData,AErrorLog);
  //  GetFMHttpClient.AddLabel('BF001','�����ͻ�','USA','3','����',AData,AErrorLog);
  //  GetFMHttpClient.AddLabel('BF001','���Ա�ǩ4','Test4','4','����',AData,AErrorLog);
  //  GetFMHttpClient.AddLabel('BF001','���Ա�ǩ5','Test5','5','����',AData,AErrorLog);
  //  GetFMHttpClient.AddLabel('BF001','���Ա�ǩ6','Test6','6','����',AData,AErrorLog);
  //  GetFMHttpClient.AddLabel('BF001','���Ա�ǩ7','Test7','7','����',AData,AErrorLog);
  //  GetFMHttpClient.AddLabel('BF001','���Ա�ǩ8','Test8','8','����',AData,AErrorLog);
  //  GetFMHttpClient.AddLabel('BF001','���Ա�ǩ9','Test9','9','����',AData,AErrorLog);
  //  GetFMHttpClient.AddLabel('BF001','���Ա�ǩ10','Test10','10','����',AData,AErrorLog);



//  {$IFDEF Version_Alpha}
//  GetFMHttpClient.GetLabelList('BF001',AData,AErrorLog);
//  GetFMHttpClient.TagCustomer(FCustId,[10159],AData,AErrorLog);
//  {$ENDIF}


  ATags:=TSuperArray.Create(FTagsJsonStr);
  ASelectedTagIDs:=TSuperArray.Create(FSelectedTagIDsJsonStr);

  ATagLabelManageFrame:=ShowTagLabelManageForm(ATags,ASelectedTagIDs);
  if ATagLabelManageFrame<>nil then
  begin
    ASelectedTagIDs:=ATagLabelManageFrame.FSelectedTagIDs;
    {$IFNDEF TEST}
    //���µ�������
    GetFMHttpClient.TagCustomer(FCustId,ATagLabelManageFrame.FSelectedTagIDsArray,AData,AErrorLog);
    {$ENDIF}
    //���½���
    Self.SyncTags(ATags,ASelectedTagIDs);
    FSelectedTagIDsJsonStr:=ASelectedTagIDs.AsJSon();
  end;

end;

procedure TFrameCustomerInfo.Clear;
//var
//  AItem:TSkinItem;
//  AParent:TSkinTreeViewItem;
//  AFrameListItemStyle_CustomerInfo:TFrameListItemStyle_CustomerInfo;
begin
    //��ϵ��
//    FCustomerInfoItem:=Self.tvData.Prop.Items.FindItemByName('customer_info');
//    if FCustomerInfoItem<>nil then
//    begin
//      //��ϵ������
//      FCustomerInfoItem.Caption:='İ���ͻ�';
//      //��ϵ�˹�˾
//      FCustomerInfoItem.Detail:='';
////      FCustomerInfoItem.Icon.Clear;
////      FCustomerInfoItem.Icon.Url:='';
////      FCustomerInfoItem.Icon.SkinImageList:=Self.imglistPictures;
////      FCustomerInfoItem.Icon.ImageIndex:=0;
//
////      //��ϵ�˵ı�ǩ
////      FFrameListItemStyle_CustomerInfo:=TFrameListItemStyle_CustomerInfo(Self.tvData.Prop.FItem1ItemStyleSetting.GetItemStyleFrameCache(FCustomerInfoItem).FItemStyleFrame);
////      FFrameListItemStyle_CustomerInfo.lvTags.Prop.Items[0].Visible:=False;
////      FFrameListItemStyle_CustomerInfo.lvTags.Prop.Items.ClearItemsByType(sitDefault);
//    end;
//    FCustomerInfoListItemStyleFrame.imgHead.Prop.Picture.Clear;
//    FCustomerInfoListItemStyleFrame.imgHead.Prop.Picture.SkinImageList:=Self.imglistPictures;
//    FCustomerInfoListItemStyleFrame.imgHead.Prop.Picture.ImageIndex:=0;

    //���ز�����ͻ���ǩ
//      FCustomerInfoListItemStyleFrame.lvTags.Visible:=False;
//    FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.ClearItemsByType(sitDefault);
//    FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.FindItemByName('space').Visible:=False;
//    FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.FindItemByName('memo').Visible:=False;
//    FCustomerInfoListItemStyleFrame.lvTags.Height:=FCustomerInfoListItemStyleFrame.lvTags.Prop.CalcContentHeight;

//      FCustomerInfoListItemStyleFrame.pnlOperation.Visible:=True;

  FCustomerInfoListItemStyleFrame.Clear;
  Self.FCustomerInfoListItemStyleFrame.SyncButtonBounds;
  Self.FCustomerInfoListItemStyleFrame.AutoSize;

//    SyncCustomerInfoListItemStyleFrameHeight;



  Self.tvData.Prop.Items.BeginUpdate;
  try

    SetItemCaptions;

    Self.tvData.Prop.Items.FindItemByName('row_devide_line').Visible:=False;

    //��ϵ�˵�ӵ������Ϣ
    FCustomerOwnerItem:=Self.tvData.Prop.Items.FindItemByName('customer_owner');
    if FCustomerOwnerItem<>nil then
    begin
      //ӵ��������
      FCustomerOwnerItem.Caption:='-';
      //��ϵ�˹�˾
      FCustomerOwnerItem.Detail:=STITLE_OwnerItem;

      FCustomerOwnerItem.Detail1:='-';
      FCustomerOwnerItem.Detail2:='-';
      FCustomerOwnerItem.Detail3:='-';

//      FCustomerOwnerItem.Visible:=False;
    end;


    //��˾��Ϣ
    FCompanyInfoItem:=Self.tvData.Prop.Items.FindItemByName('company_info');
    if FCompanyInfoItem<>nil then
    begin
      //�ͻ����
      FCompanyInfoItem.Caption:=STITLE_FirmInfo;
      //�ͻ�
      FCompanyInfoItem.Detail1:='';
      FCompanyInfoItem.Detail2:='';


      FCompanyInfoItem.Visible:=False;
    end;
    Self.tvData.Prop.Items.FindItemByName('company_state').Visible:=False;
    Self.tvData.Prop.Items.FindItemByName('company_seas_flag').Visible:=False;
    Self.tvData.Prop.Items.FindItemByName('company_country').Visible:=False;

    Self.tvData.Prop.Items.FindItemByName('company_creator').Visible:=False;
    Self.tvData.Prop.Items.FindItemByName('company_create_time').Visible:=False;
    Self.tvData.Prop.Items.FindItemByName('company_editor').Visible:=False;
    Self.tvData.Prop.Items.FindItemByName('company_edit_time').Visible:=False;
    Self.tvData.Prop.Items.FindItemByName('company_last_tracker').Visible:=False;
    Self.tvData.Prop.Items.FindItemByName('company_last_track_time').Visible:=False;




    //������ϵ���б�
    FParentItem:=Self.tvData.Prop.Items.FindItemByName('parent_item');
    FParentItem.Childs.Clear();
    FParentItem.Visible:=False;

  finally
    Self.tvData.Prop.Items.EndUpdate();
  end;


end;

procedure TFrameCustomerInfo.ClearHead;
begin
  //��ϵ��
//  FCustomerInfoItem:=Self.tvData.Prop.Items.FindItemByName('customer_info');
//  if FCustomerInfoItem<>nil then
//  begin
//    FCustomerInfoItem.Icon.Clear;
//    FCustomerInfoItem.Icon.Url:='';
//    FCustomerInfoItem.Icon.SkinImageList:=Self.imglistPictures;
//    FCustomerInfoItem.Icon.ImageIndex:=0;
//  end;

  FCustomerInfoListItemStyleFrame.imgHead.Prop.Picture.Clear;
  Self.FCustomerInfoListItemStyleFrame.imgHead.Prop.Picture.Url:='';
  Self.FCustomerInfoListItemStyleFrame.imgHead.Prop.Picture.SkinImageList:=Self.imglistPictures;
  Self.FCustomerInfoListItemStyleFrame.imgHead.Prop.Picture.ImageIndex:=0;
  Self.FCustomerInfoListItemStyleFrame.SyncButtonBounds;
end;

constructor TFrameCustomerInfo.Create(AOwner: TComponent);
begin
  inherited;

  FCustomerInfoListItemStyleFrame:=TFrameListItemStyle_CustomerInfo.Create(Self);
  FCustomerInfoListItemStyleFrame.Parent:=Self;
//  FCustomerInfoListItemStyleFrame.Align:=alTop;
//  FCustomerInfoListItemStyleFrame.Height:=300;
  FCustomerInfoListItemStyleFrame.Align:=alTop;
  FCustomerInfoListItemStyleFrame.Height:=300;

//  FCustomerInfoListItemStyleFrame.ItemDesignerPanel.Visible:=True;
//  FCustomerInfoListItemStyleFrame.ItemDesignerPanel.Align:=alTop;
  FCustomerInfoListItemStyleFrame.ItemDesignerPanel.Visible:=True;
  FCustomerInfoListItemStyleFrame.ItemDesignerPanel.Align:=alClient;

  FCustomerInfoListItemStyleFrame.memMemo.Visible:=False;

  FCustomerInfoListItemStyleFrame.btnTag.OnClick:=Self.btnTagClick;
  FCustomerInfoListItemStyleFrame.btnMemo.OnClick:=Self.btnMemoClick;
  FCustomerInfoListItemStyleFrame.lvTags.OnStopEditingItem:=lvTagsStopEditingItem;

  ClearHead;
end;

procedure TFrameCustomerInfo.Load;
//const
//  AColorArray=[$000C7FF2,$006A71FB,$00EF8399,$00DECE3B,$0070D68B,$00C591F9];
//  AColorArray:array of TColor=[$000C7FF2,$006A71FB,$00EF8399,$00DECE3B,$0070D68B,$00C591F9];
var
//  AParent:TSkinTreeViewItem;
  AItem:TSkinItem;
//  AFrameListItemStyle_CustomerInfo:TFrameListItemStyle_CustomerInfo;
  I: Integer;
  ASizeF:TSizeF;
//  AColorArray:Array[0..6] of TColor;
//  AItemWidth:Double;
begin
  Clear;
//  Exit;

  DownloadItemHttpControlClass:=uIdHttpControl.TSystemHttpControl;
  dmEasyServiceCommonMaterial.btnThemeColorCaptionLeftIconRight.DrawCaptionParam.FontSize:=11;

  Self.FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.BeginUpdate;
  try

//    //��ϵ��
//    FCustomerInfoItem:=Self.tvData.Prop.Items.FindItemByName('customer_info');
//    if FCustomerInfoItem<>nil then
//    begin
//      //��ϵ������
//      FCustomerInfoItem.Caption:='����';
//      //��ϵ�˹�˾
//      FCustomerInfoItem.Detail:='Jinhua Jinjie Info.Co., ltd.';
//      FCustomerInfoItem.Icon.Clear;
//      FCustomerInfoItem.Icon.Url:='http://www.orangeui.cn/customer_cases/D%E5%8C%BA/icon.png';
//
////      //��ϵ�˵ı�ǩ
////      FFrameListItemStyle_CustomerInfo:=TFrameListItemStyle_CustomerInfo(Self.tvData.Prop.FItem1ItemStyleSetting.GetItemStyleFrameCache(FCustomerInfoItem).FItemStyleFrame);
////      FFrameListItemStyle_CustomerInfo.lvTags.Prop.Items[0].Visible:=True;
////      FFrameListItemStyle_CustomerInfo.lvTags.Prop.Items[0].Caption:='Jinhua Jinjie Info.Co., ltd.';
////      FFrameListItemStyle_CustomerInfo.lvTags.Prop.Items.ClearItemsByType(sitDefault);
//
//    end;


//    //�����ǩ
//    AColorArray[0]:=$000C7FF2;
//    AColorArray[1]:=$006A71FB;
//    AColorArray[2]:=$00EF8399;
//    AColorArray[3]:=$00DECE3B;
//    AColorArray[4]:=$0070D68B;
//    AColorArray[5]:=$00C591F9;


//    Self.FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.BeginUpdate;
//    try
//      for I := 0 to 9-1 do
//      begin
//        AItem:=Self.FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.Insert(I);
//        AItem.Caption:=Copy('HelloWorld,DelphiTeacher',1,I+2);
//        GetGlobalDrawTextParam.IsWordWrap:=False;
//        GetGlobalDrawTextParam.FontSize:=9;
//        AItem.Width:=Ceil((uSkinBufferBitmap.GetStringWidth(AItem.Caption,GetGlobalDrawTextParam.FontSize)+5)/Const_BufferBitmapScale);
//        AItem.Color:=GlobalCustomerTagColorArray[I mod Length(GlobalCustomerTagColorArray)];
//      end;
//    finally
//      Self.FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.EndUpdate();
//    end;
    FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.FindItemByName('btnTag').Visible:=True;
    FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.FindItemByName('btnMemo').Visible:=True;
    Self.SyncTags2('[10159,10979,11016]');


    //���뱸ע
    AItem:=Self.FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.FindItemByName('memo');
    if AItem<>nil then
    begin
      Self.FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.FindItemByName('space').Visible:=True;
      AItem.Visible:=True;
      AItem.Caption:='HelloWorld,DelphiTeacher!  I''m from USA';
      GetGlobalDrawTextParam.IsWordWrap:=True;
      GetGlobalDrawTextParam.FontSize:=10;
      ASizeF:=uSkinBufferBitmap.GetStringSize(AItem.Caption,
                                            RectF(0,
                                                  0,
                                                  (Self.FCustomerInfoListItemStyleFrame.lvTags.Width),
                                                  MaxInt),
                                            GetGlobalDrawTextParam);
      AItem.Width:=Ceil(ASizeF.cx/Const_BufferBitmapScale);
      AItem.Height:=Ceil(ASizeF.cy/Const_BufferBitmapScale);
    end;
  finally
    Self.FCustomerInfoListItemStyleFrame.lvTags.Prop.Items.EndUpdate();
  end;
  Self.FCustomerInfoListItemStyleFrame.SyncButtonBounds;
  Self.FCustomerInfoListItemStyleFrame.AutoSize;




  Self.tvData.Prop.Items.BeginUpdate;
  try


    //��ϵ�˵�ӵ������Ϣ
    FCustomerOwnerItem:=Self.tvData.Prop.Items.FindItemByName('customer_owner');
    if FCustomerOwnerItem<>nil then
    begin
      //ӵ��������
      FCustomerOwnerItem.Caption := '���� ������';
      //��ϵ�˹�˾
      FCustomerOwnerItem.Detail:= STITLE_OwnerItem;

      FCustomerOwnerItem.Detail1:='ggggcexx@163.com';
      FCustomerOwnerItem.Detail2:='18957901025';
      FCustomerOwnerItem.Detail3:='+8618957901025';

//      FCustomerOwnerItem.Visible:=True;
    end;

    Self.tvData.Prop.Items.FindItemByName('row_devide_line').Visible:=True;

    //��˾��Ϣ
    FCompanyInfoItem:=Self.tvData.Prop.Items.FindItemByName('company_info');
    if FCompanyInfoItem<>nil then
    begin
      //�ͻ����
      FCompanyInfoItem.Caption:=STITLE_FirmInfo;
      //�ͻ�
      FCompanyInfoItem.Detail1:='����0020';
      FCompanyInfoItem.Detail2:='�Ϻ�����������޹�˾';

      FCompanyInfoItem.Visible:=True;
    end;

    //������ϵ���б�
    FParentItem:=Self.tvData.Prop.Items.FindItemByName('parent_item');
    FParentItem.Childs.Clear();
    for I := 0 to 2-1 do
    begin
      AItem:=FParentItem.Childs.Add;
      //��ϵ������
      AItem.Caption:='��Ӧ��';
      //
      AItem.Detail:='������';

      AItem.Detail1:='summer@163.com';
      AItem.Detail2:='18006890741';
      AItem.Detail3:='+8618006890741';

    end;

    SyncParentItem(FParentItem.Expanded);

  finally
    Self.tvData.Prop.Items.EndUpdate();
  end;


end;

procedure TFrameCustomerInfo.lvTagsStopEditingItem(Sender: TObject;
  AItem: TSkinItem; ABindingControl, AEditControl: TControl);
var
  ACustSaveParamJson:ISuperObject;
  ACustSaveParam,AErrorLog : String;
//  AJsonCustData : ISuperObject;
begin
  //�Զ������и�
  Self.FCustomerInfoListItemStyleFrame.AutoSize;
  {$IFDEF TEST}

  {$ELSE}
  //���ñ���ͻ���ע�Ľӿ�
  //'{"identFieldValue":23061188,"moduleCode":"BF001","accessToken":"tNNiDLybzP7vnbmZ","individualAccessToken":"mTKzrSkJUzLgyte9","remarks":"�������66"}'
  ACustSaveParamJson:=SO();
  ACustSaveParamJson.I['identFieldValue']:=Self.FCustID;
  ACustSaveParamJson.S['moduleCode']:='BF001';
  ACustSaveParamJson.S['accessToken']:=GetFMHttpClient.LoginedToken;
  ACustSaveParamJson.S['individualAccessToken']:=GetFMHttpClient.AccessToken;
  ACustSaveParamJson.S['remarks']:=AItem.Caption;
  ACustSaveParam:=ACustSaveParamJson.AsJson;
  if GetFMHttpClient.EditCustomerData(ACustSaveParam,AErrorLog) then
  begin
//    AJsonCustData := SO(FCustDataInfo);
//    if AJsonCustData<>Nil then
//    begin
//      AJsonCustData.O['data'] := SO(ACustSaveParam);
//      FCustDataInfo := AJsonCustData.AsString;
//      FbtnSaveCust.Enabled := False;
//      FIsEditCustData := True;
//    end;
//    App.ShowMsg(nil,SMSG_SaveSucceed,STITLE_EditCust,MB_OK);
  end else
//    App.ShowMsg(nil,AErrorLog,STITLE_EditCust,MB_OK)
    ;
  {$ENDIF}
end;

//procedure TFrameCustomerInfo.LoadData(vDatas: Variant);
//begin
//
//end;

//procedure TFrameCustomerInfo.SyncCustomerInfoListItemStyleFrameHeight;
//begin
//  FCustomerInfoListItemStyleFrame.lvTags.Height:=FCustomerInfoListItemStyleFrame.lvTags.Prop.CalcContentHeight;
//  FCustomerInfoListItemStyleFrame.Height:=
//    FCustomerInfoListItemStyleFrame.pnlClient.Top
//    +FCustomerInfoListItemStyleFrame.lvTags.Top
//    +FCustomerInfoListItemStyleFrame.lvTags.Height+10;
//end;

procedure TFrameCustomerInfo.SetItemCaptions;
  procedure UpdateCaption(const AName, ACaption: string);
  var cItem: TSkinItem;
  begin
    cItem := Self.tvData.Prop.Items.FindItemByName(AName);
    if assigned(cItem) then
      cItem.Caption := ACaption;
  end;
begin
  UpdateCaption('company_info', STITLE_FirmInfo);
  UpdateCaption('company_state', SCAPTION_CustState);
  UpdateCaption('company_seas_flag', SCAPTION_CustType);
  UpdateCaption('company_country', SCAPTION_CustCountry);
  UpdateCaption('company_creator', SCAPTION_CustCreation);
  UpdateCaption('company_editor', SCAPTION_CustModified);
  UpdateCaption('company_last_tracker', SCAPTION_CustTracker);
//  UpdateCaption('company_info', STITLE_FirmInfo);
end;

procedure TFrameCustomerInfo.SyncParentItem(AExpanded:Boolean);
begin
  if not AExpanded then
  begin
    FParentItem.Caption:=SHINT_EXPContentInfo+'('+IntToStr(FParentItem.Childs.Count)+')';
  end
  else
  begin
    FParentItem.Caption:=SHINT_CollapseContentInfo+'('+IntToStr(FParentItem.Childs.Count)+')';
  end;
  FParentItem.Visible:=(FParentItem.Childs.Count>0);

end;

procedure TFrameCustomerInfo.SyncTags(ATags, ASelectedTagIDs: ISuperArray);
begin
  //���±�ǩ
  uListItemStyleJsonHelper.LoadSelectedTags(ATags,
                                              ASelectedTagIDs,
                                              Self.FCustomerInfoListItemStyleFrame.lvTags,
                                              True);
  Self.FCustomerInfoListItemStyleFrame.SyncButtonBounds;
//  Self.SyncCustomerInfoListItemStyleFrameHeight;
  Self.FCustomerInfoListItemStyleFrame.AutoSize;
end;

procedure TFrameCustomerInfo.SyncTags2(ASelectedTagIDsJsonStr: String);
var
  AErrorLog:String;
  ATags:ISuperArray;
  ASelectedTagsIDs:ISuperArray;
begin
  {$IFDEF TEST}
  FTagsJsonStr:=
    '[{"cid":1952698,"color":1,"createCtid":261249021,"createDate":"2021-07-09 18:25:17","description":"����","labelEnName":"HignQuality","labelId":10159,"labelName":"������",'
    +'"labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":2,"createCtid":261249021,"createDate":"2021-07-09 18:44:58", '
    +'"description":"����","labelEnName":"China","labelId":10259,"labelName":"�й��ͻ�","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},  '
    +'{"cid":1952698,"color":9,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"����","labelEnName":"Test9","labelId":10979,"labelName":"���Ա�ǩ9","labelType":2,'
    +'"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":8,"createCtid":261249021,"createDate":"2021-07-09 18:44:59",'
    +'"description":"����","labelEnName":"Test8","labelId":10827,"labelName":"���Ա�ǩ8","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},'
    +'{"cid":1952698,"color":7,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"����","labelEnName":"Test7","labelId":10765,"labelName":"���Ա�ǩ7","labelType":2,'
    +'"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":6,"createCtid":261249021,"createDate":"2021-07-09 18:44:59",'
    +'"description":"����","labelEnName":"Test6","labelId":10649,"labelName":"���Ա�ǩ6","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},'
    +'{"cid":1952698,"color":5,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"����","labelEnName":"Test5","labelId":10547,"labelName":"���Ա�ǩ5","labelType":2,'
    +'"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":4,"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"����", '
    +'"labelEnName":"Test4","labelId":10474,"labelName":"���Ա�ǩ4","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":3,'
    +'"createCtid":261249021,"createDate":"2021-07-09 18:44:59","description":"����","labelEnName":"USA","labelId":10392,"labelName":"�����ͻ�","labelType":2,"modifyCtid":261249021,'
    +'"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1},{"cid":1952698,"color":10,"createCtid":261249021,"createDate":"2021-07-09 18:45:00","description":"����",'
    +'"labelEnName":"Test10","labelId":11016,"labelName":"���Ա�ǩ10","labelType":2,"modifyCtid":261249021,"modifyDate":"1970-01-01 00:00:00","moduleCode":"BF001","useFlag":1}]'
    ;
  FSelectedTagIDsJsonStr:=ASelectedTagIDsJsonStr;//'[10159,10979,11016]';
  {$ELSE}
  if FTagsJsonStr='' then
  begin
    //���ýӿڻ�ȡ
    GetFMHttpClient.GetLabelList('BF001',FTagsJsonStr,AErrorLog);
  end;
  {$ENDIF}
  ATags:=TSuperArray.Create(FTagsJsonStr);
  FSelectedTagIDsJsonStr:=ASelectedTagIDsJsonStr;

  ASelectedTagsIDs:=TSuperArray.Create(ASelectedTagIDsJsonStr);
  Self.SyncTags(ATags,ASelectedTagsIDs);

end;

procedure TFrameCustomerInfo.tvDataClickItem(AItem: TSkinItem);
begin
  SyncParentItem(not FParentItem.Expanded);
end;

procedure TFrameCustomerInfo.tvDataPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
var
  AFrame:TFrameListItemStyle_TreeMainMenu_LabelAndArrow;
  Res: TResourceStream;
  APngImage:TPngImage;
begin
  //ָ��չ����£ͼ��

  if (AItemDesignerPanel<>nil) and (AItemDesignerPanel.Parent is TFrameListItemStyle_TreeMainMenu_LabelAndArrow) then
  begin
    //Eó�ѽ������
    if OEMLogoName='ETS' then
    begin
      AFrame:=TFrameListItemStyle_TreeMainMenu_LabelAndArrow(AItemDesignerPanel.Parent);
      //ACT_expandedETS	        RCDATA	"action_ets\expanded.png"
      //ACT_collapsedETS	RCDATA	"action_ets\collapsed.png"

      Res := TResourceStream.Create(Hinstance, 'ACT_collapsedETS', 'PNG');
      APngImage:=TPngImage.Create;
      try
          APngImage.LoadFromStream(Res);
          AFrame.SkinImageList1.PictureList[0].Assign(APngImage);
      finally
          Res.Free;
          APngImage.Free;
      end;


      Res := TResourceStream.Create(Hinstance, 'ACT_expandedETS', 'PNG');
      APngImage:=TPngImage.Create;
      try

          APngImage.LoadFromStream(Res);
          AFrame.SkinImageList1.PictureList[1].Assign(APngImage);
      finally
          Res.Free;
          APngImage.Free;
      end;
    end;



  end;
end;

end.
