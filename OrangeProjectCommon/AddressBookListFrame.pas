//convert pas to utf8 by ¥

unit AddressBookListFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

  HzSpell,
  uSkinItems,
  uSkinMaterial,
  uFrameContext,
  WaitingFrame,
  uTimerTask,

  {$IFDEF ANDROID}
      Androidapi.Helpers,
      {$IF RTLVersion=32}// 10.2  TJManifest_permission
      uAndroidPermission_D10_2,
      {$ENDIF}

      {$IF RTLVersion>=33}// 10.3+
      System.Permissions, // 动态权限单元
      Androidapi.JNI.Os,
      {$ENDIF}
  {$ENDIF}

  
  FMX.AddressBook,
  FMX.AddressBook.Types,

  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
//  uSkinItems,
  uUIFunction,
  uDrawCanvas,
  uBaseLog,
  uBaseList,
  uSkinBufferBitmap,
  uSkinLabelType,
  uSkinListBoxType,
  uSkinListViewType,
  uSkinFireMonkeyScrollControl,
  uSkinFireMonkeyListBox,
  uSkinFireMonkeyCheckBox,
  uSkinFireMonkeyLabel,
  uSkinFireMonkeyImage,
  uSkinFireMonkeyItemDesignerPanel,
  FMX.Edit,
  uSkinFireMonkeyEdit,
  uSkinFireMonkeyListView,
  FMX.Controls.Presentation,
  uSkinFireMonkeyVirtualList, uSkinFireMonkeyCustomList,
  uSkinItemDesignerPanelType, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinButtonType, uBaseSkinControl, uSkinPanelType,
  uTimerTaskEvent;

type


  //取列表比较快,但是取联系人数据要放在线程中,在Android中会非常卡
  TContactGetter=class
  private
    FAddressBook:TAddressBook;

    tteGetContacts:TTimerTaskEvent;

    /// <summary>Event handler for receiving results of requesting access to Address Book</summary>
    procedure DoPermissionRequestEvent(ASender: TObject; const AMessage: string; const AAccessGranted: Boolean);
    /// <summary>Event handler for receiving notification about changing of contact info.</summary>
    procedure DoExternalChangeEvent(ASender: TObject);

    procedure tteGetContactsBegin(ATimerTask: TTimerTask);
    procedure tteGetContactsExecute(ATimerTask: TTimerTask);
    procedure tteGetContactsExecuteEnd(ATimerTask: TTimerTask);

    function DoGetContacts:Boolean;
    function CreateAddressBook:Boolean;
  public
    //数据是否获取完成
    IsGetted:Boolean;
    //名字列表
    NameList:TStringList;
    //手机号码列表
    PhoneList:TStringList;

    IsPermissionDenyed:Boolean;

    OnPermissionRequest:TPermissionRequestEvent;
  public
    constructor Create;
    destructor Destroy;override;
  public
    //读取联系人
    function GetContacts():Boolean;
    //检测读取通讯录的权限是否允许
    function GetReadPermissionStatus:TAuthorizationStatus;
  end;





  TFrameAddressBookList = class(TFrame)
    pnlToolBar: TSkinFMXPanel;
    lbList: TSkinFMXListView;
    ItemValue: TSkinFMXItemDesignerPanel;
    lblItemCaption: TSkinFMXLabel;
    pnlSearchBar: TSkinFMXPanel;
    edtFilter: TSkinFMXEdit;
    btnClearFilter: TClearEditButton;
    btnReturn: TSkinFMXButton;
    lbIndex: TSkinFMXListView;
    pnlIndex: TSkinFMXPanel;
    idpGroup: TSkinFMXItemDesignerPanel;
    SkinFMXLabel1: TSkinFMXLabel;
    idpItem1: TSkinFMXItemDesignerPanel;
    SkinFMXLabel3: TSkinFMXLabel;
    SkinFMXLabel5: TSkinFMXLabel;
    SkinFMXLabel2: TSkinFMXLabel;
    SkinFMXLabel4: TSkinFMXLabel;
    tmrCheckGetContacts: TTimer;
    procedure lbListClickItem(Sender: TSkinItem);
    procedure btnReturnClick(Sender: TObject);
    procedure edtFilterChangeTracking(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure btnClearFilterClick(Sender: TObject);
    procedure lbIndexClickItem(AItem: TSkinItem);
    procedure tmrCheckGetContactsTimer(Sender: TObject);
    { Private declarations }
  private
    FFilter:String;
    procedure DoFilter(AFilter:String);

    procedure DoLoadContacts;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    OnClickItem:TVirtualListClickItemEvent;
    procedure Load;
    { Public declarations }
  end;



var
  GlobalAddressBookListFrame:TFrameAddressBookList;
  GlobalContactGetter:TContactGetter;


implementation

{$R *.fmx}


function SortByName_ASC_Compare(Item1, Item2: Pointer): Integer;
var
  Param1,Param2:TSkinItem;
begin
  Param1:=TSkinItem(Item1);
  Param2:=TSkinItem(Item2);

  if Param1.Caption>Param2.Caption then
  begin
    Result:=1;
  end
  else if Param1.Caption<Param2.Caption then
  begin
    Result:=-1;
  end
  else
  begin
    Result:=0;
  end;
end;


function SortByName_ASC_HZSpell(Item1, Item2: Pointer): Integer;
var
  Param1,Param2:TSkinItem;
begin
  Param1:=TSkinItem(Item1);
  Param2:=TSkinItem(Item2);


  Result:=0;

  if Param1.Detail1>Param2.Detail1 then
  begin
      //大
      Result:=1;
  end
  else if Param1.Detail1<Param2.Detail1 then
  begin
      Result:=-1;
  end
  else
  begin
      Result:=0;
  end;

end;



procedure TFrameAddressBookList.btnClearFilterClick(Sender: TObject);
begin
  //清除过滤
  Self.edtFilter.Text:='';

  DoFilter(Trim(Self.edtFilter.Text));
end;

procedure TFrameAddressBookList.btnReturnClick(Sender: TObject);
begin
  //什么也不做
  //清空返回事件,也就是返回的时候不调用它
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;
  //返回
  HideFrame;//();
  ReturnFrame;//();
end;

constructor TFrameAddressBookList.Create(AOwner: TComponent);
begin
  inherited;

  //设置主题颜色
  Self.pnlToolBar.SelfOwnMaterial.BackColor.FillColor.Color:=SkinThemeColor;



  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);


  Self.lbList.Prop.Items.BeginUpdate;
  try
    Self.lbList.Prop.Items.Clear();
  finally
    Self.lbList.Prop.Items.EndUpdate;
  end;

  Self.lbIndex.Prop.Items.BeginUpdate;
  try
    Self.lbIndex.Prop.Items.Clear();
  finally
    Self.lbIndex.Prop.Items.EndUpdate;
  end;


end;

destructor TFrameAddressBookList.Destroy;
begin
  inherited;
end;

procedure TFrameAddressBookList.DoFilter(AFilter:String);
var
  I: Integer;
  AListViewItem:TSkinListViewItem;
begin
  //过滤
  if FFilter=AFilter then Exit;


  FFilter:=AFilter;
  Self.btnClearFilter.Visible:=AFilter<>'';


  //过滤
  Self.lbList.Properties.Items.BeginUpdate;
  try
    for I := 0 to Self.lbList.Properties.Items.Count-1 do
    begin
        AListViewItem:=Self.lbList.Properties.Items[I];

        if //(ASelectedList<>nil) and (SelectedList.IndexOf(GetItemCaption(I))=-1)
          //and
          (AFilter='')
          //名称
          or (Pos(LowerCase(AFilter),LowerCase(AListViewItem.Caption))>0)
          //手机
          or (Pos(LowerCase(AFilter),LowerCase(AListViewItem.Detail))>0)
          //名称
          or (Pos(LowerCase(AFilter),LowerCase(AListViewItem.Caption))>0)
          //简拼
  //        or (Pos(LowerCase(AFilter),LowerCase(GetHzPy(FAllList[I])))>0)
          or (Pos(LowerCase(AFilter),LowerCase(AListViewItem.Detail1))>0)
          then
        begin
            if AListViewItem.ItemType=sitDefault then
            begin
              AListViewItem.Visible:=True;
            end
            else if (AListViewItem.ItemType=sitHeader) then
            begin
              //Header只有在非过滤状态下才显示出来
              AListViewItem.Visible:=(AFilter='');
            end;
        end
        else
        begin
          AListViewItem.Visible:=False;
        end;

    end;

  finally
    Self.lbList.Properties.Items.EndUpdate;
  end;
end;

procedure TFrameAddressBookList.DoLoadContacts;
var
  I: Integer;
  ASkinItem:TSkinItem;
  AFirstChar:String;
  ATempChar:String;
begin
  //排序

  Self.lbList.Prop.Items.BeginUpdate;
  Self.lbIndex.Prop.Items.BeginUpdate;
  try
      Self.lbList.Prop.Items.Clear(True);
      Self.lbIndex.Prop.Items.Clear(True);


      FMX.Types.Log.d('OrangeUI TFrameAddressBookList.DoLoadContacts Load Begin '+FormatDateTime('HH:MM:SS:ZZZ',Now));


//      for I := 0 to Self.FContacts.Count-1 do
//      begin
//        ASkinItem:=Self.lbList.Prop.Items.Add;
//
//        ASkinItem.Caption:=FContacts[I].DisplayName;
//
//        if FContacts[I].Phones.Count>0 then
//        begin
//          ASkinItem.Detail:=FContacts[I].Phones[0].Number;
//        end;
//        ASkinItem.Detail1:=UpperCase(HZSpell.GetHzPy(ASkinItem.Caption));
//        ASkinItem.Detail2:=ASkinItem.Detail1.Substring(0,1);
//      end;


      for I := 0 to GlobalContactGetter.NameList.Count-1 do
      begin
        ASkinItem:=Self.lbList.Prop.Items.Add;
        ASkinItem.Caption:=GlobalContactGetter.NameList[I];
        ASkinItem.Detail:=GlobalContactGetter.PhoneList[I];
        //全拼
        ASkinItem.Detail1:=UpperCase(HZSpell.GetHzPy(ASkinItem.Caption));
        //拼音首字母
        ASkinItem.Detail2:=ASkinItem.Detail1.Substring(0,1);
      end;
      FMX.Types.Log.d('OrangeUI TFrameAddressBookList.DoLoadContacts Load End '+FormatDateTime('HH:MM:SS:ZZZ',Now));



      //排序会比较耗时
      //按字母升序排序
      FMX.Types.Log.d('OrangeUI TFrameAddressBookList.DoLoadContacts Sort Begin '+FormatDateTime('HH:MM:SS:ZZZ',Now));
      Self.lbList.Prop.Items.Sort(SortByName_ASC_HZSpell);
      FMX.Types.Log.d('OrangeUI TFrameAddressBookList.DoLoadContacts Sort End '+FormatDateTime('HH:MM:SS:ZZZ',Now));



      I:=Self.lbList.Prop.Items.Count-1;
      while I>=0 do
      begin
          ATempChar:=Self.lbList.Prop.Items[I].Detail2;

          if (ATempChar<'A') or (ATempChar>'Z') then
          begin
            ATempChar:='#';
            //要移到最后了
            Self.lbList.Prop.Items.Move(I,Self.lbList.Prop.Items.Count-1);
          end;

          Dec(I);
      end;



      //加入字母
      AFirstChar:='';
      I:=0;
      while I<Self.lbList.Prop.Items.Count do
      begin
          ATempChar:=Self.lbList.Prop.Items[I].Detail2;

          if (ATempChar<'A') or (ATempChar>'Z') then
          begin
            ATempChar:='#';
          end;

          if (AFirstChar<>ATempChar) then
          begin
            AFirstChar:=ATempChar;


            ASkinItem:=Self.lbList.Prop.Items.Insert(I);
            ASkinItem.Caption:=AFirstChar;
            ASkinItem.ItemType:=sitHeader;
            ASkinItem.Height:=30;


            ASkinItem:=Self.lbIndex.Prop.Items.Add;
            ASkinItem.Caption:=AFirstChar;

          end;

          Inc(I);
      end;

  finally
    Self.lbList.Prop.Items.EndUpdate;
    Self.lbIndex.Prop.Items.EndUpdate;
  end;

  lbIndex.Height:=lbIndex.Prop.GetContentHeight;


  DoFilter(Trim(Self.edtFilter.Text));
end;

procedure TFrameAddressBookList.edtFilterChange(Sender: TObject);
begin
  DoFilter(Trim(Self.edtFilter.Text));
end;

procedure TFrameAddressBookList.edtFilterChangeTracking(Sender: TObject);
begin
  DoFilter(Trim(Self.edtFilter.Text));
end;

procedure TFrameAddressBookList.lbIndexClickItem(AItem: TSkinItem);
var
  ASkinItem:TSkinItem;
begin
  ASkinItem:=Self.lbList.Prop.Items.FindItemByCaption(AItem.Caption);
  if ASkinItem<>nil then
  begin
    Self.lbList.Prop.ScrollToItem(ASkinItem);
  end;
end;

procedure TFrameAddressBookList.lbListClickItem(Sender: TSkinItem);
begin
  if Assigned(OnClickItem) then
  begin
    OnClickItem(Sender);
  end;
end;

procedure TFrameAddressBookList.Load;
begin
  GlobalContactGetter.GetContacts;


  //需要定时器检测是否获取完毕
  Self.tmrCheckGetContacts.Enabled:=True;
  tmrCheckGetContactsTimer(tmrCheckGetContacts);

end;

procedure TFrameAddressBookList.tmrCheckGetContactsTimer(Sender: TObject);
begin
  if GlobalContactGetter.IsGetted then
  begin
      Self.tmrCheckGetContacts.Enabled:=False;

      Self.DoLoadContacts;
  end;
end;

{ TContactGetter }

function TContactGetter.GetReadPermissionStatus: TAuthorizationStatus;
begin
  Result:=TAuthorizationStatus.NotDetermined;

//  {$IFDEF ANDROID}
//  // Using helper class from Android Support Library, so no OS version checking required
//  Result := TJContextCompat.JavaClass.checkSelfPermission(TAndroidHelper.Context,TJManifest_permission.JavaClass.READ_CONTACTS) = TJPackageManager.JavaClass.PERMISSION_GRANTED
//  {$ENDIF}

  CreateAddressBook;

  if FAddressBook<>nil then
  begin
    Result:=FAddressBook.AuthorizationStatus(TAddressBookAccessType.Read);//=TAuthorizationStatus.Authorized;
  end;

end;

constructor TContactGetter.Create;
begin
  IsPermissionDenyed:=False;

  NameList:=TStringList.Create;
  PhoneList:=TStringList.Create;
  IsGetted:=False;


  tteGetContacts:=TTimerTaskEvent.Create(nil);
  tteGetContacts.TaskName:='GetAddressBookList';
  tteGetContacts.OnBegin:=tteGetContactsBegin;
  tteGetContacts.OnExecute:=tteGetContactsExecute;
  tteGetContacts.OnExecuteEnd:=tteGetContactsExecuteEnd;
end;

function TContactGetter.CreateAddressBook: Boolean;
begin
  //没有AddressBook就自己创建
  if FAddressBook=nil then
  begin
      FMX.Types.Log.d('OrangeUI TContactGetter.Load TAddressBook.Create Begin');
      try
        FAddressBook:=TAddressBook.Create(nil);
        //如果被禁止权限会报错java.lang.SecurityException: Permission Denial: opening provider com.android.providers.contacts.ContactsProvider2
      except
        on E:Exception do
        begin
          FMX.Types.Log.d('OrangeUI TContactGetter.Load TAddressBook.Create Error '+E.Message);
          //没有权限
          //Exit;
        end;
      end;
  end;
  FMX.Types.Log.d('OrangeUI TContactGetter.Load TAddressBook.Create End');
  if FAddressBook=nil then
  begin
    FMX.Types.Log.d('OrangeUI TContactGetter.Load TAddressBook.Create End FAddressBook=nil');
    Exit;
  end;
  FAddressBook.OnPermissionRequest:=Self.DoPermissionRequestEvent;
  FAddressBook.OnExternalChange:=Self.DoExternalChangeEvent;


end;

destructor TContactGetter.Destroy;
begin
  FreeAndNil(NameList);
  FreeAndNil(PhoneList);

  FreeAndNil(tteGetContacts);

  FreeAndNil(FAddressBook);
  inherited;
end;

procedure TContactGetter.DoExternalChangeEvent(ASender: TObject);
begin

end;

function TContactGetter.DoGetContacts: Boolean;
begin
  Result:=False;

  CreateAddressBook;

  {$IFNDEF MSWINDOWS}
  if FAddressBook.AuthorizationStatus(TAddressBookAccessType.Read)=TAuthorizationStatus.Authorized then
  begin
      FMX.Types.Log.d('OrangeUI TContactGetter.Load DoPermissionRequestEvent Authorized 已经获取授权 Begin');
      //已经获取授权了
      DoPermissionRequestEvent(nil,'',True);
      FMX.Types.Log.d('OrangeUI TContactGetter.Load DoPermissionRequestEvent Authorized 已经获取授权 End');
  end
  else
  begin
      FMX.Types.Log.d('OrangeUI TContactGetter.Load RequestPermission Begin');
      //申请授权
      FAddressBook.RequestPermission();
      FMX.Types.Log.d('OrangeUI TContactGetter.Load RequestPermission End');
  end;
  {$ELSE}
  //Windows下测试
  //已经获取授权了
  DoPermissionRequestEvent(nil,'',True);
  {$ENDIF}

end;

procedure TContactGetter.DoPermissionRequestEvent(ASender: TObject;
  const AMessage: string; const AAccessGranted: Boolean);
begin
  FMX.Types.Log.d('OrangeUI TContactGetter.DoPermissionRequestEvent '+AMessage+' '+BoolToStr(AAccessGranted));

  if AAccessGranted then
  begin
    IsPermissionDenyed:=False;
    //权限允许
    //安卓比较慢
    //需要使用单独的线程
    Self.tteGetContacts.Run(True);
  end
  else
  begin
    //权限被拒绝
    IsPermissionDenyed:=True;
  end;

  if Assigned(Self.OnPermissionRequest) then
  begin
    OnPermissionRequest(ASender,AMessage,AAccessGranted);
  end;
end;

function TContactGetter.GetContacts:Boolean;
begin
  Result:=IsGetted;

  if IsGetted then Exit;
  
  //申请权限
  {$IFDEF ANDROID}
      {$IF RTLVersion>=32}// 10.2+

        //  TRequestPermissionsResultEvent = procedure(Sender: TObject; const APermissions: TClassicStringDynArray;
        //    const AGrantResults: TClassicPermissionStatusDynArray) of object;

        PermissionsService.RequestPermissions([JStringToString(TJManifest_permission.JavaClass.READ_CONTACTS)],
          procedure(const APermissions: {$IF CompilerVersion >= 35.0}TClassicStringDynArray{$ELSE}TArray<string>{$IFEND};
            const AGrantResults: {$IF CompilerVersion >= 35.0}TClassicPermissionStatusDynArray{$ELSE}TArray<TPermissionStatus>{$IFEND})
          begin
              HandleException(nil,'TContactGetter.GetContacts RequestPermissions CallBack');
              if (Length(AGrantResults) = 1) then
              begin
                if (AGrantResults[0] = TPermissionStatus.Granted) then
                begin
                    IsPermissionDenyed:=False;
                    DoGetContacts;
                end
                else
                begin
                    IsPermissionDenyed:=True;
                    HandleException(nil,'TContactGetter.GetContacts RequestPermissions CallBack ');
                end;
              end;
          end);
      {$ELSE}
          //10.1不需要申请权限
          DoGetContacts;
      {$ENDIF}
  {$ELSE}
      //苹果和Windows不需要动态申请权限
      DoGetContacts;
  {$ENDIF}
  
  Result:=True;
end;

procedure TContactGetter.tteGetContactsBegin(ATimerTask: TTimerTask);
begin
//  ShowWaitingFrame(Self,'加载中...');
end;

procedure TContactGetter.tteGetContactsExecute(ATimerTask: TTimerTask);
var
  I:Integer;
  AContacts: TAddressBookContacts;
begin
  FMX.Types.Log.d('OrangeUI TContactGetter.tteGetDataExecute Begin '+FormatDateTime('HH:MM:SS:ZZZ',Now));

  {$IFNDEF MSWINDOWS}
      if not IsGetted then
      begin
          AContacts:=TAddressBookContacts.Create;
          try
              NameList.Clear;
              PhoneList.Clear;
              //避免重复获取,比较耗时
              FAddressBook.AllContacts(nil,AContacts);
              for I := 0 to AContacts.Count-1 do
              begin
                NameList.Add(AContacts[I].DisplayName);
                if AContacts[I].Phones.Count>0 then
                begin
                  PhoneList.Add(AContacts[I].Phones[0].Number);
                end
                else
                begin
                  PhoneList.Add('');
                end;
              end;
          finally
            FreeAndNil(AContacts);
          end;
          IsGetted:=True;
      end;
  {$ELSE}
      IsGetted:=True;

      NameList.Clear;
      PhoneList.Clear;
      //Windows下测试
      NameList.Add('王能');
      PhoneList.Add('18957901025');

      NameList.Add('李三');
      PhoneList.Add('13376587765');

      NameList.Add('张五');
      PhoneList.Add('14627879876');

      NameList.Add('@*&');
      PhoneList.Add('17287654088');

      NameList.Add('Apple');
      PhoneList.Add('13833668877');

      NameList.Add('123');
      PhoneList.Add('12366770933');

      NameList.Add('hub');
      PhoneList.Add('18877650987');

      NameList.Add('阿朗');
      PhoneList.Add('19876800897');

      NameList.Add('八哥');
      PhoneList.Add('13857563773');

      NameList.Add('  ');
      PhoneList.Add('13857563776');
  {$ENDIF}

  FMX.Types.Log.d('OrangeUI TContactGetter.tteGetDataExecute End '+FormatDateTime('HH:MM:SS:ZZZ',Now));
end;

procedure TContactGetter.tteGetContactsExecuteEnd(ATimerTask: TTimerTask);
begin
//  HideWaitingFrame;
end;


initialization
  GlobalContactGetter:=TContactGetter.Create;



finalization
  FreeAndNil(GlobalContactGetter);



end.

